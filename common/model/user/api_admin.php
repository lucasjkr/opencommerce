<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ModelUserApiAdmin extends Model {
	public function addApi($data) {
		$this->db->query("INSERT INTO `oc_api` SET username = :username, `key` = :key, status = :status",
            [
                ':username' => $data['username'],
                ':key' => $data['key'],
                ':status' => $data['status']
            ]);

		$api_id = $this->db->getLastId();

		if (isset($data['api_ip'])) {
			foreach ($data['api_ip'] as $ip) {
				if ($ip) {
					$this->db->query("INSERT INTO `oc_api_ip` SET api_id = :api_id, ip = :ip",
                        [
                            ':api_id' => $api_id,
                            ':ip' => $ip
                        ]);
				}
			}
		}
		
		return $api_id;
	}

	public function editApi($api_id, $data) {
		$this->db->query("UPDATE `oc_api` SET username = :username, `key` = :key, status = :status WHERE api_id = :api_id",
            [
                ':username' => $data['username'],
                ':key' => $data['key'],
                ':status' => $data['status'],
                ':api_id' => $api_id
            ]);

		$this->db->query("DELETE FROM oc_api_ip WHERE api_id = :api_id",
            [
                ':api_id' => $api_id
            ]);

		if (isset($data['api_ip'])) {
			foreach ($data['api_ip'] as $ip) {
				if ($ip) {
					$this->db->query("INSERT INTO `oc_api_ip` SET api_id = :api_id, ip = :ip",
                        [
                            ':api_id' => $api_id,
                            ':ip' => $ip
                        ]);
				}
			}
		}
	}

	public function deleteApi($api_id) {
		$this->db->query("DELETE FROM `oc_api` WHERE api_id = :api_id",
            [
                ':api_id' => $api_id
            ]);
	}

	public function getApi($api_id) {
		$query = $this->db->query("SELECT * FROM `oc_api` WHERE api_id =  :api_id",
            [
                ':api_id' => $api_id
            ]);

		return $query->row;
	}

	public function getApis($data = []) {
		$sql = "SELECT * FROM `oc_api`";

		$sort_data = [
			'username',
			'status',
			'date_added',
			'date_modified'
        ];

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY username";
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

	public function getTotalApis() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `oc_api`");

		return $query->row['total'];
	}

	public function addApiIp($api_id, $ip) {
		$this->db->query("INSERT INTO `oc_api_ip` SET api_id = :api_id, ip = :ip",
            [
                ':api_id' => $api_id,
                ':ip' => $ip
            ]);
	}

	public function getApiIps($api_id) {
		$query = $this->db->query("SELECT * FROM `oc_api_ip` WHERE api_id = :api_id",
            [
                ':api_id' => $api_id
            ]);

		return $query->rows;
	}

	public function addApiSession($api_id, $session_id, $ip) {
		$api_ip_query = $this->db->query("SELECT * FROM `oc_api_ip` WHERE ip = :ip",
            [
                ':ip' => $ip
            ]);
		
		if (!$api_ip_query->num_rows) {
			$this->db->query("INSERT INTO `oc_api_ip` SET api_id = :api_id, ip = :ip",
                [
                    ':api_id' => $api_id,
                    ':ip' => $ip
                ]);
		}
 		
		$this->db->query("INSERT INTO `oc_api_session` SET api_id = :api_id, session_id = :session_id, ip = :ip",
            [
                ':api_id' => $api_id,
                ':session_id' => $session_id,
                ':ip' => $ip
            ]);

		return $this->db->getLastId();
	}
	
	public function getApiSessions($api_id) {
		$query = $this->db->query("SELECT * FROM `oc_api_session` WHERE api_id = :api_id",
            [
                ':api_id' => $api_id
            ]);

		return $query->rows;
	}
	
	public function deleteApiSession($api_session_id) {
		$this->db->query("DELETE FROM `oc_api_session` WHERE api_session_id = :api_session_id",
            [
                ':api_session_id' => $api_session_id
            ]);
	}
	
	public function deleteApiSessionBySessonId($session_id) {
		$this->db->query("DELETE FROM `oc_api_session` WHERE session_id = :session_id",
            [
                ':session_id' => $session_id
            ]);
	}		
}
