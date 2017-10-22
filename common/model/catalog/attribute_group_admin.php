<?php
class ModelCatalogAttributeGroupAdmin extends Model {
	public function addAttributeGroup($data) {
		$this->db->query("INSERT INTO oc_attribute_group SET sort_order = :sort_order",
            [
                ':sort_order' => $data['sort_order']
            ]);

		$attribute_group_id = $this->db->getLastId();

		foreach ($data['attribute_group_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO oc_attribute_group_description SET attribute_group_id = :attribute_group_id, language_id = :language_id, name = :name",
                [
                    ':attribute_group_id' => $attribute_group_id,
                    ':language_id' => $language_id,
                    ':name' => $value['name'],
                ]);
		}

		return $attribute_group_id;
	}

	public function editAttributeGroup($attribute_group_id, $data) {
		$this->db->query("UPDATE oc_attribute_group SET sort_order = :sort_order WHERE attribute_group_id = :attribute_group_id",
            [
                ':sort_order' => $data['sort_order'],
                ':attribute_group_id' => $attribute_group_id,
            ]);

		$this->db->query("DELETE FROM oc_attribute_group_description WHERE attribute_group_id = :attribute_group_id",
            [
                ':attribute_group_id' => $attribute_group_id,
            ]);

		foreach ($data['attribute_group_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO oc_attribute_group_description SET attribute_group_id = :attribute_group_id, language_id = :language_id, name = :name",
                [
                    ':attribute_group_id' => $attribute_group_id,
                    ':language_id' => $language_id,
                    ':name' => $value['name'],
                ]);
		}
	}

	public function deleteAttributeGroup($attribute_group_id) {
		$this->db->query("DELETE FROM oc_attribute_group WHERE attribute_group_id = :attribute_group_id",
            [
                ':attribute_group_id' => $attribute_group_id,
            ]);
		$this->db->query("DELETE FROM oc_attribute_group_description WHERE attribute_group_id = :attribute_group_id",
            [
                ':attribute_group_id' => $attribute_group_id,
            ]);
	}

	public function getAttributeGroup($attribute_group_id) {
		$query = $this->db->query("SELECT * FROM oc_attribute_group WHERE attribute_group_id = :attribute_group_id",
            [
                ':attribute_group_id' => $attribute_group_id,
            ]);

		return $query->row;
	}

	public function getAttributeGroups($data = []) {
		$sql = "SELECT * FROM oc_attribute_group ag LEFT JOIN oc_attribute_group_description agd ON (ag.attribute_group_id = agd.attribute_group_id) WHERE agd.language_id = :language_id";

		$sort_data = [
			'agd.name',
			'ag.sort_order'
		];

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY agd.name";
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

		$query = $this->db->query($sql, [ ':language_id' => $this->config->get('config_language_id') ]);

		return $query->rows;
	}

	public function getAttributeGroupDescriptions($attribute_group_id) {
		$attribute_group_data = [];

		$query = $this->db->query("SELECT * FROM oc_attribute_group_description WHERE attribute_group_id = :attribute_group_id",
            [
                ':attribute_group_id' => $attribute_group_id,
            ]);

		foreach ($query->rows as $result) {
			$attribute_group_data[$result['language_id']] = array('name' => $result['name']);
		}

		return $attribute_group_data;
	}

	public function getTotalAttributeGroups() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_attribute_group");

		return $query->row['total'];
	}
}