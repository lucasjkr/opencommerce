<?php
class ControllerMailReturn extends Controller {
	public function index($route, $args, $output) {
		if (isset($args[0])) {
			$return_id = $args[0];
		} else {
			$return_id = '';
		}
		
		if (isset($args[1])) {
			$return_status_id = $args[1];
		} else {
			$return_status_id = '';
		}		
		
		if (isset($args[2])) {
			$comment = $args[2];
		} else {
			$comment = '';
		}
		
		if (isset($args[3])) {
			$notify = $args[3];
		} else {
			$notify = '';
		}		
		
		if ($notify) {
			$this->load->model('sale/return_admin');
			
			$return_info = $this->model_sale_return_admin->getReturn($return_id);
			
			if ($return_info) {
				$this->load->language('mail/return');

				$data['return_id'] = $return_id;
				$data['date_added'] = date($this->language->get('date_format_short'), strtotime($return_info['date_modified']));
				$data['return_status'] = $return_info['return_status'];
				$data['comment'] = strip_tags(html_entity_decode($comment, ENT_QUOTES, 'UTF-8'));

                $email = $return_info['email'];

				$mail = $this->registry->get('Mail');

				$mail->setSubject(sprintf($this->language->get('text_subject'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'), $return_id));
				$mail->setText($this->load->view('mail/return', $data));
				$mail->send($email);
			}
		}
	}
}	