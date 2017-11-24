<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ControllerExtensionModuleSagepayDirectCards extends Controller {
	public function index() {
		if ($this->config->get('module_sagepay_direct_cards_status') && $this->config->get('payment_sagepay_direct_status') && $this->customer->isLogged()) {
			$this->load->language('account/sagepay_direct_cards');

			$data['card'] = $this->url->link('account/sagepay_direct_cards', '', true);

			return $this->load->view('extension/module/sagepay_direct_cards', $data);
		}
	}

}