<?php
class ModelExtensionReportProductAdmin extends Model {
	public function getProductsViewed($data = []) {
		$sql = "SELECT pd.name, p.model, p.viewed FROM oc_product p LEFT JOIN oc_product_description pd ON (p.product_id = pd.product_id) WHERE pd.language_id = :language_id AND p.viewed > 0 ORDER BY p.viewed DESC";
        $args[':language_id'] = $this->config->get('config_language_id');

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

	public function getTotalProductViews() {
		$query = $this->db->query("SELECT SUM(viewed) AS total FROM oc_product");

		return $query->row['total'];
	}

	public function getTotalProductsViewed() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_product WHERE viewed > 0");

		return $query->row['total'];
	}

	public function reset() {
		$this->db->query("UPDATE oc_product SET viewed = '0'");
	}

	public function getPurchased($data = []) {
		$sql = "SELECT op.name, op.model, SUM(op.quantity) AS quantity, SUM((op.price + op.tax) * op.quantity) AS total FROM oc_order_product op LEFT JOIN `oc_order` o ON (op.order_id = o.order_id)";
        $args = [];

		if (!empty($data['filter_order_status_id'])) {
			$sql .= " WHERE o.order_status_id = :order_status_id";
            $args[':order_status_id'] = $data['filter_order_status_id'];
		} else {
			$sql .= " WHERE o.order_status_id > '0'";
		}

		if (!empty($data['filter_date_start'])) {
			$sql .= " AND DATE(o.date_added) >= :date_start";
            $args[':date_start'] = $data['filter_date_start'];
		}

		if (!empty($data['filter_date_end'])) {
			$sql .= " AND DATE(o.date_added) <= :date_end";
            $args[':date_end'] = $data['filter_date_end'];
		}

		$sql .= " GROUP BY op.product_id ORDER BY total DESC";

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

	public function getTotalPurchased($data) {
		$sql = "SELECT COUNT(DISTINCT op.product_id) AS total FROM `oc_order_product` op LEFT JOIN `oc_order` o ON (op.order_id = o.order_id)";
        $args = [];

		if (!empty($data['filter_order_status_id'])) {
			$sql .= " WHERE o.order_status_id = :order_status_id";
            $args[':order_status_id'] = $data['filter_order_status_id'];
		} else {
			$sql .= " WHERE o.order_status_id > '0'";
		}

		if (!empty($data['filter_date_start'])) {
			$sql .= " AND DATE(o.date_added) >= :date_end";
            $args[':date_end'] = $data['filter_date_start'];
		}

		if (!empty($data['filter_date_end'])) {
			$sql .= " AND DATE(o.date_added) <= :date_end";
            $args[':date_end'] = $data['filter_date_end'];
		}

		$query = $this->db->query($sql, $args);

		return $query->row['total'];
	}
}
