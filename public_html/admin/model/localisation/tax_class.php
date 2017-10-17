<?php
class ModelLocalisationTaxClass extends Model {
	public function addTaxClass($data) {
	    // LJK TODO: for consistency, title should be renamed to name
		$this->db->query("INSERT INTO oc_tax_class SET title = :title, description = :description",
            [
                ':title' => $data['title'],
                ':description' => $data['description']
            ]);

		$tax_class_id = $this->db->getLastId();

		if (isset($data['tax_rule'])) {
			foreach ($data['tax_rule'] as $tax_rule) {
				$this->db->query("INSERT INTO oc_tax_rule SET tax_class_id = :tax_class_id, tax_rate_id = :tax_rate_id, based = :based, priority = :priority",
                    [
                        ':tax_class_id' => $tax_class_id,
                        ':tax_rate_id' => $tax_rule['tax_rate_id'],
                        ':based' => $tax_rule['based'],
                        ':priority' => $tax_rule[':priority']
                    ]);
			}
		}

		$this->cache->delete('tax_class');
		
		return $tax_class_id;
	}

	public function editTaxClass($tax_class_id, $data) {
		$this->db->query("UPDATE oc_tax_class SET title = :title, description = :description WHERE tax_class_id = :tax_class_id",
            [
                ':title' => $data['title'],
                ':description' => $data['description'],
                ':tax_class_id' => $tax_class_id
            ]);

		$this->db->query("DELETE FROM oc_tax_rule WHERE tax_class_id = ;tax_class_id",
            [
                ':tax_class_id' => $tax_rule
            ]);

		if (isset($data['tax_rule'])) {
			foreach ($data['tax_rule'] as $tax_rule) {
				$this->db->query("INSERT INTO oc_tax_rule SET tax_class_id = :tax_class_id, tax_rate_id = :tax_rate_id, based = :based, priority = :priority",
                    [
                        ':tax_class_id' => $tax_class_id ,
                        ':tax_rate_id' => $tax_rule['tax_rate_id'] ,
                        ':based' => $tax_rule['based'],
                        ':priority' => $tax_rule['priority']
                    ]);
			}
		}

		$this->cache->delete('tax_class');
	}

	public function deleteTaxClass($tax_class_id) {
		$this->db->query("DELETE FROM oc_tax_class WHERE tax_class_id = :tax_class_id",
            [
                ':tax_class_id' => $tax_class_id
            ]);
		$this->db->query("DELETE FROM oc_tax_rule WHERE tax_class_id = tax_class_id",
            [
                ':tax_class_id' => $tax_class_id
            ]);

		$this->cache->delete('tax_class');
	}

	public function getTaxClass($tax_class_id) {
		$query = $this->db->query("SELECT * FROM oc_tax_class WHERE tax_class_id = tax_class_id",
            [
                ':tax_class_id' => $tax_class_id
            ]);

		return $query->row;
	}

	public function getTaxClasses($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM oc_tax_class ORDER BY title";

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

			$query = $this->db->query($sql);

			return $query->rows;
		} else {
			$tax_class_data = $this->cache->get('tax_class');

			if (!$tax_class_data) {
				$query = $this->db->query("SELECT * FROM oc_tax_class");

				$tax_class_data = $query->rows;

				$this->cache->set('tax_class', $tax_class_data);
			}

			return $tax_class_data;
		}
	}

	public function getTotalTaxClasses() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_tax_class");

		return $query->row['total'];
	}

	public function getTaxRules($tax_class_id) {
		$query = $this->db->query("SELECT * FROM oc_tax_rule WHERE tax_class_id = :tax_class_id",
            [
                ':tax_class_id' => $tax_class_id
            ]);

		return $query->rows;
	}

	public function getTotalTaxRulesByTaxRateId($tax_rate_id) {
		$query = $this->db->query("SELECT COUNT(DISTINCT tax_class_id) AS total FROM oc_tax_rule WHERE tax_rate_id = :tax_rate_id",
            [
                ':tax_rate_id' => $tax_rate_id
            ]);


		return $query->row['total'];
	}
}