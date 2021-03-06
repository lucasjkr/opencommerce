<?php
class ModelExtensionReportCustomerTransaction extends Model {
	public function getTransactions($data = []) {
		$sql = "SELECT ct.customer_id, CONCAT(c.firstname, ' ', c.lastname) AS customer, c.email, cgd.name AS customer_group, c.status, SUM(ct.amount) AS total FROM `oc_customer_transaction` ct LEFT JOIN `oc_customer` c ON (ct.customer_id = c.customer_id) LEFT JOIN `oc_customer_group_description` cgd ON (c.customer_group_id = cgd.customer_group_id) WHERE cgd.language_id = '" . (int)$this->config->get('config_language_id') . "'";
        $args = [];

		if (!empty($data['filter_date_start'])) {
			$sql .= " AND DATE(ct.date_added) >= :date_start";
            $args[':date_start'] = $data['filter_date_start'];
		}

		if (!empty($data['filter_date_end'])) {
			$sql .= " AND DATE(ct.date_added) <= :date_end";
            $args[':date_end'] = $data['filter_date_end'];
		}

		if (!empty($data['filter_customer'])) {
			$sql .= " AND CONCAT(c.firstname, ' ', c.lastname) LIKE :customer";
            $args[':customer'] = $data['filter_customer'];
		}

		$sql .= " GROUP BY ct.customer_id ORDER BY total DESC";

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

	public function getTotalTransactions($data = []) {
		$sql = "SELECT COUNT(DISTINCT ct.customer_id) AS total FROM `oc_customer_transaction` ct LEFT JOIN `oc_customer` c ON (ct.customer_id = c.customer_id)";

		$implode = [];
        $args = [];

		if (!empty($data['filter_date_start'])) {
			$implode[] = "DATE(ct.date_added) >= :date_start'";
            $args[':date_start'] = $data['filter_date_start'];
		}

		if (!empty($data['filter_date_end'])) {
			$implode[] = "DATE(ct.date_added) <= :date_end";
            $args[':date_end'] = $data['filter_date_end'];
		}

		if (!empty($data['filter_customer'])) {
			$implode[] = "CONCAT(c.firstname, ' ', c.lastname) LIKE :customer";
            $args[':customer'] = $data['filter_customer'];
		}

		if ($implode) {
			$sql .= " WHERE " . implode(" AND ", $implode);
		}

		$query = $this->db->query($sql, $args);

		return $query->row['total'];
	}
}