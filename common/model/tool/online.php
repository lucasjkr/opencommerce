<?php
class ModelToolOnline extends Model {
	public function addOnline($ip, $customer_id, $url, $referer) {
		$this->db->query("DELETE FROM `oc_customer_online` WHERE date_added < :date_added",
            [
                ':date_added' => date('Y-m-d H:i:s', strtotime('-1 hour'))
            ]);

		$this->db->query("REPLACE INTO `oc_customer_online` SET `ip` = :ip, `customer_id` = :customer_id, `url` = :url, `referer` = :referer",
            [
                ':ip' => $ip,
                ':customer_id' => $customer_id,
                ':url' => $url,
                ':referer' => $referer
            ]);
	}
}
