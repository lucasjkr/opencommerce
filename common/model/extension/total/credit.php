<?php
class ModelExtensionTotalCredit extends Model {
	public function getTotal($total) {
		$this->load->language('extension/total/credit');

		$balance = $this->customer->getBalance();

		if ((float)$balance) {
			$credit = min($balance, $total['total']);

			if ((float)$credit > 0) {
				$total['totals'][] = [
					'code'       => 'credit',
					'title'      => $this->language->get('text_credit'),
					'value'      => -$credit,
					'sort_order' => $this->config->get('total_credit_sort_order')
                ];

				$total['total'] -= $credit;
			}
		}
	}

	public function confirm($order_info, $order_total) {
		$this->load->language('extension/total/credit');

		if ($order_info['customer_id']) {
			$this->db->query("INSERT INTO oc_customer_transaction SET customer_id = :customer_id, order_id = :order_id, description = :description, amount = :amount",
                [
                    ':customer_id' => $order_info['customer_id'],
                    ':order_id' => $order_info['order_id'],
                    ':description' => sprintf($this->language->get('text_order_id'), (int)$order_info['order_id']),
                    ':amount' => $order_total['value']
                ]);
		}
	}

	public function unconfirm($order_id) {
		$this->db->query("DELETE FROM oc_customer_transaction WHERE order_id = :order_id ",
            [
                ':order_id' => $order_id
            ]);
	}
}
