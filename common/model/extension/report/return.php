<?php
class ModelExtensionReportReturn extends Model {
	public function getReturns($data = []) {
		$sql = "SELECT MIN(r.date_added) AS date_start, MAX(r.date_added) AS date_end, COUNT(r.return_id) AS `returns` FROM `oc_return` r";
        $args = [];

		if (!empty($data['filter_return_status_id'])) {
			$sql .= " WHERE r.return_status_id = :return_status_id";
            $args[':return_status_id'] = $data['filter_return_status_id'];
		} else {
			$sql .= " WHERE r.return_status_id > '0'";
		}

		if (!empty($data['filter_date_start'])) {
			$sql .= " AND DATE(r.date_added) >= :date_start";
            $args[':date_start'] = $data['filter_date_start'];
		}

		if (!empty($data['filter_date_end'])) {
			$sql .= " AND DATE(r.date_added) <= :date_end";
            $args[':date_end'] = $data['filter_date_end'];
		}

		if (isset($data['filter_group'])) {
			$group = $data['filter_group'];
		} else {
			$group = 'week';
		}

		switch($group) {
			case 'day';
				$sql .= " GROUP BY YEAR(r.date_added), MONTH(r.date_added), DAY(r.date_added)";
				break;
			default:
			case 'week':
				$sql .= " GROUP BY YEAR(r.date_added), WEEK(r.date_added)";
				break;
			case 'month':
				$sql .= " GROUP BY YEAR(r.date_added), MONTH(r.date_added)";
				break;
			case 'year':
				$sql .= " GROUP BY YEAR(r.date_added)";
				break;
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
		if (!empty($data['filter_group'])) {
			$group = $data['filter_group'];
		} else {
			$group = 'week';
		}

		switch($group) {
			case 'day';
				$sql = "SELECT COUNT(DISTINCT YEAR(date_added), MONTH(date_added), DAY(date_added)) AS total FROM `oc_return`";
				break;
			default:
			case 'week':
				$sql = "SELECT COUNT(DISTINCT YEAR(date_added), WEEK(date_added)) AS total FROM `oc_return`";
				break;
			case 'month':
				$sql = "SELECT COUNT(DISTINCT YEAR(date_added), MONTH(date_added)) AS total FROM `oc_return`";
				break;
			case 'year':
				$sql = "SELECT COUNT(DISTINCT YEAR(date_added)) AS total FROM `oc_return`";
				break;
		}

		$args = [];

		if (!empty($data['filter_return_status_id'])) {
			$sql .= " WHERE return_status_id = :return_status_id";
            $args[':return_status_id'] = $data['filter_return_status_id'];
		} else {
			$sql .= " WHERE return_status_id > '0'";
		}

		if (!empty($data['filter_date_start'])) {
			$sql .= " AND DATE(date_added) >= :date_start";
            $args[':date_start'] = $data['filter_date_start'];
		}

		if (!empty($data['filter_date_end'])) {
			$sql .= " AND DATE(date_added) <= :date_end";
            $args[':date_end'] = $data['filter_date_end'];
		}

		$query = $this->db->query($sql, $args);

		return $query->row['total'];
	}
}