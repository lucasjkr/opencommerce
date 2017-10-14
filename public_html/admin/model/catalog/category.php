<?php
class ModelCatalogCategory extends Model {
	public function addCategory($data) {
		$this->db->query("INSERT INTO oc_category SET parent_id = :parent_id, `top` = :top, `column` = :column, sort_order = :sort_order, status = :status",
            [
                ':parent_id' => $data['parent_id'],
                ':top' => (isset($data['top']) ? (int)$data['top'] : 0),
                ':column' => $data['column'],
                ':sort_order' => $data['sort_order'],
                ':status' => $data['status'],
            ]);

		$category_id = $this->db->getLastId();

		if (isset($data['image'])) {
			$this->db->query("UPDATE oc_category SET image = :image WHERE category_id = :category_id",
                [
                    ':image' => $data['image'],
                    ':category_id' => $category_id,
                ]);
		}

		foreach ($data['category_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO oc_category_description SET category_id = :category_id, language_id = :language_id, name = :name, description = :description,
                              meta_title = :meta_title, meta_description = :meta_description, meta_keyword = :meta_keyword",
                [
                    ':category_id' => $category_id,
                    ':language_id' => $language_id,
                    ':name' => $value['name'],
                    ':description' => $value['description'],
                    ':meta_title' => $value['meta_title'],
                    ':meta_description' => $value['meta_description'],
                    ':meta_keyword' => $value['meta_keyword']
                ]);
		}

		// MySQL Hierarchical Data Closure Table Pattern
		$level = 0;

		$query = $this->db->query("SELECT * FROM `oc_category_path` WHERE category_id = :parent_id ORDER BY `level` ASC",
            [
                ':parent_id' => $data['parent_id']
            ]);

		foreach ($query->rows as $result) {
			$this->db->query("INSERT INTO `oc_category_path` SET `category_id` = :category_id, `path_id` = :path_id, `level` = :level",
                [
                    ':category_id' => $category_id ,
                    ':path_id' => $result['path_id'],
                    ':level' => $level,
                ]);

			$level++;
		}

		$this->db->query("INSERT INTO `oc_category_path` SET `category_id` = :category_id, `path_id` = :path_id, `level` = :level",
            [
                ':category_id' => $category_id,
                ':path_id' => $category_id,
                ':level' => $level,
            ]);

		if (isset($data['category_filter'])) {
			foreach ($data['category_filter'] as $filter_id) {
				$this->db->query("INSERT INTO oc_category_filter SET category_id = :category_id, filter_id = :filter_id",
                    [
                        ':category_id' => $category_id,
                        ':filter_id' => $filter_id
                    ]);
			}
		}

		if (isset($data['category_store'])) {
			foreach ($data['category_store'] as $store_id) {
				$this->db->query("INSERT INTO oc_category_to_store SET category_id = :category_id, store_id = :store_id",
                    [
                        ':category_id' => $category_id,
                        ':store_id' => $store_id
                    ]);
			}
		}
		
		if (isset($data['category_seo_url'])) {
			foreach ($data['category_seo_url'] as $store_id => $language) {
				foreach ($language as $language_id => $keyword) {
					if (!empty($keyword)) {
						$this->db->query("INSERT INTO oc_seo_url SET store_id = :store_id, language_id = :language_id, query = :query, keyword = :keyword",
                            [
                                ':store_id' => $store_id,
                                ':language_id' => $language_id,
                                ':query' => 'category_id=' . $category_id,
                                ':keyword' => $keyword,
                            ]);
					}
				}
			}
		}
		
		// Set which layout to use with this category
		if (isset($data['category_layout'])) {
			foreach ($data['category_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO oc_category_to_layout SET category_id = :category_id, store_id = :store_id , layout_id = :layout_id",
                    [
                        ':category_id' => $category_id,
                        ':store_id' => $store_id,
                        ':layout_id' => $layout_id
                    ]);
			}
		}

		$this->cache->delete('category');

		return $category_id;
	}



	public function editCategory($category_id, $data) {
		$this->db->query("UPDATE oc_category SET parent_id = :parent_id, `top` = :top, `column` = :column, sort_order = :sort_order, status = :status WHERE category_id = :category_id",
            [
                ':parent_id' => $data['parent_id'],
                ':top' => (isset($data['top']) ? (int)$data['top'] : 0),
                ':column' => $data['column'],
                ':sort_order' => $data['sort_order'],
                ':status' => $data['status'],
                ':category_id' => $category_id,
            ]);


        if (isset($data['image'])) {
			$this->db->query("UPDATE oc_category SET image = :image WHERE category_id = :category_id",
                [
                    ':image' => $data['image'],
                    ':category_id' => $category_id,
                ]);
		}


		$this->db->query("DELETE FROM oc_category_description WHERE category_id = :category_id",
            [
                ':category_id' => $category_id,
            ]);

		foreach ($data['category_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO oc_category_description SET category_id = :category_id, language_id = :language_id, name = :name, description = :description, meta_title = :meta_title, meta_description = :meta_description, meta_keyword = :meta_keywords",
                [
                    ':category_id' => $category_id,
                    ':language_id' => $language_id,
                    ':name' => $value['name'],
                    ':description' => $value['description'],
                    ':meta_title' => $value['meta_title'],
                    ':meta_description' => $value['meta_description'],
                    ':meta_keywords' => $value['meta_keyword']
                ]);
		}

		// MySQL Hierarchical Data Closure Table Pattern
		$query = $this->db->query("SELECT * FROM `oc_category_path` WHERE path_id = :category_id ORDER BY level ASC",
            [
                ':category_id' => $category_id
            ]);

		if ($query->rows) {
			foreach ($query->rows as $category_path) {
				// Delete the path below the current one
				$this->db->query("DELETE FROM `oc_category_path` WHERE category_id = :category_id AND level < :level",
                    [
                        ':category_id' => $category_path['category_id'],
                        ':level' => $category_path['level']
                    ]);

				$path = [];

				// Get the nodes new parents
				$query = $this->db->query("SELECT * FROM `oc_category_path` WHERE category_id = :category_id ORDER BY level ASC",
                    [
                        ':category_id' => $data['parent_id']
                    ]);

				foreach ($query->rows as $result) {
					$path[] = $result['path_id'];
				}

				// Get whats left of the nodes current path
				$query = $this->db->query("SELECT * FROM `oc_category_path` WHERE category_id = :category_id ORDER BY level ASC",
                    [
                        ':category_id' => $category_path['category_id']
                    ]);

				foreach ($query->rows as $result) {
					$path[] = $result['path_id'];
				}

				// Combine the paths with a new level
				$level = 0;

				foreach ($path as $path_id) {
					$this->db->query("REPLACE INTO `oc_category_path` SET category_id = :category_id, `path_id` = :path_id, level = :level",
                        [
                            ':category_id' => $category_path['category_id'],
                            ':path_id' => $path_id,
                            ':level' => $level
                        ]);

					$level++;
				}
			}
		} else {
			// Delete the path below the current one
			$this->db->query("DELETE FROM `oc_category_path` WHERE category_id = :category_id",
                [
                    ':category_id' => $category_id
                ]);

			// Fix for records with no paths
			$level = 0;

			$query = $this->db->query("SELECT * FROM `oc_category_path` WHERE category_id = :category_id ORDER BY level ASC",
                [
                    ':category_id' => $data['parent_id']
                ]);

			foreach ($query->rows as $result) {
				$this->db->query("INSERT INTO `oc_category_path` SET category_id = :category_id, `path_id` = :path_id, level = :level",
                    [
                        ':category_id' => $category_id,
                        ':path_id' => $result['path_id'],
                        ':level' => $level
                    ]);

				$level++;
			}

			$this->db->query("REPLACE INTO `oc_category_path` SET `category_id` = :category_id, `path_id` = :path_id, `level` = :level",
                [
                    ':category_id' => $category_id,
                    ':path_id' => $category_id,
                    ':level' => $level
                ]);
		}

		$this->db->query("DELETE FROM oc_category_filter WHERE category_id = :category_id",
            [
                ':category_id' => $category_id
            ]);

		if (isset($data['category_filter'])) {
			foreach ($data['category_filter'] as $filter_id) {
				$this->db->query("INSERT INTO oc_category_filter SET category_id = :category_id, filter_id = :filter_id",
                    [
                        ':category_id' => $category_id,
                        ':filter_id' => $filter_id
                    ]);
			}
		}

		$this->db->query("DELETE FROM oc_category_to_store WHERE category_id = :category_id",
            [
                ':category_id' => $category_id
            ]);

		if (isset($data['category_store'])) {
			foreach ($data['category_store'] as $store_id) {
				$this->db->query("INSERT INTO oc_category_to_store SET category_id = :category_id, store_id = :store_id",
                    [
                        ':category_id' => $category_id,
                        ':store_id' => $store_id
                    ]);
			}
		}

		// SEO URL
		$this->db->query("DELETE FROM `oc_seo_url` WHERE query = :query",
            [
                ':query' => 'category_id=' . $category_id
            ]);

		if (isset($data['category_seo_url'])) {
			foreach ($data['category_seo_url'] as $store_id => $language) {
				foreach ($language as $language_id => $keyword) {
					if (!empty($keyword)) {
						$this->db->query("INSERT INTO oc_seo_url SET store_id = :store_id, language_id = :language_id, query = :query, keyword = :keyword",
                            [
                                ':store_id' => $store_id,
                                ':language_id' => $language_id,
                                ':query' => 'category_id=' . $category_id,
                                ':keyword' => $keyword
                            ]);
					}
				}
			}
		}

		$this->db->query("DELETE FROM oc_category_to_layout WHERE category_id = :category_id",
            [
                ':category_id' => $category_id
            ]);

		if (isset($data['category_layout'])) {
			foreach ($data['category_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO oc_category_to_layout SET category_id = :category_id, store_id = :store_id, layout_id = :layout_id",
                    [
                        ':category_id' => $category_id,
                        ':store_id' => $store_id,
                        ':layout_id' => $layout_id
                    ]);
			}
		}

		$this->cache->delete('category');
	}

	public function deleteCategory($category_id) {
		$this->db->query("DELETE FROM oc_category_path WHERE category_id = :category_id",
            [
                ':category_id' => $category_id
            ]);

		$query = $this->db->query("SELECT * FROM oc_category_path WHERE path_id = :category_id",
            [
                ':category_id' => $category_id
            ]);

		foreach ($query->rows as $result) {
			$this->deleteCategory($result['category_id']);
		}

		$this->db->query("DELETE FROM oc_category WHERE category_id = :category_id",
            [
                ':category_id' => $category_id
            ]);
		$this->db->query("DELETE FROM oc_category_description WHERE category_id = :category_id",
            [
                ':category_id' => $category_id
            ]);
		$this->db->query("DELETE FROM oc_category_filter WHERE category_id = :category_id",
            [
                ':category_id' => $category_id
            ]);
		$this->db->query("DELETE FROM oc_category_to_store WHERE category_id = :category_id",
            [
                ':category_id' => $category_id
            ]);
		$this->db->query("DELETE FROM oc_category_to_layout WHERE category_id = :category_id",
            [
                ':category_id' => $category_id
            ]);
		$this->db->query("DELETE FROM oc_product_to_category WHERE category_id = :category_id",
            [
                ':category_id' => $category_id
            ]);
		$this->db->query("DELETE FROM oc_seo_url WHERE query = :query",
            [
                ':query' => 'category_id=' . $category_id
            ]);
		$this->db->query("DELETE FROM oc_coupon_category WHERE category_id = :category_id",
            [
                ':category_id' => $category_id
            ]);

		$this->cache->delete('category');
	}

	public function repairCategories($parent_id = 0) {
		$query = $this->db->query("SELECT * FROM oc_category WHERE parent_id = '" . (int)$parent_id . "'");

		foreach ($query->rows as $category) {
			// Delete the path below the current one
			$this->db->query("DELETE FROM `oc_category_path` WHERE category_id = '" . (int)$category['category_id'] . "'");

			// Fix for records with no paths
			$level = 0;

			$query = $this->db->query("SELECT * FROM `oc_category_path` WHERE category_id = '" . (int)$parent_id . "' ORDER BY level ASC");

			foreach ($query->rows as $result) {
				$this->db->query("INSERT INTO `oc_category_path` SET category_id = '" . (int)$category['category_id'] . "', `path_id` = '" . (int)$result['path_id'] . "', level = '" . (int)$level . "'");

				$level++;
			}

			$this->db->query("REPLACE INTO `oc_category_path` SET category_id = '" . (int)$category['category_id'] . "', `path_id` = '" . (int)$category['category_id'] . "', level = '" . (int)$level . "'");

			$this->repairCategories($category['category_id']);
		}
	}

	public function getCategory($category_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT GROUP_CONCAT(cd1.name ORDER BY level SEPARATOR '&nbsp;&nbsp;&gt;&nbsp;&nbsp;') FROM oc_category_path cp LEFT JOIN oc_category_description cd1 ON (cp.path_id = cd1.category_id AND cp.category_id != cp.path_id) WHERE cp.category_id = c.category_id AND cd1.language_id = '" . (int)$this->config->get('config_language_id') . "' GROUP BY cp.category_id) AS path FROM oc_category c LEFT JOIN oc_category_description cd2 ON (c.category_id = cd2.category_id) WHERE c.category_id = '" . (int)$category_id . "' AND cd2.language_id = '" . (int)$this->config->get('config_language_id') . "'");
		
		return $query->row;
	}

	public function getCategories($data = array()) {
		$sql = "SELECT cp.category_id AS category_id, GROUP_CONCAT(cd1.name ORDER BY cp.level SEPARATOR '&nbsp;&nbsp;&gt;&nbsp;&nbsp;') AS name, c1.parent_id, c1.sort_order FROM oc_category_path cp LEFT JOIN oc_category c1 ON (cp.category_id = c1.category_id) LEFT JOIN oc_category c2 ON (cp.path_id = c2.category_id) LEFT JOIN oc_category_description cd1 ON (cp.path_id = cd1.category_id) LEFT JOIN oc_category_description cd2 ON (cp.category_id = cd2.category_id) WHERE cd1.language_id = :language_id_1 AND cd2.language_id = :language_id_2";
        $args[':language_id_1'] = $this->config->get('config_language_id');
        $args[':language_id_2'] = $this->config->get('config_language_id');

        // LJK TODO: Verify that the % does not get escaped
        if (!empty($data['filter_name'])) {
			$sql .= " AND cd2.name LIKE :filter";
            $args[':filter'] = '%' . $data['filter_name'] . '%';
        }

		$sql .= " GROUP BY cp.category_id";

		$sort_data = array(
			'name',
			'sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY sort_order";
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

	public function getCategoryDescriptions($category_id) {
		$category_description_data = [];

		$query = $this->db->query("SELECT * FROM oc_category_description WHERE category_id = :category_id",
            [
                ':category_id' => $category_id
            ]);

		foreach ($query->rows as $result) {
			$category_description_data[$result['language_id']] = array(
				'name'             => $result['name'],
				'meta_title'       => $result['meta_title'],
				'meta_description' => $result['meta_description'],
				'meta_keyword'     => $result['meta_keyword'],
				'description'      => $result['description']
			);
		}

		return $category_description_data;
	}
	
	public function getCategoryPath($category_id) {
		$query = $this->db->query("SELECT category_id, path_id, level FROM oc_category_path WHERE category_id = :category_id",
            [
                ':category_id' => $category_id
            ]);

		return $query->rows;
	}
	
	public function getCategoryFilters($category_id) {
		$category_filter_data = [];

		$query = $this->db->query("SELECT * FROM oc_category_filter WHERE category_id = :category_id",
            [
                ':category_id' => $category_id
            ]);

		foreach ($query->rows as $result) {
			$category_filter_data[] = $result['filter_id'];
		}

		return $category_filter_data;
	}

	public function getCategoryStores($category_id) {
		$category_store_data = [];

		$query = $this->db->query("SELECT * FROM oc_category_to_store WHERE category_id = :category_id",
            [
                ':category_id' => $category_id
            ]);

		foreach ($query->rows as $result) {
			$category_store_data[] = $result['store_id'];
		}

		return $category_store_data;
	}
	
	public function getCategorySeoUrls($category_id) {
		$category_seo_url_data = [];
		
		$query = $this->db->query("SELECT * FROM oc_seo_url WHERE query = :query",
            [
                ':query' => 'category_id=' . $category_id
            ]);

		foreach ($query->rows as $result) {
			$category_seo_url_data[$result['store_id']][$result['language_id']] = $result['keyword'];
		}

		return $category_seo_url_data;
	}
	
	public function getCategoryLayouts($category_id) {
		$category_layout_data = [];

		$query = $this->db->query("SELECT * FROM oc_category_to_layout WHERE category_id = :category_id",
            [
                ':category_id' => $category_id
            ]);

		foreach ($query->rows as $result) {
			$category_layout_data[$result['store_id']] = $result['layout_id'];
		}

		return $category_layout_data;
	}

	public function getTotalCategories() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_category");

		return $query->row['total'];
	}
	
	public function getTotalCategoriesByLayoutId($layout_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_category_to_layout WHERE layout_id = :layout_id",
            [
                ':layout_id' => $layout_id
            ]);

		return $query->row['total'];
	}	
}