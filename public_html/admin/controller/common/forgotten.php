<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ControllerCommonForgotten extends Controller {
	private $error = [];

	public function index() {
		if ($this->user->isLogged() && isset($this->request->get['user_token']) && ($this->request->get['user_token'] == $this->session->data['user_token'])) {
			$this->response->redirect($this->url->link('common/dashboard', ''));
		}

		if (!$this->config->get('config_password')) {
			$this->response->redirect($this->url->link('common/login', ''));
		}

		$this->load->language('common/forgotten');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('user/user_admin');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_user_user_admin->editCode($this->request->post['email'], token(40));
			
			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('common/login', ''));
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = [];

		$data['breadcrumbs'][] = [
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', '')
        ];

		$data['breadcrumbs'][] = [
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('common/forgotten', 'user_token=' . '')
        ];

		$data['action'] = $this->url->link('common/forgotten', '');

		$data['cancel'] = $this->url->link('common/login', '');

		if (isset($this->request->post['email'])) {
			$data['email'] = $this->request->post['email'];
		} else {
			$data['email'] = '';
		}

		$data['header'] = $this->load->controller('common/header');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('common/forgotten', $data));
	}

	protected function validate() {
	    // LJK - is this lookinf for duplicate users by email?
        // LJK TODO: Why not index the email column to prevent that?
        // Correction its searching and getting a count which is stupid. Just search and if there are results, you're good.
		if (!isset($this->request->post['email'])) {
			$this->error['warning'] = $this->language->get('error_email');
		} elseif (!$this->model_user_user_admin->getTotalUsersByEmail($this->request->post['email'])) {
			$this->error['warning'] = $this->language->get('error_email');
		}

		return !$this->error;
	}
}