<?php
class ModelDesignBanner extends Model {
	public function getBanner($banner_id) {
		$query = $this->db->query("SELECT * FROM oc_banner b LEFT JOIN oc_banner_image bi ON (b.banner_id = bi.banner_id) WHERE b.banner_id = :banner_id AND b.status = '1' AND bi.language_id = :language_id ORDER BY bi.sort_order ASC",
            [
                ':banner_id' => $banner_id,
                ':status' => 1,
                ':language_id' => $this->config->get('config_language_id')
            ]);
		return $query->rows;
	}
}
