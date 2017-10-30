<?php
class ControllerMailForgotten extends Controller {
	public function index(&$route, &$args, &$output) {
		if ($args[0] && $args[1]) {
			$this->load->language('mail/forgotten');

			$data['text_greeting'] = sprintf($this->language->get('text_greeting'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));

			$data['reset'] = str_replace('&amp;', '&', $this->url->link('common/reset', 'email=' . urlencode($args[0]) . '&code=' . $args[1], true));
			$data['ip'] = $this->request->server['REMOTE_ADDR'];

            // Using new mailer method
            $email   = $args[0];
            $subject = html_entity_decode(sprintf($this->language->get('text_subject'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8')), ENT_QUOTES, 'UTF-8');
            $message = $this->load->view('mail/forgotten', $data);

            $mail = $this->registry->get('Mail');
            $mail->setSubject($subject);
            $mail->setText($message);
            $mail->send($email);

        }
	}
}
