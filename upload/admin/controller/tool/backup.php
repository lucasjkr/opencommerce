<?php
class ControllerToolBackup extends Controller {
	public function index() {
		$this->load->language('tool/backup');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_select_all'] = $this->language->get('text_select_all');
		$data['text_unselect_all'] = $this->language->get('text_unselect_all');

		$data['entry_export'] = $this->language->get('entry_export');
		$data['entry_import'] = $this->language->get('entry_import');

		$data['button_export'] = $this->language->get('button_export');
		$data['button_import'] = $this->language->get('button_import');

		if (isset($this->session->data['error'])) {
			$data['error_warning'] = $this->session->data['error'];

			unset($this->session->data['error']);
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('tool/backup', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['user_token'] = $this->session->data['user_token'];

		$data['export'] = $this->url->link('tool/backup/export', 'user_token=' . $this->session->data['user_token'], true);
		
		$this->load->model('tool/backup');

		$data['tables'] = $this->model_tool_backup->getTables();

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('tool/backup', $data));
	}
	
	public function import() {
		$this->load->language('tool/backup');
		
		$json = array();
		
		if (!$this->user->hasPermission('modify', 'tool/backup')) {
			$json['error'] = $this->language->get('error_permission');
		}
		
		if (isset($this->request->files['import']['tmp_name']) && is_uploaded_file($this->request->files['import']['tmp_name'])) {
			$filename = tempnam(ini_get('upload_tmp_dir'), 'bac');
			
			move_uploaded_file($this->request->files['import']['tmp_name'], ini_get('upload_tmp_dir') . '/' . $filename);
		} elseif (isset($this->request->get['import'])) {
			$filename = html_entity_decode($this->request->get['import'], ENT_QUOTES, 'UTF-8');
		} else {
			$filename = '';
		}
		
		if (!is_file(ini_get('upload_tmp_dir') . '/' . $filename) || substr(str_replace('\\', '/', realpath(ini_get('upload_tmp_dir') . '/' . $filename)), 0, strlen(ini_get('upload_tmp_dir'))) != str_replace('\\', '/', ini_get('upload_tmp_dir'))) {
			$json['error'] = $this->language->get('error_file');
		}	
		
		if (isset($this->request->get['position'])) {
			$position = $this->request->get['position'];
		} else {
			$position = 0; 	
		}
				
		if (!$json) {
			// We set $i so we can batch execute the queries rather than do them all at once.
			$i = 0;
			$start = false;
			
			$handle = fopen(ini_get('upload_tmp_dir') . '/' . $filename, 'r');

			fseek($handle, $position, SEEK_SET);
			
			while (!feof($handle) && ($i < 100)) {
				$position = ftell($handle);

				$line = fgets($handle, 1000000);
				
				if (substr($line, 0, 14) == 'TRUNCATE TABLE' || substr($line, 0, 11) == 'INSERT INTO') {
					$sql = '';
					
					$start = true;
				}

				if ($i > 0 && (substr($line, 0, 24) == 'TRUNCATE TABLE `oc_user`' || substr($line, 0, 30) == 'TRUNCATE TABLE `oc_user_group`')) {
					fseek($handle, $position, SEEK_SET);

					break;
				}

				if ($start) {
					$sql .= $line;
				}
				
				if ($start && substr($line, -2) == ";\n") {
					$this->db->query(substr($sql, 0, strlen($sql) -2));
					
					$start = false;
				}
					
				$i++;
			}

			$position = ftell($handle);

			$size = filesize(ini_get('upload_tmp_dir') . '/' . $filename);

			$json['success'] = sprintf($this->language->get('text_success'), round(($position / $size) * 100));
			
			if ($position && !feof($handle)) {
				$json['next'] = str_replace('&amp;', '&', $this->url->link('tool/backup/import', 'user_token=' . $this->session->data['user_token'] . '&import=' . $filename . '&position=' . $position, true));
			
				fclose($handle);
			} else {
				fclose($handle);
				
				unlink(ini_get('upload_tmp_dir') . '/' . $filename);

				$this->cache->delete('*');
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function export() {
		$this->load->language('tool/backup');

		if (!isset($this->request->post['backup'])) {
			$this->session->data['error'] = $this->language->get('error_export');

			$this->response->redirect($this->url->link('tool/backup', 'user_token=' . $this->session->data['user_token'], true));
		} elseif (!$this->user->hasPermission('modify', 'tool/backup')) {
			$this->session->data['error'] = $this->language->get('error_permission');

			$this->response->redirect($this->url->link('tool/backup', 'user_token=' . $this->session->data['user_token'], true));
		} else {
			$this->response->addheader('Pragma: public');
			$this->response->addheader('Expires: 0');
			$this->response->addheader('Content-Description: File Transfer');
			$this->response->addheader('Content-Type: application/octet-stream');
			$this->response->addheader('Content-Disposition: attachment; filename="' . DB_DATABASE . '_' . date('Y-m-d_H-i-s', time()) . '_backup.sql"');
			$this->response->addheader('Content-Transfer-Encoding: binary');

			$this->load->model('tool/backup');

			$this->response->setOutput($this->model_tool_backup->backup($this->request->post['backup']));		
		}
	}	
}
