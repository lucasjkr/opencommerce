<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ControllerExtensionModuleFeatured extends Controller {
	public function index($setting) {
		$this->load->language('extension/module/featured');

		$this->load->model('tool/image');

		$data['products'] = [];

		if (!$setting['limit']) {
			$setting['limit'] = 4;
		}

		$featured = $setting['product'];

		if (!empty($setting['product'])) {
            $product_infos = $this->getProductsByIds($featured);

            $product_infos = array_slice($product_infos, 0, (int)$setting['limit']);

			foreach ($product_infos as $product_info) {

				if ($product_info) {
					if ($product_info['image']) {
						$image = $this->model_tool_image->resize($product_info['image'], $setting['width'], $setting['height']);
					} else {
						$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
					}

					if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
						$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					} else {
						$price = false;
					}

					if ((float)$product_info['special']) {
						$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					} else {
						$special = false;
					}

					if ($this->config->get('config_tax')) {
						$tax = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price'], $this->session->data['currency']);
					} else {
						$tax = false;
					}

					if ($this->config->get('config_review_status')) {
						$rating = $product_info['rating'];
					} else {
						$rating = false;
					}

					$data['products'][] = [
						'product_id'  => $product_info['product_id'],
						'thumb'       => $image,
						'name'        => $product_info['name'],
						'description' => utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('theme_' . $this->config->get('config_theme') . '_product_description_length')) . '..',
						'price'       => $price,
						'special'     => $special,
						'tax'         => $tax,
						'rating'      => $rating,
						'href'        => $this->url->link('product/product', 'product_id=' . $product_info['product_id'])
					];
				}
			}
		}

		if ($data['products']) {
			return $this->load->view('extension/module/featured', $data);
		}
	}

    // LJK TODO: New method!
    // Previous plug-in used the getProduct method in model_catalog_products for each featured product, resulting in a separate
    // query for each featured product. Now we use a built in query which returns all the rows at once to iterate over.
    //
    // This results in only one database call, rather one call per featured product.
    //
    // This is private function to the this plug-in only, however if its determined that more features need this, it can be moved
    // to the Product Model instead.
    private function getProductsByIds($array) {
        if(!is_array($array)) {
            return false;
        }
        $range = implode(", ", $array);

        // Ideally, we'll just count how many items are in the array, and create a series of product_id_1, product_id_2...
        // and insert the variables into the placeholders later.
        // But first just testing how this works.

        $i = 1;
        $placeholders = '';
        $args = [];

        foreach($array as $item){
            $placeholders .= ':param' . $i .', ';
            $args[':param' . $i] = $item;
            $i++;
        }

        $placeholders  = trim($placeholders, ', ');

        $sql = "SELECT *, pd.name AS name, p.image, m.name AS manufacturer, (SELECT price FROM oc_product_discount pd2 WHERE pd2.product_id = p.product_id AND 
pd2.customer_group_id = :customer_group_id_1 AND pd2.quantity = :quantity AND ((pd2.date_start = :date_start_1 OR pd2.date_start < NOW()) AND (pd2.date_end = :date_end_1 OR 
pd2.date_end > NOW())) ORDER BY pd2.priority ASC, pd2.price ASC LIMIT 1) AS discount, (SELECT price FROM oc_product_special ps WHERE ps.product_id = p.product_id AND 
ps.customer_group_id = :customer_group_id_2 AND ((ps.date_start = :date_start_2 OR ps.date_start < NOW()) AND (ps.date_end = :date_end_2 OR 
ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1) AS special, (SELECT ss.name FROM oc_stock_status ss WHERE ss.stock_status_id = p.stock_status_id AND 
ss.language_id = :language_id_1) AS stock_status, (SELECT wcd.unit FROM oc_weight_class_description wcd WHERE p.weight_class_id = wcd.weight_class_id AND 
wcd.language_id = :language_id_2) AS weight_class, (SELECT lcd.unit FROM oc_length_class_description lcd WHERE p.length_class_id = lcd.length_class_id AND 
lcd.language_id = :language_id_3) AS length_class, (SELECT AVG(rating) AS total FROM oc_review r1 WHERE r1.product_id = p.product_id AND r1.status = '1' GROUP BY 
r1.product_id) AS rating, (SELECT COUNT(*) AS total FROM oc_review r2 WHERE r2.product_id = p.product_id AND r2.status = '1' GROUP BY r2.product_id) AS 
reviews, p.sort_order FROM oc_product p LEFT JOIN oc_product_description pd ON (p.product_id = pd.product_id) LEFT JOIN oc_product_to_store p2s ON 
(p.product_id = p2s.product_id) LEFT JOIN oc_manufacturer m ON (p.manufacturer_id = m.manufacturer_id) WHERE p.product_id IN 
(" . $placeholders . ") AND pd.language_id = :language_id_4 AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = :store_id";

        $args[':customer_group_id_1'] = $this->config->get('config_customer_group_id');
        $args[':quantity'] = 1;
        $args[':date_start_1'] = '0000-00-00';
        $args[':date_end_1'] = '0000-00-00';
        $args[':customer_group_id_2'] = $this->config->get('config_customer_group_id');
        $args[':date_start_2'] = '0000-00-00';
        $args[':date_end_2'] = '0000-00-00';
        $args[':language_id_1'] = $this->config->get('config_language_id');
        $args[':language_id_2'] = $this->config->get('config_language_id');
        $args[':language_id_3'] = $this->config->get('config_language_id');
        $args[':language_id_4'] = $this->config->get('config_language_id');
        $args[':store_id'] = $this->config->get('config_store_id');

        $query = $this->db->query($sql, $args);

        if ($query->num_rows) {
            return $query->rows;
        } else {
            return false;
        }
    }

}