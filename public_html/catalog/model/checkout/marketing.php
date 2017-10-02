<?php
class ModelCheckoutMarketing extends Model {
	public function getMarketingByCode($code) {
		$query = $this->db->query("SELECT * FROM oc_marketing WHERE code = '" . $this->db->escape($code) . "'");

		return $query->row;
	}
}