<?php
class ModelExtensionPaymentG2APay extends Model {

	public function getMethod($address, $total) {
		$this->load->language('extension/payment/g2apay');

		$query = $this->db->query("SELECT * FROM oc_zone_to_geo_zone WHERE geo_zone_id = :geo_zone_id AND country_id = :country_id AND (zone_id = :zone_id OR zone_id = '0')",
            [
                ':geo_zone_id' => $this->config->get('payment_g2apay_geo_zone_id'),
                ':country_id' => $address['country_id'],
                ':zone_id' => $address['zone_id']
            ]);

		if ($this->config->get('payment_g2apay_total') > 0 && $this->config->get('payment_g2apay_total') > $total) {
			$status = false;
		} elseif (!$this->config->get('payment_g2apay_geo_zone_id')) {
			$status = true;
		} elseif ($query->num_rows) {
			$status = true;
		} else {
			$status = false;
		}

		$method_data = [];

		if ($status) {
			$method_data = [
				'code' => 'g2apay',
				'title' => $this->language->get('text_title'),
				'terms' => '',
				'sort_order' => $this->config->get('payment_g2apay_sort_order')
            ];
		}

		return $method_data;
	}

	public function addG2aOrder($order_info) {
		$this->db->query("INSERT INTO `oc_g2apay_order` SET `order_id` = :order_id, `currency_code` = :currency_code, `total` =  :total",
            [
                ':order_id' => $order_info['order_id'],
                ':currency_code' => $order_info['currency_code'],
                ':total' => $this->currency->format($order_info['total'], $order_info['currency_code'], false, false)
            ]);
	}

	public function updateOrder($g2apay_order_id, $g2apay_transaction_id, $type, $order_info) {
		$this->db->query("UPDATE `oc_g2apay_order` SET `g2apay_transaction_id` = :transaction_id WHERE `order_id` = :order_id",
            [
                ':transaction_id' => $g2apay_transaction_id,
                ':order_id' => $order_info['order_id']
            ]);

		$this->addTransaction($g2apay_order_id, $type, $order_info);

	}

	public function addTransaction($g2apay_order_id, $type, $order_info) {
		$this->db->query("INSERT INTO `oc_g2apay_order_transaction` SET `g2apay_order_id` = :order_id, `type` = :type, `amount` = :amount",
            [
                ':order_id' => $g2apay_order_id,
                ':type' => $type,
                ':amount' => $this->currency->format($order_info['total'], $order_info['currency_code'], false, false)
            ]);
	}

	public function getG2aOrder($order_id) {
		$qry = $this->db->query("SELECT * FROM `oc_g2apay_order` WHERE `order_id` = :order_id LIMIT 1",
            [
                ':order_id' => $order_id
            ]);

		if ($qry->num_rows) {
			return $qry->row;
		} else {
			return false;
		}
	}

	public function sendCurl($url, $fields) {
	    // LJK TODO: Guzzle
		$curl = curl_init($url);

		curl_setopt($curl, CURLOPT_URL, $url);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($curl, CURLOPT_POST, true);
		curl_setopt($curl, CURLOPT_POSTFIELDS, $fields);
		$response = curl_exec($curl);

		curl_close($curl);

		return json_decode($response);
	}

	public function logger($message) {
		if ($this->config->get('payment_g2apay_debug') == 1) {
			$log = new Log('g2apay.log');
			$backtrace = debug_backtrace();
			$log->write('Origin: ' . $backtrace[6]['class'] . '::' . $backtrace[6]['function']);
			$log->write(print_r($message, 1));
		}
	}
}