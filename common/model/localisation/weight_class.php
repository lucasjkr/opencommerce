<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ModelLocalisationWeightClass extends Model {
	public function addWeightClass($data) {
		$this->db->query("INSERT INTO oc_weight_class SET `value` = :value",
            [
                ':value' => $data['value']
            ]);

		$weight_class_id = $this->db->getLastId();

		foreach ($data['weight_class_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO oc_weight_class_description SET weight_class_id = :weight_class_id, language_id = :language_id, title = :title, unit = :unit",
                [
                    ':weight_class_id' => $weight_class_id,
                    ':language_id' => $language_id,
                    ':title' => $value['title'],
                    ':unit' => $value['unit']
                ]);
		}

		$this->cache->delete('weight_class');
		
		return $weight_class_id;
	}

	public function editWeightClass($weight_class_id, $data) {
		$this->db->query("UPDATE oc_weight_class SET value = :value WHERE weight_class_id = :weight_class_id",
            [
                ':value' => $data['value'],
                ':weight_class_id' => $weight_class_id
            ]);

		$this->db->query("DELETE FROM oc_weight_class_description WHERE weight_class_id = :weight_class_id",
            [
                ':weight_class_id' => $weight_class_id
            ]);

		foreach ($data['weight_class_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO oc_weight_class_description SET weight_class_id = :weight_class_id, language_id = :language_id , title = :title, unit = :unit",
                [
                    ':weight_class_id' => $weight_class_id,
                    ':language_id' => $language_id,
                    ':title' => $value['title'],
                    ':unit' => $value['unit']
                ]);
		}

		$this->cache->delete('weight_class');
	}

	public function deleteWeightClass($weight_class_id) {
		$this->db->query("DELETE FROM oc_weight_class WHERE weight_class_id = :weight_class_id",
            [
                ':weight_class_id' => $weight_class_id
            ]);
		$this->db->query("DELETE FROM oc_weight_class_description WHERE weight_class_id = :weight_class_id",
            [
                ':weight_class_id' => $weight_class_id
            ]);

		$this->cache->delete('weight_class');
	}

	public function getWeightClasses($data = []) {
		if ($data) {
			$sql = "SELECT * FROM oc_weight_class wc LEFT JOIN oc_weight_class_description wcd ON (wc.weight_class_id = wcd.weight_class_id) WHERE wcd.language_id = :language_id";
            $args[':language_id'] = $this->config->get('config_language_id');

			$sort_data = [
				'title',
				'unit',
				'value'
            ];

			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];
			} else {
				$sql .= " ORDER BY title";
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
		} else {
			$weight_class_data = $this->cache->get('weight_class.' . (int)$this->config->get('config_language_id'));

			if (!$weight_class_data) {
				$query = $this->db->query("SELECT * FROM oc_weight_class wc LEFT JOIN oc_weight_class_description wcd ON (wc.weight_class_id = wcd.weight_class_id) WHERE wcd.language_id = :language_id",
                    [
                        ':language_id' => $this->config->get('config_language_id')
                    ]);

				$weight_class_data = $query->rows;

				$this->cache->set('weight_class.' . (int)$this->config->get('config_language_id'), $weight_class_data);
			}

			return $weight_class_data;
		}
	}

	public function getWeightClass($weight_class_id) {
		$query = $this->db->query("SELECT * FROM oc_weight_class wc LEFT JOIN oc_weight_class_description wcd ON (wc.weight_class_id = wcd.weight_class_id) WHERE wc.weight_class_id = :weight_class_id AND wcd.language_id = :language_id",
            [
                ':language_id' => $this->config->get('config_language_id'),
                ':weight_class_id' => $weight_class_id
            ]);

		return $query->row;
	}

	public function getWeightClassDescriptionByUnit($unit) {
		$query = $this->db->query("SELECT * FROM oc_weight_class_description WHERE unit = :unit AND language_id = :language_id",
            [
                ':unit' => $unit,
                ':language_id' => $this->config->get('config_language_id')
            ]);

		return $query->row;
	}

	public function getWeightClassDescriptions($weight_class_id) {
		$weight_class_data = [];

		$query = $this->db->query("SELECT * FROM oc_weight_class_description WHERE weight_class_id = :weight_class_id",
            [
                ':weight_class_id' => $weight_class_id
            ]);

		foreach ($query->rows as $result) {
			$weight_class_data[$result['language_id']] = [
				'title' => $result['title'],
				'unit'  => $result['unit']
			];
		}

		return $weight_class_data;
	}

	public function getTotalWeightClasses() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_weight_class");

		return $query->row['total'];
	}
}