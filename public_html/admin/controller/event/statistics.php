<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ControllerEventStatistics extends Controller {
	// model/catalog/review/removeReview/after
	public function removeReview(&$route, &$args, &$output) {
		$this->load->model('setting/statistics_admin');

		$this->model_report_statistics_admin->addValue('review', 1);
	}
		
	// model/sale/return/removeReturn/after
	public function removeReturn(&$route, &$args, &$output) {
		$this->load->model('setting/statistics_admin');

		$this->model_report_statistics_admin->addValue('return', 1);
	}	
}