<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ModelAccountAddress extends Model {
	public function addAddress($customer_id, $data) {
		$this->db->query("INSERT INTO oc_address SET customer_id = :customer_id , firstname = :firstname, lastname = :lastname, company = :company, address_1 = :address_1, address_2 = :address_2, postcode = :postcode, city = :city, zone_id = :zone_id, country_id = :country_id, custom_field = :custom_field",
            [
                ':customer_id' => $customer_id,
                ':firstname' => $data['firstname'],
                ':lastname' => $data['lastname'],
                ':company' => $data['company'],
                ':address_1' => $data['address_1'],
                ':address_2' => $data['address_2'],
                ':postcode' => $data['postcode'],
                ':city' => $data['city'],
                ':zone_id' => $data['zone_id'] ,
                ':country_id' => $data['country_id'],
                ':custom_field' => isset($data['custom_field']['address']) ? json_encode($data['custom_field']['address']) : '',
            ]);

		$address_id = $this->db->getLastId();

		if (!empty($data['default'])) {
			$this->db->query("UPDATE oc_customer SET address_id = :address_id WHERE customer_id = :customer_id",
                [
                    ':address_id' => $address_id,
                    ':customer_id' => $customer_id,
                ]);
		}

		return $address_id;
	}

	public function editAddress($address_id, $data) {
		$this->db->query("UPDATE oc_address SET firstname = :firstname, lastname = :lastname, company = :company, address_1 = :address_1, address_2 = :address_2, postcode = :postcode, city = :city, zone_id = :zone_id, country_id = :country_id, custom_field = :custom_field WHERE address_id  = :address_id AND customer_id = :customer_id",
            [
                ':firstname' => $data['firstname'],
                ':lastname' => $data['lastname'],
                ':company' => $data['company'],
                ':address_1' => $data['address_1'],
                ':address_2' => $data['address_2'],
                ':postcode' => $data['postcode'],
                ':city' => $data['city'],
                ':zone_id' => $data['zone_id'] ,
                ':country_id' => $data['country_id'],
                ':address_id' => $address_id,
                ':customer_id' => $this->customer->getId()
            ]);

		if (!empty($data['default'])) {
			$this->db->query("UPDATE oc_customer SET address_id = :address_id WHERE customer_id = :customer_id",
                [
                    ':address_id' => $address_id,
                    ':customer_id' => $this->customer->getId(),
                ]);
		}
	}

	public function deleteAddress($address_id) {
		$this->db->query("DELETE FROM oc_address WHERE address_id = :address_id AND customer_id = :customer_id",
            [
                ':address_id' => $address_id,
                ':customer_id' => $this->customer->getId(),
            ]);
	}

	public function getAddress($address_id) {
		$address_query = $this->db->query("SELECT DISTINCT * FROM oc_address WHERE address_id = :address_id AND customer_id = :customer_id",
            [
                ':address_id' => $address_id,
                ':customer_id' => $this->customer->getId(),
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

			$address_data = [
				'address_id'     => $address_query->row['address_id'],
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

			return $address_data;
		} else {
			return false;
		}
	}

	public function getAddresses() {
	    // LJK TODO: Why are we doing individual queries like this, rather than using a join?
		$address_data = [];

		$query = $this->db->query("SELECT * FROM oc_address WHERE customer_id = :customer_id",
            [
                ':customer_id' => $this->customer->getId()
            ]);

		foreach ($query->rows as $result) {
			$country_query = $this->db->query("SELECT * FROM `oc_country` WHERE country_id = :country_id",
                [
                    ':country_id' => $result['country_id']
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
                    ':zone_id' => $result['zone_id']
                ]);

			if ($zone_query->num_rows) {
				$zone = $zone_query->row['name'];
				$zone_code = $zone_query->row['code'];
			} else {
				$zone = '';
				$zone_code = '';
			}

			$address_data[$result['address_id']] = [
				'address_id'     => $result['address_id'],
				'firstname'      => $result['firstname'],
				'lastname'       => $result['lastname'],
				'company'        => $result['company'],
				'address_1'      => $result['address_1'],
				'address_2'      => $result['address_2'],
				'postcode'       => $result['postcode'],
				'city'           => $result['city'],
				'zone_id'        => $result['zone_id'],
				'zone'           => $zone,
				'zone_code'      => $zone_code,
				'country_id'     => $result['country_id'],
				'country'        => $country,
				'iso_code_2'     => $iso_code_2,
				'iso_code_3'     => $iso_code_3,
				'address_format' => $address_format,
				'custom_field'   => json_decode($result['custom_field'], true)
			];
		}

		return $address_data;
	}

	public function getTotalAddresses() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_address WHERE customer_id = :customer_id",
            [
                ':customer_id' => $this->customer->getId()
            ]);

		return $query->row['total'];
	}
}
