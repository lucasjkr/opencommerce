<?php

class ModelExtensionPaymentWorldpayAdmin extends Model {

	public function install() {
		$this->db->query("
			CREATE TABLE IF NOT EXISTS `oc_worldpay_order` (
			  `worldpay_order_id` INT(11) NOT NULL AUTO_INCREMENT,
			  `order_id` INT(11) NOT NULL,
			  `order_code` VARCHAR(50),
			  `refund_status` INT(1) DEFAULT NULL,
			  `currency_code` CHAR(3) NOT NULL,
			  `total` DECIMAL( 10, 2 ) NOT NULL,
			  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
              `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			  PRIMARY KEY (`worldpay_order_id`)
			) ENGINE=InnoDB DEFAULT CHARSET=utf8;");

		$this->db->query("
			CREATE TABLE IF NOT EXISTS `oc_worldpay_order_transaction` (
			  `worldpay_order_transaction_id` INT(11) NOT NULL AUTO_INCREMENT,
			  `worldpay_order_id` INT(11) NOT NULL,
			  `type` ENUM('payment', 'refund') DEFAULT NULL,
			  `amount` DECIMAL( 10, 2 ) NOT NULL,
			  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
              `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			  PRIMARY KEY (`worldpay_order_transaction_id`)
			) ENGINE=InnoDB DEFAULT CHARSET=utf8;");

		$this->db->query("
			CREATE TABLE IF NOT EXISTS `oc_worldpay_order_recurring` (
			  `worldpay_order_recurring_id` INT(11) NOT NULL AUTO_INCREMENT,
			  `order_id` INT(11) NOT NULL,
			  `order_recurring_id` INT(11) NOT NULL,
			  `order_code` VARCHAR(50),
			  `token` VARCHAR(50),
              `next_payment` DATETIME NOT NULL,
			  `trial_end` datetime DEFAULT NULL,
			  `subscription_end` datetime DEFAULT NULL,
			  `currency_code` CHAR(3) NOT NULL,
			  `total` DECIMAL( 10, 2 ) NOT NULL,
			  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
              `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			  PRIMARY KEY (`worldpay_order_recurring_id`)
			) ENGINE=InnoDB DEFAULT CHARSET=utf8;");

		$this->db->query("
			CREATE TABLE IF NOT EXISTS `oc_worldpay_card` (
			  `card_id` INT(11) NOT NULL AUTO_INCREMENT,
			  `customer_id` INT(11) NOT NULL,
			  `order_id` INT(11) NOT NULL,
			  `token` VARCHAR(50) NOT NULL,
			  `digits` VARCHAR(22) NOT NULL,
			  `expiry` VARCHAR(5) NOT NULL,
			  `type` VARCHAR(50) NOT NULL,
			  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
              `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			  PRIMARY KEY (`card_id`)
			) ENGINE=InnoDB DEFAULT CHARSET=utf8;");
	}

	public function uninstall() {
		$this->db->query("DROP TABLE IF EXISTS `oc_worldpay_order`;");
		$this->db->query("DROP TABLE IF EXISTS `oc_worldpay_order_transaction`;");
		$this->db->query("DROP TABLE IF EXISTS `oc_worldpay_order_recurring`;");
		$this->db->query("DROP TABLE IF EXISTS `oc_worldpay_card`;");
	}

	public function refund($order_id, $amount) {
		$worldpay_order = $this->getOrder($order_id);

		if (!empty($worldpay_order) && $worldpay_order['refund_status'] != 1) {
			$order['refundAmount'] = (int)($amount * 100);

			$url = $worldpay_order['order_code'] . '/refund';

			$response_data = $this->sendCurl($url, $order);

			return $response_data;
		} else {
			return false;
		}
	}

	public function updateRefundStatus($worldpay_order_id, $status) {
		$this->db->query("UPDATE `oc_worldpay_order` SET `refund_status` = :status WHERE `worldpay_order_id` = :order_id",
            [
                ':status' => $status,
                ':order_id' => $worldpay_order_id
            ]);
	}

	public function getOrder($order_id) {
		$query = $this->db->query("SELECT * FROM `oc_worldpay_order` WHERE `order_id` = ::order_id LIMIT 1",
            [
                ':order_id' => $order_id
            ]);

		if ($query->num_rows) {
			$order = $query->row;
			$order['transactions'] = $this->getTransactions($order['worldpay_order_id'], $query->row['currency_code']);

			return $order;
		} else {
			return false;
		}
	}

	private function getTransactions($worldpay_order_id, $currency_code) {
		$query = $this->db->query("SELECT * FROM `oc_worldpay_order_transaction` WHERE `worldpay_order_id` = :order_id",
            [
                ':order_id' = $worldpay_order_id
            ]);

		$transactions = [];
		if ($query->num_rows) {
			foreach ($query->rows as $row) {
				$row['amount'] = $this->currency->format($row['amount'], $currency_code, false);
				$transactions[] = $row;
			}
			return $transactions;
		} else {
			return false;
		}
	}

	public function addTransaction($worldpay_order_id, $type, $total) {
		$this->db->query("INSERT INTO `oc_worldpay_order_transaction` SET `worldpay_order_id` = :order_id, `type` = :type, `amount` = :total",
            [
                ':order_id' => $worldpay_order_id,
                ':type' => $type,
                ':total' => $total
            ]);
	}

	public function getTotalReleased($worldpay_order_id) {
		$query = $this->db->query("SELECT SUM(`amount`) AS `total` FROM `oc_worldpay_order_transaction` WHERE `worldpay_order_id` = :order_id AND (`type` = 'payment' OR `type` = 'refund')",
            [
                ':order_id' => $worldpay_order_id
            ]);

		return (double)$query->row['total'];
	}

	public function getTotalRefunded($worldpay_order_id) {
	    // LJK TODO - original query didn't have type, just refund. It should be migrated up to the rest of code
		$query = $this->db->query("SELECT SUM(`amount`) AS `total` FROM `oc_worldpay_order_transaction` WHERE `worldpay_order_id` = :order_id AND `type` = 'refund'",
            [
                ':order_id' => $worldpay_order_id
            ]);

		return (double)$query->row['total'];
	}

	public function sendCurl($url, $order) {

		$json = json_encode($order);

        // LJK TODO: Guzzle
		$curl = curl_init();

		curl_setopt($curl, CURLOPT_URL, 'https://api.worldpay.com/v1/orders/' . $url);
		curl_setopt($curl, CURLOPT_CUSTOMREQUEST, 'POST');
		curl_setopt($curl, CURLOPT_POSTFIELDS, $json);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($curl, CURLOPT_CONNECTTIMEOUT, 0);
		curl_setopt($curl, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_0);
		curl_setopt($curl, CURLOPT_TIMEOUT, 10);
		curl_setopt(
				$curl, CURLOPT_HTTPHEADER, [
			"Authorization: " . $this->config->get('payment_worldpay_service_key'),
			"Content-Type: application/json",
			"Content-Length: " . strlen($json)
            ]
		);

		$result = json_decode(curl_exec($curl));
		curl_close($curl);

		$response = [];

		if (isset($result)) {
			$response['status'] = $result->httpStatusCode;
			$response['message'] = $result->message;
			$response['full_details'] = $result;
		} else {
			$response['status'] = 'success';
		}

		return $response;
	}

	public function logger($message) {
		if ($this->config->get('payment_worldpay_debug') == 1) {
			$log = new Log('worldpay.log');
			$log->write($message);
		}
	}

}
