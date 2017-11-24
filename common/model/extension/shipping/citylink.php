<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ModelExtensionShippingCitylink extends Model {
	function getQuote($address) {
		$this->load->language('extension/shipping/citylink');

        $query = $this->db->query("SELECT * FROM oc_zone_to_geo_zone WHERE geo_zone_id = :geo_zone_id AND country_id = :country_id AND (zone_id = :zone_id_1 OR zone_id = :zone_id_2)",
            [
                ':geo_zone_id' => $this->config->get('shipping_citylink_geo_zone_id'),
                ':country_id' => $address['country_id'],
                ':zone_id_1' => $address['zone_id'],
                ':zone_id_2' => 0,
            ]);


        if (!$this->config->get('shipping_citylink_geo_zone_id')) {
			$status = true;
		} elseif ($query->num_rows) {
			$status = true;
		} else {
			$status = false;
		}

		$method_data = [];

		if ($status) {
			$cost = 0;
			$weight = $this->cart->getWeight();

			$rates = explode(',', $this->config->get('shipping_citylink_rate'));

			foreach ($rates as $rate) {
				$data = explode(':', $rate);

				if ($data[0] >= $weight) {
					if (isset($data[1])) {
						$cost = $data[1];
					}

					break;
				}
			}

			$quote_data = [];

			if ((float)$cost) {
				$quote_data['citylink'] = [
					'code'         => 'citylink.citylink',
					'title'        => $this->language->get('text_title') . '  (' . $this->language->get('text_weight') . ' ' . $this->weight->format($weight, $this->config->get('config_weight_class_id')) . ')',
					'cost'         => $cost,
					'tax_class_id' => $this->config->get('shipping_citylink_tax_class_id'),
					'text'         => $this->currency->format($this->tax->calculate($cost, $this->config->get('shipping_citylink_tax_class_id'), $this->config->get('config_tax')), $this->session->data['currency'])
                ];

				$method_data = [
					'code'       => 'citylink',
					'title'      => $this->language->get('text_title'),
					'quote'      => $quote_data,
					'sort_order' => $this->config->get('shipping_citylink_sort_order'),
					'error'      => false
                ];
			}
		}

		return $method_data;
	}
}