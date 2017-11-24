<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ControllerEventDebug extends Controller {
	public function before(&$route, &$args) {
		if ($route == 'common/home') { // add the route you want to test
			$this->session->data['debug'][$route] = microtime();		
		}
	}
	
	public function after($route, &$args, &$output) {
		if ($route == 'common/home') { // add the route you want to test
			if (isset($this->session->data['debug'][$route])) {
				$log_data = array(
					'route' => $route,
					'time'  => microtime() - $this->session->data['debug'][$route]
				);
				
				$this->log->write($log_data);
			}
		}
	}	
}
