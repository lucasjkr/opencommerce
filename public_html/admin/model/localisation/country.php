<?php
class ModelLocalisationCountry extends Model {
	public function addCountry($data) {
		$this->db->query("INSERT INTO oc_country SET name = :name, iso_code_2 = :iso_code_2, iso_code_3 = :iso_code_3, address_format = :address_format, postcode_required = :postcode_required, status = :status",
            [
                ':name' => $data['name'],
                ':iso_code_2' => $data['iso_code_2'],
                ':iso_code_3' => $data['iso_code_3'],
                ':address_format' => $data['address_format'],
                ':postcode_required' => $data['postcode_required'],
                ':status' => $data['status']
            ]);

		$this->cache->delete('country');
		
		return $this->db->getLastId();
	}

	public function editCountry($country_id, $data) {
		$this->db->query("UPDATE oc_country SET name = :name, iso_code_2 = :iso_code_2 , iso_code_3 = :iso_code_3 , address_format = :address_format, postcode_required = :postcode_required, status = :status WHERE country_id = :country_id ",
            [
                ':name' => $data['name'],
                ':iso_code_2' => $data['iso_code_2'],
                ':iso_code_3' => $data['iso_code_3'],
                ':address_format' => $data['address_format'],
                ':postcode_required' => $data['postcode_required'],
                ':status' => $data['status'],
                ':country_id' => $country_id
            ]);

		$this->cache->delete('country');
	}

	public function deleteCountry($country_id) {
		$this->db->query("DELETE FROM oc_country WHERE country_id = :country_id",
            [
                ':country_id' => $country_id
            ]);

		$this->cache->delete('country');
	}

	public function getCountry($country_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM oc_country WHERE country_id = :country_id",
            [
                ':country_id' => $country_id
            ]);

		return $query->row;
	}

	public function getCountries($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM oc_country";

			$sort_data = array(
				'name',
				'iso_code_2',
				'iso_code_3'
			);

			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];
			} else {
				$sql .= " ORDER BY name";
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

			$query = $this->db->query($sql);

			return $query->rows;
		} else {
			$country_data = $this->cache->get('country.admin');

			if (!$country_data) {
				$query = $this->db->query("SELECT * FROM oc_country ORDER BY name ASC");

				$country_data = $query->rows;

				$this->cache->set('country.admin', $country_data);
			}

			return $country_data;
		}
	}

	public function getTotalCountries() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_country");

		return $query->row['total'];
	}
}