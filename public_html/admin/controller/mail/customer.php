<?php
class ControllerMailCustomer extends Controller {
	public function approve(&$route, &$args, &$output) {
		$this->load->model('customer/customer_admin');
		
		$customer_info = $this->model_customer_customer_admin->getCustomer($args[0]);

		if ($customer_info) {
			$this->load->model('setting/store');
	
			$store_info = $this->model_setting_store->getStore($customer_info['store_id']);
	
			if ($store_info) {
				$store_name = html_entity_decode($store_info['name'], ENT_QUOTES, 'UTF-8');
				$store_url = $store_info['url'] . 'index.php?route=account/login';
			} else {
				$store_name = html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8');
				$store_url = HTTP_CATALOG . 'index.php?route=account/login';
			}
			
			$this->load->model('localisation/language_admin');
			
			$language_info = $this->model_localisation_language->getLanguage($customer_info['language_id']);

			if ($language_info) {
				$language_code = $language_info['code'];
			} else {
				$language_code = $this->config->get('config_language');
			}
			
			$language = new Language($language_code);
			$language->load($language_code);
			$language->load('mail/customer_approve');
						
			$subject = sprintf($language->get('text_subject'), $store_name);
								
			$data['text_welcome'] = sprintf($language->get('text_welcome'), $store_name);
				
			$data['login'] = $store_url . 'index.php?route=account/login';	
			$data['store'] = $store_name;

            // LJK Note: This has been rewritten to use new Mailer
            $subject = sprintf($this->language->get('text_subject'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
            $message = $this->load->view('mail/customer_approve', $data);

            $mail = $this->registry->get('Mail');
            $mail->setSubject($subject);
            $mail->setText($message);
            $mail->send($customer_info['email']);

            $emails = explode(',', $this->config->get('config_mail_alert_email'));
            foreach ($emails as $email) {
                if ($email && filter_var($email, FILTER_VALIDATE_EMAIL)) {
                    $mail->send($email);
                }
            }
		}
	}
	
	public function deny(&$route, &$args, &$output) {
		$this->load->model('customer/customer_admin');
		
		$customer_info = $this->model_customer_customer_admin->getCustomer($args[0]);

		if ($customer_info) {
			$this->load->model('setting/store');

			$store_info = $this->model_setting_store->getStore($customer_info['store_id']);

			if ($store_info) {
				$store_name = html_entity_decode($store_info['name'], ENT_QUOTES, 'UTF-8');
				$store_url = $store_info['url'] . 'index.php?route=account/login';
			} else {
				$store_name = html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8');
				$store_url = HTTP_CATALOG . 'index.php?route=account/login';
			}

			$this->load->model('localisation/language_admin');
			
			$language_info = $this->model_localisation_language->getLanguage($customer_info['language_id']);

			if ($language_info) {
				$language_code = $language_info['code'];
			} else {
				$language_code = $this->config->get('config_language');
			}

			$language = new Language($language_code);
			$language->load($language_code);
			$language->load('mail/customer_deny');

			$data['text_welcome'] = sprintf($language->get('text_welcome'), $store_name);

			$data['contact'] = $store_url . 'index.php?route=information/contact';
			$data['store'] = $store_name;

			$subject = sprintf($language->get('text_subject'), $store_name);
            $message = $this->load->view('mail/customer_deny', $data);
            $email   = $customer_info['email'];

            $mail = $this->registry->get('Mail');
            $mail->setSubject($subject);
            $mail->setText($message);
            $mail->send($email);

            $emails = explode(',', $this->config->get('config_mail_alert_email'));
            foreach ($emails as $email) {
                if ($email && filter_var($email, FILTER_VALIDATE_EMAIL)) {
                    $mail->send($email);
                }
            }
		}
	}
}	