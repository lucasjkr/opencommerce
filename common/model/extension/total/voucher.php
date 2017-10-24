<?php
class ModelExtensionTotalVoucher extends Model {
	public function addVoucher($order_id, $data) {
		$this->db->query("INSERT INTO oc_voucher SET order_id = :order_id, code = :code, from_name = :from_name, from_email = :from_email, to_name = :to_name, to_email = :to_email, voucher_theme_id = :voucher_theme_id, message = :message, amount = :amount, status = '1'",
            [
                ':order_id' => $order_id,
                ':code' => $data['code'],
                ':from_name' => $data['from_name'],
                ':from_email' => $data['from_email'],
                ':to_name' => $data['to_name'],
                ':to_email' => $data['to_email'],
                ':voucher_theme_id' => $data['voucher_theme_id'],
                ':message' => $data['message'],
                ':amount' => $data['amount']
            ]);

		return $this->db->getLastId();
	}

	public function disableVoucher($order_id) {
		$this->db->query("UPDATE oc_voucher SET status = '0' WHERE order_id = :order_id",
            [
                ':order_id' => $order_id
            ]);
	}

	public function getVoucher($code) {
		$status = true;

		$voucher_query = $this->db->query("SELECT *, vtd.name AS theme FROM oc_voucher v LEFT JOIN oc_voucher_theme vt ON (v.voucher_theme_id = vt.voucher_theme_id) LEFT JOIN oc_voucher_theme_description vtd ON (vt.voucher_theme_id = vtd.voucher_theme_id) WHERE v.code = :code AND vtd.language_id = :language_id AND v.status = '1'",
            [
                ':code' => $code,
                ':language_id' => $this->config->get('config_language_id')
            ]);

		if ($voucher_query->num_rows) {
			if ($voucher_query->row['order_id']) {
				$implode = [];

				foreach ($this->config->get('config_complete_status') as $order_status_id) {
				    // LJK TODO: We need to parameterize these implodes
                    // Probably just need to set $i = 0, and then create the array with $i++
					$implode[] = "'" . (int)$order_status_id . "'";
				}

				$order_query = $this->db->query("SELECT order_id FROM `oc_order` WHERE order_id = :order_id AND order_status_id IN(" . implode(",", $implode) . ")",
                    [
                        ':order_id' => $voucher_query->row['order_id']
                    ]);

				if (!$order_query->num_rows) {
					$status = false;
				}

				$order_voucher_query = $this->db->query("SELECT order_voucher_id FROM `oc_order_voucher` WHERE order_id = :order_id AND voucher_id = :voucher_id",
                    [
                        ':order_id' => $voucher_query->row['order_id'],
                        ':voucher_id' => $voucher_query->row['voucher_id'],
                    ]);

				if (!$order_voucher_query->num_rows) {
					$status = false;
				}
			}

			$voucher_history_query = $this->db->query("SELECT SUM(amount) AS total FROM `oc_voucher_history` vh WHERE vh.voucher_id = :voucher_id GROUP BY vh.voucher_id",
                [
                    ':voucher_id' => $voucher_query->row['voucher_id']
                ]);

			if ($voucher_history_query->num_rows) {
				$amount = $voucher_query->row['amount'] + $voucher_history_query->row['total'];
			} else {
				$amount = $voucher_query->row['amount'];
			}

			if ($amount <= 0) {
				$status = false;
			}
		} else {
			$status = false;
		}

		if ($status) {
			return [
				'voucher_id'       => $voucher_query->row['voucher_id'],
				'code'             => $voucher_query->row['code'],
				'from_name'        => $voucher_query->row['from_name'],
				'from_email'       => $voucher_query->row['from_email'],
				'to_name'          => $voucher_query->row['to_name'],
				'to_email'         => $voucher_query->row['to_email'],
				'voucher_theme_id' => $voucher_query->row['voucher_theme_id'],
				'theme'            => $voucher_query->row['theme'],
				'message'          => $voucher_query->row['message'],
				'image'            => $voucher_query->row['image'],
				'amount'           => $amount,
				'status'           => $voucher_query->row['status'],
				'date_added'       => $voucher_query->row['date_added']
			];
		}
	}

	public function getTotal($total) {
		if (isset($this->session->data['voucher'])) {
			$this->load->language('extension/total/voucher', 'voucher');

			$voucher_info = $this->getVoucher($this->session->data['voucher']);

			if ($voucher_info) {
				$amount = min($voucher_info['amount'], $total['total']);
				
				if ($amount > 0) {
					$total['totals'][] = [
						'code'       => 'voucher',
						'title'      => sprintf($this->language->get('voucher')->get('text_voucher'), $this->session->data['voucher']),
						'value'      => -$amount,
						'sort_order' => $this->config->get('total_voucher_sort_order')
					];

					$total['total'] -= $amount;
				} else {
					unset($this->session->data['voucher']);
				}
			} else {
				unset($this->session->data['voucher']);
			}
		}
	}

	// LJK TODO: confirm accepts $order_info, but doesn't use it?
    // Need to check controllers, see if this is being used or not
	public function confirm($order_info, $order_total) {
		$code = '';

		$start = strpos($order_total['title'], '(') + 1;
		$end = strrpos($order_total['title'], ')');

		if ($start && $end) {
			$code = substr($order_total['title'], $start, $end - $start);
		}

		if ($code) {
			$voucher_info = $this->getVoucher($code);

			if ($voucher_info) {
				$this->db->query("INSERT INTO `oc_voucher_history` SET voucher_id = :voucher_id, order_id = :order_id, amount = :amount",
                    [
                        ':voucher_id' => $voucher_info['voucher_id'],
                        ':order_id' => $voucher_info['order_id'],
                        ':amount' => $order_total['value']
                    ]);
			} else {
				return $this->config->get('config_fraud_status_id');
			}
		}
	}

	public function unconfirm($order_id) {
		$this->db->query("DELETE FROM `oc_voucher_history` WHERE order_id = :order_id",
            [
                ':order_id' => $order_id
            ]);
	}
}
