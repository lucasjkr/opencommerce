<?php
class ModelAccountDownload extends Model {
	public function getDownload($download_id) {
		$implode = [];

		$order_statuses = $this->config->get('config_complete_status');

		foreach ($order_statuses as $order_status_id) {
			$implode[] = "o.order_status_id = '" . (int)$order_status_id . "'";
		}

		if ($implode) {
			$query = $this->db->query("SELECT d.filename, d.mask FROM `oc_order` o LEFT JOIN oc_order_product op ON (o.order_id = op.order_id) LEFT JOIN oc_product_to_download p2d ON (op.product_id = p2d.product_id) LEFT JOIN oc_download d ON (p2d.download_id = d.download_id) WHERE o.customer_id = :customer_id AND (" . implode(" OR ", $implode) . ") AND d.download_id = :download_id",
                [
                    ':customer_id' => $this->customer->getId(),
                    ':download_id' => $download_id,
                ]);

			return $query->row;
		} else {
			return;
		}
	}

	public function getDownloads($start = 0, $limit = 20) {
		if ($start < 0) {
			$start = 0;
		}

		if ($limit < 1) {
			$limit = 20;
		}

		$implode = [];

		$order_statuses = $this->config->get('config_complete_status');

		foreach ($order_statuses as $order_status_id) {
			$implode[] = "o.order_status_id = '" . (int)$order_status_id . "'";
		}

		if ($implode) {
			$query = $this->db->query("SELECT DISTINCT d.download_id, o.order_id, o.date_added, dd.name, d.filename FROM `oc_order` o LEFT JOIN oc_order_product op ON (o.order_id = op.order_id) LEFT JOIN oc_product_to_download p2d ON (op.product_id = p2d.product_id) LEFT JOIN oc_download d ON (p2d.download_id = d.download_id) LEFT JOIN oc_download_description dd ON (d.download_id = dd.download_id) WHERE o.customer_id = :customer_id AND dd.language_id = :language_id AND (" . implode(" OR ", $implode) . ") ORDER BY o.date_added DESC LIMIT " . (int)$start . "," . (int)$limit,
                [
                    ':customer_id' => $this->customer->getId(),
                    ':language_id' => $this->config->get('config_language_id'),
                ]);

			return $query->rows;
		} else {
			return array();
		}
	}

	public function getTotalDownloads() {
		$implode = [];

		$order_statuses = $this->config->get('config_complete_status');

		foreach ($order_statuses as $order_status_id) {
			$implode[] = "o.order_status_id = '" . (int)$order_status_id . "'";
		}

		if ($implode) {
			$query = $this->db->query("SELECT COUNT(*) AS total FROM `oc_order` o LEFT JOIN oc_order_product op ON (o.order_id = op.order_id) LEFT JOIN oc_product_to_download p2d ON (op.product_id = p2d.product_id) WHERE o.customer_id = :customer_id AND (" . implode(" OR ", $implode) . ")",
                [
                    ':customer_id' => $this->customer->getId()
                ]);

			return $query->row['total'];
		} else {
			return 0;
		}
	}

	public function addDownloadReport($download_id, $ip, $country = '') {
		$this->db->query("INSERT INTO `oc_download_report` SET download_id = :download_id , store_id = :store_id, ip = :ip, country = :country",
            [
                ':download_id' => $download_id,
                ':store_id' => $this->config->get('config_store_id'),
                ':ip' => $ip,
                ':country' => $country
            ]);
	}
}