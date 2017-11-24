<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ModelExtensionDashboardOnlineAdmin extends Model {
	public function getTotalOnline($data = []) {
	    $args = [];
		$sql = "SELECT COUNT(*) AS total FROM `oc_customer_online` co LEFT JOIN oc_customer c ON (co.customer_id = c.customer_id)";

		$implode = [];

		if (!empty($data['filter_ip'])) {
			$implode[] = "co.ip LIKE :ip";
            $args[':ip'] = $data['filter_ip'];
		}

		if (!empty($data['filter_customer'])) {
			$implode[] = "co.customer_id > 0 AND CONCAT(c.firstname, ' ', c.lastname) LIKE :customer";
            $args[':customer'] = $data['filter_customer'];
		}

		if ($implode) {
			$sql .= " WHERE " . implode(" AND ", $implode);
		}

		$query = $this->db->query($sql, $args);

		return $query->row['total'];
	}
}