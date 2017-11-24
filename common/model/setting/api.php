<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ModelSettingApi extends Model {
	public function login($username, $key) {
		$query = $this->db->query("SELECT * FROM oc_api a LEFT JOIN oc_api_ip `ai` ON (a.api_id = ai.api_id) WHERE a.username = :username AND a.key = :key",
            [
                ':username' => $username,
                ':key' => $key
            ]);

		return $query->row;
	}
}