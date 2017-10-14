<?php
class ControllerStartupError extends Controller {
	public function index() {
		$this->registry->set('log',  DIR_LOGS . 'error.log');
		
		set_error_handler(array($this, 'handler'));	
	}
	
	public function handler($code, $message, $file, $line) {
		// error suppressed with @
		if (error_reporting() === 0) {
			return false;
		}
	
		switch ($code) {
			case E_NOTICE:
			case E_USER_NOTICE:
				$error = 'Notice';
				break;
			case E_WARNING:
			case E_USER_WARNING:
				$error = 'Warning';
				break;
			case E_ERROR:
			case E_USER_ERROR:
				$error = 'Fatal Error';
				break;
			default:
				$error = 'Unknown';
				break;
		}

        if (defined('PHP_ERROR_DISPLAY') && PHP_ERROR_DISPLAY == 1) {
			echo '<b>' . $error . '</b>: ' . $message . ' in <b>' . $file . '</b> on line <b>' . $line . '</b>';
		}

		if (defined('PHP_ERROR_LOG') && PHP_ERROR_LOG == 1) {
			$this->log->write('PHP ' . $error . ':  ' . $message . ' in ' . $file . ' on line ' . $line);
		}

        if (defined('PHP_ERROR_HALT') && PHP_ERROR_HALT == 1) {
            exit();
        }

		return true;
	} 
} 
