<?php
class ModelUserUserGroupAdmin extends Model {
	public function addUserGroup($data) {
		$this->db->query("INSERT INTO `oc_user_group` SET `name` = :name, `permission` = :permission",
            [
                ':name' => $data['name'],
                ':permission' => isset($data['permission']) ? json_encode($data['permission']) : ''
            ]);
	
		return $this->db->getLastId();
	}

	public function editUserGroup($user_group_id, $data) {
		$this->db->query("UPDATE `oc_user_group` SET `name` = :name, `permission` = :permission WHERE `user_group_id` = :user_group_id",
            [
                ':name' => $data['name'],
                ':permission' => isset($data['permission']) ? json_encode($data['permission']) : '',
                ':user_group_id' => $user_group_id
            ]);
	}

	public function deleteUserGroup($user_group_id) {
		$this->db->query("DELETE FROM `oc_user_group` WHERE `user_group_id` = :user_group_id",
            [
                ':user_group_id' => $user_group_id
            ]);
	}

	public function getUserGroup($user_group_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM `oc_user_group` WHERE `user_group_id` = :user_group_id",
            [
                ':user_group_id' => $user_group_id
            ]);

		$user_group = array(
			'name'       => $query->row['name'],
			'permission' => json_decode($query->row['permission'], true)
		);

		return $user_group;
	}

	public function getUserGroups($data = []) {
		$sql = "SELECT * FROM `oc_user_group`";

		$sql .= " ORDER BY name";

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

	public function getTotalUserGroups() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `oc_user_group`");

		return $query->row['total'];
	}

	public function addPermission($user_group_id, $type, $route) {
		$user_group_query = $this->db->query("SELECT DISTINCT * FROM `oc_user_group` WHERE `user_group_id` = :user_group_id",
            [
                ':user_group_id' => $user_group_id
            ]);

		if ($user_group_query->num_rows) {
			$data = json_decode($user_group_query->row['permission'], true);

			$data[$type][] = $route;

			$this->db->query("UPDATE `oc_user_group` SET `permission` = :permission WHERE `user_group_id` = :user_group_id",
                [
                    ':permission' => json_encode($data),
                    ':user_group_id' => $user_group_id
                ]);
		}
	}

	public function removePermission($user_group_id, $type, $route) {
		$user_group_query = $this->db->query("SELECT DISTINCT * FROM `oc_user_group` WHERE `user_group_id` = :user_group_id",
            [
                ':user_group_id' => $user_group_id
            ]);

		if ($user_group_query->num_rows) {
			$data = json_decode($user_group_query->row['permission'], true);

			$data[$type] = array_diff($data[$type], array($route));

			$this->db->query("UPDATE `oc_user_group` SET `permission` = :permission WHERE `user_group_id` = :user_group_id",
                [
                    ':permission' => json_encode($data),
                    ':user_group_id' => $user_group_id
                ]);
		}
	}
}