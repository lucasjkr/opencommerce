<?php
class ModelExtensionDashboardMapAdmin extends Model {
	public function getTotalOrdersByCountry() {
		$implode = [];
		
		if (is_array($this->config->get('config_complete_status'))) {
			foreach ($this->config->get('config_complete_status') as $order_status_id) {
				$implode[] = (int)$order_status_id;
			}
		}
		
		if ($implode) {
			$query = $this->db->query("SELECT COUNT(*) AS total, SUM(o.total) AS amount, c.iso_code_2 FROM `oc_order` o LEFT JOIN `oc_country` c ON (o.payment_country_id = c.country_id) WHERE o.order_status_id IN('" . (int)implode(',', $implode) . "') GROUP BY o.payment_country_id");

			return $query->rows;
		} else {
			return [];
		}
	}
}