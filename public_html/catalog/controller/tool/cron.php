<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ControllerToolCron extends Controller {
	public function index() {
		$this->load->model('setting/cron');

		$results = $this->model_setting_cron->getCronJobs();

		foreach ($results as $result) {
			try {
				$this->load->controller('cron/' . $result['code']);
			} catch (Exception $exception) {
				$this->log->write('PHP ' . $exception->getCode  . ':  ' . $exception->getMessage() . ' in ' . $exception->getFile() . ' on line ' . $exception->getLine());
			}
		}
	}
}