<?php
class ModelLocalisationGeoZone extends Model {
	public function addGeoZone($data) {
		$this->db->query("INSERT INTO oc_geo_zone SET name = :name, description = :description",
            [
                ':name' => $data['name'],
                ':description' => $data['description'],
            ]);

		$geo_zone_id = $this->db->getLastId();

		if (isset($data['zone_to_geo_zone'])) {
		    // LJK TODO: investigate - geo_zone_id is generated from the above query - there shouldn't be any way for the DELETE query to find anything to delete
			foreach ($data['zone_to_geo_zone'] as $value) {
				$this->db->query("INSERT INTO oc_zone_to_geo_zone SET country_id = :country_id, zone_id = :zone_id, geo_zone_id = :geo_zone_id",
                    [
                        ':country_id' => $value['country_id'],
                        ':zone_id' => $value['zone_id'],
                        ':geo_zone_id' => $geo_zone_id
                    ]);
			}
		}

		$this->cache->delete('geo_zone');
		
		return $geo_zone_id;
	}

	public function editGeoZone($geo_zone_id, $data) {
		$this->db->query("UPDATE oc_geo_zone SET name = :name, description = :description WHERE geo_zone_id = :geo_zone_id",
            [
                ':name' => $data['name'],
                ':description' => $data['description'],
                ':geo_zone_id' => $geo_zone_id
            ]);

		$this->db->query("DELETE FROM oc_zone_to_geo_zone WHERE geo_zone_id = :geo_zone_id",
            [
                ':geo_zone_id' => $geo_zone_id
            ]);

		if (isset($data['zone_to_geo_zone'])) {
			foreach ($data['zone_to_geo_zone'] as $value) {
			    // LJK TODO the above query already appears to have deleted anythign this query would delete.
				$this->db->query("INSERT INTO oc_zone_to_geo_zone SET country_id = :country_id, zone_id = :zone_id, geo_zone_id = :geozone_id",
                    [
                        ':geo_zone_id' => $geo_zone_id,
                        ':country_id' => $value['country_id'],
                        ':zone_id' => $value['zone_id'],
                    ]);
			}
		}

		$this->cache->delete('geo_zone');
	}

	public function deleteGeoZone($geo_zone_id) {
		$this->db->query("DELETE FROM oc_geo_zone WHERE geo_zone_id = :geo_zone_id",
            [
                ':geo_zone_id' => $geo_zone_id
            ]);
		$this->db->query("DELETE FROM oc_zone_to_geo_zone WHERE geo_zone_id = :geo_zone_id",
            [
                ':geo_zone_id' => $geo_zone_id
            ]);

		$this->cache->delete('geo_zone');
	}

	public function getGeoZone($geo_zone_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM oc_geo_zone WHERE geo_zone_id =:geo_zone_id",
            [
                ':geo_zone_id' => $geo_zone_id
            ]);

		return $query->row;
	}

	public function getGeoZones($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM oc_geo_zone";

			$sort_data = array(
				'name',
				'description'
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
			$geo_zone_data = $this->cache->get('geo_zone');

			if (!$geo_zone_data) {
				$query = $this->db->query("SELECT * FROM oc_geo_zone ORDER BY name ASC");

				$geo_zone_data = $query->rows;

				$this->cache->set('geo_zone', $geo_zone_data);
			}

			return $geo_zone_data;
		}
	}

	public function getTotalGeoZones() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_geo_zone");

		return $query->row['total'];
	}

	public function getZoneToGeoZones($geo_zone_id) {
		$query = $this->db->query("SELECT * FROM oc_zone_to_geo_zone WHERE geo_zone_id = :geo_zone_id",
            [
                ':geo_zone_id' => $geo_zone_id
            ]);

		return $query->rows;
	}

	public function getTotalZoneToGeoZoneByGeoZoneId($geo_zone_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_zone_to_geo_zone WHERE geo_zone_id = :geo_zone_id",
            [
                ':geo_zone_id' => $geo_zone_id
            ]);

		return $query->row['total'];
	}

	public function getTotalZoneToGeoZoneByCountryId($country_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_zone_to_geo_zone WHERE country_id = :country_id",
            [
                ':country_id' => $country_id
            ]);

		return $query->row['total'];
	}

	public function getTotalZoneToGeoZoneByZoneId($zone_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_zone_to_geo_zone WHERE zone_id = :zone_id",
            [
                ':zone_id' => $zone_id
            ]);

		return $query->row['total'];
	}
}