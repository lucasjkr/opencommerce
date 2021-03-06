<?php
class ModelSaleRecurringAdmin extends Model {
	public function getRecurrings($data) {
		$sql = "SELECT `or`.order_recurring_id, `or`.order_id, `or`.reference, `or`.`status`, `or`.`date_added`, CONCAT(`o`.firstname, ' ', `o`.lastname) AS customer FROM `oc_order_recurring` `or` LEFT JOIN `oc_order` `o` ON (`or`.order_id = `o`.order_id)";

		$implode = [];
        $args = [];

		if (!empty($data['filter_order_recurring_id'])) {
			$implode[] = "or.order_recurring_id = :order_recurring_id";
            $args[':order_recurring_id'] = $data['filter_order_recurring_id'];
		}

		if (!empty($data['filter_order_id'])) {
			$implode[] = "or.order_id = :order_id";
            $args[':order_id'] = $data['filter_order_id'];
		}

		if (!empty($data['filter_reference'])) {
			$implode[] = "or.reference LIKE :reference";
            $args[':reference'] = $data['folter_reference'] . '%';
		}

		if (!empty($data['filter_customer'])) {
			$implode[] = "CONCAT(o.firstname, ' ', o.lastname) LIKE :customer";
            $args[':customer'] = $data['filter_customer'] . '%';
		}

		if (!empty($data['filter_status'])) {
			$implode[] = "or.status = :status";
            $args[':status'] = $data['filter_status'];
		}

		if (!empty($data['filter_date_added'])) {
			$implode[] = "DATE(or.date_added) = DATE(:date_added)";
            $args[':date_added'] = $data['filter_date_added'];
		}

		if ($implode) {
			$sql .= " WHERE " . implode(" AND ", $implode);
		} 
			 
		$sort_data = [
			'or.order_recurring_id',
			'or.order_id',
			'or.reference',
			'customer',
			'or.status',
			'or.date_added'
		];

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY or.order_recurring_id";
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

	public function getRecurring($order_recurring_id) {
		$query = $this->db->query("SELECT * FROM oc_order_recurring WHERE order_recurring_id = :order_recurring_id",
            [
                ':order_recurring_id' => $order_recurring_id
            ]);

		return $query->row;
	}

	public function getRecurringTransactions($order_recurring_id) {
		$transactions = [];

		$query = $this->db->query("SELECT amount, type, date_added FROM oc_order_recurring_transaction WHERE order_recurring_id = :order_recurring_id ORDER BY date_added DESC",
            [
                ':order_recurring_id' => $order_recurring_id
            ]);

		foreach ($query->rows as $result) {
			switch ($result['type']) {
				case 0:
					$type = $this->language->get('text_transaction_date_added');
					break;
				case 1:
					$type = $this->language->get('text_transaction_payment');
					break;
				case 2:
					$type = $this->language->get('text_transaction_outstanding_payment');
					break;
				case 3:
					$type = $this->language->get('text_transaction_skipped');
					break;
				case 4:
					$type = $this->language->get('text_transaction_failed');
					break;
				case 5:
					$type = $this->language->get('text_transaction_cancelled');
					break;
				case 6:
					$type = $this->language->get('text_transaction_suspended');
					break;
				case 7:
					$type = $this->language->get('text_transaction_suspended_failed');
					break;
				case 8:
					$type = $this->language->get('text_transaction_outstanding_failed');
					break;
				case 9:
					$type = $this->language->get('text_transaction_expired');
					break;
				default:
					$type = '';
					break;
			}

			$transactions[] = [
				'date_added' => $result['date_added'],
				'amount'     => $result['amount'],
				'type'       => $type
			];
		}

		return $transactions;
	}

	private function getStatus($status) {
		switch ($status) {
			case 1:
				$result = $this->language->get('text_status_inactive');
				break;
			case 2:
				$result = $this->language->get('text_status_active');
				break;
			case 3:
				$result = $this->language->get('text_status_suspended');
				break;
			case 4:
				$result = $this->language->get('text_status_cancelled');
				break;
			case 5:
				$result = $this->language->get('text_status_expired');
				break;
			case 6:
				$result = $this->language->get('text_status_pending');
				break;
			default:
				$result = '';
				break;
		}

		return $result;
	}
	
	public function getTotalRecurrings($data = []) {
		$sql = "SELECT COUNT(*) AS `total` FROM `oc_order_recurring` `or` LEFT JOIN `oc_order` o ON (`or`.order_id = `o`.order_id)";
		
		$implode = [];
        $args = [];

		if (!empty($data['filter_order_recurring_id'])) {
			$implode[] .= "or.order_recurring_id = :order_recurring_id";
            $args[':order_recurring_id'] = $data['filter_order_recurring_id'];
		}

		if (!empty($data['filter_order_id'])) {
			$implode[] .= "or.order_id = :order_id";
            $args[':order_id'] = $data['filter_order_id'];
		}

		if (!empty($data['filter_payment_reference'])) {
			$implode[] .= " or.reference LIKE :reference";
            $args[':reference'] = $data['filter_reference'] . '%';
		}

		if (!empty($data['filter_customer'])) {
			$implode[] .= "CONCAT(o.firstname, ' ', o.lastname) LIKE :customer";
            $args['customer'] = $data['filter_customer'] . '%';
		}

		if (!empty($data['filter_status'])) {
			$implode[] .= "or.status = :status";
            $args[':status'] = $data['filter_status'];
		}

		if (!empty($data['filter_date_added'])) {
			$implode[] .= "DATE(or.date_added) = DATE(:date_added)";
            $args[':date_added'] = $data['filter_date_added'];
		}
		
		if ($implode) {
			$sql .= " WHERE " . implode(" AND ", $implode);
		} 
		
		$query = $this->db->query($sql, $args);

		return $query->row['total'];
	}	
}
