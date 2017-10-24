<?php
class ModelLocalisationZoneAdmin extends Model {
	public function addZone($data) {
		$this->db->query("INSERT INTO oc_zone SET status = :status, name = :name, code = :code, country_id = :country_id",
            [
                ':status' => $data['status'],
                ':name' => $data['name'],
                ':code' => $data['code'],
                ':country_id' => $data['country_id']
            ]);

		$this->cache->delete('zone');
		
		return $this->db->getLastId();
	}

	public function editZone($zone_id, $data) {
		$this->db->query("UPDATE oc_zone SET status = :status, name = :name, code = :code, country_id = :country_id WHERE zone_id = :zone_id",
            [
                ':status' => $data['status'],
                ':name' => $data['name'],
                ':code' => $data['code'],
                ':country_id' => $data['country_id'],
                ':zone_id' => $zone_id
            ]);

		$this->cache->delete('zone');
	}

	public function deleteZone($zone_id) {
		$this->db->query("DELETE FROM oc_zone WHERE zone_id = :zone_id",
            [
                ':zone_id' => $zone_id
            ]);

		$this->cache->delete('zone');
	}

	public function getZone($zone_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM oc_zone WHERE zone_id = :zone_id",
            [
                ':zone_id' => $zone_id
            ]);

		return $query->row;
	}

	public function getZones($data = []) {
		$sql = "SELECT *, z.name, c.name AS country FROM oc_zone z LEFT JOIN oc_country c ON (z.country_id = c.country_id)";

		$sort_data = [
			'c.name',
			'z.name',
			'z.code'
		];

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY c.name";
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
	}

	public function getZonesByCountryId($country_id) {
		$zone_data = $this->cache->get('zone.' . (int)$country_id);

		if (!$zone_data) {
			$query = $this->db->query("SELECT * FROM oc_zone WHERE country_id = :country_id AND status = '1' ORDER BY name",
                [
                    ':country_id' => $country_id
                ]);

			$zone_data = $query->rows;

			$this->cache->set('zone.' . (int)$country_id, $zone_data);
		}

		return $zone_data;
	}

	public function getTotalZones() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_zone");

		return $query->row['total'];
	}

	public function getTotalZonesByCountryId($country_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_zone WHERE country_id = :country_id",
            [
                ':country_id' => $country_id
            ]);

		return $query->row['total'];
	}
}