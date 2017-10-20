<?php
class ModelCatalogAttributeAdmin extends Model {
	public function addAttribute($data) {
		$this->db->query("INSERT INTO oc_attribute SET attribute_group_id = :attribute_group_id, sort_order = :sort_order'",
            [
                ':attribute_group_id' => $data['attribute_group_id'],
                ':sort_order' => $data['sort_order'],

            ]);

		$attribute_id = $this->db->getLastId();

		foreach ($data['attribute_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO oc_attribute_description SET attribute_id = :attribute_id, language_id = :language_id, name = :name ",
                [
                    ':attribute_id' => $attribute_id,
                    ':language_id' => $language_id,
                    ':name' => $value['name'],
                ]);
		}

		return $attribute_id;
	}

	public function editAttribute($attribute_id, $data) {
		$this->db->query("UPDATE oc_attribute SET attribute_group_id = :attribute_group_id, sort_order = :sort_order WHERE attribute_id = :attribute_id",
            [
                ':attribute_id' => $attribute_id,
                ':language_id' => $language_id,
                ':attribute_id' => $attribute_id,
            ]);

		$this->db->query("DELETE FROM oc_attribute_description WHERE attribute_id = :attribute_id",
            [
                ':attribute_id' => $attribute_id,
            ]);

		foreach ($data['attribute_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO oc_attribute_description SET attribute_id = :attribute_id, language_id = :language_id, name = :name",
                [
                    ':attribute_id' => $attribute_id,
                    ':language_id' => $language_id,
                    ':name' => $value['name'],
                ]);
		}
	}

	public function deleteAttribute($attribute_id) {
		$this->db->query("DELETE FROM oc_attribute WHERE attribute_id = :attribute_id",
            [
                ':attribute_id' => $attribute_id
            ]);
		$this->db->query("DELETE FROM oc_attribute_description WHERE attribute_id = :attribute_id",
            [
                ':attribute_id' => $attribute_id
            ]);
	}

	public function getAttribute($attribute_id) {
		$query = $this->db->query("SELECT * FROM oc_attribute a LEFT JOIN oc_attribute_description ad ON (a.attribute_id = ad.attribute_id) WHERE a.attribute_id = :attribute_id AND ad.language_id = :language_id",
            [
                ':attribute_id' => $attribute_id,
                ':language_id' => $this->config->get('config_language_id'),
            ]);

		return $query->row;
	}

	public function getAttributes($data = array()) {
        $sql = "SELECT *, (SELECT agd.name FROM oc_attribute_group_description agd WHERE agd.attribute_group_id = a.attribute_group_id AND agd.language_id = :language_id ) AS attribute_group FROM oc_attribute a LEFT JOIN oc_attribute_description ad ON (a.attribute_id = ad.attribute_id) WHERE ad.language_id = :language_id ";
		$args[':language_id'] = $this->config->get('config_language_id');

        if (!empty($data['filter_name'])) {
			$sql .= " AND ad.name LIKE :filter_name";
            $args[':filter_name'] = '%' . $data['filter_name'] . '%';
		} else {
		    $data['filter_name'] = '';
        }

		if (!empty($data['filter_attribute_group_id'])) {
			$sql .= " AND a.attribute_group_id = :filter_attribute_group_id ";
            $args[':filter_attribute_group_id'] = $data['filter_attribute_group_id'];
		} else {
            $data['filter_attribute_group_id'] = '';
        }

		$sort_data = array(
			'ad.name',
			'attribute_group',
			'a.sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY attribute_group, ad.name";
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

	public function getAttributeDescriptions($attribute_id) {
		$attribute_data = [];

		$query = $this->db->query("SELECT * FROM oc_attribute_description WHERE attribute_id = :attribute_id",
            [
                ':attribute_id' => $attribute_id
            ]);

		foreach ($query->rows as $result) {
			$attribute_data[$result['language_id']] = array('name' => $result['name']);
		}

		return $attribute_data;
	}

	public function getTotalAttributes() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_attribute");

		return $query->row['total'];
	}

	public function getTotalAttributesByAttributeGroupId($attribute_group_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_attribute WHERE attribute_group_id = :attribute_group_id",
            [
                ':attribute_group_id' => $attribute_group_id
            ]);

		return $query->row['total'];
	}
}
