<?php
namespace Template;
final class Twig {
	private $twig;
	private $data = [];

	public function set($key, $value) {
		$this->data[$key] = $value;
	}

	public function render($template, $cache = false) {
		// specify where to look for templates
		$loader = new \Twig_Loader_Filesystem(DIR_TEMPLATE);

		// initialize Twig environment
		$config = array('autoescape' => false);

		if ($cache) {
			$config['cache'] = DIR_CACHE;
            $config['auto_reload'] = true;
		}

		$this->twig = new \Twig_Environment($loader, $config);

		try {
			// load template
			$template = $this->twig->loadTemplate($template . '.twig');

			return $template->render($this->data);
		} catch (Exception $e) {
			trigger_error('Error: Could not load template ' . $template . '!');
			exit();
		}
	}
}
