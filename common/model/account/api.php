<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ModelAccountApi extends Model {
	public function login($username, $key) {
		$query = $this->db->query("SELECT * FROM `oc_api` WHERE `username` = :username AND `key` = :key AND status = '1'",
            [
                ':username' => $username,
                ':key' => $key
            ]);

		return $query->row;
	}

	public function addApiSession($api_id, $session_id, $ip) {
		$this->db->query("INSERT INTO `oc_api_session` SET api_id = :api_id, session_id = :session_id, ip = :ip",
            [
                ':api_id' => $api_id,
                ':sesion_id' => $session_id,
                ':ip' => $ip
            ]);

		return $this->db->getLastId();
	}

	public function getApiIps($api_id) {
		$query = $this->db->query("SELECT * FROM `oc_api_ip` WHERE api_id = :api_id",
            [
                ':api_id' => $api_id
            ]);

		return $query->rows;
	}
}
