<?php
class ModelDesignTranslation extends Model {
	public function getTranslations($route) {
		$language_code = !empty($this->session->data['language']) ? $this->session->data['language'] : $this->config->get('config_language');
		
		$query = $this->db->query("SELECT * FROM oc_translation WHERE store_id = :store_id AND language_id = :language_id AND (route = :route_1 OR route = :route_2)",
            [
                ':store_id' => $this->config->get('config_store_id'),
                ':language_id' => $this->config->get('config_language_id'),
                ':route_1' => $route,
                ':route_2' => $language_code
            ]);

		return $query->rows;
	}
}
