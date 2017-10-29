<?php
class ModelExtensionPaymentFirstdataAdmin extends Model {
	public function install() {
		$this->db->query("
			CREATE TABLE IF NOT EXISTS `oc_firstdata_order` (
			  `firstdata_order_id` INT(11) NOT NULL AUTO_INCREMENT,
			  `order_id` INT(11) NOT NULL,
			  `order_ref` CHAR(50) NOT NULL,
			  `order_ref_previous` CHAR(50) NOT NULL,
			  `pasref` VARCHAR(50) NOT NULL,
			  `pasref_previous` VARCHAR(50) NOT NULL,
			  `tdate` DATETIME NOT NULL,
			  `capture_status` INT(1) DEFAULT NULL,
			  `void_status` INT(1) DEFAULT NULL,
			  `currency_code` CHAR(3) NOT NULL,
			  `authcode` VARCHAR(30) NOT NULL,
			  `account` VARCHAR(30) NOT NULL,
			  `total` DECIMAL( 10, 2 ) NOT NULL,
			  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
              `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			  PRIMARY KEY (`firstdata_order_id`)
			) ENGINE=InnoDB DEFAULT CHARSET=utf8;");

		$this->db->query("
			CREATE TABLE IF NOT EXISTS `oc_firstdata_order_transaction` (
			  `firstdata_order_transaction_id` INT(11) NOT NULL AUTO_INCREMENT,
			  `firstdata_order_id` INT(11) NOT NULL,
			  `type` ENUM('auth', 'payment', 'void') DEFAULT NULL,
			  `amount` DECIMAL( 10, 2 ) NOT NULL,
			  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
              `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			  PRIMARY KEY (`firstdata_order_transaction_id`)
			) ENGINE=InnoDB DEFAULT CHARSET=utf8;");

		$this->db->query("
			CREATE TABLE IF NOT EXISTS `oc_firstdata_card` (
			  `firstdata_card_id` INT(11) NOT NULL AUTO_INCREMENT,
			  `customer_id` INT(11) NOT NULL,
			  `digits` CHAR(25) NOT NULL,
			  `expire_month` INT(2) NOT NULL,
			  `expire_year` INT(2) NOT NULL,
			  `token` CHAR(64) NOT NULL,
              `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
              `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			  PRIMARY KEY (`firstdata_card_id`)
			) ENGINE=InnoDB DEFAULT CHARSET=utf8;");
	}

	public function uninstall() {
		$this->db->query("DROP TABLE IF EXISTS `oc_firstdata_order`;");
		$this->db->query("DROP TABLE IF EXISTS `oc_firstdata_order_transaction`;");
		$this->db->query("DROP TABLE IF EXISTS `oc_firstdata_card`;");
	}

	public function void($order_id) {
		$firstdata_order = $this->getOrder($order_id);

		if (!empty($firstdata_order)) {
			$timestamp = strftime("%Y%m%d%H%M%S");
			$merchant_id = $this->config->get('payment_firstdata_merchant_id');
			$secret = $this->config->get('payment_firstdata_secret');

			$this->logger('Void hash construct: ' . $timestamp . ' . ' . $merchant_id . ' . ' . $firstdata_order['order_ref'] . ' . . . ');

			$tmp = $timestamp . ' . ' . $merchant_id . ' . ' . $firstdata_order['order_ref'] . ' . . . ';
			$hash = sha1($tmp);
			$tmp = $hash . ' . ' . $secret;
			$hash = sha1($tmp);

			$xml = '';
			$xml .= '<request type="void" timestamp="' . $timestamp . '">';
			$xml .= '<merchantid>' . $merchant_id . '</merchantid>';
			$xml .= '<account>' . $firstdata_order['account'] . '</account>';
			$xml .= '<orderid>' . $firstdata_order['order_ref'] . '</orderid>';
			$xml .= '<pasref>' . $firstdata_order['pasref'] . '</pasref>';
			$xml .= '<authcode>' . $firstdata_order['authcode'] . '</authcode>';
			$xml .= '<sha1hash>' . $hash . '</sha1hash>';
			$xml .= '</request>';

			$this->logger('Void XML request:\r\n' . print_r(simplexml_load_string($xml), 1));

			$ch = curl_init();
			curl_setopt($ch, CURLOPT_URL, "https://epage.payandshop.com/epage-remote.cgi");
			curl_setopt($ch, CURLOPT_POST, 1);
			curl_setopt($ch, CURLOPT_USERAGENT, "OpenCart " . VERSION);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
			curl_setopt($ch, CURLOPT_POSTFIELDS, $xml);
			curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
			$response = curl_exec ($ch);
			curl_close ($ch);

			return simplexml_load_string($response);
		} else {
			return false;
		}
	}

	public function updateVoidStatus($firstdata_order_id, $status) {
		$this->db->query("UPDATE `oc_firstdata_order` SET `void_status` = :status WHERE `firstdata_order_id` = :order_id",
            [
                ':status' => $status,
                ':order_id' => $firstdata_order_id,
            ]);
	}

	public function capture($order_id, $amount) {
		$firstdata_order = $this->getOrder($order_id);

		if (!empty($firstdata_order) && $firstdata_order['capture_status'] == 0) {
			$timestamp = strftime("%Y%m%d%H%M%S");
			$merchant_id = $this->config->get('payment_firstdata_merchant_id');
			$secret = $this->config->get('payment_firstdata_secret');

			if ($firstdata_order['settle_type'] == 2) {
				$this->logger('Capture hash construct: ' . $timestamp . ' . ' . $merchant_id . ' . ' . $firstdata_order['order_ref'] . ' . ' . (int)round($amount*100) . ' . ' . (string)$firstdata_order['currency_code'] . ' . ');

				$tmp = $timestamp . ' . ' . $merchant_id . ' . ' . $firstdata_order['order_ref'] . ' . ' . (int)round($amount*100) . ' . ' . (string)$firstdata_order['currency_code'] . ' . ';
				$hash = sha1($tmp);
				$tmp = $hash . ' . ' . $secret;
				$hash = sha1($tmp);

				$settle_type = 'multisettle';
				$xml_amount = '<amount currency="' . (string)$firstdata_order['currency_code'] . '">' . (int)round($amount*100) . '</amount>';
			} else {
				$this->logger('Capture hash construct: ' . $timestamp . ' . ' . $merchant_id . ' . ' . $firstdata_order['order_ref'] . ' . ' . (int)round($amount*100) . ' . ' . (string)$firstdata_order['currency_code'] . ' . ');

				$tmp = $timestamp . ' . ' . $merchant_id . ' . ' . $firstdata_order['order_ref'] . ' . ' . (int)round($amount*100) . ' . ' . (string)$firstdata_order['currency_code'] . ' . ';
				$hash = sha1($tmp);
				$tmp = $hash . ' . ' . $secret;
				$hash = sha1($tmp);

				$settle_type = 'settle';
				$xml_amount = '<amount currency="' . (string)$firstdata_order['currency_code'] . '">' . (int)round($amount*100) . '</amount>';
			}

			$xml = '';
			$xml .= '<request type="' . $settle_type . '" timestamp="' . $timestamp . '">';
			$xml .= '<merchantid>' . $merchant_id . '</merchantid>';
			$xml .= '<account>' . $firstdata_order['account'] . '</account>';
			$xml .= '<orderid>' . $firstdata_order['order_ref'] . '</orderid>';
			$xml .= $xml_amount;
			$xml .= '<pasref>' . $firstdata_order['pasref'] . '</pasref>';
			$xml .= '<autosettle flag="1" />';
			$xml .= '<authcode>' . $firstdata_order['authcode'] . '</authcode>';
			$xml .= '<sha1hash>' . $hash . '</sha1hash>';
			$xml .= '</request>';

			$this->logger('Settle XML request:\r\n' . print_r(simplexml_load_string($xml), 1));

            // LJKR TODO: Guzzle
			$ch = curl_init();
			curl_setopt($ch, CURLOPT_URL, "https://epage.payandshop.com/epage-remote.cgi");
			curl_setopt($ch, CURLOPT_POST, 1);
			curl_setopt($ch, CURLOPT_USERAGENT, "OpenCart " . VERSION);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
			curl_setopt($ch, CURLOPT_POSTFIELDS, $xml);
			curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
			$response = curl_exec ($ch);
			curl_close ($ch);

			return simplexml_load_string($response);
		} else {
			return false;
		}
	}

	public function updateCaptureStatus($firstdata_order_id, $status) {
		$this->db->query("UPDATE `oc_firstdata_order` SET `capture_status` = :status WHERE `firstdata_order_id` = :order_id",
            [
                ':status' => $status,
                ':order_id' => $firstdata_order_id
            ]);
	}

	public function getOrder($order_id) {
		$this->logger('getOrder - ' . $order_id);

		$qry = $this->db->query("SELECT * FROM `oc_firstdata_order` WHERE `order_id` = :order_id LIMIT 1",
            [
                ':order_id' => $order_id
            ]);

		if ($qry->num_rows) {
			$order = $qry->row;
			$order['transactions'] = $this->getTransactions($order['firstdata_order_id']);

			$this->logger(print_r($order, 1));

			return $order;
		} else {
			return false;
		}
	}

	private function getTransactions($firstdata_order_id) {
		$qry = $this->db->query("SELECT * FROM `oc_firstdata_order_transaction` WHERE `firstdata_order_id` = :order_id",
            [
                ':order_id' = $firstdata_order_id
            ]);

		if ($qry->num_rows) {
			return $qry->rows;
		} else {
			return false;
		}
	}

	public function addTransaction($firstdata_order_id, $type, $total) {
		$this->db->query("INSERT INTO `oc_firstdata_order_transaction` SET `firstdata_order_id` = :order_id, `type` = :type, `amount` = :total",
            [
                ':order_id' => $firstdata_order_id,
                ':type' => $type,
                ':total' => $total
            ]);
	}

	public function logger($message) {
		if ($this->config->get('payment_firstdata_debug') == 1) {
			$log = new Log('firstdata.log');
			$log->write($message);
		}
	}

	public function getTotalCaptured($firstdata_order_id) {
		$query = $this->db->query("SELECT SUM(`amount`) AS `total` FROM `oc_firstdata_order_transaction` WHERE `firstdata_order_id` = :order_id AND (`type` = 'payment' OR `type` = 'refund')",
            [
                ':order_id' => $firstdata_order_id
            ]);

		return (float)$query->row['total'];
	}

	public function mapCurrency($code) {
		$currency = [
			'GBP' => 826,
			'USD' => 840,
			'EUR' => 978,
		];

		if (array_key_exists($code, $currency)) {
			return $currency[$code];
		} else {
			return false;
		}
	}
}