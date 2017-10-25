<?php
namespace Cart;
class User {
	private $user_id;
	private $user_group_id;
	private $username;
    private $email;
	private $permission = [];
// TODO: LJK much refactoring throughout to cease looking for $user->['username'] and instead getting $user->['email']
// the rewrites within SHOULD be sufficient for the short term, but longer term and for consistency, we should be
// referring to field properly.
// TODO: The above can hold off until AFTER the user and customer tables are combined.
	public function __construct($registry) {
		$this->db = $registry->get('db');
		$this->request = $registry->get('request');
		$this->session = $registry->get('session');

		if (isset($this->session->data['user_id'])) {
			$user_query = $this->db->query("SELECT * FROM oc_user WHERE user_id = :user_id AND status = '1'",
                [
                    ':user_id' => $this->session->data['user_id']
                ]);

			if ($user_query->num_rows) {
				$this->user_id = $user_query->row['user_id'];
				$this->username = $user_query->row['email'];
				$this->user_group_id = $user_query->row['user_group_id'];

				$user_group_query = $this->db->query("SELECT permission FROM oc_user_group WHERE user_group_id = :user_group_id",
                    [
                        ':user_group_id' => $user_query->row['user_group_id']
                    ]);

				$permissions = json_decode($user_group_query->row['permission'], true);

				if (is_array($permissions)) {
					foreach ($permissions as $key => $value) {
						$this->permission[$key] = $value;
					}
				}
			} else {
				$this->logout();
			}
		}
	}

	public function login($email, $password) {
		$user_query = $this->db->query("SELECT * FROM oc_user WHERE email = :email AND status = '1'",
            [
                ':email' => $email
            ]);

        if ($user_query->num_rows) {
            if (password_verify($password, $user_query->row['password'])) {
                $this->session->data['user_id'] = $user_query->row['user_id'];
                $this->user_id = $user_query->row['user_id'];
                $this->username = $user_query->row['email'];
                $this->user_group_id = $user_query->row['user_group_id'];

                // Check password hash strength, re-hash if necessary
                if (password_needs_rehash($user_query->row['password'], PASSWORD_DEFAULT)) {
                    $this->db->query("UPDATE oc_user SET password = :password WHERE user_id = :user_id",
                        [
                            ':password' => password_hash($password, PASSWORD_DEFAULT),
                            ':user_id' => $this->user_id
                        ]);
                }

                $user_group_query = $this->db->query("SELECT permission FROM oc_user_group WHERE user_group_id = :user_group_id",
                    [
                        ':user_group_id' => $user_query->row['user_group_id']
                    ]);

                $permissions = json_decode($user_group_query->row['permission'], true);

                if (is_array($permissions)) {
                    foreach ($permissions as $key => $value) {
                        $this->permission[$key] = $value;
                    }
                }
                return true;
            }
        } else {
            return false;
        }
    }

	public function logout() {
		unset($this->session->data['user_id']);

		$this->user_id = '';
		$this->email = '';
	}

	public function hasPermission($key, $value) {
		if (isset($this->permission[$key])) {
			return in_array($value, $this->permission[$key]);
		} else {
			return false;
		}
	}

	public function isLogged() {
		return $this->user_id;
	}

	public function getId() {
		return $this->user_id;
	}

	public function getUserName() {
		return $this->email;
	}

    public function getEmail() {
        return $this->email;
    }

	public function getGroupId() {
		return $this->user_group_id;
	}
}
