<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ModelAccountWishlist extends Model {
	public function addWishlist($product_id) {
		$this->db->query("DELETE FROM oc_customer_wishlist WHERE customer_id = :customer_id AND product_id = :product_id",
            [
                ':customer_id' => $this->customer->getId(),
                ':product_id' => $product_id
            ]);

		$this->db->query("INSERT INTO oc_customer_wishlist SET customer_id = :customer_id, product_id = :product_id",
            [
                ':customer_id' => $this->customer->getId(),
                ':product_id' => $product_id
            ]);
	}

	public function deleteWishlist($product_id) {
		$this->db->query("DELETE FROM oc_customer_wishlist WHERE customer_id = :customer_id AND product_id = :product_id",
            [
                ':customer_id' => $this->customer->getId(),
                ':product_id' => $product_id
            ]);
	}

	public function getWishlist() {
        $query = $this->db->query("SELECT * FROM oc_customer_wishlist WHERE customer_id = :customer_id",
            [
                ':customer_id' => $this->customer->getId()
            ]);

		return $query->rows;
	}

	public function getTotalWishlist() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_customer_wishlist WHERE customer_id = :customer_id",
            [
                ':customer_id' => $this->customer->getId()
            ]);

		return $query->row['total'];
	}
}
