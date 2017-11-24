<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ModelDesignThemeAdmin extends Model {
	public function editTheme($store_id, $theme, $route, $code) {
		// LJK TODO: What is code for?
	    $this->db->query("DELETE FROM `oc_theme` WHERE store_id = :store_id AND theme = :theme AND route = :route",
            [
                ':store_id' => $store_id,
                ':theme' => $theme,
                ':route' => $route,
            ]);
		
		$this->db->query("INSERT INTO `oc_theme` SET store_id = :store_id, theme = :theme, route = :route, code = :code",
            [
                ':store_id' => $store_id,
                ':theme' => $theme,
                ':route' => $route,
                ':code' => $code
            ]);
	}

	public function deleteTheme($theme_id) {
		$this->db->query("DELETE FROM `oc_theme` WHERE theme_id = :theme_id",
            [
                ':theme_id' => $theme_id
            ]);
	}

	public function getTheme($store_id, $theme, $route) {
		$query = $this->db->query("SELECT * FROM `oc_theme` WHERE store_id = :store_id AND theme = :theme AND route = :route",
            [
                ':store_id' => $store_id,
                ':theme' => $theme,
                ':route' => $route,
            ]);

		return $query->row;
	}
	
	public function getThemes($start = 0, $limit = 10) {
		if ($start < 0) {
			$start = 0;
		}

		if ($limit < 1) {
			$limit = 10;
		}		
		
		$query = $this->db->query("SELECT *, (SELECT name FROM `oc_store` s WHERE s.store_id = t.store_id) AS store FROM `oc_theme` t ORDER BY t.date_added DESC LIMIT " . (int)$start . "," . (int)$limit);

		return $query->rows;
	}	
	
	public function getTotalThemes() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `oc_theme`");

		return $query->row['total'];
	}	
}