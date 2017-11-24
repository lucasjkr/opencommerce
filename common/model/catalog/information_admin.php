<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ModelCatalogInformationAdmin extends Model {
	public function addInformation($data) {
		$this->db->query("INSERT INTO oc_information SET sort_order = :sort_order, bottom = :bottom, status = :status",
            [
                ':sort_order' => $data['sort_order'],
                ':bottom' => (isset($data['bottom']) ? (int)$data['bottom'] : 0),
                ':status' => (int)$data['status']
            ]);

		$information_id = $this->db->getLastId();

		foreach ($data['information_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO oc_information_description SET information_id = :information_id, language_id = :language_id, title = :title, description = :description, meta_title = :meta_title, meta_description = :meta_description, meta_keyword = :meta_keyword",
                [
                    ':information_id' => $information_id,
                    ':language_id' => $language_id,
                    ':title' => $value['title'],
                    ':description' => $value['description'],
                    ':meta_title' => $value['meta_title'],
                    ':meta_description' => $value['meta_description'],
                    ':meta_keyword' => $value['meta_keyword']
                ]);
		}

		if (isset($data['information_store'])) {
			foreach ($data['information_store'] as $store_id) {
				$this->db->query("INSERT INTO oc_information_to_store SET information_id = :information_id, store_id = :store_id",
                    [
                        ':information_id' => $information_id,
                        ':store_id' => $store_id
                    ]);
			}
		}

		// SEO URL
		if (isset($data['information_seo_url'])) {
			foreach ($data['information_seo_url'] as $store_id => $language) {
				foreach ($language as $language_id => $keyword) {
					if (!empty($keyword)) {
						$this->db->query("INSERT INTO oc_seo_url SET store_id = :store_id, language_id = :language_id, query = :query, keyword = :keyword",
                            [
                                ':store_id' => $store_id,
                                ':language_id' => $language_id,
                                ':query' => 'information_id=' . (int)$information_id,
                                ':keyword' => $keyword
                            ]);
					}
				}
			}
		}
		
		if (isset($data['information_layout'])) {
			foreach ($data['information_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO oc_information_to_layout SET information_id = :information_id, store_id = :store_id, layout_id = :layout_id",
                    [
                        ':information_id' => $information_id,
                        ':store_id' => $store_id,
                        ':layout_id' => $layout_id
                    ]);
			}
		}

		$this->cache->delete('information');

		return $information_id;
	}

	public function editInformation($information_id, $data) {
		$this->db->query("UPDATE oc_information SET sort_order = :sort_order, bottom = :bottom, status = :status WHERE information_id = :information_id",
            [
                ':sort_order' => $data['sort_order'],
                ':bottom' => (isset($data['bottom']) ? (int)$data['bottom'] : 0),
                ':status' => $data['status'],
                ':information_id' => $information_id
            ]);

		$this->db->query("DELETE FROM oc_information_description WHERE information_id = :information_id",
            [
                ':information_id' => $information_id
            ]);

		foreach ($data['information_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO oc_information_description SET information_id = :information_id, language_id = :language_id, title = :title, description = :description, meta_title = :meta_title, meta_description = :meta_description, meta_keyword = :meta_keyword",
                [
                    ':information_id' => $information_id,
                    ':language_id' => $language_id,
                    ':title' => $value['title'],
                    ':description' => $value['description'],
                    ':meta_title' => $value['meta_title'],
                    ':meta_description' => $value['meta_description'],
                    ':meta_keyword' => $value['meta_keyword']
                ]);
		}

		$this->db->query("DELETE FROM oc_information_to_store WHERE information_id = :information_id",
            [
                ':information_id' => $information_id
            ]);

		if (isset($data['information_store'])) {
			foreach ($data['information_store'] as $store_id) {
				$this->db->query("INSERT INTO oc_information_to_store SET information_id = :information_id, store_id = :store_id",
                    [
                        ':information_id' => $information_id,
                        ':store_id' => $store_id
                    ]);
			}
		}

		$this->db->query("DELETE FROM oc_seo_url WHERE query = :query",
            [
                ':query' => 'information_id=' . $information_id
            ]);

		if (isset($data['information_seo_url'])) {
			foreach ($data['information_seo_url'] as $store_id => $language) {
				foreach ($language as $language_id => $keyword) {
					if (trim($keyword)) {
						$this->db->query("INSERT INTO `oc_seo_url` SET store_id = :store_id, language_id = :language_id, query = :query, keyword = :keyword",
                            [
                                ':store_id' => $store_id,
                                ':language_id' => $language_id,
                                ':query' => 'information_id=' . (int)$information_id,
                                ':keyword' => $keyword
                            ]);
					}
				}
			}
		}

		$this->db->query("DELETE FROM `oc_information_to_layout` WHERE information_id = :information_id",
            [
                ':information_id' => $information_id,
            ]);

		if (isset($data['information_layout'])) {
			foreach ($data['information_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO `oc_information_to_layout` SET information_id = :information_id, store_id = :store_id, layout_id = :layout_id",
                    [
                        ':information_id' => $information_id,
                        ':store_id' => $store_id,
                        ':layout_id' => $layout_id
                    ]);
			}
		}

		$this->cache->delete('information');
	}

	public function deleteInformation($information_id) {
		$this->db->query("DELETE FROM `oc_information` WHERE information_id = :information_id",
            [
                ':information_id' => $information_id
            ]);

		$this->db->query("DELETE FROM `oc_information_description` WHERE information_id = :information_id",
            [
                ':information_id' => $information_id
            ]);

		$this->db->query("DELETE FROM `oc_information_to_store` WHERE information_id = :information_id",
            [
                ':information_id' => $information_id
            ]);

		$this->db->query("DELETE FROM `oc_information_to_layout` WHERE information_id = :information_id",
            [
                ':information_id' => $information_id
            ]);

		$this->db->query("DELETE FROM `oc_seo_url` WHERE query = :query",
            [
                ':query' => 'information_id=' . $information_id
            ]);

		$this->cache->delete('information');
	}

	public function getInformation($information_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM oc_information WHERE information_id =  :information_id",
            [
                ':information_id' => $information_id
            ]);

		return $query->row;
	}

	public function getInformations($data = []) {
		if ($data) {
			$sql = "SELECT * FROM oc_information i LEFT JOIN oc_information_description id ON (i.information_id = id.information_id) WHERE id.language_id = :language_id";

            $args[':language_id'] = $this->config->get('config_language_id');

            $sort_data = [
				'id.title',
				'i.sort_order'
			];

			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];
			} else {
				$sql .= " ORDER BY id.title";
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
		} else {
			$information_data = $this->cache->get('information.' . (int)$this->config->get('config_language_id'));

			if (!$information_data) {
				$query = $this->db->query("SELECT * FROM oc_information i LEFT JOIN oc_information_description id ON (i.information_id = id.information_id) WHERE id.language_id = :language_id ORDER BY id.title",
                    [
                        ':language_id' => $this->config->get('config_language_id')
                    ]);

				$information_data = $query->rows;

				$this->cache->set('information.' . (int)$this->config->get('config_language_id'), $information_data);
			}

			return $information_data;
		}
	}

	public function getInformationDescriptions($information_id) {
		$information_description_data = [];

		$query = $this->db->query("SELECT * FROM oc_information_description WHERE information_id = :information_id",
            [
                ':information_id' => $information_id
            ]);

		foreach ($query->rows as $result) {
			$information_description_data[$result['language_id']] = [
				'title'            => $result['title'],
				'description'      => $result['description'],
				'meta_title'       => $result['meta_title'],
				'meta_description' => $result['meta_description'],
				'meta_keyword'     => $result['meta_keyword']
			];
		}

		return $information_description_data;
	}

	public function getInformationStores($information_id) {
		$information_store_data = [];

		$query = $this->db->query("SELECT * FROM oc_information_to_store WHERE information_id = :information_id",
            [
                ':information_id' => $information_id
            ]);

		foreach ($query->rows as $result) {
			$information_store_data[] = $result['store_id'];
		}

		return $information_store_data;
	}

	public function getInformationSeoUrls($information_id) {
		$information_seo_url_data = [];
		
		$query = $this->db->query("SELECT * FROM oc_seo_url WHERE query = :query",
            [
                ':query' =>  'information_id=' . (int)$information_id
            ]);

		foreach ($query->rows as $result) {
			$information_seo_url_data[$result['store_id']][$result['language_id']] = $result['keyword'];
		}

		return $information_seo_url_data;
	}

	public function getInformationLayouts($information_id) {
		$information_layout_data = [];

		$query = $this->db->query("SELECT * FROM oc_information_to_layout WHERE information_id = :information_id",
            [
                ':information_id' => $information_id
            ]);

		foreach ($query->rows as $result) {
			$information_layout_data[$result['store_id']] = $result['layout_id'];
		}

		return $information_layout_data;
	}

	public function getTotalInformations() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_information");

		return $query->row['total'];
	}

	public function getTotalInformationsByLayoutId($layout_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_information_to_layout WHERE layout_id = :layout_id",
            [
                ':layout_id' => $layout_id
            ]);

		return $query->row['total'];
	}
}