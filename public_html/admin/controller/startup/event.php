<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ControllerStartupEvent extends Controller {
	public function index() {
		// Add events from the DB
		$this->load->model('setting/event_admin');
		
		$results = $this->model_setting_event_admin->getEvents();
		
		foreach ($results as $result) {
			if ((substr($result['trigger'], 0, 6) == 'admin/') && $result['status']) {
				$this->event->register(substr($result['trigger'], 6), new Action($result['action']), $result['sort_order']);
			}
		}		
	}
}