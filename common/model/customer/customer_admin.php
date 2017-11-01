<?php
class ModelCustomerCustomerAdmin extends Model {
	public function addCustomer($data) {
		$this->db->query("INSERT INTO `oc_customer` SET `customer_group_id` = :customer_group_id, `firstname` = :firstname, `lastname` = :lastname, `email` = :email, `telephone` = :telephone, `custom_field` = :custom_field, `newsletter` = :newsletter, `password` = :password, `status` = :status, `safe` = :safe",
            [
                ':customer_group_id' => $data['customer_group_id'],
                ':firstname' => $data['firstname'],
                ':lastname' => $data['lastname'],
                ':email' => $data['email'],
                ':telephone' => $data['telephone'],
                ':custom_field' => isset($data['custom_field']) ? json_encode($data['custom_field']) : json_encode([]),
                ':newsletter' => $data['newsletter'],
                ':password' => password_hash($data['password'], PASSWORD_DEFAULT),
                ':status' => $data['status'],
                ':safe' => $data['safe']
            ]);

		$customer_id = $this->db->getLastId();

		if (isset($data['address'])) {
			foreach ($data['address'] as $address) {
				$this->db->query("INSERT INTO `oc_address` SET `customer_id` = :customer_id, `firstname` = :firstname, `lastname` = :lastname, company = :company, address_1 = :address_1, address_2 = address_2, city = :city, postcode = :postcode, country_id = :country_id, zone_id = :zone_id, custom_field = :custom_field",
                    [
                        ':customer_id' => $customer_id,
                        ':firstname' => $address['firstname'],
                        ':lastname' => $address['lastname'],
                        ':company' => $address['company'],
                        ':address_1' => $address['address_1'],
                        ':address_2' => $address['address_2'],
                        ':city' => $address['city'],
                        ':postcode' => $address['postcode'],
                        ':country_id' => $address['country_id'],
                        ':zone_id' => $address['zone_id'],
                        ':custom_field' => isset($address['custom_field']) ? json_encode($address['custom_field']) : json_encode([])
                    ]);

                // LJK TODO: storing address_id in customers didn't seem correct, but now that I see that its the default address, it seems OK
                // LJK TODO: However, I still think that there should just be a default address column in the address table, or default_billing and default_shipping columns.
				if (isset($address['default'])) {
					$address_id = $this->db->getLastId();

					$this->db->query("UPDATE oc_customer SET address_id = :address_id WHERE customer_id = :customer_id",
                        [
                            ':address_id' => $address_id,
                            ':customer_id' => $customer_id
                        ]);
				}
			}
		}

		return $customer_id;
	}

	public function editCustomer($customer_id, $data) {
		$this->db->query("UPDATE `oc_customer` SET `customer_group_id` = :customer_group_id, `firstname` = :firstname, `lastname` = :lastname, `email` = :email, `telephone` = :telephone, `custom_field` = :custom_field, `newsletter` = :newsletter, status = :status, safe = :safe WHERE customer_id = :customer_id",
            [
                ':customer_group_id' => $data['customer_group_id'],
                ':firstname' => $data['firstname'],
                ':lastname' => $data['lastname'],
                ':email' => $data['email'],
                ':telephone' => $data['telephone'],
                ':custom_field' => isset($data['custom_field']) ? json_encode($data['custom_field']) : json_encode([]),
                ':newsletter' => $data['newsletter'],
                ':status' => $data['status'],
                ':safe' => $data['safe'],
                ':customer_id' => $customer_id
            ]);

		if ($data['password']) {
			$this->db->query("UPDATE `oc_customer` SET `password` = :password WHERE `customer_id` = :customer_id",
                [
                    ':password' => password_hash($data['password'], PASSWORD_DEFAULT),
                    ':customer_id' => $customer_id
                ]);
		}

		$this->db->query("DELETE FROM oc_address WHERE customer_id = :customer_id",
            [
                ':customer_id' => $customer_id
            ]);

		if (isset($data['address'])) {
			foreach ($data['address'] as $address) {
			    // LJK TODO: Not sure if address_id is needed to be set here
				$this->db->query("INSERT INTO oc_address SET customer_id = :customer_id, firstname = :firstname , lastname = :lastname, company = :company, address_1 = :address_1, address_2 = :address_2, city = :city, postcode = :postcode, country_id = :country_id, zone_id = :zone_id, custom_field = :custom_field",
                    [
                        ':customer_id' => $customer_id,
                        ':firstname' => $address['firstname'],
                        ':lastname' => $address['lastname'],
                        ':company' => $address['company'],
                        ':address_1' => $address['address_1'],
                        ':address_2' => $address['address_2'],
                        ':city' => $address['city'],
                        ':postcode' => $address['postcode'],
                        ':country_id' => $address['country_id'],
                        ':zone_id' => $address['zone_id'],
                        ':custom_field' => isset($address['custom_field']) ? json_encode($address['custom_field']) : json_encode([])
                    ]);
				if (isset($address['default'])) {
					$address_id = $this->db->getLastId();

					$this->db->query("UPDATE oc_customer SET address_id = :address_id WHERE customer_id = :customer_id",
                        [
                            ':address_id' => $address_id,
                            ':customer_id' => $customer_id
                        ]);
				}
			}
		}
	}

	public function editToken($customer_id, $token) {
		$this->db->query("UPDATE oc_customer SET token = :token WHERE customer_id = :customer_id",
            [
                ':token' => $token,
                ':customer_id' => $customer_id
            ]);
	}

	public function deleteCustomer($customer_id) {
		$this->db->query("DELETE FROM oc_customer WHERE customer_id = :customer_id",
        [
            ':customer_id' => $customer_id
        ]);
		$this->db->query("DELETE FROM oc_customer_activity WHERE customer_id = :customer_id",
        [
            ':customer_id' => $customer_id
        ]);
		$this->db->query("DELETE FROM oc_customer_approval WHERE customer_id = :customer_id",
        [
            ':customer_id' => $customer_id
        ]);
		$this->db->query("DELETE FROM oc_customer_transaction WHERE customer_id = :customer_id",
        [
            ':customer_id' => $customer_id
        ]);
		$this->db->query("DELETE FROM oc_customer_ip WHERE customer_id = :customer_id",
        [
            ':customer_id' => $customer_id
        ]);
		$this->db->query("DELETE FROM oc_address WHERE customer_id = :customer_id",
        [
            ':customer_id' => $customer_id
        ]);
	}

	public function getCustomer($customer_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM oc_customer WHERE customer_id = :customer_id",
        [
            ':customer_id' => $customer_id
        ]);

		return $query->row;
	}

	public function getCustomerByEmail($email) {
		$query = $this->db->query("SELECT DISTINCT * FROM oc_customer WHERE LCASE(email) = :email",
            [
                ':email' => utf8_strtolower($email)
            ]);

		return $query->row;
	}
	
	public function getCustomers($data = []) {
		$sql = "SELECT *, CONCAT(c.firstname, ' ', c.lastname) AS name, cgd.name AS customer_group FROM oc_customer c LEFT JOIN oc_customer_group_description cgd ON (c.customer_group_id = cgd.customer_group_id) WHERE cgd.language_id = :language_id";

        $args[':language_id'] = $this->config->get('config_language_id');

		if (!empty($data['filter_name'])) {
			$sql .= " AND CONCAT(c.firstname, ' ', c.lastname) LIKE :name";
            $args[':name'] = '%' . $data['filter_name'] . '%';
		}

		if (!empty($data['filter_email'])) {
			$sql .= " AND c.email LIKE :email";
            $args[':email'] = $data['filter_email'] . '%';
		}

		if (isset($data['filter_newsletter']) && !is_null($data['filter_newsletter'])) {
			$sql .= " AND c.newsletter = :newsletter";
            $args[':newsletter'] = $data['filter_newsletter'];
		}

		if (!empty($data['filter_customer_group_id'])) {
			$sql .= " AND c.customer_group_id = :customer_group_id";
            $args[':customer_group_id'] = $data['filter_customer_group_id'];
		}
		
		if (!empty($data['filter_ip'])) {
			$sql .= " AND c.customer_id IN (SELECT customer_id FROM oc_customer_ip WHERE ip = :ip)";
            $args[':ip'] = $data['filter_ip'];
		}

		if (isset($data['filter_status']) && $data['filter_status'] !== '') {
			$sql .= " AND c.status = :status";
            $args[':status'] = $data['filter_status'];
		}

		if (!empty($data['filter_date_added'])) {
			$sql .= " AND DATE(c.date_added) = DATE(:date_added)";
            $args[':date_added'] = $data['filter_date_added'];
		}

		$sort_data = [
			'name',
			'c.email',
			'customer_group',
			'c.status',
			'c.ip',
			'c.date_added'
		];

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY name";
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

		$query = $this->db->query($sql, $args);

		return $query->rows;
	}

	public function getAddress($address_id) {
		$address_query = $this->db->query("SELECT * FROM oc_address WHERE address_id = :address_id",
            [
                ':address_id' => $address_id
            ]);

		if ($address_query->num_rows) {
			$country_query = $this->db->query("SELECT * FROM `oc_country` WHERE country_id = :country_id",
                [
                    ':country_id' => $address_query->row['country_id']
                ]);

			if ($country_query->num_rows) {
				$country = $country_query->row['name'];
				$iso_code_2 = $country_query->row['iso_code_2'];
				$iso_code_3 = $country_query->row['iso_code_3'];
				$address_format = $country_query->row['address_format'];
			} else {
				$country = '';
				$iso_code_2 = '';
				$iso_code_3 = '';
				$address_format = '';
			}

			$zone_query = $this->db->query("SELECT * FROM `oc_zone` WHERE zone_id = :zone_id",
                [
                    ':zone_id' => $address_query->row['zone_id']
                ]);

			if ($zone_query->num_rows) {
				$zone = $zone_query->row['name'];
				$zone_code = $zone_query->row['code'];
			} else {
				$zone = '';
				$zone_code = '';
			}

			return [
				'address_id'     => $address_query->row['address_id'],
				'customer_id'    => $address_query->row['customer_id'],
				'firstname'      => $address_query->row['firstname'],
				'lastname'       => $address_query->row['lastname'],
				'company'        => $address_query->row['company'],
				'address_1'      => $address_query->row['address_1'],
				'address_2'      => $address_query->row['address_2'],
				'postcode'       => $address_query->row['postcode'],
				'city'           => $address_query->row['city'],
				'zone_id'        => $address_query->row['zone_id'],
				'zone'           => $zone,
				'zone_code'      => $zone_code,
				'country_id'     => $address_query->row['country_id'],
				'country'        => $country,
				'iso_code_2'     => $iso_code_2,
				'iso_code_3'     => $iso_code_3,
				'address_format' => $address_format,
				'custom_field'   => json_decode($address_query->row['custom_field'], true)
            ];
		}
	}

	public function getAddresses($customer_id) {
		$address_data = [];

		$query = $this->db->query("SELECT address_id FROM oc_address WHERE customer_id = :customer_id",
            [
                ':customer_id' => $customer_id
            ]);

		foreach ($query->rows as $result) {
			$address_info = $this->getAddress($result['address_id']);

			if ($address_info) {
				$address_data[$result['address_id']] = $address_info;
			}
		}

		return $address_data;
	}

	public function getTotalCustomers($data = []) {
	    $args = [];
		$sql = "SELECT COUNT(*) AS total FROM oc_customer";

		$implode = [];

		if (!empty($data['filter_name'])) {
			$implode[] = "CONCAT(firstname, ' ', lastname) LIKE :name";
            $args[':name'] = '%' . $data['filter_name']. '%';
		}

		if (!empty($data['filter_email'])) {
			$implode[] = "email LIKE :email";
		    $args[':email'] = $data['filter_email'] . '%';
		}

		if (isset($data['filter_newsletter']) && !is_null($data['filter_newsletter'])) {
			$implode[] = "newsletter = :newsletter";
            $args[':newsletter'] = $data['filter_newsletter'];
		}

		if (!empty($data['filter_customer_group_id'])) {
			$implode[] = "customer_group_id = :customer_group_id";
            $args[':customer_group_id'] = $data['filter_customer_group_id'];
		}

		if (!empty($data['filter_ip'])) {
			$implode[] = "customer_id IN (SELECT customer_id FROM oc_customer_ip WHERE ip = :ip)";
            $args[':ip'] = $data['filter_ip'];
		}

		if (isset($data['filter_status']) && $data['filter_status'] !== '') {
			$implode[] = "status = :status";
            $args[':status'] = $data['filter_status'];
		}

		if (!empty($data['filter_date_added'])) {
			$implode[] = "DATE(date_added) = DATE(:date_added)";
            $args[':date_added'] = $data['filter_date_added'];
		}

		if ($implode) {
			$sql .= " WHERE " . implode(" AND ", $implode);
		}

		$query = $this->db->query($sql, $args);

		return $query->row['total'];
	}

	public function getTotalAddressesByCustomerId($customer_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_address WHERE customer_id = :customer_group_id",
            [
                ':customer_id' => $customer_id
            ]);

		return $query->row['total'];
	}

	public function getTotalAddressesByCountryId($country_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_address WHERE country_id = :country_id",
            [
                ':country_id' => $country_id
            ]);

		return $query->row['total'];
	}

	public function getTotalAddressesByZoneId($zone_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_address WHERE zone_id = :zone_id",
            [
                ':zone_id' => $zone_id
            ]);

		return $query->row['total'];
	}

	public function getTotalCustomersByCustomerGroupId($customer_group_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_customer WHERE customer_group_id = :customer_group_id",
            [
                ':customer_group_id' => $customer_group_id
            ]);

		return $query->row['total'];
	}

	public function addHistory($customer_id, $comment) {
		$this->db->query("INSERT INTO oc_customer_history SET customer_id = :customer_id, comment = :comment",
            [
                ':customer_id' => $customer_id,
                ':comment' => strip_tags($comment)
            ]);
	}

	public function getHistories($customer_id, $start = 0, $limit = 10) {
		if ($start < 0) {
			$start = 0;
		}

		if ($limit < 1) {
			$limit = 10;
		}

		$query = $this->db->query("SELECT comment, date_added FROM oc_customer_history WHERE customer_id = :customer_id ORDER BY date_added DESC LIMIT " . (int)$start . "," . (int)$limit,
            [
                ':customer_id' => $customer_id
            ]);

		return $query->rows;
	}

	public function getTotalHistories($customer_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_customer_history WHERE customer_id = :customer_id",
            [
                ':customer_id' => $customer_id
            ]);

		return $query->row['total'];
	}

	public function addTransaction($customer_id, $description = '', $amount = '', $order_id = 0) {
		$this->db->query("INSERT INTO oc_customer_transaction SET customer_id = :customer_id, order_id = :order_id, description = :description, amount = :amount",
            [
                ':customer_id' => $customer_id ,
                ':order_id' => $order_id ,
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

	public function getTransactions($customer_id, $start = 0, $limit = 10) {
		if ($start < 0) {
			$start = 0;
		}

		if ($limit < 1) {
			$limit = 10;
		}

		$query = $this->db->query("SELECT * FROM oc_customer_transaction WHERE customer_id = :customer_id ORDER BY date_added DESC LIMIT " . (int)$start . "," . (int)$limit,
            [
                ':customer_id' => $customer_id
            ]);

		return $query->rows;
	}


	public function getTotalTransactions($customer_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total  FROM oc_customer_transaction WHERE customer_id = :customer_id",
            [
                ':customer_id' => $customer_id
            ]);

		return $query->row['total'];
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

	public function getIps($customer_id, $start = 0, $limit = 10) {
		if ($start < 0) {
			$start = 0;
		}
		if ($limit < 1) {
			$limit = 10;
		}

		$query = $this->db->query("SELECT ip, store_id, country, date_added FROM oc_customer_ip WHERE customer_id = :customer_id ORDER BY date_added DESC LIMIT " . (int)$start . "," . (int)$limit,
            [
                ':customer_id' => $customer_id
            ]);
		
		return $query->rows;
	}

	public function getTotalIps($customer_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_customer_ip WHERE customer_id = :customer_id",
            [
                ':customer_id' => $customer_id
            ]);

		return $query->row['total'];
	}

	public function getTotalCustomersByIp($ip) {
		$query = $this->db->query("SELECT COUNT(DISTINCT customer_id) AS total FROM oc_customer_ip WHERE ip = :ip",
            [
                ':ip' => $ip
            ]);

		return $query->row['total'];
	}

	public function getTotalLoginAttempts($email) {
		$query = $this->db->query("SELECT * FROM `oc_customer_login` WHERE `email` = :email",
            [
                ':email' => utf8_strtolower($email)
            ]);

		return $query->row;
	}

	public function deleteLoginAttempts($email) {
		$this->db->query("DELETE FROM `oc_customer_login` WHERE `email` = :email",
            [
                ':email' => utf8_strtolower($email)
            ]);
	}
}
