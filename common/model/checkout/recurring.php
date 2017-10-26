<?php
class ModelCheckoutRecurring extends Model {
	public function addRecurring($order_id, $description, $data) {
		$this->db->query("INSERT INTO `oc_order_recurring` SET `order_id` = :order_id, `status` = :status, `product_id` = :product_id, `product_name` = :product_name, `product_quantity` = :product_quantity, `recurring_id` = :recurring_id, `recurring_name` = :recurring_name, `recurring_description` = :recurring_description, `recurring_frequency` = :recurring_frequency, `recurring_cycle` = :recurring_cycle, `recurring_duration` = :recurring_duration, `recurring_price` = :recurring_price, `trial` = :trial, `trial_frequency` = :trial_frequency, `trial_cycle` = :trial_cycle, `trial_duration` = :trial_duration, `trial_price` = :trial_price, `reference` = :reference",
            [
                ':order_id' => $order_id,
                ':status' => 6,
                ':product_id' => $data['product_id'],
                ':product_name' => $data['name'],
                ':product_quantity' => $data['quantity'],
                ':recurring_id' => $data['recurring_id'],
                ':recurring_name' => $data['name'],
                ':recurring_description' => $description,
                ':recurring_frequency' => $data['frequency'],
                ':recurring_cycle' => $data['cycle'],
                ':recurring_duration' => $data['duration'],
                ':recurring_price' => $data['price'],
                ':trial' => $data['trial'],
                ':trial_frequency' => $data['trial_frequency'],
                ':trial_cycle' => $data['trial_cycle'],
                ':trial_duration' => $data['trial_duration'],
                ':trial_price' => $data['trial_price'],
                ':refernce' => ''
            ]);

		return $this->db->getLastId();
	}

	public function editReference($order_recurring_id, $reference) {
		$this->db->query("UPDATE oc_order_recurring SET reference = :reference WHERE order_recurring_id = :order_recurring_id",
            [
                ':reference' => $reference,
                ':order_recurring_id' => $order_recurring_id
            ]);

		if ($this->db->countAffected() > 0) {
			return true;
		} else {
			return false;
		}
	}
}
