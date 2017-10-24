<?php
class ModelExtensionShippingParcelforce48 extends Model {
	function getQuote($address) {
		$this->load->language('extension/shipping/parcelforce_48');

        $query = $this->db->query("SELECT * FROM oc_zone_to_geo_zone WHERE geo_zone_id = :geo_zone_id AND country_id = :country_id AND (zone_id = :zone_id_1 OR zone_id = :zone_id_2",
            [
                ':geo_zone_id' => $this->config->get('shipping_parcelforce_48_geo_zone_id'),
                ':country_id' => $address['country_id'],
                ':zone_id_1' => $address['zone_id'],
                ':zone_id_2' => 0,

            ]);

		if (!$this->config->get('shipping_parcelforce_48_geo_zone_id')) {
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
			$sub_total = $this->cart->getSubTotal();

			$rates = explode(',', $this->config->get('shipping_parcelforce_48_rate'));

			foreach ($rates as $rate) {
				$data = explode(':', $rate);

				if ($data[0] >= $weight) {
					if (isset($data[1])) {
						$cost = $data[1];
					}

					break;
				}
			}

			$rates = explode(',', $this->config->get('shipping_parcelforce_48_insurance'));

			foreach ($rates as $rate) {
				$data = explode(':', $rate);

				if ($data[0] >= $sub_total) {
					if (isset($data[1])) {
						$insurance = $data[1];
					}

					break;
				}
			}

			$quote_data = [];

			if ((float)$cost) {
				$text = $this->language->get('text_description');

				if ($this->config->get('shipping_parcelforce_48_display_weight')) {
					$text .= ' (' . $this->language->get('text_weight') . ' ' . $this->weight->format($weight, $this->config->get('config_weight_class_id')) . ')';
				}

				if ($this->config->get('shipping_parcelforce_48_display_insurance') && (float)$insurance) {
					$text .= ' (' . $this->language->get('text_insurance') . ' ' . $this->currency->format($insurance, $this->session->data['currency']) . ')';
				}

				if ($this->config->get('shipping_parcelforce_48_display_time')) {
					$text .= ' (' . $this->language->get('text_time') . ')';
				}

				$quote_data['parcelforce_48'] = [
					'code'         => 'parcelforce_48.parcelforce_48',
					'title'        => $text,
					'cost'         => $cost,
					'tax_class_id' => $this->config->get('shipping_parcelforce_48_tax_class_id'),
					'text'         => $this->currency->format($this->tax->calculate($cost, $this->config->get('shipping_parcelforce_48_tax_class_id'), $this->config->get('config_tax')), $this->session->data['currency'])
				];

				$method_data = [
					'code'       => 'parcelforce_48',
					'title'      => $this->language->get('text_title'),
					'quote'      => $quote_data,
					'sort_order' => $this->config->get('shipping_parcelforce_48_sort_order'),
					'error'      => false
				];
			}
		}

		return $method_data;
	}
}