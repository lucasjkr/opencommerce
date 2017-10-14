<?php
class ModelCatalogRecurring extends Model {
	public function addRecurring($data) {
		$this->db->query("INSERT INTO `oc_recurring` SET `sort_order` = :sort_order, `status` = :status, `price` = :price, `frequency` = :frequency, `duration` = :duration, `cycle` = :cycle, `trial_status` = :trial_status, `trial_price` = :trial_price, `trial_frequency` = :trial_frequency, `trial_duration` = :trial_duration, `trial_cycle` = :trial_cycle",
            [
                ':sort_order' => $data['sort_order'],
                ':status' => $data['status'],
                ':price' => $data['price'],
                ':frequency' => $data['frequency'],
                ':duration' => $data['duration'],
                ':cycle' => $data['cycle'],
                ':trial_status' => $data['trial_status'] ,
                ':trial_price' => $data['trial_price'],
                ':trial_frequency' => $data['trial_frequency'],
                ':trial_duration' => $data['trial_duration'],
                ':trial_cycle' => $data['trial_cycle']
            ]);

		$recurring_id = $this->db->getLastId();

		foreach ($data['recurring_description'] as $language_id => $recurring_description) {
			$this->db->query("INSERT INTO `oc_recurring_description` SET `recurring_id` = :recurring_id, `language_id` = :language_id, `name` = :name",
            [
                ':recurring_id' => $recurring_id,
                ':language_id' => $language_id ,
                ':name' => $recurring_description['name']
            ]);
		}

		return $recurring_id;
	}

	public function editRecurring($recurring_id, $data) {
		$this->db->query("DELETE FROM `oc_recurring_description` WHERE recurring_id = :recurring_id",
            [
                ':recurring_id' => $recurring_id
            ]);

		$this->db->query("UPDATE `oc_recurring` SET `price` = :price, `frequency` = :frequency, `duration` = :duration, `cycle` = :cycle, `sort_order` = :sort_order, `status` = :status, `trial_price` = :trial_price, `trial_frequency` = :trial_frequency, `trial_duration` = :trial_duration, `trial_cycle` = trial_cycle, `trial_status` = :trial_status WHERE recurring_id = :recurring_id",
            [
                ':price' => $data['price'],
                ':frequency' => $data['frequency'],
                ':duration' => $data['duration'],
                ':cycle' => $data['cycle'],
                ':sort_order' => $data['sort_order'],
                ':status' => $data['status'],
                ':trial_price' => $data['trial_price'],
                ':trial_frequency' => $data['trial_frequency'],
                ':trial_duration' => $data['trial_duration'],
                ':trial_cycle' => $data['trial_cycle'],
                ':trial_status' => $data['trial_status'] ,
                ':recurring_id' => $recurring_id,
            ]

            );

        foreach ($data['recurring_description'] as $language_id => $recurring_description) {
            $this->db->query("INSERT INTO `oc_recurring_description` SET `recurring_id` = :recurring_id, `language_id` = :language_id, `name` = :name",
            [
                ':recurring_id' => $recurring_id,
                ':language_id' => $language_id ,
                ':name' => $recurring_description['name']
            ]);
		}
	}

	public function copyRecurring($recurring_id) {
		$data = $this->getRecurring($recurring_id);

		$data['recurring_description'] = $this->getRecurringDescription($recurring_id);

		foreach ($data['recurring_description'] as &$recurring_description) {
			$recurring_description['name'] .= ' - 2';
		}

		$this->addRecurring($data);
	}

	public function deleteRecurring($recurring_id) {
		$this->db->query("DELETE FROM `oc_recurring` WHERE recurring_id = :recurring_id",
            [
                ':recurring_id' => $recurring_id
            ]);
		$this->db->query("DELETE FROM `oc_recurring_description` WHERE recurring_id = :recurring_id",
            [
                ':recurring_id' => $recurring_id
            ]);
		$this->db->query("DELETE FROM `oc_product_recurring` WHERE recurring_id = :recurring_id",
            [
                ':recurring_id' => $recurring_id
            ]);
		$this->db->query("UPDATE `oc_order_recurring` SET `recurring_id` = 0 WHERE `recurring_id` = :recurring_id",
            [
                ':recurring_id' => $recurring_id
            ]);
	}

	public function getRecurring($recurring_id) {
		$query = $this->db->query("SELECT * FROM `oc_recurring` WHERE recurring_id = `recurring_id` = :recurring_id",
            [
                ':recurring_id' => $recurring_id
            ]);

		return $query->row;
	}

	public function getRecurringDescription($recurring_id) {
		$recurring_description_data = [];

		$query = $this->db->query("SELECT * FROM `oc_recurring_description` WHERE `recurring_id` =  :recurring_id",
            [
                ':recurring_id' => $recurring_id
            ]);

		foreach ($query->rows as $result) {
			$recurring_description_data[$result['language_id']] = array('name' => $result['name']);
		}

		return $recurring_description_data;
	}

	public function getRecurrings($data = array()) {
		$sql = "SELECT * FROM `oc_recurring` r LEFT JOIN oc_recurring_description rd ON (r.recurring_id = rd.recurring_id) WHERE rd.language_id = :language_id";

        $args[':language_id'] = $this->config->get('config_language_id');

		if (!empty($data['filter_name'])) {
			$sql .= " AND rd.name LIKE :name";
            $args[':name'] =  $data['filter_name'] . '%';
		}

		$sort_data = array(
			'rd.name',
			'r.sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY rd.name";
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

	public function getTotalRecurrings() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `oc_recurring`");

		return $query->row['total'];
	}
}