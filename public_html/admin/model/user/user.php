<?php
class ModelUserUser extends Model {
	public function addUser($data) {
        $data['password'] = password_hash($data['password'], PASSWORD_DEFAULT);
		$this->db->query("INSERT INTO `oc_user` SET `user_group_id` = ?, `password` = ?, firstname = ?, lastname = ?, email = ?, image = ?, status = ?",
            [$data['user_group_id'], $data['password'], $data['firstname'], $data['lastname'], $data['email'], $data['image'], $data['status']]);
	
		return $this->db->getLastId();
	}

	public function editUser($user_id, $data) {
		$this->db->query("UPDATE `oc_user` SET user_group_id = ?, firstname = ?, lastname = ?, email = ?, image = ?, status = ? WHERE user_id = ?",
            [ $data['user_group_id'], $data['firstname'], $data['lastname'], $data['email'], $data['image'], $data['status'], $user_id ]);

		if ($data['password']) {
		    $data['password'] = password_hash($data['password'], PASSWORD_DEFAULT);
			$this->db->query("UPDATE `oc_user` SET `password` = :password WHERE user_id = :user_id",
               [
                   ':password' => $data['password'],
                   ':user_id' => $user_id,
               ]
            );
		}
	}

	public function editPassword($user_id, $password) {
		$this->db->query("UPDATE `oc_user` SET `password` = ? WHERE user_id = ?",
            [password_hash($password, PASSWORD_DEFAULT), $user_id ]);
	}

	public function editCode($email, $code) {
		$this->db->query("UPDATE `oc_user` SET `code` = ? WHERE LCASE(email) = ?",
            [$code, $email]
        );
	}

	public function deleteUser($user_id) {
		$this->db->query("DELETE FROM `oc_user` WHERE `user_id` = ?",
            [$user_id]
        );
	}

	public function getUser($user_id) {
		$query = $this->db->query("SELECT *, (SELECT ug.name FROM `oc_user_group` ug WHERE ug.user_group_id = u.user_group_id) AS user_group FROM `oc_user` u WHERE u.user_id = ?",
            [ $user_id ]
        );

		return $query->row;
	}

	public function getUserByUsername($email) {
		$query = $this->db->query("SELECT * FROM `oc_user` WHERE `email` = ?",
            [ $email ]);

		return $query->row;
	}

	public function getUserByEmail($email) {
		$query = $this->db->query("SELECT DISTINCT * FROM `oc_user` WHERE LCASE(email) = ?",
            [utf8_strtolower($email)]
        );

		return $query->row;
	}

	public function getUserByCode($code) {
		$query = $this->db->query("SELECT * FROM `oc_user` WHERE code = ? AND code != ''",
            [$code]
        );

		return $query->row;
	}

	public function getUsers($data = array()) {
		$sql = "SELECT * FROM `oc_user`";

		$sort_data = array(
			'email',
			'status',
			'date_added'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY email";
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

	public function getTotalUsers() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `oc_user`");

		return $query->row['total'];
	}

	public function getTotalUsersByGroupId($user_group_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `oc_user` WHERE user_group_id = ?",
            [$user_group_id ]
        );

		return $query->row['total'];
	}

	public function getTotalUsersByEmail($email) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `oc_user` WHERE LCASE(email) = ?",
            [ utf8_strtolower($email) ]
        );

		return $query->row['total'];
	}
}
