<?php
class ModelExtensionShippingItem extends Model {
	function getQuote($address) {
		$this->load->language('extension/shipping/item');

        $query = $this->db->query("SELECT * FROM oc_zone_to_geo_zone WHERE geo_zone_id = :geo_zone_id AND country_id = :country_id AND (zone_id = :zone_id_1 OR zone_id = :zone_id_2)",
            [
                ':geo_zone_id' => $this->config->get('shipping_item_geo_zone_id'),
                ':country_id' => $address['country_id'],
                ':zone_id_1' => $address['zone_id'],
                ':zone_id_2' => 0,
            ]);


        if (!$this->config->get('shipping_item_geo_zone_id')) {
			$status = true;
		} elseif ($query->num_rows) {
			$status = true;
		} else {
			$status = false;
		}

		$method_data = [];

		if ($status) {
			$items = 0;

			foreach ($this->cart->getProducts() as $product) {
				if ($product['shipping']) {
					$items += $product['quantity'];
				}
			}

			$quote_data = [];

			$quote_data['item'] = [
				'code'         => 'item.item',
				'title'        => $this->language->get('text_description'),
				'cost'         => $this->config->get('shipping_item_cost') * $items,
				'tax_class_id' => $this->config->get('shipping_item_tax_class_id'),
				'text'         => $this->currency->format($this->tax->calculate($this->config->get('shipping_item_cost') * $items, $this->config->get('shipping_item_tax_class_id'), $this->config->get('config_tax')), $this->session->data['currency'])
			];

			$method_data = [
				'code'       => 'item',
				'title'      => $this->language->get('text_title'),
				'quote'      => $quote_data,
				'sort_order' => $this->config->get('shipping_item_sort_order'),
				'error'      => false
			];
		}

		return $method_data;
	}
}