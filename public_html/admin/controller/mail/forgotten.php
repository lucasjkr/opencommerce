<?php
class ControllerMailForgotten extends Controller {
	public function index(&$route, &$args, &$output) {
		if ($args[0] && $args[1]) {
			$this->load->language('mail/forgotten');

			$data['text_greeting'] = sprintf($this->language->get('text_greeting'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));

			$data['reset'] = str_replace('&amp;', '&', $this->url->link('common/reset', 'email=' . urlencode($args[0]) . '&code=' . $args[1], true));
			$data['ip'] = $this->request->server['REMOTE_ADDR'];
            $data['btn_reset'] = $this->language->get('btn_reset');
            $data['store_url'] = HTTP_SERVER;

            $data['store'] = html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8');

            $this->load->model('tool/image');

            if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
                $data['logo'] = $this->model_tool_image->resize($this->config->get('config_logo'), $this->config->get('theme_default_image_location_width'), $this->config->get('theme_default_image_cart_height'));
            } else {
                $data['logo'] = '';
            }

            // Using new mailer method
            $email   = $args[0];
            $subject = html_entity_decode(sprintf($this->language->get('text_subject'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8')), ENT_QUOTES, 'UTF-8');
            $message = $this->load->view('mail/forgotten', $data);

            $mail = $this->registry->get('Mail');
            $mail->setSubject($subject);
            $mail->setHtml($message);
            $mail->send($email);

        }
	}
}
