<?php
class ModelCatalogDownload extends Model {
	public function addDownload($data) {
		$this->db->query("INSERT INTO `oc_download` SET `filename` = :filename, `mask` = :mask",
            [
                ':filename' => $data['filename'],
                ':mask' => $data['mask']
            ]);

		$download_id = $this->db->getLastId();

		foreach ($data['download_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO `oc_download_description` SET `download_id` = :download_id, `language_id` = :language_id, `name` = :name",
                [
                    ':download_id' => $download_id,
                    ':language_id' => $language_id,
                    ':name' => $value['name']
                ]);
		}

		return $download_id;
	}

	public function editDownload($download_id, $data) {
		$this->db->query("UPDATE oc_download SET filename = :filename, mask = :mask WHERE download_id = :download_id",
            [
                ':filename' => $data['filename'],
                ':mask' => $data['mask'],
                ':download_id' => $download_id,
            ]);

		$this->db->query("DELETE FROM oc_download_description WHERE download_id = :download_id",
            [
                ':download_id' => $download_id,
            ]);

		foreach ($data['download_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO oc_download_description SET download_id = :download_id, language_id = :language_id, name = :name",
                [
                    ':download_id' => $download_id,
                    ':language_id' => $language_id,
                    ':name' => $value['name']
                ]);
		}
	}

	public function deleteDownload($download_id) {
		$this->db->query("DELETE FROM oc_download WHERE download_id = download_id",
            [
                ':download_id' => $download_id,
            ]);
		$this->db->query("DELETE FROM oc_download_description WHERE download_id = download_id",
            [
                ':download_id' => $download_id,
            ]);
	}

	public function getDownload($download_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM oc_download d LEFT JOIN oc_download_description dd ON (d.download_id = dd.download_id) WHERE d.download_id = '" . (int)$download_id . "' AND dd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		return $query->row;
	}

	public function getDownloads($data = array()) {
		$sql = "SELECT * FROM oc_download d LEFT JOIN oc_download_description dd ON (d.download_id = dd.download_id) WHERE dd.language_id = :language_id";

        $args[':language_id'] = $this->config->get('config_language_id');

		if (!empty($data['filter_name'])) {
			$sql .= " AND dd.name LIKE :filter_name";
            $args[':filter_name'] = $data['filter_name']) . '%';
		}

		$sort_data = array(
			'dd.name',
			'd.date_added'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY dd.name";
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

	public function getDownloadDescriptions($download_id) {
		$download_description_data = array();

		$query = $this->db->query("SELECT * FROM oc_download_description WHERE download_id = :download_id",
            [
                ':download_id' => $download_id,
            ]);

		foreach ($query->rows as $result) {
			$download_description_data[$result['language_id']] = array('name' => $result['name']);
		}

		return $download_description_data;
	}

	public function getTotalDownloads() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_download");

		return $query->row['total'];
	}

	public function getReports($download_id, $start = 0, $limit = 10) {
		if ($start < 0) {
			$start = 0;
		}

		if ($limit < 1) {
			$limit = 10;
		}

		$query = $this->db->query("SELECT ip, store_id, country, date_added FROM oc_download_report WHERE download_id = :download_id ORDER BY date_added ASC LIMIT " . (int)$start . "," . (int)$limit,
            [
                ':download_id' => $download_id,
            ]);

		return $query->rows;
	}

	public function getTotalReports($download_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_download_report WHERE download_id = :download_id"
            [
                ':download_id' => $download_id,
            ]);

		return $query->row['total'];
	}
}