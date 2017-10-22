<?php
class ModelLocalisationReturnReasonAdmin extends Model {
	public function addReturnReason($data) {
		foreach ($data['return_reason'] as $language_id => $value) {
			if (isset($return_reason_id)) {
			    // LJK TODO: This first action doesn't look like it will ever get triggered
				$this->db->query("INSERT INTO oc_return_reason SET return_reason_id = :return_reason_id, language_id = :language_id , name = :name",
                    [
                        ':return_reason_id' => $return_reason_id,
                        ':language_id' => $language_id,
                        ':name' => $value['name']
                    ]);
			} else {
				$this->db->query("INSERT INTO oc_return_reason SET language_id = :language_id, name = :name",
                    [
                        ':language_id' => $language_id,
                        ':name' => $value['name']
                    ]);

				$return_reason_id = $this->db->getLastId();
			}
		}

		$this->cache->delete('return_reason');
		
		return $return_reason_id;
	}

	public function editReturnReason($return_reason_id, $data) {
		$this->db->query("DELETE FROM oc_return_reason WHERE return_reason_id = :return_reason_id",
            [
                ':return_reason_id' => $return_reason_id
            ]);

		foreach ($data['return_reason'] as $language_id => $value) {
			$this->db->query("INSERT INTO oc_return_reason SET return_reason_id = :return_reason_id, language_id = :language_id, name = :name",
                [
                    ':return_reason_id' => $return_reason_id,
                    ':language_id' => $language_id,
                    ':name' => $value['name']
                ]);
		}

		$this->cache->delete('return_reason');
	}

	public function deleteReturnReason($return_reason_id) {
		$this->db->query("DELETE FROM oc_return_reason WHERE return_reason_id =  :return_reason_id",
            [
                ':return_reason_id' => $return_reason_id
            ]);
		$this->cache->delete('return_reason');
	}

	public function getReturnReason($return_reason_id) {
		$query = $this->db->query("SELECT * FROM oc_return_reason WHERE return_reason_id = :return_reason_id AND language_id = :language_id",
            [
                ':return_reason_id' => $return_reason_id,
                ':language_id' => $this->config->get('config_language_id')
            ]);

		return $query->row;
	}

	public function getReturnReasons($data = []) {
		if ($data) {
			$sql = "SELECT * FROM oc_return_reason WHERE language_id = :language_id ORDER BY name";
            $args[':language_id'] = $this->config->get('config_language_id');

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
			$return_reason_data = $this->cache->get('return_reason.' . (int)$this->config->get('config_language_id'));

			if (!$return_reason_data) {
				$query = $this->db->query("SELECT return_reason_id, name FROM oc_return_reason WHERE language_id = :language_id ORDER BY name",
                    [
                        ':language_id' => $this->config->get('config_language_id')
                    ]);

				$return_reason_data = $query->rows;

				$this->cache->set('return_reason.' . (int)$this->config->get('config_language_id'), $return_reason_data);
			}

			return $return_reason_data;
		}
	}

	public function getReturnReasonDescriptions($return_reason_id) {
		$return_reason_data = [];

		$query = $this->db->query("SELECT * FROM oc_return_reason WHERE return_reason_id = :return_reason_id",
            [
                ':return_reason_id' => $return_reason_id
            ]);

		foreach ($query->rows as $result) {
			$return_reason_data[$result['language_id']] = array('name' => $result['name']);
		}

		return $return_reason_data;
	}

	public function getTotalReturnReasons() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_return_reason WHERE language_id = :language_id",
            [
                ':language_id' => $this->config->get('config_language_id')
            ]);

		return $query->row['total'];
	}
}