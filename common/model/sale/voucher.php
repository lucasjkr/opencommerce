<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ModelSaleVoucher extends Model {
	public function addVoucher($data) {
		$this->db->query("INSERT INTO oc_voucher SET code = :code, from_name = :from_name, from_email = :from_email, to_name = :to_name, to_email = :to_email, voucher_theme_id = :voucher_theme_id, message = :message, amount = :amount, status = :status",
            [
                ':code' => $data['code'],
                ':from_name' => $data['from_name'],
                ':from_email' => $data['from_email'],
                ':to_name' => $data['to_name'],
                ':to_email' => $data['to_email'],
                ':voucher_theme_id' => $data['voucher_theme_id'],
                ':message' => $data['message'],
                ':amount' => $data['amount'],
                ':status' => $data['status']
            ]);

		return $this->db->getLastId();
	}

	public function editVoucher($voucher_id, $data) {
		$this->db->query("UPDATE oc_voucher SET code = :code, from_name = :from_name, from_email = :from_email, to_name = :to_name, 
to_email = :to_email, voucher_theme_id = :voucher_theme_id, message = :message, amount = :amount, status = :status WHERE voucher_id = :voucher_id",
            [
                ':code' => $data['code'],
                ':from_name' => $data['from_name'],
                ':from_email' => $data['from_email'],
                ':to_name' => $data['to_name'],
                ':to_email' => $data['to_email'],
                ':voucher_theme_id' => $data['voucher_theme_id'],
                ':message' => $data['message'],
                ':amount' => $data['amount'],
                ':status' => $data['status'],
                ':voucher_id' => $voucher_id
            ]);
	}

	public function deleteVoucher($voucher_id) {
		$this->db->query("DELETE FROM oc_voucher WHERE voucher_id = :voucher_id",
            [
                ':voucher_id' => $voucher_id
            ]);
		$this->db->query("DELETE FROM oc_voucher_history WHERE voucher_id = :voucher_id",
            [
                ':voucher_id' => $voucher_id
            ]);
	}

	public function getVoucher($voucher_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM oc_voucher WHERE voucher_id = :voucher_id",
            [
                ':voucher_id' => $voucher_id
            ]);

		return $query->row;
	}

	public function getVoucherByCode($code) {
		$query = $this->db->query("SELECT DISTINCT * FROM oc_voucher WHERE code = :code",
            [
                ':code' => $code
            ]);

		return $query->row;
	}

	public function getVouchers($data = []) {
		$sql = "SELECT v.voucher_id, v.order_id, v.code, v.from_name, v.from_email, v.to_name, v.to_email, (SELECT vtd.name FROM oc_voucher_theme_description vtd WHERE vtd.voucher_theme_id = v.voucher_theme_id AND vtd.language_id = :language_id) AS theme, v.amount, v.status, v.date_added FROM oc_voucher v";
        $args[':language_id'] = $this->config->get('config_language_id');

		$sort_data = [
			'v.code',
			'v.from_name',
			'v.to_name',
			'theme',
			'v.amount',
			'v.status',
			'v.date_added'
		];

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY v.date_added";
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

		$query = $this->db->query($sql, $args);

		return $query->rows;
	}

	public function getTotalVouchers() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_voucher");

		return $query->row['total'];
	}

	public function getTotalVouchersByVoucherThemeId($voucher_theme_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_voucher WHERE voucher_theme_id = :voucher_theme_id ",
            [
                ':voucher_theme_id' => $voucher_theme_id
            ]);

		return $query->row['total'];
	}

	public function getVoucherHistories($voucher_id, $start = 0, $limit = 10) {
		if ($start < 0) {
			$start = 0;
		}

		if ($limit < 1) {
			$limit = 10;
		}

		$query = $this->db->query("SELECT vh.order_id, CONCAT(o.firstname, ' ', o.lastname) AS customer, vh.amount, vh.date_added FROM oc_voucher_history vh LEFT JOIN `oc_order` o ON (vh.order_id = o.order_id) WHERE vh.voucher_id = :voucher_id ORDER BY vh.date_added ASC LIMIT " . (int)$start . "," . (int)$limit,
            [
                ':voucher_id' => $voucher_id
            ]);

		return $query->rows;
	}

	public function getTotalVoucherHistories($voucher_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_voucher_history WHERE voucher_id = :voucher_id",
            [
                ':voucher_id' => $voucher_id
            ]);

		return $query->row['total'];
	}
}
