<?php
class ModelCatalogOptionAdmin extends Model {
	public function addOption($data) {
		$this->db->query("INSERT INTO `oc_option` SET `type` = :type, sort_order = :sort_order",
            [
                ':type' => $data['type'],
                ':sort_order' => $data['sort_order']
            ]);

		$option_id = $this->db->getLastId();

		foreach ($data['option_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO oc_option_description SET option_id = :option_id, language_id = :language_id, name = :name",
                [
                    ':option_id' => $option_id,
                    ':language_id' => $language_id,
                    ':name' => $value['name']
                ]);
		}

		if (isset($data['option_value'])) {
			foreach ($data['option_value'] as $option_value) {
				$this->db->query("INSERT INTO oc_option_value SET option_id = :option_id, image = :image, sort_order = :sort_order",
                    [
                        ':option_id' => $option_id,
                        ':image' => html_entity_decode($option_value['image'], ENT_QUOTES, 'UTF-8'),
                        ':sort_order' => $option_value['sort_order']
                    ]);

				$option_value_id = $this->db->getLastId();

				foreach ($option_value['option_value_description'] as $language_id => $option_value_description) {
					$this->db->query("INSERT INTO oc_option_value_description SET option_value_id = :option_value_id, language_id = :language_id, option_id = :option_id, name = :name",
                        [
                            ':option_value_id' => $option_value_id,
                            ':language_id' => $language_id,
                            ':option_id' => $option_id,
                            ':name' => $option_value_description['name']
                        ]);
				}
			}
		}

		return $option_id;
	}

	public function editOption($option_id, $data) {
		$this->db->query("UPDATE `oc_option` SET `type` = :type, `sort_order` = :sort_order WHERE `option_id` = :option_id",
            [
                ':type' => $data['type'],
                ':sort_order' => $data['sort_order'],
                ':option_id' => $option_id
            ]);

		$this->db->query("DELETE FROM `oc_option_description` WHERE `option_id` = :option_id",
            [
                ':option_id' => $option_id
            ]);

		foreach ($data['option_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO `oc_option_description` SET `option_id` = :option_id, `language_id` = :language_id, `name` = :name",
                [
                    ':option_id' => $option_id,
                    ':language_id' => $language_id,
                    ':name' => $value['name'],
                ]);
		}

		$this->db->query("DELETE FROM `oc_option_value` WHERE `option_id` = :option_id",
            [
                ':option_id' => $option_id
            ]);
		$this->db->query("DELETE FROM `oc_option_value_description` WHERE `option_id` = :option_id",
            [
                ':option_id' => $option_id
            ]);

		if (isset($data['option_value'])) {
			foreach ($data['option_value'] as $option_value) {
				if ($option_value['option_value_id']) {
					$this->db->query("INSERT INTO `oc_option_value` SET `option_value_id` = :option_value_id, `option_id` = :option_id, `image` = :image', `sort_order` = :sort_order",
                        [
                            ':option_value_id' => $option_value['option_value_id'],
                            ':option_id' => $option_id,
                            ':image' => html_entity_decode($option_value['image'], ENT_QUOTES, 'UTF-8'),
                            ':sort_order' => $option_value['sort_order']
                        ]);
				} else {
					$this->db->query("INSERT INTO `oc_option_value` SET `option_id` = :option_id, `image` = :image, `sort_order` = :sort_order",
                        [
                            ':option_id' => $option_id,
                            ':image' => html_entity_decode($option_value['image'], ENT_QUOTES, 'UTF-8'),
                            ':sort_order' => $option_value['sort_order']
                        ]);
				}

				$option_value_id = $this->db->getLastId();

				foreach ($option_value['option_value_description'] as $language_id => $option_value_description) {
					$this->db->query("INSERT INTO `oc_option_value_description` SET `option_value_id` = :option_value_id, `language_id` = :language_id, `option_id` = :option_id, `name` = :name",
                        [
                            ':option_value_id' => $option_value_id,
                            ':language_id' => $language_id,
                            ':option_id' => $option_id,
                            ':name' => $option_value_description['name']
                        ]);
				}
			}

		}
	}

	public function deleteOption($option_id) {
		$this->db->query("DELETE FROM `oc_option` WHERE `option_id` = :option_id",
            [
                ':option_id' => $option_id
            ]);
		$this->db->query("DELETE FROM `oc_option_description` WHERE `option_id` = :option_id",
            [
                ':option_id' => $option_id
            ]);
		$this->db->query("DELETE FROM `oc_option_value` WHERE `option_id` = :option_id",
            [
                ':option_id' => $option_id
            ]);
		$this->db->query("DELETE FROM `oc_option_value_description` WHERE `option_id` = :option_id",
            [
                ':option_id' => $option_id
            ]);
	}

	public function getOption($option_id) {
		$query = $this->db->query("SELECT * FROM `oc_option` o LEFT JOIN `oc_option_description` od ON (o.option_id = od.option_id) WHERE o.option_id = :option_id AND od.language_id = :language_id",
            [
                ':option_id' => $option_id,
                ':language_id' => $this->config->get('config_language_id')
            ]);

		return $query->row;
	}

	public function getOptions($data = []) {
		$sql = "SELECT * FROM `oc_option` o LEFT JOIN oc_option_description od ON (o.option_id = od.option_id) WHERE od.language_id = :language_id";

        $args[':language_id'] = $this->config->get('config_language_id');

		if (!empty($data['filter_name'])) {
			$sql .= " AND od.name LIKE :filter";
            $args[':filter'] = $data['filter_name'] . '%';
		}

		$sort_data = [
			'od.name',
			'o.type',
			'o.sort_order'
        ];

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY od.name";
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

	public function getOptionDescriptions($option_id) {
		$option_data = [];

		$query = $this->db->query("SELECT * FROM `oc_option_description` WHERE `option_id` = :option_id",
            [
                ':option_id' => $option_id
            ]);

		foreach ($query->rows as $result) {
			$option_data[$result['language_id']] = ['name' => $result['name']];
		}

		return $option_data;
	}

	public function getOptionValue($option_value_id) {
		$query = $this->db->query("SELECT * FROM `oc_option_value` ov LEFT JOIN `oc_option_value_description` ovd ON (ov.option_value_id = ovd.option_value_id) WHERE ov.option_value_id = :option_value_id AND ovd.language_id = :language_id",
            [
                ':option_value_id' => $option_value_id,
                ':language_id' => $this->config->get('config_language_id')
            ]);

		return $query->row;
	}

	public function getOptionValues($option_id) {
		$option_value_data = [];

		$option_value_query = $this->db->query("SELECT * FROM `oc_option_value` ov LEFT JOIN `oc_option_value_description` ovd ON (ov.option_value_id = ovd.option_value_id) WHERE ov.option_id = :option_id AND ovd.language_id = :language_id ORDER BY ov.sort_order, ovd.name",
            [
                ':option_id' => $option_id,
                ':language_id' => $this->config->get('config_language_id')
            ]);

		foreach ($option_value_query->rows as $option_value) {
			$option_value_data[] = [
				'option_value_id' => $option_value['option_value_id'],
				'name'            => $option_value['name'],
				'image'           => $option_value['image'],
				'sort_order'      => $option_value['sort_order']
            ];
		}

		return $option_value_data;
	}

	public function getOptionValueDescriptions($option_id) {
		$option_value_data = [];

		$option_value_query = $this->db->query("SELECT * FROM oc_option_value WHERE option_id = :option_id ORDER BY sort_order",
            [
                ':option_id' => $option_id
            ]);

		foreach ($option_value_query->rows as $option_value) {
			$option_value_description_data = [];

			$option_value_description_query = $this->db->query("SELECT * FROM oc_option_value_description WHERE option_value_id = :option_value_id",
                [
                    ':option_value_id' => $option_value['option_value_id']
                ]);

			foreach ($option_value_description_query->rows as $option_value_description) {
				$option_value_description_data[$option_value_description['language_id']] = ['name' => $option_value_description['name']];
			}

			$option_value_data[] = [
				'option_value_id'          => $option_value['option_value_id'],
				'option_value_description' => $option_value_description_data,
				'image'                    => $option_value['image'],
				'sort_order'               => $option_value['sort_order']
			];
		}

		return $option_value_data;
	}

	public function getTotalOptions() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `oc_option`");

		return $query->row['total'];
	}
}