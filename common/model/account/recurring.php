<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ModelAccountRecurring extends Model {
	public function getOrderRecurring($order_recurring_id) {
		$query = $this->db->query("SELECT `or`.*,`o`.`payment_method`,`o`.`payment_code`,`o`.`currency_code` FROM `oc_order_recurring` `or` LEFT JOIN `oc_order` `o` ON `or`.`order_id` = `o`.`order_id` WHERE `or`.`order_recurring_id` = :order_recurring_id AND `o`.`customer_id` = :customer_id",
            [
                ':order_recurring_id' => $order_recurring_id,
                ':customer_id' => $this->customer->getId()
            ]);

		return $query->row;
	}

	public function getOrderRecurrings($start = 0, $limit = 20) {
		if ($start < 0) {
			$start = 0;
		}

		if ($limit < 1) {
			$limit = 1;
		}

		$query = $this->db->query("SELECT `or`.*,`o`.`payment_method`,`o`.`currency_id`,`o`.`currency_value` FROM `oc_order_recurring` `or` LEFT JOIN `oc_order` `o` ON `or`.`order_id` = `o`.`order_id` WHERE `o`.`customer_id` = :customer_id ORDER BY `o`.`order_id` DESC LIMIT " . (int)$start . "," . (int)$limit,
            [
                ':customer_id' => $this->customer->getId()
            ]);

		return $query->rows;
	}
	
	public function getOrderRecurringByReference($reference) {
		$query = $this->db->query("SELECT * FROM `oc_order_recurring` WHERE `reference` = :reference",
            [
                ':reference' => $reference
            ]);

		return $query->row;
	}

	public function getOrderRecurringTransactions($order_recurring_id) {
		$query = $this->db->query("SELECT * FROM `oc_order_recurring_transaction` WHERE `order_recurring_id` = :order_recurring_id",
            [
                ':order_recurring_id' => $order_recurring_id
            ]);

		return $query->rows;
	}

	public function getTotalOrderRecurrings() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `oc_order_recurring` `or` LEFT JOIN `oc_order` `o` ON `or`.`order_id` = `o`.`order_id` WHERE `o`.`customer_id` = :customer_id",
            [
                ':customer_id' => $this->customer->getId()
            ]);

		return $query->row['total'];
	}
	
	public function addOrderRecurringTransaction($order_recurring_id, $type) {
		$this->db->query("INSERT INTO `oc_order_recurring_transaction` SET `order_recurring_id` = :order_recurring_id, `type` = :type",
            [
                ':order_recurring_id' => $order_recurring_id,
                ':type' => $type
            ]);
	}	
	
	public function editOrderRecurringStatus($order_recurring_id, $status) {
		$this->db->query("UPDATE `oc_order_recurring` SET `status` = :status WHERE `order_recurring_id` = :order_recurring_id",
            [
                ':status' => $status,
                ':order_recurring_id' => $order_recurring_id
            ]);
	}	
}