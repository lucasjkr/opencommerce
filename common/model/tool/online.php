<?php
class ModelToolOnline extends Model {
	public function addOnline($ip, $customer_id, $url, $referer) {
		$this->db->query("DELETE FROM `oc_customer_online` WHERE date_added < '" . date('Y-m-d H:i:s', strtotime('-1 hour')) . "'");

		$this->db->query("REPLACE INTO `oc_customer_online` SET `ip` = '" . $this->db->escape($ip) . "', `customer_id` = '" . (int)$customer_id . "', `url` = '" . $this->db->escape($url) . "', `referer` = '" . $this->db->escape($referer) . "'");
	}
}
