<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ModelExtensionShippingFree extends Model {
	function getQuote($address) {
		$this->load->language('extension/shipping/free');

        $query = $this->db->query("SELECT * FROM oc_zone_to_geo_zone WHERE geo_zone_id = :geo_zone_id AND country_id = :country_id AND (zone_id = :zone_id_1 OR zone_id = :zone_id_2)",
            [
                ':geo_zone_id' => $this->config->get('shipping_free_geo_zone_id'),
                ':country_id' => $address['country_id'],
                ':zone_id_1' => $address['zone_id'],
                ':zone_id_2' => 0,
            ]);

		if (!$this->config->get('shipping_free_geo_zone_id')) {
			$status = true;
		} elseif ($query->num_rows) {
			$status = true;
		} else {
			$status = false;
		}

		if ($this->cart->getSubTotal() < $this->config->get('shipping_free_total')) {
			$status = false;
		}

		$method_data = [];

		if ($status) {
			$quote_data = [];

			$quote_data['free'] = [
				'code'         => 'free.free',
				'title'        => $this->language->get('text_description'),
				'cost'         => 0.00,
				'tax_class_id' => 0,
				'text'         => $this->currency->format(0.00, $this->session->data['currency'])
			];

			$method_data = [
				'code'       => 'free',
				'title'      => $this->language->get('text_title'),
				'quote'      => $quote_data,
				'sort_order' => $this->config->get('shipping_free_sort_order'),
				'error'      => false
			];
		}

		return $method_data;
	}
}