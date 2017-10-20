<?php
class ControllerExtensionFeedOpenbaypro extends Controller {
	private $error = [];

	public function index() {
        $this->response->redirect($this->url->link('marketplace/openbay', 'user_token=' . $this->session->data['user_token'], true));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/openbaypro')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	public function install() {
		$this->load->model('setting/setting_admin');
		$this->load->model('setting/event_admin');

		$this->model_user_user_group_admin->addPermission($this->user->getGroupId(), 'access', 'marketplace/openbay');
		$this->model_user_user_group_admin->addPermission($this->user->getGroupId(), 'modify', 'marketplace/openbay');

		$settings = $this->model_setting_setting_admin->getSetting('feed_openbaypro');
		$settings['feed_openbaypro_status'] = 1;
		$settings['feed_openbaypro_language'] = "en_GB";
		$this->model_setting_setting_admin->editSetting('feed_openbaypro', $settings);

		$this->model_setting_event_admin->addEvent('openbay_product_del_after', 'admin/model/catalog/product/deleteProduct/after', 'marketplace/openbay/eventDeleteProduct');

		$this->model_setting_event_admin->addEvent('openbay_product_edit_after', 'admin/model/catalog/product/editProduct/after', 'marketplace/openbay/eventEditProduct');

		$this->model_setting_event_admin->addEvent('openbay_menu', 'admin/view/common/column_left/before', 'marketplace/openbay/eventMenu');
	}

	public function uninstall() {
		$this->load->model('setting/setting_admin');
		$this->load->model('setting/event_admin');

		$settings = $this->model_setting_setting_admin->getSetting('feed_openbaypro');
		$settings['feed_openbaypro_status'] = 0;
		$this->model_setting_setting_admin->editSetting('feed_openbaypro', $settings);

		$this->model_setting_event_admin->deleteEventByCode('openbay_product_del_after');
		$this->model_setting_event_admin->deleteEventByCode('openbay_product_edit_after');
		$this->model_setting_event_admin->deleteEventByCode('openbay_menu');
	}
}
