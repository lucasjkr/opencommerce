<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ModelAccountTransaction extends Model {
	public function getTransactions($data = []) {
		$sql = "SELECT * FROM `oc_customer_transaction` WHERE customer_id = :customer_id";
        $args[':customer_id'] = $this->customer->getId();

		$sort_data = [
			'amount',
			'description',
			'date_added'
		];

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY date_added";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql, $args);

		return $query->rows;
	}

	public function getTotalTransactions() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `oc_customer_transaction` WHERE customer_id = :customer_id",
            [
                ':customer_id' => $this->customer->getId()
            ]);

		return $query->row['total'];
	}

	public function getTotalAmount() {
		$query = $this->db->query("SELECT SUM(amount) AS total FROM `oc_customer_transaction` WHERE customer_id = :customer_id GROUP BY customer_id",
            [
                ':customer_id' => $this->customer->getId()
            ]);

		if ($query->num_rows) {
			return $query->row['total'];
		} else {
			return 0;
		}
	}
}