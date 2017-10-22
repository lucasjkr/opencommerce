<?php
class ModelAccountReturn extends Model {
	public function addReturn($data) {
		$this->db->query("INSERT INTO `oc_return` SET order_id = :order_id, customer_id = :customer_id, firstname = :firstname, lastname = :lastname, email = :email, telephone = :telephone, product = :product, model = :model, quantity = :quantity, opened = :opened, return_reason_id = :return_reason_id, return_status_id = :return_status_id, comment = :comment, date_ordered = :date_ordered",
            [
                ':order_id' => $data['order_id'],
                ':customer_id' => $this->customer->getId(),
                ':firstname' => $data['firstname'],
                ':lastname' => $data['lastname'],
                ':email' => $data['email'],
                ':telephone' => $data['telephone'],
                ':product' => $data['product'],
                ':model' => $data['model'],
                ':quantity' => $data['quantity'],
                ':opened' => $data['opened'],
                ':return_reason_id' => $data['return_reason_id'],
                ':return_status_id' => $this->config->get('config_return_status_id') ,
                ':comment' => $data['comment'],
                ':date_ordered' => $data['date_ordered'],
            ]);

		return $this->db->getLastId();
	}

	public function getReturn($return_id) {
		$query = $this->db->query("SELECT r.return_id, r.order_id, r.firstname, r.lastname, r.email, r.telephone, r.product, r.model, r.quantity, r.opened, (SELECT rr.name FROM oc_return_reason rr WHERE rr.return_reason_id = r.return_reason_id AND rr.language_id = :language_id_1 AS reason, (SELECT ra.name FROM oc_return_action ra WHERE ra.return_action_id = r.return_action_id AND ra.language_id = :language_id_2) AS action, (SELECT rs.name FROM oc_return_status rs WHERE rs.return_status_id = r.return_status_id AND rs.language_id = :language_id_3) AS status, r.comment, r.date_ordered, r.date_added, r.date_modified FROM `oc_return` r WHERE r.return_id = :return_id  AND r.customer_id = :customer_id",
            [
                ':return' => $return_id,
                ':customer_id' => $this->customer->getId(),
                ':language_id_1' => $this->config->get('config_language_id'),
                ':language_id_2' => $this->config->get('config_language_id'),
                ':language_id_3' => $this->config->get('config_language_id')
            ]);

		return $query->row;
	}

	public function getReturns($start = 0, $limit = 20) {
		if ($start < 0) {
			$start = 0;
		}

		if ($limit < 1) {
			$limit = 20;
		}

		$query = $this->db->query("SELECT r.return_id, r.order_id, r.firstname, r.lastname, rs.name as status, r.date_added FROM `oc_return` r LEFT JOIN oc_return_status rs ON (r.return_status_id = rs.return_status_id) WHERE r.customer_id = :customer_id AND rs.language_id = :language_id ORDER BY r.return_id DESC LIMIT " . (int)$start . "," . (int)$limit,
            [
                ':customer_id' => $this->customer->getId(),
                ':language_id' => $this->config->get('config_language_id'),
            ]);

		return $query->rows;
	}

	public function getTotalReturns() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `oc_return`WHERE customer_id = :customer_id",
            [
                ':customer_id' => $this->customer->getId()
            ]);

		return $query->row['total'];
	}

	public function getReturnHistories($return_id) {
		$query = $this->db->query("SELECT rh.date_added, rs.name AS status, rh.comment FROM oc_return_history rh LEFT JOIN oc_return_status rs ON rh.return_status_id = rs.return_status_id WHERE rh.return_id = :return_id AND rs.language_id = :language_id ORDER BY rh.date_added ASC",
            [
                ':return_id' => $return_id,
                ':langauge_id' => $this->config->get('config_language_id'),
            ]);

		return $query->rows;
	}
}
