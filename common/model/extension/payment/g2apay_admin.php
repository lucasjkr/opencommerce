<?php

class ModelExtensionPaymentG2aPayAdmin extends Model {

	public function install() {
		$this->db->query("
			CREATE TABLE `oc_g2apay_order` (
				`g2apay_order_id` INT(11) NOT NULL AUTO_INCREMENT,
				`order_id` int(11) NOT NULL,
				`g2apay_transaction_id` varchar(255) NOT NULL,
				`refund_status` INT(1) DEFAULT NULL,
				`currency_code` CHAR(3) NOT NULL,
				`total` DECIMAL( 10, 2 ) NOT NULL,
				`date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
				KEY `g2apay_transaction_id` (`g2apay_transaction_id`),
				PRIMARY KEY `g2apay_order_id` (`g2apay_order_id`)
			) ENGINE=InnoDB DEFAULT CHARSET=utf8;
		");

		$this->db->query("
			CREATE TABLE IF NOT EXISTS `oc_g2apay_order_transaction` (
			  `g2apay_order_transaction_id` INT(11) NOT NULL AUTO_INCREMENT,
			  `g2apay_order_id` INT(11) NOT NULL,
			  `type` ENUM('payment', 'refund') DEFAULT NULL,
			  `amount` DECIMAL( 10, 2 ) NOT NULL,
			  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
              `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			  PRIMARY KEY (`g2apay_order_transaction_id`)
			) ENGINE=InnoDB DEFAULT CHARSET=utf8;
			");
	}

	public function uninstall() {
		$this->db->query("DROP TABLE IF EXISTS `oc_g2apay_order`;");
		$this->db->query("DROP TABLE IF EXISTS `oc_g2apay_order_transaction`;");
	}

	public function getOrder($order_id) {

		$qry = $this->db->query("SELECT * FROM `oc_g2apay_order` WHERE `order_id` = : order_id LIMIT 1",
            [
                ':order_id' => $order_id
            ]);

		if ($qry->num_rows) {
			$order = $qry->row;
			$order['transactions'] = $this->getTransactions($order['g2apay_order_id'], $qry->row['currency_code']);
			return $order;
		} else {
			return false;
		}
	}

	public function getTotalReleased($g2apay_order_id) {
		$query = $this->db->query("SELECT SUM(`amount`) AS `total` FROM `oc_g2apay_order_transaction` WHERE `g2apay_order_id` = :order_id AND (`type` = 'payment' OR `type` = 'refund')",
            [
                ':order_id' => $g2apay_order_id
            ]);

		return (double)$query->row['total'];
	}

	public function refund($g2apay_order, $amount) {
		if (!empty($g2apay_order) && $g2apay_order['refund_status'] != 1) {
			if ($this->config->get('payment_g2apay_environment') == 1) {
				$url = 'https://pay.g2a.com/rest/transactions/' . $g2apay_order['g2apay_transaction_id'];
			} else {
				$url = 'https://www.test.pay.g2a.com/rest/transactions/' . $g2apay_order['g2apay_transaction_id'];
			}

			$refunded_amount = round($amount, 2);

			$string = $g2apay_order['g2apay_transaction_id'] . $g2apay_order['order_id'] . round($g2apay_order['total'], 2) . $refunded_amount . html_entity_decode($this->config->get('payment_g2apay_secret'));
			$hash = hash('sha256', $string);

			$fields = [
				'action' => 'refund',
				'amount' => $refunded_amount,
				'hash' => $hash,
            ];

			return $this->sendCurl($url, $fields);
		} else {
			return false;
		}
	}

	public function updateRefundStatus($g2apay_order_id, $status) {
		$this->db->query("UPDATE `oc_g2apay_order` SET `refund_status` = :refund_status WHERE `g2apay_order_id` = :order_id",
            [
                ':refund_status' => $status,
                ':order_id' => $g2apay_order_id
            ]);
	}

	private function getTransactions($g2apay_order_id, $currency_code) {
		$query = $this->db->query("SELECT * FROM `oc_g2apay_order_transaction` WHERE `g2apay_order_id` = :order_id",
            [
                ':order_id' => $g2apay_order_id
            ]);

		$transactions = [];
		if ($query->num_rows) {
			foreach ($query->rows as $row) {
				$row['amount'] = $this->currency->format($row['amount'], $currency_code, true, true);
				$transactions[] = $row;
			}
			return $transactions;
		} else {
			return false;
		}
	}

	public function addTransaction($g2apay_order_id, $type, $total) {
		$this->db->query("INSERT INTO `oc_g2apay_order_transaction` SET `g2apay_order_id` = :order_id, `type` = :type, `amount` = :amount",
            [
                ':order_id' => $g2apay_order_id,
                ':type' => $type,
                ':amount' => $total
            ]);
	}

	public function getTotalRefunded($g2apay_order_id) {
		$query = $this->db->query("SELECT SUM(`amount`) AS `total` FROM `oc_g2apay_order_transaction` WHERE `g2apay_order_id` = :order_id AND 'refund'",
            [
                ':order_id' => $g2apay_order_id
            ]);

		return (double)$query->row['total'];
	}

	public function sendCurl($url, $fields) {
	    // LJK TODO Guzzle
		$curl = curl_init($url);
		curl_setopt($curl, CURLOPT_URL, $url);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($curl, CURLOPT_CUSTOMREQUEST, "PUT");
		curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query($fields));

		$auth_hash = hash('sha256', $this->config->get('payment_g2apay_api_hash') . $this->config->get('payment_g2apay_username') . html_entity_decode($this->config->get('payment_g2apay_secret')));
		$authorization = $this->config->get('payment_g2apay_api_hash') . ";" . $auth_hash;
		curl_setopt(
				$curl, CURLOPT_HTTPHEADER, [
			"Authorization: " . $authorization
            ]
		);

		$response = json_decode(curl_exec($curl));

		curl_close($curl);
		if (is_object($response)) {
			return (string)$response->status;
		} else {
			return str_replace('"', "", $response);
		}
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
