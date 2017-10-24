<?php
class ModelMarketingCoupon extends Model {
	public function addCoupon($data) {
		$this->db->query("INSERT INTO oc_coupon SET name = :name, code = :code, discount = :discount, type = :type, total = :total, logged = :logged, shipping = :shipping, date_start = :date_start, date_end = :date_end, uses_total = :uses_total, uses_customer = :uses_customer, status = :status",
            [
                ':name' => $data['name'],
                ':code' => $data['code'],
                ':discount' => $data['discount'],
                ':type' => $data['type'],
                ':total' => $data['total'],
                ':logged' => $data['logged'],
                ':shipping' => $data['shipping'],
                ':date_start' => $data['date_start'],
                ':date_end' => $data['date_end'],
                ':uses_total' => $data['uses_total'],
                ':uses_customer' => $data['uses_customer'],
                ':status' => $data['status']
            ]);

		$coupon_id = $this->db->getLastId();

		if (isset($data['coupon_product'])) {
			foreach ($data['coupon_product'] as $product_id) {
				$this->db->query("INSERT INTO oc_coupon_product SET coupon_id = :coupon_id, product_id = :product_id",
                    [
                        ':coupon_id' => $coupon_id,
                        ':product_id' => $product_id
                    ]);
			}
		}

		if (isset($data['coupon_category'])) {
			foreach ($data['coupon_category'] as $category_id) {
				$this->db->query("INSERT INTO oc_coupon_category SET coupon_id = :coupon_id, category_id = :category_id",
                    [
                        ':coupon_id' => $coupon_id,
                        ':category_id' => $category_id
                    ]);
			}
		}

		return $coupon_id;
	}

	public function editCoupon($coupon_id, $data) {
		$this->db->query("UPDATE oc_coupon SET name = :name, code = :code, discount = :discount, type = :type, total = :total, logged = :logged, shipping = :shipping, date_start = :date_start, date_end = :date_end, uses_total = :uses_total, uses_customer = :uses_customer , status = :status WHERE coupon_id = :coupon_id",
            [
                ':name' => $data['name'],
                ':code' => $data['code'],
                ':discount' => $data['discount'],
                ':type' => $data['type'],
                ':total' => $data['total'],
                ':logged' => $data['logged'],
                ':shipping' => $data['shipping'],
                ':date_start' => $data['date_start'],
                ':date_end' => $data['date_end'],
                ':uses_total' => $data['uses_total'],
                ':uses_customer' => $data['uses_customer'],
                ':status' => $data['status'],
                ':coupon_id' => $coupon_id
            ]);

		$this->db->query("DELETE FROM oc_coupon_product WHERE coupon_id = :coupon_id",
            [
                ':coupon_id' => $coupon_id
            ]);

		if (isset($data['coupon_product'])) {
			foreach ($data['coupon_product'] as $product_id) {
                $this->db->query("INSERT INTO oc_coupon_product SET coupon_id = :coupon_id, product_id = :product_id",
                    [
                        ':coupon_id' => $coupon_id,
                        ':product_id' => $product_id
                    ]);
			}
		}

		$this->db->query("DELETE FROM oc_coupon_category WHERE coupon_id = :coupon_id",
            [
                ':coupon_id' => $coupon_id
            ]);

		if (isset($data['coupon_category'])) {
			foreach ($data['coupon_category'] as $category_id) {
                $this->db->query("INSERT INTO oc_coupon_category SET coupon_id = :coupon_id, category_id = :category_id",
                    [
                        ':coupon_id' => $coupon_id,
                        ':category_id' => $category_id
                    ]);
			}
		}
	}

	public function deleteCoupon($coupon_id) {
		$this->db->query("DELETE FROM oc_coupon WHERE coupon_id = :coupon_id",
            [
                ':coupon_id' => $coupon_id
            ]);
		$this->db->query("DELETE FROM oc_coupon_product WHERE coupon_id = :coupon_id",
            [
                ':coupon_id' => $coupon_id
            ]);
		$this->db->query("DELETE FROM oc_coupon_category WHERE coupon_id = :coupon_id",
            [
                ':coupon_id' => $coupon_id
            ]);
		$this->db->query("DELETE FROM oc_coupon_history WHERE coupon_id = :coupon_id",
            [
                ':coupon_id' => $coupon_id
            ]);
	}

	public function getCoupon($coupon_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM oc_coupon WHERE coupon_id = :coupon_id",
            [
                ':coupon_id' => $coupon_id
            ]);

		return $query->row;
	}

	public function getCouponByCode($code) {
		$query = $this->db->query("SELECT DISTINCT * FROM oc_coupon WHERE code = :code",
            [
                ':code' => $code
            ]);

		return $query->row;
	}

	public function getCoupons($data = []) {
		$sql = "SELECT coupon_id, name, code, discount, date_start, date_end, status FROM oc_coupon";

		$sort_data = [
			'name',
			'code',
			'discount',
			'date_start',
			'date_end',
			'status'
		];

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY name";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getCouponProducts($coupon_id) {
		$coupon_product_data = [];

		$query = $this->db->query("SELECT * FROM oc_coupon_product WHERE coupon_id = :coupon_id",
            [
                ':coupon_id' => $coupon_id
            ]);

		foreach ($query->rows as $result) {
			$coupon_product_data[] = $result['product_id'];
		}

		return $coupon_product_data;
	}

	public function getCouponCategories($coupon_id) {
		$coupon_category_data = [];

		$query = $this->db->query("SELECT * FROM oc_coupon_category WHERE coupon_id = :coupon_id",
            [
                ':coupon_id' => $coupon_id
            ]);

		foreach ($query->rows as $result) {
			$coupon_category_data[] = $result['category_id'];
		}

		return $coupon_category_data;
	}

	public function getTotalCoupons() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_coupon");

		return $query->row['total'];
	}

	public function getCouponHistories($coupon_id, $start = 0, $limit = 10) {
		if ($start < 0) {
			$start = 0;
		}

		if ($limit < 1) {
			$limit = 10;
		}

		$query = $this->db->query("SELECT ch.order_id, CONCAT(c.firstname, ' ', c.lastname) AS customer, ch.amount, ch.date_added FROM oc_coupon_history ch LEFT JOIN oc_customer c ON (ch.customer_id = c.customer_id) WHERE ch.coupon_id = :coupon_id ORDER BY ch.date_added ASC LIMIT " . (int)$start . "," . (int)$limit,
            [
                ':coupon_id' => $coupon_id
            ]);

		return $query->rows;
	}

	public function getTotalCouponHistories($coupon_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_coupon_history WHERE coupon_id = :coupone_id",
            [
                ':coupon_id' => $coupon_id
            ]);

		return $query->row['total'];
	}
}