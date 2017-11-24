<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ModelDesignLayout extends Model {
	public function getLayout($route) {
		$query = $this->db->query("SELECT * FROM oc_layout_route WHERE :route LIKE route AND store_id = :store_id ORDER BY route DESC LIMIT 1",
            [
                ':route' => $route,
                ':store_id' => $this->config->get('config_store_id')
            ]);

		if ($query->num_rows) {
			return (int)$query->row['layout_id'];
		} else {
			return 0;
		}
	}
	
	public function getLayoutModules($layout_id, $position) {
		$query = $this->db->query("SELECT * FROM oc_layout_module WHERE layout_id = :layout_id AND position = :position ORDER BY sort_order",
            [
                ':layout_id' => $layout_id,
                ':position' => $position
            ]);
		
		return $query->rows;
	}
}