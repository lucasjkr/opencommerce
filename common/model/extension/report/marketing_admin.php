<?php
class ModelExtensionReportMarketingAdmin extends Model {
	public function getMarketing($data = array()) {
		$sql = "SELECT m.marketing_id, m.name AS campaign, m.code, m.clicks AS clicks, (SELECT COUNT(DISTINCT order_id) FROM `oc_order` o1 WHERE o1.marketing_id = m.marketing_id";
        $args = [];

		if (!empty($data['filter_order_status_id'])) {
			$sql .= " AND o1.order_status_id = :order_status_id";
            $args[':order_status_id'] = $data['filter_order_status_id'];
		} else {
			$sql .= " AND o1.order_status_id > '0'";
		}

		if (!empty($data['filter_date_start'])) {
			$sql .= " AND DATE(o1.date_added) >= :date_start";
            $args[':date_start'] = $data['filter_date_start'];
		}

		if (!empty($data['filter_date_end'])) {
			$sql .= " AND DATE(o1.date_added) <= :date_end";
            $args[':date_end'] = $data['filter_date_end'];
		}

		$sql .= ") AS `orders`, (SELECT SUM(total) FROM `oc_order` o2 WHERE o2.marketing_id = m.marketing_id";

		if (!empty($data['filter_order_status_id'])) {
			$sql .= " AND o2.order_status_id = :order_status_id";
            $args[':order_status_id'] = $data['filter_order_status_id'];
		} else {
			$sql .= " AND o2.order_status_id > '0'";
		}

		if (!empty($data['filter_date_start'])) {
			$sql .= " AND DATE(o2.date_added) >= :date_start_2";
            $args[':date_start_2'] = $data['filter_date_start'];
		}

		if (!empty($data['filter_date_end'])) {
			$sql .= " AND DATE(o2.date_added) <= :date_end_2";
            $args[':date_end_2'] = $data['filter_date_end'];
		}

		$sql .= " GROUP BY o2.marketing_id) AS `total` FROM `oc_marketing` m ORDER BY m.date_added ASC";

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

	public function getTotalMarketing($data = array()) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `oc_marketing`");

		return $query->row['total'];
	}
}