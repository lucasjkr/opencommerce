<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ModelExtensionPaymentBankTransfer extends Model {
	public function getMethod($address, $total) {
		$this->load->language('extension/payment/bank_transfer');

		$query = $this->db->query("SELECT * FROM oc_zone_to_geo_zone WHERE geo_zone_id = :geo_zone_id AND country_id = :country_id AND (zone_id = :zone_id OR zone_id = '0')",
            [
                ':geo_zone_id' => $this->config->get('payment_bank_transfer_geo_zone_id'),
                ':country_id' => $address['country_id'],
                ':zone_id' => $address['zone_id']
            ]);

		if ($this->config->get('payment_bank_transfer_total') > 0 && $this->config->get('payment_bank_transfer_total') > $total) {
			$status = false;
		} elseif (!$this->config->get('payment_bank_transfer_geo_zone_id')) {
			$status = true;
		} elseif ($query->num_rows) {
			$status = true;
		} else {
			$status = false;
		}

		$method_data = [];

		if ($status) {
			$method_data = array(
				'code'       => 'bank_transfer',
				'title'      => $this->language->get('text_title'),
				'terms'      => '',
				'sort_order' => $this->config->get('payment_bank_transfer_sort_order')
			);
		}

		return $method_data;
	}
}
