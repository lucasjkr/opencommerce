<?php
class ModelExtensionPaymentCardConnect extends Model {
	public function getMethod($address, $total) {
		$this->load->language('extension/payment/cardconnect');

		$query = $this->db->query("SELECT * FROM `oc_zone_to_geo_zone` WHERE `geo_zone_id` = :geo_zone_id AND `country_id` = :country_id AND (`zone_id` = :zone_id OR `zone_id` = '0')",
            [
                ':geo_zone_id' => $this->config->get('payment_cardconnect_geo_zone'),
                ':country_id' => $address['country_id'],
                ':zone_id' => $address['zone_id']
            ]);

		if ($this->config->get('payment_cardconnect_total') > 0 && $this->config->get('payment_cardconnect_total') > $total) {
			$status = false;
		} elseif (!$this->config->get('payment_cardconnect_geo_zone')) {
			$status = true;
		} elseif ($query->num_rows) {
			$status = true;
		} else {
			$status = false;
		}

		$method_data = [];

		if ($status) {
			$method_data = [
				'code'			=> 'cardconnect',
				'title'			=> $this->language->get('text_title'),
				'terms'			=> '',
				'sort_order'	=> $this->config->get('payment_cardconnect_sort_order')
            ];
		}

		return $method_data;
	}

	public function getCardTypes() {
		$cards = [];

		$cards[] = [
			'text'  => 'Visa',
			'value' => 'VISA'
		];

		$cards[] = [
			'text'  => 'MasterCard',
			'value' => 'MASTERCARD'
		];

		$cards[] = [
			'text'  => 'Discover Card',
			'value' => 'DISCOVER'
		];

		$cards[] = [
			'text'  => 'American Express',
			'value' => 'AMEX'
        ];

		return $cards;
	}

	public function getMonths() {
		$months = [];

		for ($i = 1; $i <= 12; $i++) {
			$months[] = [
				'text'  => strftime('%B', mktime(0, 0, 0, $i, 1, 2000)),
				'value' => sprintf('%02d', $i)
            ];
		}

		return $months;
	}

	public function getYears() {
		$years = [];

		$today = getdate();

		for ($i = $today['year']; $i < $today['year'] + 11; $i++) {
			$years[] = [
				'text'  => strftime('%Y', mktime(0, 0, 0, 1, 1, $i)),
				'value' => strftime('%y', mktime(0, 0, 0, 1, 1, $i))
            ];
		}

		return $years;
	}

	public function getCard($token, $customer_id) {
		$query = $this->db->query("SELECT * FROM `oc_cardconnect_card` WHERE `token` = :token AND `customer_id` = :customer_id",
            [
                ':token' => $token,
                ':customer_id' => $customer_id
            ]);

		if ($query->num_rows) {
			return $query->row;
		} else {
			return false;
		}
	}

	public function getCards($customer_id) {
		$query = $this->db->query("SELECT * FROM `oc_cardconnect_card` WHERE `customer_id` = :customer_id",
            [
                ':customer_id' => $customer_id
            ]);

		return $query->rows;
	}

	public function addCard($cardconnect_order_id, $customer_id, $profileid, $token, $type, $account, $expiry) {
	    // LJK TODO: Rename profileid => profile_id
		$this->db->query("INSERT INTO `oc_cardconnect_card` SET `cardconnect_order_id` = :order_id, `customer_id` = :customer_id, `profileid` = :profileid, `token` = :token, `type` = :type, `account` = :account, `expiry` = :expiry",
            [
                ':order_id' => $cardconnect_order_id,
                ':customer_id' => $customer_id,
                ':profileid' => $profileid,
                ':token' => $token,
                ':type' => $type,
                ':account' => $account,
                ':expiry' => $expiry
            ]);
	}

	public function deleteCard($token, $customer_id) {
		$this->db->query("DELETE FROM `oc_cardconnect_card` WHERE `token` = :token AND `customer_id` = :customer_id",
            [
                ':token' => $token,
                ':customer_id' => $customer_id
            ]);
	}

	public function addOrder($order_info, $payment_method) {
		$this->db->query("INSERT INTO `oc_cardconnect_order` SET `order_id` = :order_id, `customer_id` = :customer_id,
 `payment_method` = :payment_method, `retref` = :retref, `authcode` = :authcode, `currency_code` = :currency_code, `total` = :total",
            [
                ':order_id' => $order_info['order_id'],
                ':customer_id' => $this->customer->getId(),
                ':payment_method' => $payment_method,
                ':refref' => $order_info['retref'],
                ':authcode' => $order_info['authcode'],
                ':currency_code' => $order_info['currency_code'],
                ':total' => $this->currency->format($order_info['total'], $order_info['currency_code'], false, false),
            ]);

		return $this->db->getLastId();
	}

	public function addTransaction($cardconnect_order_id, $type, $status, $order_info) {
		$this->db->query("INSERT INTO `oc_cardconnect_order_transaction` SET `cardconnect_order_id` = :order_id, `type` = :type, `retref` = :retref, `amount` = :amount, `status` = :status",
            [
                ':order_id' => $cardconnect_order_id,
                ':type' => $type,
                ':retref' => $order_info['retref'],
                ':amount' => $this->currency->format($order_info['total'], $order_info['currency_code'], false, false),
                ':status' => $status
            ]);
	}

	public function getSettlementStatuses($merchant_id, $date) {
		$this->log('Getting settlement statuses from CardConnect');

		$url = 'https://' . $this->config->get('payment_cardconnect_site') . '.cardconnect.com:' . (($this->config->get('payment_cardconnect_environment') == 'live') ? 8443 : 6443) . '/cardconnect/rest/settlestat?merchid=' . $merchant_id . '&date=' . $date;

		$header = [];

		$header[] = 'Content-type: application/json';
		$header[] = 'Authorization: Basic ' . base64_encode($this->config->get('payment_cardconnect_api_username') . ':' . $this->config->get('payment_cardconnect_api_password'));

		$this->model_extension_payment_cardconnect->log('Header: ' . print_r($header, true));

		$this->model_extension_payment_cardconnect->log('URL: ' . $url);

        // LJK TODO: Guzzle
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
		curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'GET');
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($ch, CURLOPT_TIMEOUT, 30);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
		$response_data = curl_exec($ch);
		if (curl_errno($ch)) {
			$this->model_extension_payment_cardconnect->log('cURL error: ' . curl_errno($ch));
		}
		curl_close($ch);

		$response_data = json_decode($response_data, true);

		$this->log('Response: ' . print_r($response_data, true));

		return $response_data;
	}

	public function updateTransactionStatusByRetref($retref, $status) {
		$this->db->query("UPDATE `oc_cardconnect_order_transaction` SET `status` = :status WHERE `retref` = :retref",
            [
                ':status' => $status,
                ':refref' => $retref
            ]);
	}

	public function updateCronRunTime() {
		$this->db->query("DELETE FROM `oc_setting` WHERE `key` = 'cardconnect_cron_time'");

		$this->db->query("INSERT INTO `oc_setting` SET `store_id` = '0', `code` = 'cardconnect', `key` = 'cardconnect_cron_time', `value` = NOW(), `serialized` = '0'");
	}

	public function log($data) {
		if ($this->config->get('payment_cardconnect_logging')) {
			$log = new Log('cardconnect.log');

			$log->write($data);
		}
	}
}