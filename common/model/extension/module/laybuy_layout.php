<?php
class ModelExtensionModuleLaybuyLayout extends Model {
	public function getStatusLabel($id) {
		$statuses = $this->getTransactionStatuses();

		foreach ($statuses as $status) {
			if ($status['status_id'] == $id && $status['status_name'] != '') {
				return $status['status_name'];

				break;
			}
		}

		return $id;
	}

	public function getTransactionByOrderId($order_id) {
		$query = $this->db->query("SELECT * FROM `oc_laybuy_transaction` WHERE `order_id` = :order_id ORDER BY `laybuy_ref_no` DESC LIMIT 1",
            [
                ':order_id' => $order_id
            ]);

		return $query->row;
	}

	public function getTransactionStatuses() {
		$this->load->language('extension/payment/laybuy');

		$transaction_statuses = [
			[
				'status_id'		=> 1,
				'status_name'	=> $this->language->get('text_status_1')
            ],
			[
				'status_id'		=> 5,
				'status_name'	=> $this->language->get('text_status_5')
            ],
			[
				'status_id'		=> 7,
				'status_name'	=> $this->language->get('text_status_7')
			],
			[
				'status_id'		=> 50,
				'status_name'	=> $this->language->get('text_status_50')
            ],
			[
				'status_id'		=> 51,
				'status_name'	=> $this->language->get('text_status_51')
            ]
		];

		return $transaction_statuses;
	}

	public function isLayBuyOrder($order_id) {
		$query = $this->db->query("SELECT * FROM `oc_laybuy_transaction` WHERE `order_id` = :order_id",
            [
                ':order_id' => $order_id
            ]);

		if ($query->num_rows) {
			return true;
		} else {
			return false;
		}
	}
}