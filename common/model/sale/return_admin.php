<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ModelSaleReturnAdmin extends Model {
	public function addReturn($data) {
		$this->db->query("INSERT INTO `oc_return` SET order_id = :order_id, product_id = :product_id , customer_id = :customer_id,
 firstname = :firstname, lastname = :lastname, email = :email, telephone = :telephone, product = :product, model = :model, 
 quantity = :quantity, opened = :opened, return_reason_id = :return_reason_id, return_action_id = :return_action_id, 
 return_status_id = :return_status_id, comment = :comment, date_ordered = :date_ordered ",
            [
                ':order_id' => $data['order_id'],
                ':product_id' => $data['product_id'],
                ':customer_id' => $data['customer_id'],
                ':firstname' => $data['firstname'],
                ':lastname' => $data['lastname'],
                ':email' => $data['email'],
                ':telephone' => $data['telephone'],
                ':product' => $data['product'],
                ':model' => $data['model'],
                ':quantity' => $data['quantity'],
                ':opened' => $data['opened'],
                ':return_reason_id' => $data['return_reason_id'],
                ':return_action_id' => $data['return_action_id'],
                ':return_status_id' => $data['return_status_id'],
                ':comment' => $data['comment'],
                ':date_ordered' => $data['date_ordered']
            ]);
	
		return $this->db->getLastId();
	}

	public function editReturn($return_id, $data) {
		$this->db->query("UPDATE `oc_return` SET order_id = :order_id, product_id = :product_id, customer_id = :customer_id, firstname = :firstname, lastname = :lastname, email = :email, telephone = :telephone, product = :product, model = :model, quantity = :quantity, opened = :opened, return_reason_id = :return_reason_id, return_action_id = :return_action_id, comment = :comment, date_ordered = :date_ordered WHERE return_id = :return_id",
            [
                ':order_id' => $data['order_id'],
                ':product_id' => $data['product_id'],
                ':customer_id' => $data['customer_id'],
                ':firstname' => $data['firstname'],
                ':lastname' => $data['lastname'],
                ':email' => $data['email'],
                ':telephone' => $data['telephone'],
                ':product' => $data['product'],
                ':model' => $data['model'],
                ':quantity' => $data['quantity'],
                ':opened' => $data['opened'],
                ':return_reason_id' => $data['return_reason_id'],
                ':return_action_id' => $data['return_action_id'],
                ':return_status_id' => $data['return_status_id'],
                ':comment' => $data['comment'],
                ':date_ordered' => $data['date_ordered'],
                ':return_id' => $return_id
            ]);
	}

	public function deleteReturn($return_id) {
		$this->db->query("DELETE FROM `oc_return` WHERE `return_id` = :return_id",
            [
                ':return_id' => $return_id
            ]);
		$this->db->query("DELETE FROM `oc_return_history` WHERE `return_id` = :return_id",
            [
                ':return_id' => $return_id
            ]);
	}

	public function getReturn($return_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT CONCAT(c.firstname, ' ', c.lastname) FROM oc_customer c WHERE c.customer_id = r.customer_id) AS customer, (SELECT rs.name FROM oc_return_status rs WHERE rs.return_status_id = r.return_status_id AND rs.language_id = :language_id) AS return_status FROM `oc_return` r WHERE r.return_id = :return_id",
            [
                ':language_id' => $this->config->get('config_language_id'),
                ':return_id' => $return_id
            ]);

		return $query->row;
	}

	public function getReturns($data = []) {
		$sql = "SELECT *, CONCAT(r.firstname, ' ', r.lastname) AS customer, (SELECT rs.name FROM oc_return_status rs WHERE rs.return_status_id = r.return_status_id AND rs.language_id = :language_id) AS return_status FROM `oc_return` r";
        $args[':language_id'] = $this->config->get('config_language_id');

		$implode = [];

		if (!empty($data['filter_return_id'])) {
			$implode[] = "r.return_id = :return_id";
            $args[':return_id'] = $data['filter_return_id'];
		}

		if (!empty($data['filter_order_id'])) {
			$implode[] = "r.order_id = '" . (int)$data['filter_order_id'] . "'";
            $args[':order_id'] = $data['filter_order_id'];
        }

		if (!empty($data['filter_customer'])) {
			$implode[] = "CONCAT(r.firstname, ' ', r.lastname) LIKE :customer";
            $args[':customer'] = $data['filter_customer'] . '%';
        }

		if (!empty($data['filter_product'])) {
			$implode[] = "r.product = :product";
            $args[':product'] = $data['filter_product'];
        }

		if (!empty($data['filter_model'])) {
			$implode[] = "r.model = :model";
            $args[':model'] = $data['filter_model'];
        }

		if (!empty($data['filter_return_status_id'])) {
			$implode[] = "r.return_status_id = :return_status_id";
            $args[':return_status_id'] = $data['filter_return_status_id'];
        }

		if (!empty($data['filter_date_added'])) {
			$implode[] = "DATE(r.date_added) = DATE(:date_added)";
            $args[':date_added'] = $data['filter_date_added'];
        }

		if (!empty($data['filter_date_modified'])) {
			$implode[] = "DATE(r.date_modified) = DATE(:date_modified)";
            $args[':date_modified'] = $data['filter_date_modified'];
        }

		if ($implode) {
			$sql .= " WHERE " . implode(" AND ", $implode);
		}

		$sort_data = [
			'r.return_id',
			'r.order_id',
			'customer',
			'r.product',
			'r.model',
			'status',
			'r.date_added',
			'r.date_modified'
		];

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY r.return_id";
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

	public function getTotalReturns($data = []) {
		$sql = "SELECT COUNT(*) AS total FROM `oc_return`r";

		$implode = [];
        $args = [];

		if (!empty($data['filter_return_id'])) {
            $implode[] = "r.return_id = :return_id";
            $args[':return_id'] = $data['filter_return_id'];
		}

		if (!empty($data['filter_customer'])) {
            $implode[] = "CONCAT(r.firstname, ' ', r.lastname) LIKE :customer";
            $args[':customer'] = $data['filter_customer'] . '%';
		}

		if (!empty($data['filter_order_id'])) {
            $implode[] = "r.order_id = '" . (int)$data['filter_order_id'] . "'";
            $args[':order_id'] = $data['filter_order_id'];		}

		if (!empty($data['filter_product'])) {
            $implode[] = "r.product = :product";
            $args[':product'] = $data['filter_product'];
		}

		if (!empty($data['filter_model'])) {
            $implode[] = "r.model = :model";
            $args[':model'] = $data['filter_model'];
		}

		if (!empty($data['filter_return_status_id'])) {
            $implode[] = "r.return_status_id = :return_status_id";
            $args[':return_status_id'] = $data['filter_return_status_id'];
		}

		if (!empty($data['filter_date_added'])) {
            $implode[] = "DATE(r.date_added) = DATE(:date_added)";
            $args[':date_added'] = $data['filter_date_added'];
		}

		if (!empty($data['filter_date_modified'])) {
            $implode[] = "DATE(r.date_modified) = DATE(:date_modified)";
            $args[':date_modified'] = $data['filter_date_modified'];
		}

		if ($implode) {
			$sql .= " WHERE " . implode(" AND ", $implode);
		}

		$query = $this->db->query($sql, $args);

		return $query->row['total'];
	}

	public function getTotalReturnsByReturnStatusId($return_status_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `oc_return` WHERE return_status_id = :return_status_id",
            [
                ':return_status_id' => $return_status_id
            ]);

		return $query->row['total'];
	}

	public function getTotalReturnsByReturnReasonId($return_reason_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `oc_return` WHERE return_reason_id = :return_reason_id",
            [
                ':return_reason_id' => $return_reason_id
            ]);

		return $query->row['total'];
	}

	public function getTotalReturnsByReturnActionId($return_action_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `oc_return` WHERE return_action_id = :return_action_id",
            [
                ':return_action_id' => $return_action_id
            ]);

		return $query->row['total'];
	}
	
	public function addReturnHistory($return_id, $return_status_id, $comment, $notify) {
		$this->db->query("UPDATE `oc_return` SET `return_status_id` = :return_status_id WHERE return_id = :return_id",
            [
                ':return_id' => $return_id,
                ':return_status_id' => $return_status_id
            ]);
		$this->db->query("INSERT INTO `oc_return_history` SET `return_id` = :return_id, return_status_id = :return_status_id, notify = :notify, comment = :comment",
            [
                ':return_id' => $return_id,
                ':return_status_id' => $return_status_id,
                ':notify' => $notify,
                ':comment' => $comment
            ]);
	}

	public function getReturnHistories($return_id, $start = 0, $limit = 10) {
		if ($start < 0) {
			$start = 0;
		}

		if ($limit < 1) {
			$limit = 10;
		}

		$query = $this->db->query("SELECT rh.date_added, rs.name AS status, rh.comment, rh.notify FROM oc_return_history rh LEFT JOIN oc_return_status rs ON rh.return_status_id = rs.return_status_id WHERE rh.return_id = :return_id AND rs.language_id = :language_id ORDER BY rh.date_added DESC LIMIT " . (int)$start . "," . (int)$limit,
            [
                ':return_id' => $return_id,
                ':language_id' => $this->config->get('config_language_id')
            ]);

		return $query->rows;
	}

	public function getTotalReturnHistories($return_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_return_history WHERE return_id = :return_id",
            [
                ':return_id' => $return_id
            ]);

		return $query->row['total'];
	}

	public function getTotalReturnHistoriesByReturnStatusId($return_status_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_return_history WHERE return_status_id = :return_status_id",
            [
                ':return_status_id' => $return_status_id
            ]);

		return $query->row['total'];
	}
}