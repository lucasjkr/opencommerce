<?php
class ControllerMailForgotten extends Controller {
	public function index(&$route, &$args, &$output) {			            
		if ($args[0] && $args[1]) {
			$this->load->language('mail/forgotten');

			$data['text_greeting'] = sprintf($this->language->get('text_greeting'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
			$data['text_change'] = $this->language->get('text_change');
			$data['text_ip'] = $this->language->get('text_ip');

			$data['reset'] = str_replace('&amp;', '&', $this->url->link('account/reset', 'email=' . urlencode($args[0]) . '&code=' . $args[1], true));
			$data['ip'] = $this->request->server['REMOTE_ADDR'];

            $email            = $args[0];
            $mail             = $this->registry->get('Mail');
			$mail->setSubject(html_entity_decode(sprintf($this->language->get('text_subject'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8')), ENT_QUOTES, 'UTF-8'));
			$mail->setText($this->load->view('mail/forgotten', $data));
			$mail->send($email);
		}
	}
}
