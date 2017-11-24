<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ModelLocalisationReturnActionAdmin extends Model {
	public function addReturnAction($data) {
		foreach ($data['return_action'] as $language_id => $value) {
			if (isset($return_action_id)) {
				$this->db->query("INSERT INTO `oc_return_action` SET `return_action_id` = :return_action_id, `language_id` = :language_id, `name` = :name",
                    [
                        ':return_action_id' => $return_action_id,
                        ':language_id' => $language_id ,
                        ':name' => $value['name']
                    ]);
			} else {
				$this->db->query("INSERT INTO `oc_return_action` SET `language_id` = :language_id, `name` = :name",
                    [
                        ':language_id' => $language_id,
                        ':name' => $value['name']
                    ]);

				$return_action_id = $this->db->getLastId();
			}
		}

		$this->cache->delete('return_action');
		
		return $return_action_id;
	}

	public function editReturnAction($return_action_id, $data) {
		$this->db->query("DELETE FROM `oc_return_action` WHERE `return_action_id` = :return_action_id",
            [
                ':return_action_id' => $return_action_id
            ]);

		foreach ($data['return_action'] as $language_id => $value) {
			$this->db->query("INSERT INTO `oc_return_action` SET `return_action_id` = :return_action_id, `language_id` = :language_id , `name` = :name",
                [
                    ':return_action_id' => $return_action_id,
                    ':language_id' => $language_id,
                    ':name' => $value['name']
                ]);
		}

		$this->cache->delete('return_action');
	}

	public function deleteReturnAction($return_action_id) {
		$this->db->query("DELETE FROM oc_return_action WHERE return_action_id = :return_action_id",
            [
                ':return_action_id' => $return_action_id
            ]);

		$this->cache->delete('return_action');
	}

	public function getReturnAction($return_action_id) {
		$query = $this->db->query("SELECT * FROM oc_return_action WHERE return_action_id = :return_action_id  AND language_id = :language_id",
            [
                ':return_action_id' => $return_action_id,
                ':language_id' => $this->config->get('config_language_id')
            ]);

		return $query->row;
	}

	public function getReturnActions($data = []) {
		if ($data) {
			$sql = "SELECT * FROM oc_return_action WHERE language_id = :language_id ORDER BY name";
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
			$return_action_data = $this->cache->get('return_action.' . (int)$this->config->get('config_language_id'));

			if (!$return_action_data) {
				$query = $this->db->query("SELECT return_action_id, name FROM oc_return_action WHERE language_id = :language_id ORDER BY name",
                    [
                        ':language_id' => $this->config->get('config_language_id')
                    ]);

				$return_action_data = $query->rows;

				$this->cache->set('return_action.' . (int)$this->config->get('config_language_id'), $return_action_data);
			}

			return $return_action_data;
		}
	}

	public function getReturnActionDescriptions($return_action_id) {
		$return_action_data = [];

		$query = $this->db->query("SELECT * FROM oc_return_action WHERE return_action_id = :return_action_id",
            [
                ':return_action_id' => $return_action_id
            ]);

		foreach ($query->rows as $result) {
			$return_action_data[$result['language_id']] = ['name' => $result['name']];
		}

		return $return_action_data;
	}

	public function getTotalReturnActions() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_return_action WHERE language_id = :language_id",
            [
                ':language_id' => $this->config->get('config_language_id')
            ]);

		return $query->row['total'];
	}
}