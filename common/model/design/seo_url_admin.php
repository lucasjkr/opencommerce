<?php
class ModelDesignSeoUrlAdmin extends Model {
	public function addSeoUrl($data) {
		$this->db->query("INSERT INTO `oc_seo_url` SET store_id = :store_id, language_id = :language_id, query = :query, keyword = :keyword",
            [
                ':store_id' => $data['store_id'],
                ':language_id' => $data['language_id'],
                ':query' => $data['query'],
                ':keyword' => $data['keyword']
            ]);
	}

	public function editSeoUrl($seo_url_id, $data) {
		$this->db->query("UPDATE `oc_seo_url` SET store_id = :store_id, language_id = :language_id, query = :query, keyword = :keyword WHERE seo_url_id = :seo_url_id",
            [
                ':store_id' => $data['store_id'],
                ':language_id' => $data['language_id'],
                ':query' => $data['query'],
                ':keyword' => $data['keyword'],
                ':seo_url_id' => $seo_url_id
            ]);
	}

	public function deleteSeoUrl($seo_url_id) {
		$this->db->query("DELETE FROM `oc_seo_url` WHERE seo_url_id = :seo_url_id",
            [
                ':seo_url_id' => $seo_url_id
            ]);
	}
	
	public function getSeoUrl($seo_url_id) {
		$query = $this->db->query("SELECT * FROM `oc_seo_url` WHERE seo_url_id = :seo_url_id",
            [
                ':seo_url_id' => $seo_url_id
            ]);

		return $query->row;
	}

	public function getSeoUrls($data = array()) {
	    $args = [];
		$sql = "SELECT *, (SELECT `name` FROM `oc_store` s WHERE s.store_id = su.store_id) AS store, (SELECT `name` FROM `oc_language` l WHERE l.language_id = su.language_id) AS language FROM `oc_seo_url` su";

		$implode = [];

		if (!empty($data['filter_query'])) {
			$implode[] = "`query` LIKE :query";
            $args[':query'] = $data['filter_query'];
		}
		
		if (!empty($data['filter_keyword'])) {
			$implode[] = "`keyword` LIKE :keyword";
            $args[':keyword'] = $data['filter_keyword'];
		}
		
		if (isset($data['filter_store_id']) && $data['filter_store_id'] !== '') {
			$implode[] = "`store_id` = :store_id";
            $args[':store_id'] = $data['filter_store_id'];
		}
				
		if (!empty($data['filter_language_id']) && $data['filter_language_id'] !== '') {
			$implode[] = "`language_id` = :language_id";
            $args[':language_id'] = $data['filter_language_id'];
		}
		
		if ($implode) {
			$sql .= " WHERE " . implode(" AND ", $implode);
		}	
		
		$sort_data = array(
			'query',
			'keyword',
			'language_id',
			'store_id'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY query";
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

	public function getTotalSeoUrls($data = array()) {
	    $args = [];
		$sql = "SELECT COUNT(*) AS total FROM `oc_seo_url`";
		
		$implode = [];

		if (!empty($data['filter_query'])) {
			$implode[] = "query LIKE :query";
            $args[':query'] = $data['filter_query'];
		}
		
		if (!empty($data['filter_keyword'])) {
			$implode[] = "keyword LIKE :keyword";
            $args[':keyword'] = $data['filter_keyword'];
		}
		
		if (!empty($data['filter_store_id']) && $data['filter_store_id'] !== '') {
			$implode[] = "store_id = :store_id";
            $args[':store_id'] = $data['filter_store_id'];
		}
				
		if (!empty($data['filter_language_id']) && $data['filter_language_id'] !== '') {
			$implode[] = "language_id = :language_id";
            $args[':language_id'] = $data['filter_language_id'];
		}
		
		if ($implode) {
			$sql .= " WHERE " . implode(" AND ", $implode);
		}		
		
		$query = $this->db->query($sql, $args);

		return $query->row['total'];
	}
	
	public function getSeoUrlsByKeyword($keyword) {
		$query = $this->db->query("SELECT * FROM `oc_seo_url` WHERE keyword = :keyword",
            [
                ':keyword' => $keyword
            ]);

		return $query->rows;
	}	
	
	public function getSeoUrlsByQuery($keyword) {
	    //LJK TODO: This is the same exact query as getSeoUrlsByKeyword (above) - either its not implemented  in the front end,
        // or its returning the wrong results
        $query = $this->db->query("SELECT * FROM `oc_seo_url` WHERE keyword = :keyword",
            [
                ':keyword' => $keyword
            ]);

        return $query->rows;
	}	
}