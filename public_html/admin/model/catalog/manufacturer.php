<?php
class ModelCatalogManufacturer extends Model {
	public function addManufacturer($data) {
		$this->db->query("INSERT INTO oc_manufacturer SET name = :name, sort_order = :sort_order",
            [
                ':name' => $data['name'],
                ':sort_order' => $data['sort_order']
            ]);

		$manufacturer_id = $this->db->getLastId();

		if (isset($data['image'])) {
			$this->db->query("UPDATE oc_manufacturer SET image = :image WHERE manufacturer_id = :manufacturer_id",
                [
                    ':image' => $data['image'],
                    ':manufacturer_id' => $manufacturer_id
                ]);
		}

		if (isset($data['manufacturer_store'])) {
			foreach ($data['manufacturer_store'] as $store_id) {
				$this->db->query("INSERT INTO oc_manufacturer_to_store SET manufacturer_id = :manufacturer_id, store_id = :store_id",
                    [
                        ':manufacturer_id' => $manufacturer_id,
                        ':store_id' => $store_id
                    ]);
			}
		}
				
		// SEO URL
		if (isset($data['manufacturer_seo_url'])) {
			foreach ($data['manufacturer_seo_url'] as $store_id => $language) {
				foreach ($language as $language_id => $keyword) {
					if (!empty($keyword)) {
						$this->db->query("INSERT INTO oc_seo_url SET store_id = :store_id, language_id = :language_id, query = :query, keyword = :keyword",
                            [
                                ':store_id' => $store_id,
                                ':language_id' => $language_id,
                                ':query' =>  'manufacturer_id=' . (int)$manufacturer_id,
                                ':keyword' => $keyword
                            ]);
					}
				}
			}
		}
		
		$this->cache->delete('manufacturer');

		return $manufacturer_id;
	}

	public function editManufacturer($manufacturer_id, $data) {
		$this->db->query("UPDATE oc_manufacturer SET name = :name, sort_order = :sort_order WHERE manufacturer_id = :manufacturer_id",
            [
                ':name' => $data['name'],
                ':sort_order' => $data['sort_order'],
                ':manufacturer_id' => $manufacturer_id
            ]);

		if (isset($data['image'])) {
			$this->db->query("UPDATE oc_manufacturer SET image = :image WHERE manufacturer_id = :manufacturer_id",
                [
                    ':manufacturer_id' => $manufacturer_id,
                    ':image' => $data['image'],
                ]);
		}

		$this->db->query("DELETE FROM oc_manufacturer_to_store WHERE manufacturer_id = :manufacturer_id",
            [
                ':manufacturer_id' => $manufacturer_id,
            ]);

		if (isset($data['manufacturer_store'])) {
			foreach ($data['manufacturer_store'] as $store_id) {
				$this->db->query("INSERT INTO oc_manufacturer_to_store SET manufacturer_id = :manufacturer_id, store_id = :store_id",
                    [
                        ':manufacturer_id' => $manufacturer_id,
                        ':store_id' => $store_id
                    ]);
			}
		}

		$this->db->query("DELETE FROM `oc_seo_url` WHERE query = :query",
            [
                ':query' =>  'manufacturer_id=' . $manufacturer_id
            ]);

		if (isset($data['manufacturer_seo_url'])) {
			foreach ($data['manufacturer_seo_url'] as $store_id => $language) {
				foreach ($language as $language_id => $keyword) {
					if (!empty($keyword)) {
						$this->db->query("INSERT INTO `oc_seo_url` SET store_id = :store_id, language_id = :language_id, query = :query, keyword = :keyword",
                            [
                                ':store_id' => $store_id,
                                ':query' =>  'manufacturer_id=' . $manufacturer_id,
                                ':language_id' => $language_id,
                                ':keyword' => $keyword
                            ]);
					}
				}
			}
		}

		$this->cache->delete('manufacturer');
	}

	public function deleteManufacturer($manufacturer_id) {
		$this->db->query("DELETE FROM `oc_manufacturer` WHERE manufacturer_id = :manufacturer_id",
            [
                ':manufacturer_id' => $manufacturer_id,
            ]);
		$this->db->query("DELETE FROM `oc_manufacturer_to_store` WHERE manufacturer_id = :manufacturer_id",
            [
                ':manufacturer_id' => $manufacturer_id,
            ]);
		$this->db->query("DELETE FROM `oc_seo_url` WHERE query = :query",
            [
                ':query' => 'manufacturer_id=' . $manufacturer_id,

            ]);

		$this->cache->delete('manufacturer');
	}

	public function getManufacturer($manufacturer_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM oc_manufacturer WHERE manufacturer_id = :manufacturer_id",
            [
                ':manufacturer_id' => $manufacturer_id,
            ]);

		return $query->row;
	}

	public function getManufacturers($data = array()) {
		$sql = "SELECT * FROM oc_manufacturer";

		if (!empty($data['filter_name'])) {
			$sql .= " WHERE name LIKE :name";
            $args[':name'] = $data['filter_name'] . '%';
		}

		$sort_data = array(
			'name',
			'sort_order'
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

		$query = $this->db->query($sql, $args);

		return $query->rows;
	}

	public function getManufacturerStores($manufacturer_id) {
		$manufacturer_store_data = [];

		$query = $this->db->query("SELECT * FROM oc_manufacturer_to_store WHERE manufacturer_id = :manufacturer_id",
            [
                ':manufacturer_id' => $manufacturer_id,
            ]);

		foreach ($query->rows as $result) {
			$manufacturer_store_data[] = $result['store_id'];
		}

		return $manufacturer_store_data;
	}
	
	public function getManufacturerSeoUrls($manufacturer_id) {
		$manufacturer_seo_url_data = [];
		
		$query = $this->db->query("SELECT * FROM oc_seo_url WHERE query = :query",
            [
                ':query' => 'manufacturer_id=' . $manufacturer_id
            ]);

		foreach ($query->rows as $result) {
			$manufacturer_seo_url_data[$result['store_id']][$result['language_id']] = $result['keyword'];
		}

		return $manufacturer_seo_url_data;
	}
	
	public function getTotalManufacturers() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_manufacturer");

		return $query->row['total'];
	}
}
