<?php
/**
 * Modifcation XML Documentation
 * 
 * 
 * Start of the modifcation tag
 * <modification>
 * 
 * Tag: name
 * Description: Name of the modification 
 * Example:
 *   
 * <name>
 *   <![CDATA[Modification Default]]>
 * </name>
 *   
 * 
 * TAG: version
 * Description: Version Extension Version This is used for when you are uploading  
 * Example:
 *   
 * <version>
 *   <![CDATA[1.0]]>
 * </version>
 *   
 *   
 * TAG: <author>
 * Description:  Author of the extension 
 *   
 *   
 * TAG: Link
 * Description: Link to the authors web site
 * Example:
 * 
 * <link>
 *   <![CDATA[http://www.opencart.com]]>
 * </link>  
 *   
 *   
 * TAG: file   
 * Description: System uses PHP function glob with the BRACE flag
 * http://hk1.php.net/manual/en/function.glob.php
 * Example:  
 * 
  *  <file name="system/{engine,library}/{action,loader,config,language}*.php">
 
 
 
 * Attributes name	

	
 * TAG: <operation>   
 
 Because search and replace are different from regex	
	
 *  	<operation type="regex">
  *      <search>
 *         <![CDATA[~(require|include)(_once)?\(([^)]+)~]]>
 *        </search>
 *       <add position="replace">
 *         <![CDATA[$1$2(modification($3)]]>
 *      </add>
 *     </operation>
  
  
  <regex>
  
  
  
  </file>

 */
 
class ControllerExtensionModification extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/modification');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/modification');

		$this->getList();
	}

	public function delete() {
		$this->load->language('extension/modification');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/modification');

		if (isset($this->request->post['selected']) && $this->validate()) {
			foreach ($this->request->post['selected'] as $modification_id) {
				$this->model_setting_modification->deleteModification($modification_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('extension/modification', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	public function refresh() {
		$this->load->language('extension/modification');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/modification');

		if ($this->validate()) {
			// Log
			$log = new Log('vqmod.log');

			// Clear all modification files
			$files = glob(DIR_MODIFICATION . '{*.php,*.tpl}', GLOB_BRACE);

			if ($files) {
				foreach ($files as $file) {
					if (file_exists($file)) {
						unlink($file);
					}
				}
			}

			// Begin
			$xml = array();

			// Load the default modification XML
			$xml[] = file_get_contents(DIR_SYSTEM . 'modification.xml');

			// Get the default modification file
			$results = $this->model_setting_modification->getModifications();

			foreach ($results as $result) {
				if ($result['status']) {
					$xml[] = $result['code'];
				}
			}

			$modification = array();

			foreach ($xml as $xml) {
				$dom = new DOMDocument('1.0', 'UTF-8');
				$dom->preserveWhiteSpace = false;
				$dom->loadXml($xml);

				$files = $dom->getElementsByTagName('modification')->item(0)->getElementsByTagName('file');

				foreach ($files as $file) {
					$path = '';

					// Get the full path of the files that are going to be used for modification
					if (substr($file->getAttribute('name'), 0, 7) == 'catalog') {
						$path = DIR_CATALOG . substr($file->getAttribute('name'), 8);
					}

					if (substr($file->getAttribute('name'), 0, 5) == 'admin') {
						$path = DIR_APPLICATION . substr($file->getAttribute('name'), 6);
					}

					if (substr($file->getAttribute('name'), 0, 6) == 'system') {
						$path = DIR_SYSTEM . substr($file->getAttribute('name'), 7);
					}

					if ($path) {
						$files = glob($path, GLOB_BRACE);
						
						$operations = $file->getElementsByTagName('operation');

						if ($files) {
							foreach ($files as $file) {
								// Get the key to be used for the modification cache filename.
								if (substr($file, 0, strlen(DIR_CATALOG)) == DIR_CATALOG) {
									$key = 'catalog_' . str_replace('/', '_', substr($file, strlen(DIR_CATALOG)));
								}

								if (substr($file, 0, strlen(DIR_APPLICATION)) == DIR_APPLICATION) {
									$key = 'admin_' . str_replace('/', '_', substr($file, strlen(DIR_APPLICATION)));
								}

								if (substr($file, 0, strlen(DIR_SYSTEM)) == DIR_SYSTEM) {
									$key = 'system_' . str_replace('/', '_', substr($file, strlen(DIR_SYSTEM)));
								}

								if (!isset($modification[$key])) {
									$modification[$key] = file_get_contents($file);
								}
	
								foreach ($operations as $operation) {
									$type = $operation->getAttribute('type');
									
									// Search and replace
									if ($type != 'regex') {
										$search = $operation->getElementsByTagName('search')->item(0)->textContent;
										$trim = $operation->getElementsByTagName('search')->item(0)->getAttribute('trim');
										$offset = $operation->getElementsByTagName('search')->item(0)->getAttribute('offset');
										$limit = $operation->getElementsByTagName('search')->item(0)->getAttribute('limit');
										$add = $operation->getElementsByTagName('add')->item(0)->textContent;
										$position = $operation->getElementsByTagName('add')->item(0)->getAttribute('position');
									
										// Trim
										if (!$trim || $trim == 'true') {
											$search = trim($search);
										}
	
										switch ($position) {
											default:
											case 'replace':
												$replace = $add;
												break;
											case 'before':
												$replace = $add . $search;
												break;
											case 'after':
												$replace = $search . $add;
												break;
										}
	
										$i = 0;
										$pos = -1;
										$match = array();
										
										// Create an array of all the start postions of all the matched code 
										while (($pos = strpos($modification[$key], $search, $pos + 1)) !== false) {
											$match[$i++] = $pos;
										}
										
										// Offset
										if (!$offset) {
											$offset = 0;
										}
																				
										// Limit
										if (!$limit) {
											$limit = count($match);
										}	
																							
										// Only replace the occurance of the string that is equal to the between the offset and limit
										if (isset($match[$offset]) && isset($match[$limit - 1])) {
											for ($i = $offset; $i < $limit; $i++) {
												$modification[$key] = substr_replace($modification[$key], $replace, $match[$i], strlen($search));
												
											}
										}
									} else {
										$search = $operation->getElementsByTagName('search')->item(0)->textContent;
										$replace = $operation->getElementsByTagName('add')->item(0)->textContent;									
										$limit = $operation->getElementsByTagName('search')->item(0)->getAttribute('limit');
										
										// Limit
										if (!$limit) {
											$limit = -1;
										}
										
										/*
										Regex does not require offset to match items
	
										So if, for example, you want to change the 3rd 'foo' to 'bar' on the following line:
	
										lorem ifoopsum foo lor foor ipsum foo dolor foo
											   ^1      ^2      ^3         ^4        ^5
	
										run: s/\(.\{-}\zsfoo\)\{3}/bar/
	
										to get:
	
										lorem ifoopsum foo lor barr ipsum foo dolor foo
											   ^1      ^2      ^3=bar     ^4        ^5
										*/
										$modification[$key] = preg_replace($search, $replace, $modification[$key], $limit);							
									}
								}
							}
						}
					}
				}
			}

			// Write all modification files
			foreach ($modification as $key => $value) {
				$file = DIR_MODIFICATION . $key;

				$handle = fopen($file, 'w');

				fwrite($handle, $value);

				fclose($handle);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

		//	$this->response->redirect($this->url->link('extension/modification', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	public function clear() {
		$this->load->language('extension/modification');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/modification');

		if ($this->validate()) {
			// Clear all modification files
			$files = glob(DIR_MODIFICATION . '{*.php,*.tpl}', GLOB_BRACE);

			if ($files) {
				foreach ($files as $file) {
					if (file_exists($file)) {
						unlink($file);
					}
				}
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('extension/modification', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	public function enable() {
		$this->load->language('extension/modification');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/modification');

		if (isset($this->request->get['modification_id']) && $this->validate()) {
			$this->model_setting_modification->enableModification($this->request->get['modification_id']);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('extension/modification', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	public function disable() {
		$this->load->language('extension/modification');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/modification');

		if (isset($this->request->get['modification_id']) && $this->validate()) {
			$this->model_setting_modification->disableModification($this->request->get['modification_id']);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('extension/modification', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	public function clearlog() {
		$this->load->language('extension/modification');

		if ($this->validate()) {
			$file = DIR_LOGS . 'vqmod.log';

			$handle = fopen($file, 'w+');

			fclose($handle);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('extension/modification', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	protected function getList() {
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'name';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/modification', 'token=' . $this->session->data['token'] . $url, 'SSL')
		);

		$data['refresh'] = $this->url->link('extension/modification/refresh', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['clear'] = $this->url->link('extension/modification/clear', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['delete'] = $this->url->link('extension/modification/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$data['modifications'] = array();

		$filter_data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
		);

		$modification_total = $this->model_setting_modification->getTotalModifications();

		$results = $this->model_setting_modification->getModifications($filter_data);

		foreach ($results as $result) {
			$data['modifications'][] = array(
				'modification_id' => $result['modification_id'],
				'name'            => $result['name'],
				'author'          => $result['author'],
				'version'         => $result['version'],
				'status'          => $result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled'),
				'date_added'      => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'link'            => $result['link'],
				'enable'          => $this->url->link('extension/modification/enable', 'token=' . $this->session->data['token'] . '&modification_id=' . $result['modification_id'], 'SSL'),
				'disable'         => $this->url->link('extension/modification/disable', 'token=' . $this->session->data['token'] . '&modification_id=' . $result['modification_id'], 'SSL'),
				'enabled'         => $result['status'],
			);
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');
		$data['text_refresh'] = $this->language->get('text_refresh');

		$data['column_name'] = $this->language->get('column_name');
		$data['column_author'] = $this->language->get('column_author');
		$data['column_version'] = $this->language->get('column_version');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_action'] = $this->language->get('column_action');

		$data['button_refresh'] = $this->language->get('button_refresh');
		$data['button_clear'] = $this->language->get('button_clear');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_link'] = $this->language->get('button_link');
		$data['button_enable'] = $this->language->get('button_enable');
		$data['button_disable'] = $this->language->get('button_disable');

		$data['tab_general'] = $this->language->get('tab_general');
		$data['tab_log'] = $this->language->get('tab_log');

		$data['token'] = $this->session->data['token'];

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_name'] = $this->url->link('extension/modification', 'token=' . $this->session->data['token'] . '&sort=name' . $url, 'SSL');
		$data['sort_author'] = $this->url->link('extension/modification', 'token=' . $this->session->data['token'] . '&sort=author' . $url, 'SSL');
		$data['sort_version'] = $this->url->link('extension/version', 'token=' . $this->session->data['token'] . '&sort=author' . $url, 'SSL');
		$data['sort_status'] = $this->url->link('extension/modification', 'token=' . $this->session->data['token'] . '&sort=status' . $url, 'SSL');
		$data['sort_date_added'] = $this->url->link('extension/modification', 'token=' . $this->session->data['token'] . '&sort=date_added' . $url, 'SSL');

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $modification_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('extension/modification', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($modification_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($modification_total - $this->config->get('config_limit_admin'))) ? $modification_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $modification_total, ceil($modification_total / $this->config->get('config_limit_admin')));

		$data['sort'] = $sort;
		$data['order'] = $order;

		// Log
		$file = DIR_LOGS . 'vqmod.log';

		if (file_exists($file)) {
			$data['log'] = file_get_contents($file, FILE_USE_INCLUDE_PATH, null);
		} else {
			$data['log'] = '';
		}

		$data['clear_log'] = $this->url->link('extension/modification/clearlog', 'token=' . $this->session->data['token'], 'SSL');

		$data['header'] = $this->load->controller('common/header');
		$data['menu'] = $this->load->controller('common/menu');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/modification.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/modification')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}