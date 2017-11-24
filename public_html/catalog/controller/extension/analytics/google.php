<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ControllerExtensionAnalyticsGoogle extends Controller {
    public function index() {
		return html_entity_decode($this->config->get('analytics_google_code'), ENT_QUOTES, 'UTF-8');
	}
}
