<?php
class ModelReportOnlineAdmin extends Model {
	public function getOnline($data = []) {
		$sql = "SELECT co.ip, co.customer_id, co.url, co.referer, co.date_added FROM oc_customer_online co LEFT JOIN oc_customer c ON (co.customer_id = c.customer_id)";

		$implode = [];
        $args = [];

		if (!empty($data['filter_ip'])) {
			$implode[] = "co.ip LIKE :ip";
            $args[':ip'] = $data['filter_ip'];
		}

		if (!empty($data['filter_customer'])) {
			$implode[] = "co.customer_id > 0 AND CONCAT(c.firstname, ' ', c.lastname) LIKE :name";
            $args[':name'] = $data['filter_customer'];
		}

		if ($implode) {
			$sql .= " WHERE " . implode(" AND ", $implode);
		}

		$sql .= " ORDER BY co.date_added DESC";

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

	public function getTotalOnline($data = []) {
		$sql = "SELECT COUNT(*) AS total FROM `oc_customer_online` co LEFT JOIN oc_customer c ON (co.customer_id = c.customer_id)";

		$implode = [];
        $args = [];

		if (!empty($data['filter_ip'])) {
			$implode[] = "co.ip LIKE :ip";
		    $args[':ip'] = $data['filter_ip'];
		}

		if (!empty($data['filter_customer'])) {
			$implode[] = "co.customer_id > 0 AND CONCAT(c.firstname, ' ', c.lastname) LIKE :name";
            $args[':name'] = $data['filter_customer'];
		}

		if ($implode) {
			$sql .= " WHERE " . implode(" AND ", $implode);
		}

		$query = $this->db->query($sql, $args);

		return $query->row['total'];
	}
}
