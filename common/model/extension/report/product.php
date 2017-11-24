<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ModelExtensionReportProduct extends Model {
	public function getProductsViewed($data = []) {
		$sql = "SELECT p.product_id, pd.name, p.model, COUNT(pv.`product_id`) as viewed FROM oc_product p LEFT JOIN oc_product_description pd ON p.product_id = pd.product_id LEFT JOIN oc_product_views pv ON p.product_id = pv.product_id WHERE pd.language_id = :language_id GROUP BY product_id ORDER BY viewed DESC";

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
		$query = $this->db->query("SELECT COUNT(product_id) AS total FROM oc_product_views");

		return $query->row['total'];
	}

	public function getTotalProductsViewed() {
		$query = $this->db->query("SELECT COUNT(pv.product_id) FROM (SELECT DISTINCT product_id FROM oc_product_views) pv");

		return $query->row['total'];
	}

	public function reset() {
		$this->db->query("DELETE FROM oc_product_views");
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
