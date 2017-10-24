<?php
class ModelLocalisationLocation extends Model {
	public function addLocation($data) {
		$this->db->query("INSERT INTO oc_location SET name = :name, address = :address, geocode = :geocode, telephone = :telephone, fax = :fax, image = :image, open = :open, comment = :comment",
            [
                ':name' => $data['name'],
                ':address' => $data['address'],
                ':geocode' => $data['geocode'],
                ':telephone' => $data['telephone'],
                ':fax' => $data['fax'],
                ':image' => $data['image'],
                ':open' => $data['open'],
                ':comment' => $data['comment']
            ]);
	
		return $this->db->getLastId();
	}

	public function editLocation($location_id, $data) {
		$this->db->query("UPDATE oc_location SET name = :name , address = :address, geocode = :geocode, telephone = :telephone , fax = :fax, image = :image, open = :open, comment = :comment WHERE location_id = :location_id",
            [
                ':name' => $data['name'],
                ':address' => $data['address'],
                ':geocode' => $data['geocode'],
                ':telephone' => $data['telephone'],
                ':fax' => $data['fax'],
                ':image' => $data['image'],
                ':open' => $data['open'],
                ':comment' => $data['comment'],
                ':location_id' => $location_id
            ]);
	}

	public function deleteLocation($location_id) {
		$this->db->query("DELETE FROM oc_location WHERE location_id = :location_id",
            [
                ':location_id' => $location_id
            ]);
	}

	public function getLocation($location_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM oc_location WHERE location_id = :location_id",
            [
                ':location_id' => $location_id
            ]);

		return $query->row;
	}

	public function getLocations($data = []) {
		$sql = "SELECT location_id, name, address FROM oc_location";

		$sort_data = [
			'name',
			'address',
		];

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
	}

	public function getTotalLocations() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_location");

		return $query->row['total'];
	}
}
