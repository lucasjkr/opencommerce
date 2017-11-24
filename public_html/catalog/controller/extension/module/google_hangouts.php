<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ControllerExtensionModuleGoogleHangouts extends Controller {
	public function index() {
		$this->load->language('extension/module/google_hangouts');

		if ($this->request->server['HTTPS']) {
			$data['code'] = str_replace('http', 'https', html_entity_decode($this->config->get('module_google_hangouts_code')));
		} else {
			$data['code'] = html_entity_decode($this->config->get('module_google_hangouts_code'));
		}

		return $this->load->view('extension/module/google_hangouts', $data);
	}
}