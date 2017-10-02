<?php
class ModelCheckoutRecurring extends Model {
	public function addRecurring($order_id, $description, $data) {
		$this->db->query("INSERT INTO `oc_order_recurring` SET `order_id` = '" . (int)$order_id . "', `status` = 6, `product_id` = '" . (int)$data['product_id'] . "', `product_name` = '" . $this->db->escape((string)$data['name']) . "', `product_quantity` = '" . $this->db->escape((string)$data['quantity']) . "', `recurring_id` = '" . (int)$data['recurring_id'] . "', `recurring_name` = '" . $this->db->escape((string)$data['name']) . "', `recurring_description` = '" . $this->db->escape($description) . "', `recurring_frequency` = '" . $this->db->escape((string)$data['frequency']) . "', `recurring_cycle` = '" . (int)$data['cycle'] . "', `recurring_duration` = '" . (int)$data['duration'] . "', `recurring_price` = '" . (float)$data['price'] . "', `trial` = '" . (int)$data['trial'] . "', `trial_frequency` = '" . $this->db->escape((string)$data['trial_frequency']) . "', `trial_cycle` = '" . (int)$data['trial_cycle'] . "', `trial_duration` = '" . (int)$data['trial_duration'] . "', `trial_price` = '" . (float)$data['trial_price'] . "', `reference` = ''");

		return $this->db->getLastId();
	}

	public function editReference($order_recurring_id, $reference) {
		$this->db->query("UPDATE oc_order_recurring SET reference = '" . $this->db->escape($reference) . "' WHERE order_recurring_id = '" . (int)$order_recurring_id . "'");

		if ($this->db->countAffected() > 0) {
			return true;
		} else {
			return false;
		}
	}
}
