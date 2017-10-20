<?php
class ControllerToolBackup extends Controller {
	public function index() {
		$this->load->language('tool/backup');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = [];

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('tool/backup', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['user_token'] = $this->session->data['user_token'];

		$this->load->model('tool/backup_admin');

		$ignore = array(
			'oc_user',
			'oc_user_group'
		);

		$data['tables'] = [];

		$results = $this->model_tool_backup_admin->getTables();

		foreach ($results as $result) {
			if (!in_array($result, $ignore)) {
				$data['tables'][] = $result;
			}
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('tool/backup', $data));
	}

	public function history() {
		$this->load->language('tool/backup');

		$data['histories'] = [];

		$files = glob(DIR_STORAGE . 'backup/*.sql');

		foreach ($files as $file) {
			$size = filesize($file);

			$i = 0;

			$suffix = array(
				'B',
				'KB',
				'MB',
				'GB',
				'TB',
				'PB',
				'EB',
				'ZB',
				'YB'
			);

			while (($size / 1024) > 1) {
				$size = $size / 1024;

				$i++;
			}

			$data['histories'][] = array(
				'filename'   => basename($file),
				'size'       => round(substr($size, 0, strpos($size, '.') + 4), 2) . $suffix[$i],
				'date_added' => date($this->language->get('datetime_format'), filemtime($file)),
				'download'   => $this->url->link('tool/backup/download', 'user_token=' . $this->session->data['user_token'] . '&filename=' . urlencode(basename($file)), true),
			);
		}

		$this->response->setOutput($this->load->view('tool/backup_history', $data));
	}

	public function backup() {
		$this->load->language('tool/backup');

		$json = [];

		if (isset($this->request->get['filename'])) {
			$filename = $this->request->get['filename'];
		} else {
			$filename = 'test1.sql'; //date('Y-m-d H:i:s') . '.sql';
		}

		if (isset($this->request->get['backup'])) {
			$backup = explode(',', $this->request->get['backup']);
		} else {
			$backup = [];
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		if (!$this->user->hasPermission('modify', 'tool/backup')) {
			$json['error'] = $this->language->get('error_permission');
		}

		$file = DIR_STORAGE . 'backup/' . $filename;

		// Validate the directory
		if (substr(str_replace('\\', '/', realpath($file)), 0, strlen(DIR_STORAGE . 'backup/')) != str_replace('\\', '/', DIR_STORAGE . 'backup/')) {
			$json['error'] = $this->language->get('error_directory');
		}

		$this->load->model('tool/backup_admin');

		$allowed = $this->model_tool_backup_admin->getTables();

		foreach ($backup as $table) {
			if (!in_array($table, $allowed)) {
				$json['error'] = sprintf($this->language->get('error_table'), $table);

				break;
			}
		}

		//

		//print_r($backup);

		if (!$json) {
			$table = current($backup);

			$this->log->write($table);

			if ($table) {
				$output = '';

				if ($page == 1) {
					$output .= 'TRUNCATE TABLE `' . $this->db->escape($table) . '`;' . "\n\n";
				}

				$record_total = $this->model_tool_backup_admin->getTotalRecords($table);

				$results = $this->model_tool_backup_admin->getRecords($table, ($page - 1) * 200, 200);

				foreach ($results as $result) {
					$fields = '';

					foreach (array_keys($result) as $value) {
						$fields .= '`' . $value . '`, ';
					}

					$values = '';

					foreach (array_values($result) as $value) {
						$value = str_replace(array("\x00", "\x0a", "\x0d", "\x1a"), array('\0', '\n', '\r', '\Z'), $value);
						$value = str_replace(array("\n", "\r", "\t"), array('\n', '\r', '\t'), $value);
						$value = str_replace('\\', '\\\\', $value);
						$value = str_replace('\'', '\\\'', $value);
						$value = str_replace('\\\n', '\n', $value);
						$value = str_replace('\\\r', '\r', $value);
						$value = str_replace('\\\t', '\t', $value);

						$values .= '\'' . $value . '\', ';
					}

					$output .= 'INSERT INTO `' . $table . '` (' . preg_replace('/, $/', '', $fields) . ') VALUES (' . preg_replace('/, $/', '', $values) . ');' . "\n";
				}

				if ($record_total >= (($page - 1) * 200)) {
					$output .= "\n\n";

					array_shift($backup);
				}

				$handle = fopen($file, 'w+');

				fwrite($handle, $output);

				fclose($handle);

				if ((($page + 1) * 200) >= $record_total) {
					echo '2';

					$json['success'] = sprintf('backing up table ' . $table);

					$json['next'] = str_replace('&amp;', '&', $this->url->link('tool/backup/backup', 'user_token=' . $this->session->data['user_token'] . '&filename=' . urlencode($filename) . '&backup=' . implode(',', $backup) . '&page=' . ($page + 1), true));
				} else {
					$json['success'] = sprintf('backing up table ' . $table);

					//	echo '3';
					$json['next'] = str_replace('&amp;', '&', $this->url->link('tool/backup/backup', 'user_token=' . $this->session->data['user_token'] . '&filename=' . urlencode($filename) . '&backup=' . implode(',', $backup) . '&page=1', true));
				}
			} else {
				$json['success'] = $this->language->get('text_success');
			}


		}

		//$this->log->write($json);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function restore() {
		$this->load->language('tool/backup');

		$json = [];

		if (isset($this->request->get['filename'])) {
			$filename = $this->request->get['filename'];
		} else {
			$filename = '';
		}

		if (!$this->user->hasPermission('modify', 'tool/backup')) {
			$json['error'] = $this->language->get('error_permission');
		}

		$file = DIR_STORAGE . 'backup/' . $filename;

		if (!is_file($file)) {
			$json['error'] = $this->language->get('error_file');
		}

		// Validate the directory
		if (substr(str_replace('\\', '/', realpath($file)), 0, strlen(DIR_STORAGE . 'backup/')) == str_replace('\\', '/', DIR_STORAGE . 'backup/')) {
			$json['error'] = $this->language->get('error_directory');
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

			$handle = fopen($file, 'r');

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

			$size = filesize($filename);

			//$json['total'] = round(($position / $size) * 100);

			if ($position && !feof($handle)) {
				$json['next'] = str_replace('&amp;', '&', $this->url->link('tool/backup/restore', 'user_token=' . $this->session->data['user_token'] . '&filename=' . urlencode($filename) . '&position=' . $position, true));

				fclose($handle);
			} else {
				fclose($handle);

				unlink($file);

				$json['success'] = $this->language->get('text_success');

				$this->cache->delete('*');
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function upload() {
		$this->load->language('tool/backup');

		$json = [];

		// Check user has permission
		if (!$this->user->hasPermission('modify', 'tool/backup')) {
			$json['error'] = $this->language->get('error_permission');
		}

		if (empty($this->request->files['upload']['name']) || !is_file($this->request->files['upload']['tmp_name'])) {
			$json['error'] = $this->language->get('error_upload');
		}

		if (!$json) {
			// Sanitize the filename
			$filename = html_entity_decode($this->request->files['upload']['name'], ENT_QUOTES, 'UTF-8');

			if ((utf8_strlen($filename) < 3) || (utf8_strlen($filename) > 128)) {
				$json['error'] = $this->language->get('error_filename');
			}

			// Allowed file extension types
			if (strtolower(substr(strrchr($filename, '.'), 1)) != 'sql') {
				$json['error'] = $this->language->get('error_filetype');
			}
		}

		if (!$json) {
			$json['success'] = $this->language->get('text_success');

			move_uploaded_file($this->request->files['upload']['tmp_name'], DIR_STORAGE . 'backup/' . $filename);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function download() {
		$this->load->language('tool/backup');

		$json = [];

		if (isset($this->request->get['filename'])) {
			$filename = $this->request->get['filename'];
		} else {
			$filename = '';
		}

		// Check user has permission
		if (!$this->user->hasPermission('modify', 'tool/backup')) {
			$this->response->redirect($this->url->link('error/permission', '', true));
		}

		$file = DIR_STORAGE . 'backup/' . $filename;

		if (!is_file($file)) {
			$this->response->redirect($this->url->link('error/not_found', '', true));
		}

		if (!headers_sent()) {
			header('Content-Type: application/octet-stream');
			header('Content-Disposition: attachment; filename="' . ($mask ? $mask : basename($file)) . '"');
			header('Expires: 0');
			header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
			header('Pragma: public');
			header('Content-Length: ' . filesize($file));

			if (ob_get_level()) {
				ob_end_clean();
			}

			readfile($file, 'rb');

			exit();
		} else {
			exit('Error: Headers already sent out!');
		}
	}

	public function delete() {
		$this->load->language('tool/backup');

		$json = [];

		if (isset($this->request->get['filename'])) {
			$filename = $this->request->get['filename'];
		} else {
			$filename = '';
		}

		// Check user has permission
		if (!$this->user->hasPermission('modify', 'tool/backup')) {
			$json['error'] = $this->language->get('error_permission');
		}

		$file = DIR_STORAGE . 'backup/' . $filename;

		if (!is_file($file)) {
			$json['error'] = $this->language->get('error_file');
		}

		// Validate the directory
		if (substr(str_replace('\\', '/', realpath($file)), 0, strlen(DIR_STORAGE . 'backup/')) != str_replace('\\', '/', DIR_STORAGE . 'backup/')) {
			$json['error'] = $this->language->get('error_directory');
		}

		if (!$json) {
			$json['success'] = $this->language->get('text_success');

			unlink($file);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}