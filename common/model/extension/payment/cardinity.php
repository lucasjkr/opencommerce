<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

use Cardinity\Client;
use Cardinity\Method\Payment;
use Cardinity\Exception as CardinityException;

class ModelExtensionPaymentCardinity extends Model {
	public function addOrder($data) {
		$this->db->query("INSERT INTO `oc_cardinity_order` SET `order_id` = :order_id, `payment_id` = :payment_id",
            [
                ':order_id' => $data['order_id'],
                ':payment_id' => $data['payment_id']
            ]);
	}

	public function getOrder($order_id) {
		$query = $this->db->query("SELECT * FROM `oc_cardinity_order` WHERE `order_id` = :order_id LIMIT 1",
            [
                ':order_id' => $order_id
            ]);

		return $query->row;
	}

	public function createPayment($key, $secret, $payment_data) {
		$client = Client::create([
			'consumerKey'    => $key,
			'consumerSecret' => $secret,
		]);

		$method = new Payment\Create($payment_data);

		try {
			$payment = $client->call($method);

			return $payment;
		} catch (Exception $exception) {
			$this->exception($exception);

			throw $exception;
		}
	}

	public function finalizePayment($key, $secret, $payment_id, $pares) {
		$client = Client::create([
			'consumerKey'    => $key,
			'consumerSecret' => $secret,
        ]);

		$method = new Payment\Finalize($payment_id, $pares);

		try {
			$payment = $client->call($method);

			return $payment;
		} catch (Exception $exception) {
			$this->exception($exception);

			return false;
		}
	}

	public function getMethod($address, $total) {
		$this->load->language('extension/payment/cardinity');

		$query = $this->db->query("SELECT * FROM oc_zone_to_geo_zone WHERE geo_zone_id = :geo_zone_id AND country_id = :country_id AND (zone_id = :zone_id OR zone_id = '0')",
            [
                ':geo_zone_id' => $this->config->get('payment_cardinity_geo_zone_id'),
                ':country_id' => $address['country_id'],
                ':zone_id' => $address['zone_id']
            ]);

		if ($this->config->get('payment_cardinity_total') > 0 && $this->config->get('payment_cardinity_total') > $total) {
			$status = false;
		} elseif (!$this->config->get('payment_cardinity_geo_zone_id')) {
			$status = true;
		} elseif ($query->num_rows) {
			$status = true;
		} else {
			$status = false;
		}

		if (!in_array($this->session->data['currency'], $this->getSupportedCurrencies())) {
			$status = false;
		}

		$method_data = [];

		if ($status) {
			$method_data = [
				'code'		 => 'cardinity',
				'title'		 => $this->language->get('text_title'),
				'terms'		 => '',
				'sort_order' => $this->config->get('payment_cardinity_sort_order')
			];
		}

		return $method_data;
	}

	public function getSupportedCurrencies() {
		return [
			'USD',
			'GBP',
			'EUR'
        ];
	}

	public function log($data, $class_step = 6, $function_step = 6) {
		if ($this->config->get('payment_cardinity_debug')) {
			$backtrace = debug_backtrace();
			$log = new Log('cardinity.log');
			$log->write('(' . $backtrace[$class_step]['class'] . '::' . $backtrace[$function_step]['function'] . ') - ' . print_r($data, true));
		}
	}

	private function exception(Exception $exception) {
		$this->log($exception->getMessage(), 1, 2);

		switch (true) {
			case $exception instanceof CardinityException\Request:
				if ($exception->getErrorsAsString()) {
					$this->log($exception->getErrorsAsString(), 1, 2);
				}

				break;
			case $exception instanceof CardinityException\InvalidAttributeValue:
				foreach ($exception->getViolations() as $violation) {
					$this->log($violation->getMessage(), 1, 2);
				}

				break;
		}
	}
}