<?php
class ModelExtensionOpenBayAmazonusListing extends Model {
	public function listingSuccessful($product_id) {
		$this->db->query("UPDATE `oc_amazonus_product` SET `status` = 'ok' WHERE product_id = " . (int)$product_id . " AND `version` = 3");
	}

	public function listingFailed($product_id, $messages) {
		$this->db->query("UPDATE `oc_amazonus_product` SET `status` = 'error', `messages` = '" . $this->db->escape(json_encode($messages)) . "' WHERE product_id = " . (int)$product_id . " AND `version` = 3");
	}
}