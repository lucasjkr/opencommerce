<?php
class ModelLocalisationOrderStatus extends Model {
	public function addOrderStatus($data) {
		foreach ($data['order_status'] as $language_id => $value) {
			// LJK TODO: Would order status id EVER be set when you're creating a new one?
		    if (isset($order_status_id)) {
				$this->db->query("INSERT INTO oc_order_status SET order_status_id = :order_status_id , language_id = :language_id , name = :name",
                    [
                        ':order_status_id' => $order_status_id,
                        ':language_id' => $language_id,
                        ':name' => $value['name']
                    ]);
			} else {
				$this->db->query("INSERT INTO oc_order_status SET language_id = :language_id, name = :name",
                    [
                        ':language_id' => $language_id,
                        ':name' => $value['name']
                    ]);

				$order_status_id = $this->db->getLastId();
			}
		}

		$this->cache->delete('order_status');
		
		return $order_status_id;
	}

	public function editOrderStatus($order_status_id, $data) {
		$this->db->query("DELETE FROM oc_order_status WHERE order_status_id = :order_status_id",
            [
                ':order_status_id' => $order_status_id
            ]);
        // LJK TODO: Why not just update?
		foreach ($data['order_status'] as $language_id => $value) {
			$this->db->query("INSERT INTO oc_order_status SET order_status_id = :order_status_id, language_id = :language_id, name = :name",
                [
                    ':order_status_id' => $order_status_id,
                    ':language_id' => $language_id,
                    ':name' => $value['name']
                ]);
		}

		$this->cache->delete('order_status');
	}

	public function deleteOrderStatus($order_status_id) {
		$this->db->query("DELETE FROM oc_order_status WHERE order_status_id = :order_status_id",
            [
                ':order_status_id' => $order_status_id
            ]);

		$this->cache->delete('order_status');
	}

	public function getOrderStatus($order_status_id) {
		$query = $this->db->query("SELECT * FROM oc_order_status WHERE order_status_id = :order_status_id  AND language_id = :language_id",
            [
                ':order_status_id' => $order_status_id,
                ':language_id' => $this->config->get('config_language_id')
            ]);

		return $query->row;
	}

	public function getOrderStatuses($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM oc_order_status WHERE language_id = :language_id ORDER BY name";
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
			$order_status_data = $this->cache->get('order_status.' . (int)$this->config->get('config_language_id'));

			if (!$order_status_data) {
				$query = $this->db->query("SELECT order_status_id, name FROM oc_order_status WHERE language_id = :language_id ORDER BY name",
                    [
                        ':language_id' => $this->config->get('config_language_id');
                    ]);

				$order_status_data = $query->rows;

				$this->cache->set('order_status.' . (int)$this->config->get('config_language_id'), $order_status_data);
			}

			return $order_status_data;
		}
	}

	public function getOrderStatusDescriptions($order_status_id) {
		$order_status_data = [];

		$query = $this->db->query("SELECT * FROM oc_order_status WHERE order_status_id = :order_status_id",
            [
                ':order_status_id' => $order_status_id
            ]);

		foreach ($query->rows as $result) {
			$order_status_data[$result['language_id']] = array('name' => $result['name']);
		}

		return $order_status_data;
	}

	public function getTotalOrderStatuses() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_order_status WHERE language_id = :language_id",
            [
                ':language_id' => $this->config->get('config_language_id')
            ]);

		return $query->row['total'];
	}
}