<?php
class ModelCatalogInformation extends Model {
	public function getInformation($information_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM oc_information i LEFT JOIN oc_information_description id ON (i.information_id = id.information_id) LEFT JOIN oc_information_to_store i2s ON (i.information_id = i2s.information_id) WHERE i.information_id = :information_id AND id.language_id = :language_id AND i2s.store_id = :store_id AND i.status = :status",
            [
                ':information_id' => $information_id,
                ':language_id' => $this->config->get('config_language_id'),
                ':store_id' => $this->config->get('config_store_id'),
                ':status' => 1
            ]);

		return $query->row;
	}

	public function getInformations() {
		$query = $this->db->query("SELECT * FROM oc_information i LEFT JOIN oc_information_description id ON (i.information_id = id.information_id) LEFT JOIN oc_information_to_store i2s ON (i.information_id = i2s.information_id) WHERE id.language_id = :langauge_id AND i2s.store_id = :store_id AND i.status = :status ORDER BY i.sort_order, LCASE(id.title) ASC",
            [
                ':langauge_id' => $this->config->get('config_language_id'),
                ':store_id' => $this->config->get('config_store_id'),
                ':status' => 1
            ]);

		return $query->rows;
	}

	public function getInformationLayoutId($information_id) {
		$query = $this->db->query("SELECT * FROM oc_information_to_layout WHERE information_id = :information_id AND store_id = :store_id",
            [
                ':information_id' => $information_id,
                ':store_id' => $this->config->get('config_store_id')
            ]);

		if ($query->num_rows) {
			return (int)$query->row['layout_id'];
		} else {
			return 0;
		}
	}
}