<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ModelAccountActivity extends Model {
	public function addActivity($key, $data) {
		if (isset($data['customer_id'])) {
			$customer_id = $data['customer_id'];
		} else {
			$customer_id = 0;
		}

		$this->db->query("INSERT INTO `oc_customer_activity` SET `customer_id` = :customer_id, `key` = :key, `data` = :data, `ip` = :ip",
            [
                ':customer_id' => $customer_id,
                ':key' => $key,
                ':data' => json_encode($data),
                ':ip' => $this->request->server['REMOTE_ADDR']
            ]);
	}
}