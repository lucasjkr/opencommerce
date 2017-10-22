<?php
class ModelLocalisationStockStatusAdmin extends Model {
	public function addStockStatus($data) {
		foreach ($data['stock_status'] as $language_id => $value) {
			if (isset($stock_status_id)) {
				$this->db->query("INSERT INTO oc_stock_status SET stock_status_id = :stock_status_id, language_id = :language_id, name = :name",
                    [
                        ':stock_status_id' => $stock_status_id,
                        ':language_id' => $language_id,
                        ':name' => $value['name'],
                    ]);
			} else {
				$this->db->query("INSERT INTO oc_stock_status SET language_id = :language_id, name = :name",
                    [
                        ':language_id' => $language_id,
                        ':name' => $value['name'],
                    ]);

				$stock_status_id = $this->db->getLastId();
			}
		}

		$this->cache->delete('stock_status');
		
		return $stock_status_id;
	}

	public function editStockStatus($stock_status_id, $data) {
		$this->db->query("DELETE FROM oc_stock_status WHERE stock_status_id = :stock_status_id",
            [
                ':stock_status_id' => $stock_status_id
            ]);

		foreach ($data['stock_status'] as $language_id => $value) {
			$this->db->query("INSERT INTO oc_stock_status SET stock_status_id = :stock_status_id, language_id = :language_id, name = :name",
                [
                    ':stock_status_id' => $stock_status_id,
                    ':language_id' => $language_id,
                    ':name' => $value['name'],
                ]);
		}

		$this->cache->delete('stock_status');
	}

	public function deleteStockStatus($stock_status_id) {
		$this->db->query("DELETE FROM oc_stock_status WHERE stock_status_id = :stock_status_id",
            [
                ':stock_status_id' => $stock_status_id
            ]);

		$this->cache->delete('stock_status');
	}

	public function getStockStatus($stock_status_id) {
		$query = $this->db->query("SELECT * FROM oc_stock_status WHERE stock_status_id = :stock_status_id AND language_id = :language_id",
            [
                ':stock_status_id' => $stock_status_id,
                ':language_id' => $this->config->get('config_language_id')
            ]);

		return $query->row;
	}

	public function getStockStatuses($data = []) {
		if ($data) {
			$sql = "SELECT * FROM oc_stock_status WHERE language_id = :language_id ORDER BY name";
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
			$stock_status_data = $this->cache->get('stock_status.' . (int)$this->config->get('config_language_id'));

			if (!$stock_status_data) {
				$query = $this->db->query("SELECT stock_status_id, name FROM oc_stock_status WHERE language_id = :language_id ORDER BY name",
                    [
                        ':language_id' => $this->config->get('config_language_id')
                    ]);

				$stock_status_data = $query->rows;

				$this->cache->set('stock_status.' . (int)$this->config->get('config_language_id'), $stock_status_data);
			}

			return $stock_status_data;
		}
	}

	public function getStockStatusDescriptions($stock_status_id) {
		$stock_status_data = [];

		$query = $this->db->query("SELECT * FROM oc_stock_status WHERE stock_status_id = :stock_status_id",
            [
                ':stock_status_id' => $stock_status_id
            ]);

		foreach ($query->rows as $result) {
			$stock_status_data[$result['language_id']] = array('name' => $result['name']);
		}

		return $stock_status_data;
	}

	public function getTotalStockStatuses() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_stock_status WHERE language_id = :language_id",
            [
                ':language_id' => $this->config->get('config_language_id')
            ]);

		return $query->row['total'];
	}
}