<?php
class ModelCheckoutOrder extends Model {
	public function addOrder($data) {
		$this->db->query("INSERT INTO `oc_order` SET invoice_prefix = :invoice_prefix, store_id = :store_id, store_name = :store_name, 
store_url = :store_url, customer_id = :customer_id, customer_group_id = :customer_group_id, firstname = :firstname, 
lastname = :lastname, email = :email, telephone = :telephone , custom_field = :custom_field, payment_firstname = :payment_firstname, 
payment_lastname = :payment_lastname, payment_company = :payment_company, 
payment_address_1 = :payment_address_1 , payment_address_1 = :payment_address_1, 
payment_city = :payment_city, payment_postcode = :payment_postcode, 
payment_country = :payment_country, payment_country_id = :payment_country_id, 
payment_zone = :payment_zone, payment_zone_id = :payment_zone_id , 
payment_address_format = :payment_address_format, 
payment_custom_field = :payment_custom_field, 
payment_method = :payment_method, payment_code = :payment_code, 
shipping_firstname = :shipping_firstname, shipping_lastname = :shipping_lastname, 
shipping_company = :shipping_company, shipping_address_1 = :shipping_address_1, shipping_address_2 = :shipping_address_2, shipping_city = :shipping_city, 
shipping_postcode = :shipping_postcode, shipping_country = :shipping_country, shipping_country_id = :shipping_country_id, shipping_zone = :shipping_zone , 
shipping_zone_id = :shipping_zone_id, shipping_address_format = :shipping_address_format, shipping_custom_field = :shipping_custom_field, 
shipping_method = :shipping_method, shipping_code = :shipping_code, comment = :comment, total = :total, affiliate_id = :affiliate_id, commission = :commission, 
marketing_id = :marketing_id, tracking = :tracking, language_id = :language_id, currency_id = :currency_id, currency_code = :currency_code, 
currency_value = :currency_value, ip = :ip, forwarded_ip = :forwarded_ip, user_agent = :user_agent , accept_language = :accept_language",
            [
                ':invoice_prefix' => $data['invoice_prefix'],
                ':store_id' => $data['store_id'],
                ':store_name' => $data['store_name'],
                ':store_url' => $data['store_url'],
                ':customer_id' => $data['customer_id'],
                ':customer_group_id' => $data['customer_group_id'],
                ':first_name' => $data['firstname'],
                ':last_name' => $data['lastname'],
                ':email' => $data['email'],
                ':telephone' => $data['telephone'],
                ':custom_field' => isset($data['custom_field']) ? json_encode($data['custom_field']) : '',
                ':payment_firstname' => $data[':payment_firstname'],
                ':payment_lastname' => $data['payment_lastname'],
                ':payment_company' => $data['payment_company'],
                ':payment_address_1' => $data['payment_address_1'],
                ':payment_address_2' => $data['payment_address_2'],
                ':payment_city' => $data['payment_city'],
                ':payment_postcode' => $data['payment_postcode'],
                ':payment_country' => $data['payment_country'],
                ':payment_country_id' => $data['payment_country_id'],
                ':payment_zone' => $data['payment_zone'],
                ':payment_zone_id' => $data['payment_zone_id'],
                ':payment_address_format' => $data['payment_address_format'],
                ':payment_custom_field' => isset($data['payment_custom_field']) ? json_encode($data['payment_custom_field']) : '',
                ':payment_method' => $data['payment_method'],
                ':payment_code' => $data['payment_code'],
                ':shipping_firstname' => $data['shipping_firstname'],
                ':shipping_lastname' => $data['shipping_lastname'],
                ':shipping_company' => $data['shipping_company'],
                ':shipping_address_1' => $data['shipping_address_1'],
                ':shipping_address_2' => $data['shipping_address_2'],
                ':shipping_city' => $data['shipping_city'],
                ':shipping_postcode' => $data['shipping_postcode'],
                ':shipping_country' => $data['shipping_country'],
                ':shipping_country_id' => $data['shipping_country_id'],
                ':shipping_zone' => $data['shipping_zone'],
                ':shipping_zone_id' => $data['shipping_zone_id'],
                ':shipping_address_format' => $data['shipping_address_format'],
                ':shipping_custom_field' => isset($data['shipping_custom_field']) ? json_encode($data['shipping_custom_field']) : '',
                ':shipping_method' => $data['shipping_method'],
                ':shipping_code' => $data['shipping_code'],
                ':comment' => $data['comment'],
                ':total' => $data['total'],
                // LJK TODO: DELETE affiliate_id from insert, from query, and from TABLE
                // LJK Also look for other instances of affiliate_id, commission, etc to purge
                'affiliate_id' => $data['affiliate_id'],
                ':commission' => $data['commission'],
                ':marketing_id' => $data['marketing_id'],
                ':tracking' => $data['tracking'],
                ':language_id' => $data['language_id'],
                ':currency_id' => $data['currency_id'],
                ':currency_code' => $data['currency_code'],
                ':currency_value' => $data['currency_value'],
                ':ip' => $data['ip'],
                ':forwarded_ip' => $data['forwarded_ip'],
                ':user_agent' => $data['user_agent'],
                ':accept_language' => $data['accept_language'],
            ]);

		$order_id = $this->db->getLastId();

		// Products
		if (isset($data['products'])) {
			foreach ($data['products'] as $product) {
				$this->db->query("INSERT INTO oc_order_product SET order_id = :order_id, product_id = :product_id, name = :name , model = :model , quantity = :quantity, price = :price, total = :total, tax = :tax, reward = :reward",
                    [
                        ':order_id' => $order_id,
                        ':product_id' => $data['product_id'],
                        ':name' => $product['name'],
                        ':model' => $product['model'],
                        ':quantity' => $product['quantity'],
                        ':price' => $product['price'],
                        ':total' => $product['total'],
                        ':tax' => $product['tax'],
                        ':reward' => $product['reward'],

                    ]);

				$order_product_id = $this->db->getLastId();

				foreach ($product['option'] as $option) {
					$this->db->query("INSERT INTO oc_order_option SET order_id = :order_id, order_product_id = :order_product_id, product_option_id = :product_option_id, product_option_value_id = :product_option_value_id, name = :name, `value` = :value, `type` = :type",
                        [
                            ':order_id' => $order_id,
                            ':order_product_id' => $order_product_id,
                            ':product_option_id' => $option['product_option_id'],
                            ':product_option_value_id' => $option['product_option_value_id'],
                            ':name' => $option['name'],
                            ':value' => $option['value'],
                            ':type' => $option['type'],
                        ]);
				}
			}
		}

		// Gift Voucher
		$this->load->model('extension/total/voucher');

		// Vouchers
		if (isset($data['vouchers'])) {
			foreach ($data['vouchers'] as $voucher) {
				$this->db->query("INSERT INTO oc_order_voucher SET order_id = :order_id , description = :description, code = :code, from_name = :from_name, from_email = :from_email, to_name = :to_name, to_email = :to_email, voucher_theme_id = :voucher_theme_id, message = :message, amount = :amount",
                    [
                        ':order_id' => $order_id,
                        ':description' => $voucher['description'],
                        ':code' => $voucher['code'],
                        ':from_name' => $voucher['from_name'],
                        ':from_email' => $voucher['from_email'],
                        ':to_name' => $voucher['to_name'],
                        ':to_email' => $voucher['to_email'],
                        ':voucher_them_id' => $voucher['voucher_theme_id'],
                        ':message' => $voucher['message'],
                        ':amount' => $voucher['amount'],
                    ]);

				$order_voucher_id = $this->db->getLastId();

				$voucher_id = $this->model_extension_total_voucher->addVoucher($order_id, $voucher);

				$this->db->query("UPDATE oc_order_voucher SET voucher_id = :voucher_id WHERE order_voucher_id = :order_voucher_id",
                    [
                        ':voucher_id' => $voucher_id,
                        ':voucher_order_id' => $order_voucher_id
                    ]);
			}
		}

		// Totals
		if (isset($data['totals'])) {
			foreach ($data['totals'] as $total) {
				$this->db->query("INSERT INTO oc_order_total SET order_id = :order_id, code = :code, title = :title, `value` = :value, sort_order = :sort_order",
                    [
                        ':order_id' => $order_id,
                        ':code' => $total['code'],
                        ':title' => $total['title'],
                        ':value' => $total['value'],
                        ':sort_order' => $total['sort_order']
                    ]);
			}
		}

		return $order_id;
	}

	public function editOrder($order_id, $data) {
		// Void the order first
		$this->addOrderHistory($order_id, 0);

		$this->db->query("UPDATE `oc_order` SET invoice_prefix = :invoice_prefix, store_id = :store_id, store_name = :store_name, 
store_url = :store_url, customer_id = :customer_id, customer_group_id = :customer_group_id, firstname = :firstname, 
lastname = :lastname, email = :email, telephone = :telephone , custom_field = :custom_field, payment_firstname = :payment_firstname, 
payment_lastname = :payment_lastname, payment_company = :payment_company, 
payment_address_1 = :payment_address_1 , payment_address_1 = :payment_address_1, 
payment_city = :payment_city, payment_postcode = :payment_postcode, 
payment_country = :payment_country, payment_country_id = :payment_country_id, 
payment_zone = :payment_zone, payment_zone_id = :payment_zone_id , 
payment_address_format = :payment_address_format, 
payment_custom_field = :payment_custom_field, 
payment_method = :payment_method, payment_code = :payment_code, 
shipping_firstname = :shipping_firstname, shipping_lastname = :shipping_lastname, 
shipping_company = :shipping_company, shipping_address_1 = :shipping_address_1, shipping_address_2 = :shipping_address_2, shipping_city = :shipping_city, 
shipping_postcode = :shipping_postcode, shipping_country = :shipping_country, shipping_country_id = :shipping_country_id, shipping_zone = :shipping_zone , 
shipping_zone_id = :shipping_zone_id, shipping_address_format = :shipping_address_format, shipping_custom_field = :shipping_custom_field, 
shipping_method = :shipping_method, shipping_code = :shipping_code, comment = :comment, total = :total, affiliate_id = :affiliate_id, commission = :commission, 
marketing_id = :marketing_id, tracking = :tracking, language_id = :language_id, currency_id = :currency_id, currency_code = :currency_code, 
currency_value = :currency_value, ip = :ip, forwarded_ip = :forwarded_ip, user_agent = :user_agent , accept_language = :accept_language 
WHERE order_id = :order_id",
            [
                ':invoice_prefix' => $data['invoice_prefix'],
                ':store_id' => $data['store_id'],
                ':store_name' => $data['store_name'],
                ':store_url' => $data['store_url'],
                ':customer_id' => $data['customer_id'],
                ':customer_group_id' => $data['customer_group_id'],
                ':first_name' => $data['firstname'],
                ':last_name' => $data['lastname'],
                ':email' => $data['email'],
                ':telephone' => $data['telephone'],
                ':custom_field' => isset($data['custom_field']) ? json_encode($data['custom_field']) : '',
                ':payment_firstname' => $data[':payment_firstname'],
                ':payment_lastname' => $data['payment_lastname'],
                ':payment_company' => $data['payment_company'],
                ':payment_address_1' => $data['payment_address_1'],
                ':payment_address_2' => $data['payment_address_2'],
                ':payment_city' => $data['payment_city'],
                ':payment_postcode' => $data['payment_postcode'],
                ':payment_country' => $data['payment_country'],
                ':payment_country_id' => $data['payment_country_id'],
                ':payment_zone' => $data['payment_zone'],
                ':payment_zone_id' => $data['payment_zone_id'],
                ':payment_address_format' => $data['payment_address_format'],
                ':payment_custom_field' => isset($data['payment_custom_field']) ? json_encode($data['payment_custom_field']) : '',
                ':payment_method' => $data['payment_method'],
                ':payment_code' => $data['payment_code'],
                ':shipping_firstname' => $data['shipping_firstname'],
                ':shipping_lastname' => $data['shipping_lastname'],
                ':shipping_company' => $data['shipping_company'],
                ':shipping_address_1' => $data['shipping_address_1'],
                ':shipping_address_2' => $data['shipping_address_2'],
                ':shipping_city' => $data['shipping_city'],
                ':shipping_postcode' => $data['shipping_postcode'],
                ':shipping_country' => $data['shipping_country'],
                ':shipping_country_id' => $data['shipping_country_id'],
                ':shipping_zone' => $data['shipping_zone'],
                ':shipping_zone_id' => $data['shipping_zone_id'],
                ':shipping_address_format' => $data['shipping_address_format'],
                ':shipping_custom_field' => isset($data['shipping_custom_field']) ? json_encode($data['shipping_custom_field']) : '',
                ':shipping_method' => $data['shipping_method'],
                ':shipping_code' => $data['shipping_code'],
                ':comment' => $data['comment'],
                ':total' => $data['total'],
                // LJK TODO: DELETE affiliate_id from insert, from query, and from TABLE
                // LJK Also look for other instances of affiliate_id, commission, etc to purge
                'affiliate_id' => $data['affiliate_id'],
                ':commission' => $data['commission'],
                ':marketing_id' => $data['marketing_id'],
                ':tracking' => $data['tracking'],
                ':language_id' => $data['language_id'],
                ':currency_id' => $data['currency_id'],
                ':currency_code' => $data['currency_code'],
                ':currency_value' => $data['currency_value'],
                ':ip' => $data['ip'],
                ':forwarded_ip' => $data['forwarded_ip'],
                ':user_agent' => $data['user_agent'],
                ':accept_language' => $data['accept_language'],
                ':order_id' => $order_id
            ]);

		$this->db->query("DELETE FROM oc_order_product WHERE order_id = :order_id",
            [
                ':order_id' => $order_id
            ]);
		$this->db->query("DELETE FROM oc_order_option WHERE order_id = :order_id",
            [
                ':order_id' => $order_id
            ]);

		// Products
		if (isset($data['products'])) {
			foreach ($data['products'] as $product) {
				$this->db->query("INSERT INTO oc_order_product SET order_id = :order_id, product_id = :product_id, name = :name, model = :model, quantity = :quantity, price = :price, total = :total, tax = :tax, reward = :reward",
                    [
                        ':order_id' => $order_id,
                        ':product_id' => $product['product_id'],
                        ':name' => $product['name'],
                        ':model' => $product['model'],
                        ':quantity' => $product['quantity'],
                        ':price' => $product['price'],
                        ':total' => $product['total'],
                        ':tax' => $product['tax'],
                        ':reward' => $product['reward']
                    ]);

				$order_product_id = $this->db->getLastId();

				foreach ($product['option'] as $option) {
					$this->db->query("INSERT INTO oc_order_option SET order_id = :order_id, order_product_id = :order_product_id, product_option_id = :product_option_id, product_option_value_id = :product_option_value_id, name = :name, `value` = :value, `type` = :type",
                        [
                            ':order_id' => $order_id,
                            ':order_product_id' => $order_product_id,
                            ':product_option_id' => $option['product_option_id'],
                            ':product_option_value_id' => $option['product_option_value_id'],
                            ':name' => $option['name'],
                            ':value' => $option['value'],
                            ':type' => $option['type']
                        ]);
				}
			}
		}

		// Gift Voucher
		$this->load->model('extension/total/voucher');

		$this->model_extension_total_voucher->disableVoucher($order_id);

		// Vouchers
		$this->db->query("DELETE FROM oc_order_voucher WHERE order_id = :order_id",
            [
                ':order_id' => $order_id
            ]);

		if (isset($data['vouchers'])) {
			foreach ($data['vouchers'] as $voucher) {
				$this->db->query("INSERT INTO oc_order_voucher SET order_id = :order_id, description = :description, code = :code, from_name = :from_name, from_email = :from_email, to_name = :to_name, to_email = :to_email, voucher_theme_id = :voucher_theme_id, message = :message, amount = :amount",
                    [
                        ':order_id' => $order_id,
                        ':description' => $voucher['description'],
                        ':code' => $voucher['code'],
                        ':from_name' => $voucher['from_name'],
                        ':from_email' => $voucher['from_email'],
                        ':to_name' => $voucher['to_name'],
                        ':to_email' => $voucher['to_email'],
                        ':voucher_theme_id' => $voucher['voucher_theme_id'],
                        ':message' => $voucher['message'],
                        ':amount' => $voucher['amount']
                    ]);

				$order_voucher_id = $this->db->getLastId();

				$voucher_id = $this->model_extension_total_voucher->addVoucher($order_id, $voucher);

				$this->db->query("UPDATE oc_order_voucher SET voucher_id = :voucher_id WHERE order_voucher_id = :order_voucher_id",
                    [
                        ':voucher_id' => $voucher_id,
                        ':order_voucher_id' => $order_voucher_id
                    ]);
			}
		}

		// Totals
		$this->db->query("DELETE FROM oc_order_total WHERE order_id = :order_id",
            [
                ':order_id' => $order_id
            ]);

		if (isset($data['totals'])) {
			foreach ($data['totals'] as $total) {
				$this->db->query("INSERT INTO oc_order_total SET order_id = :order_id, code = :code, title = :title, `value` = :value, sort_order = :sort_order",
                    [
                        ':order_id' => $order_id,
                        ':code' => $total['code'],
                        ':title' => $total['title'],
                        ':value' => $total['value'],
                        ':sort_order' => $total['sort_order']
                    ]);
			}
		}
	}

	public function deleteOrder($order_id) {
		// Void the order first
		$this->addOrderHistory($order_id, 0);

		$this->db->query("DELETE FROM `oc_order` WHERE order_id = :order_id",
            [
                ':order_id' => $order_id
            ]);
		$this->db->query("DELETE FROM `oc_order_product` WHERE order_id = :order_id",
            [
                ':order_id' => $order_id
            ]);
		$this->db->query("DELETE FROM `oc_order_option` WHERE order_id = :order_id",
            [
                ':order_id' => $order_id
            ]);
		$this->db->query("DELETE FROM `oc_order_voucher` WHERE order_id = :order_id",
            [
                ':order_id' => $order_id
            ]);
		$this->db->query("DELETE FROM `oc_order_total` WHERE order_id = :order_id",
            [
                ':order_id' => $order_id
            ]);
		$this->db->query("DELETE FROM `oc_order_history` WHERE order_id = :order_id",
            [
                ':order_id' => $order_id
            ]);
		$this->db->query("DELETE `or`, ort FROM `oc_order_recurring` `or`, `oc_order_recurring_transaction` `ort` WHERE order_id = :order_id AND ort.order_recurring_id = `or`.order_recurring_id",
            [
                ':order_id' => $order_id
            ]);
		$this->db->query("DELETE FROM `oc_customer_transaction` WHERE order_id = :order_id",
            [
                ':order_id' => $order_id
            ]);

		// Gift Voucher
		$this->load->model('extension/total/voucher');

		$this->model_extension_total_voucher->disableVoucher($order_id);
	}

	public function getOrder($order_id) {
		$order_query = $this->db->query("SELECT *, (SELECT os.name FROM `oc_order_status` os WHERE os.order_status_id = o.order_status_id AND os.language_id = o.language_id) AS order_status FROM `oc_order` o WHERE o.order_id = :order_id",
            [
                ':order_id' => $order_id
            ]);

		if ($order_query->num_rows) {
			$country_query = $this->db->query("SELECT * FROM `oc_country` WHERE country_id = :country_id",
                [
                    ':country_id' => $order_query->row['payment_country_id']
                ]);

			if ($country_query->num_rows) {
				$payment_iso_code_2 = $country_query->row['iso_code_2'];
				$payment_iso_code_3 = $country_query->row['iso_code_3'];
			} else {
				$payment_iso_code_2 = '';
				$payment_iso_code_3 = '';
			}

			$zone_query = $this->db->query("SELECT * FROM `oc_zone` WHERE zone_id = :zone_id",
                [
                    ':zone_id' => $order_query->row['payment_zone_id']
                ]);

			if ($zone_query->num_rows) {
				$payment_zone_code = $zone_query->row['code'];
			} else {
				$payment_zone_code = '';
			}

			$country_query = $this->db->query("SELECT * FROM `oc_country` WHERE country_id = :country_id",
                [
                    ':country_id' => $order_query->row['shipping_country_id']
                ]);

			if ($country_query->num_rows) {
				$shipping_iso_code_2 = $country_query->row['iso_code_2'];
				$shipping_iso_code_3 = $country_query->row['iso_code_3'];
			} else {
				$shipping_iso_code_2 = '';
				$shipping_iso_code_3 = '';
			}

			$zone_query = $this->db->query("SELECT * FROM `oc_zone` WHERE zone_id = :zone_id",
                [
                    ':zone_id' => $order_query->row['shipping_zone_id']
                ]);

			if ($zone_query->num_rows) {
				$shipping_zone_code = $zone_query->row['code'];
			} else {
				$shipping_zone_code = '';
			}

			$this->load->model('localisation/language');

			$language_info = $this->model_localisation_language->getLanguage($order_query->row['language_id']);

			if ($language_info) {
				$language_code = $language_info['code'];
			} else {
				$language_code = $this->config->get('config_language');
			}

			return [
				'order_id'                => $order_query->row['order_id'],
				'invoice_no'              => $order_query->row['invoice_no'],
				'invoice_prefix'          => $order_query->row['invoice_prefix'],
				'store_id'                => $order_query->row['store_id'],
				'store_name'              => $order_query->row['store_name'],
				'store_url'               => $order_query->row['store_url'],
				'customer_id'             => $order_query->row['customer_id'],
				'firstname'               => $order_query->row['firstname'],
				'lastname'                => $order_query->row['lastname'],
				'email'                   => $order_query->row['email'],
				'telephone'               => $order_query->row['telephone'],
				'custom_field'            => json_decode($order_query->row['custom_field'], true),
				'payment_firstname'       => $order_query->row['payment_firstname'],
				'payment_lastname'        => $order_query->row['payment_lastname'],
				'payment_company'         => $order_query->row['payment_company'],
				'payment_address_1'       => $order_query->row['payment_address_1'],
				'payment_address_2'       => $order_query->row['payment_address_2'],
				'payment_postcode'        => $order_query->row['payment_postcode'],
				'payment_city'            => $order_query->row['payment_city'],
				'payment_zone_id'         => $order_query->row['payment_zone_id'],
				'payment_zone'            => $order_query->row['payment_zone'],
				'payment_zone_code'       => $payment_zone_code,
				'payment_country_id'      => $order_query->row['payment_country_id'],
				'payment_country'         => $order_query->row['payment_country'],
				'payment_iso_code_2'      => $payment_iso_code_2,
				'payment_iso_code_3'      => $payment_iso_code_3,
				'payment_address_format'  => $order_query->row['payment_address_format'],
				'payment_custom_field'    => json_decode($order_query->row['payment_custom_field'], true),
				'payment_method'          => $order_query->row['payment_method'],
				'payment_code'            => $order_query->row['payment_code'],
				'shipping_firstname'      => $order_query->row['shipping_firstname'],
				'shipping_lastname'       => $order_query->row['shipping_lastname'],
				'shipping_company'        => $order_query->row['shipping_company'],
				'shipping_address_1'      => $order_query->row['shipping_address_1'],
				'shipping_address_2'      => $order_query->row['shipping_address_2'],
				'shipping_postcode'       => $order_query->row['shipping_postcode'],
				'shipping_city'           => $order_query->row['shipping_city'],
				'shipping_zone_id'        => $order_query->row['shipping_zone_id'],
				'shipping_zone'           => $order_query->row['shipping_zone'],
				'shipping_zone_code'      => $shipping_zone_code,
				'shipping_country_id'     => $order_query->row['shipping_country_id'],
				'shipping_country'        => $order_query->row['shipping_country'],
				'shipping_iso_code_2'     => $shipping_iso_code_2,
				'shipping_iso_code_3'     => $shipping_iso_code_3,
				'shipping_address_format' => $order_query->row['shipping_address_format'],
				'shipping_custom_field'   => json_decode($order_query->row['shipping_custom_field'], true),
				'shipping_method'         => $order_query->row['shipping_method'],
				'shipping_code'           => $order_query->row['shipping_code'],
				'comment'                 => $order_query->row['comment'],
				'total'                   => $order_query->row['total'],
				'order_status_id'         => $order_query->row['order_status_id'],
				'order_status'            => $order_query->row['order_status'],
				'affiliate_id'            => $order_query->row['affiliate_id'],
				'commission'              => $order_query->row['commission'],
				'language_id'             => $order_query->row['language_id'],
				'language_code'           => $language_code,
				'currency_id'             => $order_query->row['currency_id'],
				'currency_code'           => $order_query->row['currency_code'],
				'currency_value'          => $order_query->row['currency_value'],
				'ip'                      => $order_query->row['ip'],
				'forwarded_ip'            => $order_query->row['forwarded_ip'],
				'user_agent'              => $order_query->row['user_agent'],
				'accept_language'         => $order_query->row['accept_language'],
				'date_added'              => $order_query->row['date_added'],
				'date_modified'           => $order_query->row['date_modified']
			];
		} else {
			return false;
		}
	}
	
	public function getOrderProducts($order_id) {
		$query = $this->db->query("SELECT * FROM oc_order_product WHERE order_id = :order_id",
            [
                ':order_id' => $order_id
            ]);
		
		return $query->rows;
	}
	
	public function getOrderOptions($order_id, $order_product_id) {
		$query = $this->db->query("SELECT * FROM oc_order_option WHERE order_id = :order_id AND order_product_id = :order_product_id",
            [
                ':order_id' => $order_id,
                ':order_product_id' => $order_product_id
            ]);
		
		return $query->rows;
	}
	
	public function getOrderVouchers($order_id) {
		$query = $this->db->query("SELECT * FROM oc_order_voucher WHERE order_id = :order_id",
            [
                ':order_id' => $order_id
            ]);
	
		return $query->rows;
	}
	
	public function getOrderTotals($order_id) {
		$query = $this->db->query("SELECT * FROM `oc_order_total` WHERE order_id = :order_id ORDER BY sort_order ASC",
            [
                ':order_id' => $order_id
            ]);
		
		return $query->rows;
	}	
			
	public function addOrderHistory($order_id, $order_status_id, $comment = '', $notify = false, $override = false) {
		$order_info = $this->getOrder($order_id);
		
		if ($order_info) {
			// Fraud Detection
			$this->load->model('account/customer');

			$customer_info = $this->model_account_customer->getCustomer($order_info['customer_id']);

			if ($customer_info && $customer_info['safe']) {
				$safe = true;
			} else {
				$safe = false;
			}

			// Only do the fraud check if the customer is not on the safe list and the order status is changing into the complete or process order status
			if (!$safe && !$override && in_array($order_status_id, array_merge($this->config->get('config_processing_status'), $this->config->get('config_complete_status')))) {
				// Anti-Fraud
				$this->load->model('setting/extension');

				$extensions = $this->model_setting_extension->getExtensions('fraud');

				foreach ($extensions as $extension) {
					if ($this->config->get('fraud_' . $extension['code'] . '_status')) {
						$this->load->model('extension/fraud/' . $extension['code']);

						if (property_exists($this->{'model_extension_fraud_' . $extension['code']}, 'check')) {
							$fraud_status_id = $this->{'model_extension_fraud_' . $extension['code']}->check($order_info);
	
							if ($fraud_status_id) {
								$order_status_id = $fraud_status_id;
							}
						}
					}
				}
			}

			// If current order status is not processing or complete but new status is processing or complete then commence completing the order
			if (!in_array($order_info['order_status_id'], array_merge($this->config->get('config_processing_status'), $this->config->get('config_complete_status'))) && in_array($order_status_id, array_merge($this->config->get('config_processing_status'), $this->config->get('config_complete_status')))) {
				// Redeem coupon, vouchers and reward points
				$order_totals = $this->getOrderTotals($order_id);

				foreach ($order_totals as $order_total) {
					$this->load->model('extension/total/' . $order_total['code']);

					if (property_exists($this->{'model_extension_total_' . $order_total['code']}, 'confirm')) {
						// Confirm coupon, vouchers and reward points
						$fraud_status_id = $this->{'model_extension_total_' . $order_total['code']}->confirm($order_info, $order_total);
						
						// If the balance on the coupon, vouchers and reward points is not enough to cover the transaction or has already been used then the fraud order status is returned.
						if ($fraud_status_id) {
							$order_status_id = $fraud_status_id;
						}
					}
				}

				// Stock subtraction
				$order_products = $this->getOrderProducts($order_id);

				foreach ($order_products as $order_product) {
					$this->db->query("UPDATE oc_product SET quantity = (quantity - :quantity) WHERE product_id = :product_id AND subtract = :subtract",
                        [
                            ':quantity' => $order_product['quantity'],
                            ':product_id' => $order_product['product_id'],
                            ':subtract' => 1
                        ]);

					$order_options = $this->getOrderOptions($order_id, $order_product['order_product_id']);

					foreach ($order_options as $order_option) {
						$this->db->query("UPDATE oc_product_option_value SET quantity = (quantity - :quantity) WHERE product_option_value_id = :product_option_value_id AND subtract = :subtract",
                            [
                                ':quantity' => $order_product['quantity'],
                                ':product_option_value_id' => $order_option['product_option_value_id'],
                                ':subtract' => 1
                            ]);
					}
				}
				
				// Add commission if sale is linked to affiliate referral.
				if ($order_info['affiliate_id'] && $this->config->get('config_affiliate_auto')) {
					$this->load->model('account/customer');

					if (!$this->model_account_customer->getTotalTransactionsByOrderId($order_id)) {
						$this->model_account_customer->addTransaction($order_info['affiliate_id'], $this->language->get('text_order_id') . ' #' . $order_id, $order_info['commission'], $order_id);
					}
				}
			}

			// Update the DB with the new statuses
			$this->db->query("UPDATE `oc_order` SET order_status_id = :order_status_id WHERE order_id = :order_id",
                [
                    ':order_status_id' => $order_status_id,
                    ':order_id' => $order_id
                ]);

			$this->db->query("INSERT INTO oc_order_history SET order_id = :order_id, order_status_id = :order_status_id, notify = :notify, comment = :comment",
                [
                    ':order_id' => $order_id,
                    ':order_status_id' => $order_status_id,
                    ':notify' => $notify,
                    ':comment' => $comment
                ]);

			// If old order status is the processing or complete status but new status is not then commence restock, and remove coupon, voucher and reward history
			if (in_array($order_info['order_status_id'], array_merge($this->config->get('config_processing_status'), $this->config->get('config_complete_status'))) && !in_array($order_status_id, array_merge($this->config->get('config_processing_status'), $this->config->get('config_complete_status')))) {
				// Restock
				$order_products = $this->getOrderProducts($order_id);

				foreach($order_products as $order_product) {
					$this->db->query("UPDATE `oc_product` SET quantity = (quantity + :quantity) WHERE product_id = :product_id AND subtract = :subtract",
                        [
                            ':quantity' => $order_product['quantity'],
                            ':product_id' => $order_product['product_id'],
                            ':subtract' => 1
                        ]);

					$order_options = $this->getOrderOptions($order_id, $order_product['order_product_id']);

					foreach ($order_options as $order_option) {
						$this->db->query("UPDATE oc_product_option_value SET quantity = (quantity + :quantity) WHERE product_option_value_id = :product_option_value_id AND subtract = :subtract",
                            [
                                ':quantity' => $order_product['quantity'],
                                ':product_option_value_id' => $order_option['product_option_value_id'],
                                ':subtract' => 1
                            ]);
					}
				}

				// Remove coupon, vouchers and reward points history
				$order_totals = $this->getOrderTotals($order_id);
				
				foreach ($order_totals as $order_total) {
					$this->load->model('extension/total/' . $order_total['code']);

					if (property_exists($this->{'model_extension_total_' . $order_total['code']}, 'unconfirm')) {
						$this->{'model_extension_total_' . $order_total['code']}->unconfirm($order_id);
					}
				}

				// Remove commission if sale is linked to affiliate referral.
				if ($order_info['affiliate_id']) {
					$this->load->model('account/customer');
					
					$this->model_account_customer->deleteTransactionByOrderId($order_id);
				}
			}

			$this->cache->delete('product');
		}
	}
}