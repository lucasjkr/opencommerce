<?php
class ModelAccountCustomer extends Model {
	public function addCustomer($data) {
		if (isset($data['customer_group_id']) && is_array($this->config->get('config_customer_group_display')) && in_array($data['customer_group_id'], $this->config->get('config_customer_group_display'))) {
			$customer_group_id = $data['customer_group_id'];
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}

		$this->load->model('account/customer_group');

		$customer_group_info = $this->model_account_customer_group->getCustomerGroup($customer_group_id);

		$this->db->query("INSERT INTO `oc_customer` SET `customer_group_id` = :customer_group_id, `store_id` = :store_id, `language_id` = :language_id, `firstname` = :firstname, `lastname` = :lastname, `email` = :email, `telephone` = :telephone, `password` = :password, `custom_field` = :custom_field, `newsletter` = :newsletter, `ip` = :ip, status = :status",
            [
                ':customer_group_id' => $customer_group_id,
                ':store_id' => $this->config->get('config_store_id'),
                ':language_id' => $this->config->get('config_language_id'),
                ':firstname' => $data['firstname'],
                ':lastname' => $data['lastname'],
                ':email' => mb_strtolower($data['email'], 'UTF-8'),
                ':telephone' => $data['telephone'],
                ':custom_field' => isset($data['custom_field']['account']) ? json_encode($data['custom_field']['account']) : '',
                ':password' => password_hash($data['password'], PASSWORD_DEFAULT),
                ':newsletter' => isset($data['newsletter']) ? (int)$data['newsletter'] : 0,
                ':ip' => $this->request->server['REMOTE_ADDR'],
                ':status' => $customer_group_info['approval']
            ]);

		$customer_id = $this->db->getLastId();

		if ($customer_group_info['approval']) {
			$this->db->query("INSERT INTO `oc_customer_approval` SET `customer_id` = :customer_id, `type` = :type",
                [
                    ':customer_id' => $customer_id,
                    ':type' => 'customer'
                ]);
		}

		return $customer_id;
	}

	public function editCustomer($customer_id, $data) {
		$this->db->query("UPDATE `oc_customer` SET `firstname` = :firstname, `lastname` = :lastname, `email` = :email, `telephone` = :telephone, custom_field = :custom_field WHERE customer_id = :customer_id ",
            [
                ':firstname' => $data['firstname'],
                ':lastname' => $data['lastname'],
                ':email' => $data['email'],
                ':telephone' => $data['telephone'],
                ':custom_field' => isset($data['custom_field']['account']) ? json_encode($data['custom_field']['account']) : '',
                ':customer_id' => $customer_id
            ]);
	}

	public function editPassword($email, $password) {
		$this->db->query("UPDATE `oc_customer` SET `password` = :password, `code` = :code WHERE `email` = :email",
            [
                ':password' => password_hash($password, PASSWORD_DEFAULT),
                ':code' => '',
                ':email' => utf8_strtolower($email),
            ]);
	}

	public function editAddressId($customer_id, $address_id) {
		$this->db->query("UPDATE oc_customer SET address_id = :address_id WHERE customer_id = :customer_id",
            [
                ':address_id' => $address_id,
                ':customer_id' => $customer_id,
            ]);
	}

	public function editCode($email, $code) {
		$this->db->query("UPDATE `oc_customer` SET `code` = :code WHERE `email` = :email",
            [
                ':code' => $code,
                ':email' => utf8_strtolower($email)
            ]);
	}

	public function editToken($email, $token) {
		$this->db->query("UPDATE `oc_customer` SET `token` = :token WHERE `email` = :email",
            [
                ':token' => $token,
                ':email' => utf8_strtolower($email)
            ]);
	}

	public function editNewsletter($newsletter) {
		$this->db->query("UPDATE oc_customer SET newsletter = :newsletter WHERE customer_id = :customer_id",
            [
                ':newsletter' => $newsletter,
                ':customer_id' => $this->customer->getId()
            ]);
	}

	public function getCustomer($customer_id) {
		$query = $this->db->query("SELECT * FROM oc_customer WHERE customer_id = :customer_id",
            [
                ':customer_id' => $customer_id
            ]);

		return $query->row;
	}

	public function getCustomerByEmail($email) {
		$query = $this->db->query("SELECT * FROM oc_customer WHERE email = :email",
            [
                ':email' => utf8_strtolower($email)
            ]);

		return $query->row;
	}

	public function getCustomerByCode($code) {
		$query = $this->db->query("SELECT * FROM `oc_customer` WHERE code = :code_1 AND code != :code_2",
            [
                ':code_1' => $code,
                ':code_2' => ''
            ]);

		return $query->row;
	}

	public function getCustomerByToken($token) {
	    // LJK TODO: Is this even making a selction?
		$query = $this->db->query("SELECT * FROM oc_customer WHERE token = :token AND token != :token",
            [
                ':token_1' => $token,
                ':token_2' => ''
            ]);

        // LJK TODO isn't this nullifying the token? Need to look at this more
		$this->db->query("UPDATE oc_customer SET token = ''");

		return $query->row;
	}

	public function getTotalCustomersByEmail($email) {
	    // LJK TODO the premis of this function is flawed - there shouldnt' BE duplicate customers and emails
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_customer WHERE email = :email",
            [
                ':email' => utf8_strtolower($email)
            ]);

		return $query->row['total'];
	}

	public function addTransaction($customer_id, $description, $amount = '', $order_id = 0) {
		// LJK TODO - Why do we need this - we have an orders table to keep track of this
	    $this->db->query("INSERT INTO oc_customer_transaction SET customer_id = :customer_id, order_id = :order_id , description = :description , amount = :amount",
            [
                ':customer_id' => $customer_id,
                ':order_id' => $order_id,
                ':description' => $description,
                ':amount' => $amount
            ]);
	}

	public function deleteTransactionByOrderId($order_id) {
		$this->db->query("DELETE FROM oc_customer_transaction WHERE order_id = :order_id",
            [
                ':order_id' => $order_id
            ]);
	}

	public function getTransactionTotal($customer_id) {
		$query = $this->db->query("SELECT SUM(amount) AS total FROM oc_customer_transaction WHERE customer_id = :customer_id",
            [
                ':customer_id' => $customer_id
            ]);

		return $query->row['total'];
	}

	public function getTotalTransactionsByOrderId($order_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_customer_transaction WHERE order_id = :order_id",
            [
                ':order_id' => $order_id
            ]);

		return $query->row['total'];
	}

	public function getIps($customer_id) {
		$query = $this->db->query("SELECT * FROM `oc_customer_ip` WHERE customer_id = :customer_id",
            [
                ':customer_id' => $customer_id
            ]);

		return $query->rows;
	}

	public function addLogin($customer_id, $ip, $country = '') {
		$this->db->query("INSERT INTO oc_customer_ip SET customer_id = :customer_id, store_id = :store_id, ip = :ip, country = :country",
            [
                ':customer_id' => $customer_id,
                ':store_id' => $this->config->get('config_store_id'),
                ':ip' => $ip,
                ':country' => $country
            ]);
	}

	public function addLoginAttempt($email) {
		$query = $this->db->query("SELECT * FROM oc_customer_login WHERE email = :email AND ip = :ip",
            [
                ':email' => utf8_strtolower($email),
                ':ip' => $this->request->server['REMOTE_ADDR']
            ]);

		if (!$query->num_rows) {
			$this->db->query("INSERT INTO oc_customer_login SET email = :email, ip = :ip, total = 1",
                [
                    ':email' => utf8_strtolower($email),
                    ':ip' => $this->request->server['REMOTE_ADDR'],

                ]);
		} else {
			$this->db->query("UPDATE oc_customer_login SET total = (total + 1) WHERE customer_login_id = :customer_login_id",
                [
                    ':customer_login_id' => $query->row['customer_login_id']
                ]);
		}
	}

	public function getLoginAttempts($email) {
		$query = $this->db->query("SELECT * FROM `oc_customer_login` WHERE email = :email",
            [
                ':email' => utf8_strtolower($email)
            ]);

		return $query->row;
	}

	public function deleteLoginAttempts($email) {
		$this->db->query("DELETE FROM `oc_customer_login` WHERE email = :email",
            [
                ':email' => utf8_strtolower($email)
            ]);
	}
}
