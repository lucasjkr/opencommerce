<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ModelExtensionDashboardActivityAdmin extends Model {
	public function getActivities() {
		$query = $this->db->query("SELECT `key`, `data`, `date_added` FROM `oc_customer_activity` ORDER BY `date_added` DESC LIMIT 0,5");

		return $query->rows;
	}
}