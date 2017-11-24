<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ModelDesignTheme extends Model {
	public function getTheme($route, $theme) {
		$query = $this->db->query("SELECT * FROM oc_theme WHERE store_id = :store_id AND theme = :theme AND route = :route",
            [
                ':store_id' => $this->config->get('config_store_id'),
                ':theme' => $theme,
                ':route' => $route
            ]);

		return $query->row;
	}
}