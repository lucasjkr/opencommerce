<?php
class ModelDesignBannerAdmin extends Model {
	public function addBanner($data) {
		$this->db->query("INSERT INTO oc_banner SET name = :name, status = :status",
            [
                ':name' => $data['name'],
                ':status' => $data['status'],
            ]);

		$banner_id = $this->db->getLastId();

		if (isset($data['banner_image'])) {
			foreach ($data['banner_image'] as $language_id => $value) {
				foreach ($value as $banner_image) {
					$this->db->query("INSERT INTO oc_banner_image SET banner_id = :banner_id, language_id = :language_id, title = :title, link = :link, image = :image, sort_order = :sort_order",
                        [
                            ':banner_id' => $banner_id,
                            ':language_id' => $language_id,
                            ':title' => $banner_image['title'],
                            ':link' => $banner_image['link'],
                            ':image' => $banner_image['image'],
                            ':sort_order' => $banner_image['sort_order']
                        ]);
				}
			}
		}

		return $banner_id;
	}

	public function editBanner($banner_id, $data) {
		$this->db->query("UPDATE oc_banner SET name = :name, status = :status WHERE banner_id = :banner_id",
            [
                ':name' => $data['name'],
                ':status' => $data['status'],
                ':banner_id' => $banner_id
            ]);

		$this->db->query("DELETE FROM oc_banner_image WHERE banner_id = :banner_id",
            [
                ':banner_id' => $banner_id
            ]);

		if (isset($data['banner_image'])) {
			foreach ($data['banner_image'] as $language_id => $value) {
				foreach ($value as $banner_image) {
					$this->db->query("INSERT INTO oc_banner_image SET banner_id = :banner_id, language_id = :language_id, title = :title, link = :link, image = :image, sort_order = :sort_order".
                    [
                        ':banner_id' => $banner_id,
                        ':language_id' => $language_id,
                        ':title' => $banner_image['title'],
                        ':link' => $banner_image['link'],
                        ':image' => $banner_image['image'],
                        ':sort_order' => $banner_image['sort_order']
                    ]);
				}
			}
		}
	}

	public function deleteBanner($banner_id) {
		$this->db->query("DELETE FROM oc_banner WHERE banner_id = :banner_id",
            [
                ':banner_id' => $banner_id
            ]);
		$this->db->query("DELETE FROM oc_banner_image WHERE banner_id = :banner_id",
            [
                ':banner_id' => $banner_id
            ]);
	}

	public function getBanner($banner_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM oc_banner WHERE banner_id = :banner_id",
            [
                ':banner_id' => $banner_id
            ]);

		return $query->row;
	}

	public function getBanners($data = []) {
		$sql = "SELECT * FROM oc_banner";

		$sort_data = [
			'name',
			'status'
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

	public function getBannerImages($banner_id) {
		$banner_image_data = [];

		$banner_image_query = $this->db->query("SELECT * FROM oc_banner_image WHERE banner_id = :banner_id ORDER BY sort_order ASC",
            [
                ':banner_id' => $banner_id
            ]);

		foreach ($banner_image_query->rows as $banner_image) {
			$banner_image_data[$banner_image['language_id']][] = [
				'title'      => $banner_image['title'],
				'link'       => $banner_image['link'],
				'image'      => $banner_image['image'],
				'sort_order' => $banner_image['sort_order']
			];
		}

		return $banner_image_data;
	}

	public function getTotalBanners() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_banner");

		return $query->row['total'];
	}
}
