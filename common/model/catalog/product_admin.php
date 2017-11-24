<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ModelCatalogProductAdmin extends Model {
	public function addProduct($data) {
		$this->db->query("INSERT INTO `oc_product` SET model = :model, location = :location, quantity = :quantity, minimum = :minimum, subtract = :subtract, stock_status_id = :stock_status_id, date_available = :date_available, manufacturer_id = :manufacturer_id, shipping = :shipping, price = :price, weight = :weight, weight_class_id = :weight_class_id, length = :length, width = :width, height = :height, length_class_id = :length_class_id, status = :status, tax_class_id = :tax_class_id, sort_order = :sort_order",
        [
            ':model' => $data['model'],
            ':location' => $data['location'],
            ':quantity' => $data['quantity'],
            ':minimum' => $data['minimum'],
            ':subtract' => $data['subtract'],
            ':stock_status_id' => $data['stock_status_id'],
            ':date_available' => $data['date_available'],
            ':manufacturer_id' => $data['manufacturer_id'],
            ':shipping' => $data['shipping'],
            ':price' => $data['price'],
            ':weight' => $data['weight'],
            ':weight_class_id' => $data['weight_class_id'],
            ':length' => $data['length'],
            ':width' => $data['width'],
            ':height' => $data['height'],
            ':length_class_id' => $data['length_class_id'] ,
            ':status' => $data['status'],
            ':tax_class_id' => $data['tax_class_id'],
            ':sort_order' => $data['sort_order'],
        ]);

		$product_id = $this->db->getLastId();

		foreach ($data['product_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO `oc_product_description` SET product_id = :product_id, language_id = :language_id, name = :name, description = :description, tag = :tag, meta_title = :meta_title, meta_description = :meta_description, meta_keyword = :meta_keyword",
                [
                    ':product_id' => $product_id,
                    ':language_id' => $language_id,
                    ':name' => $value['name'],
                    ':description' => $value['description'],
                    ':tag' => $value['tag'],
                    ':meta_title' => $value['meta_title'],
                    ':meta_description' => $value['meta_description'],
                    ':meta_keyword' => $value['meta_keyword']
                ]);
		}

		if (isset($data['product_store'])) {
			foreach ($data['product_store'] as $store_id) {
				$this->db->query("INSERT INTO `oc_product_to_store` SET product_id = :product_id, store_id = :store_id",
                    [
                        ':product_id' => $product_id,
                        ':store_id' => $store_id
                    ]);
			}
		}

		if (isset($data['product_attribute'])) {
			foreach ($data['product_attribute'] as $product_attribute) {
				if ($product_attribute['attribute_id']) {
					// Removes duplicates
					$this->db->query("DELETE FROM `oc_product_attribute` WHERE product_id = :product_id AND attribute_id = :attribute_id",
                        [
                            ':product_id' => $product_id,
                            ':attribute_id' => $product_attribute['attribute_id']
                        ]);

					foreach ($product_attribute['product_attribute_description'] as $language_id => $product_attribute_description) {
						$this->db->query("DELETE FROM `oc_product_attribute` WHERE product_id = :product_id AND attribute_id = :attribute_id AND language_id = :language_id",
                            [
                                ':product_id' => $product_id,
                                ':attribute_id' => $product_attribute['attribute_id'],
                                ':language_id' => $language_id
                            ]);

						$this->db->query("INSERT INTO `oc_product_attribute` SET product_id = :product_id, attribute_id = :attribute_id, language_id = :language_id, text = :text",
                            [
                                ':product_id' => $product_id,
                                ':attribute_id' => $product_attribute['attribute_id'],
                                ':language_id' => $language_id,
                                ':text' => $product_attribute_description['text']
                            ]);
					}
				}
			}
		}

		if (isset($data['product_option'])) {
			foreach ($data['product_option'] as $product_option) {
				if ($product_option['type'] == 'select' || $product_option['type'] == 'radio' || $product_option['type'] == 'checkbox' || $product_option['type'] == 'image') {
					if (isset($product_option['product_option_value'])) {
						$this->db->query("INSERT INTO `oc_product_option` SET product_id = :product_id, option_id = :option_id, required = :required",
                            [
                                ':product_id' => $product_id,
                                ':option_id' => $product_option['option_id'],
                                ':required' => $product_option['required']
                            ]);

						$product_option_id = $this->db->getLastId();

						foreach ($product_option['product_option_value'] as $product_option_value) {
							$this->db->query("INSERT INTO `oc_product_option_value` SET product_option_id = :product_option_id, product_id = :product_id, option_id = :option_id, option_value_id = :option_value_id, quantity = :quantity, subtract = :subtract, price = :price, price_prefix = :price_prefix, weight = :weight, weight_prefix = :weight_prefix",
                                [
                                    ':product_option_id' => $product_option_id,
                                    ':product_id' => $product_id,
                                    ':option_id' => $product_option['option_id'],
                                    ':option_value_id' => $product_option_value['option_value_id'],
                                    ':quantity' => $product_option_value['quantity'],
                                    ':subtract' => $product_option_value['subtract'],
                                    ':price' => $product_option_value['price'],
                                    ':price_prefix' => $product_option_value['price_prefix'],
                                    ':weight' => $product_option_value['weight'],
                                    ':weight_prefix' => $product_option_value['weight_prefix']
                                ]);
						}
					}
				} else {
					$this->db->query("INSERT INTO `oc_product_option` SET product_id = :product_id, option_id = :option_id, value = :value), required = :required",
                        [
                            ':product_id' => $product_id,
                            ':option_id' => $product_option['option_id'],
                            ':value' => $product_option['value'],
                            ':required' => $product_option['required']
                        ]);
				}
			}
		}

		if (isset($data['product_recurring'])) {
			foreach ($data['product_recurring'] as $recurring) {
				$this->db->query("INSERT INTO `oc_product_recurring` SET `product_id` = :product_id, customer_group_id = :customer_group_id, `recurring_id` = :recurring_id",
                    [
                        ':product_id' => $product_id,
                        ':customer_group_id' => $recurring['customer_group_id'],
                        ':recurring_id' => $recurring['recurring_id']
                    ]);
			}
		}
		
		if (isset($data['product_discount'])) {
			foreach ($data['product_discount'] as $product_discount) {
				$this->db->query("INSERT INTO `oc_product_discount` SET product_id = :product_id, customer_group_id = :customer_group_id, quantity = :quantity, priority = :priority, price = :price, date_start = :date_start, date_end = :date_end",
                    [
                        ':product_id' => $product_id,
                        ':customer_group_id' => $product_discount['customer_group_id'],
                        ':quantity' => $product_discount['quantity'],
                        ':priority' => $product_discount['priority'],
                        ':price' => $product_discount['price'],
                        ':date_start' => $product_discount['date_start'],
                        ':date_end' => $product_discount['date_end']
                    ]);
			}
		}

		if (isset($data['product_special'])) {
			foreach ($data['product_special'] as $product_special) {
				$this->db->query("INSERT INTO `oc_product_special` SET product_id = :product_id, customer_group_id = :customer_group_id, priority = :priority, price = :price, date_start = :date_start, date_end = :date_end",
                    [
                        ':product_id' => $product_id,
                        ':customer_group_id' => $product_special['customer_group_id'],
                        ':priority' => $product_special['priority'],
                        ':price' => $product_special['price'],
                        ':date_start' => $product_special['date_start'],
                        ':date_end' => $product_special['date_end']
                    ]);
			}
		}

		if (isset($data['product_image'])) {
			foreach ($data['product_image'] as $product_image) {
				$this->db->query("INSERT INTO `oc_product_image` SET product_id = :product_id, image = :image, sort_order = :sort_order",
                    [
                        ':product_id' => $product_id,
                        ':image' => $product_image['image'],
                        ':sort_order' => $product_image['sort_order']
                    ]);
			}
		}

		if (isset($data['product_download'])) {
			foreach ($data['product_download'] as $download_id) {
				$this->db->query("INSERT INTO `oc_product_to_download` SET product_id = :product_id, download_id = :download_id",
                    [
                        ':product_id' => $product_id,
                        ':download_id' => $download_id
                    ]);
			}
		}

		if (isset($data['product_category'])) {
			foreach ($data['product_category'] as $category_id) {
				$this->db->query("INSERT INTO `oc_product_to_category` SET product_id = :product_id, category_id = :category_id",
                    [
                        ':product_id' => $product_id,
                        ':category_id' => $category_id
                    ]);
			}
		}

		if (isset($data['product_filter'])) {
			foreach ($data['product_filter'] as $filter_id) {
				$this->db->query("INSERT INTO `oc_product_filter` SET product_id = :product_id, filter_id = :filter_id",
                    [
                        ':product_id' => $product_id,
                        ':filter_id' => $filter_id
                    ]);
			}
		}

		if (isset($data['product_related'])) {
			foreach ($data['product_related'] as $related_id) {
				$this->db->query("DELETE FROM `oc_product_related` WHERE `product_id` = :product_id  AND `related_id` = :$related_id",
                    [
                        ':product_id' => $product_id,
                        ':related_id' => $related_id,
                    ]);
				$this->db->query("INSERT INTO `oc_product_related` SET `product_id` = :product_id, related_id = :related_id",
                    [
                        ':product_id' => $product_id,
                        ':related_id' => $related_id,
                    ]);
				$this->db->query("DELETE FROM `oc_product_related` WHERE `product_id` = :related_id AND related_id = :product_id",
                    [
                        ':product_id' => $product_id,
                        ':related_id' => $related_id,
                    ]);
				$this->db->query("INSERT INTO `oc_product_related` SET `product_id` = :related_id, related_id = :product_id",
                    [
                        ':product_id' => $product_id,
                        ':related_id' => $related_id,
                    ]);
			}
		}

		// SEO URL
		if (isset($data['product_seo_url'])) {
			foreach ($data['product_seo_url'] as $store_id => $language) {
				foreach ($language as $language_id => $keyword) {
					if (!empty($keyword)) {
						$this->db->query("INSERT INTO `oc_seo_url` SET store_id = :store_id, language_id = :language_id, query = :query, keyword = :keyword",
                            [
                                ':store_id' => $store_id,
                                ':language_id' => $language_id,
                                ':query' => 'product_id=' . $product_id,
                                ':keyword' => $keyword
                            ]);
					}
				}
			}
		}
		
		if (isset($data['product_layout'])) {
			foreach ($data['product_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO `oc_product_to_layout` SET product_id = '" . (int)$product_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
			}
		}


		$this->cache->delete('product');

		return $product_id;
	}

	public function editProduct($product_id, $data) {
		$this->db->query("UPDATE `oc_product` SET `model` = :model, location = :location, quantity = :quantity, minimum = :minimum, subtract = :subtract, stock_status_id = :stock_status_id, date_available = :date_available, manufacturer_id = :manufacturer_id, shipping = :shipping, price = :price, weight = :weight, weight_class_id = :weight_class_id, length = :length, width = :width, height = :height, length_class_id = :length_class_id, status = :status, tax_class_id = :tax_class_id, sort_order = :sort_order WHERE product_id = :product_id",
            [
                ':model' => $data['model'],
                ':location' => $data['location'],
                ':quantity' => $data['quantity'],
                ':minimum' => $data['minimum'],
                ':subtract' => $data['subtract'],
                ':stock_status_id' => $data['stock_status_id'],
                ':date_available' => $data['date_available'],
                ':manufacturer_id' => $data['manufacturer_id'],
                ':shipping' => $data['shipping'],
                ':price' => $data['price'],
                ':weight' => $data['weight'],
                ':weight_class_id' => $data['weight_class_id'],
                ':length' => $data['length'],
                ':width' => $data['width'],
                ':height' => $data['height'],
                ':length_class_id' => $data['length_class_id'] ,
                ':status' => $data['status'],
                ':tax_class_id' => $data['tax_class_id'],
                ':sort_order' => $data['sort_order'],
                ':product_id' => $product_id,
            ]);

		if (isset($data['image'])) {
			$this->db->query("UPDATE `oc_product` SET image = :image WHERE product_id = :product_id",
                [
                    ':image' => $data['image'],
                    ':product_id' => $product_id
                ]);
		}

		$this->db->query("DELETE FROM `oc_product_description` WHERE `product_id` = :product_id",
            [
                ':product_id' => $product_id
            ]);


		foreach ($data['product_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO `oc_product_description` SET 
`product_id` = :product_id, 
`language_id` = :language_id, 
`name` = :name, 
`description` = :description, 
`tag` = :tag, 
`meta_title` = :meta_title, 
`meta_description` = :meta_description, 
`meta_keyword` = :meta_keyword",
                [
                    ':product_id' => $product_id,
                    ':language_id' => $language_id,
                    ':name' => $value['name'],
                    ':description' => $value['description'],
                    ':tag' => $value['tag'],
                    ':meta_title' => $value['meta_title'],
                    ':meta_description' => $value['meta_description'],
                    ':meta_keyword' => $value['meta_keyword']
                ]);
		}

		$this->db->query("DELETE FROM `oc_product_to_store` WHERE product_id = :product_id",
            [
                ':product_id' => $product_id
            ]);


		if (isset($data['product_store'])) {
			foreach ($data['product_store'] as $store_id) {
				$this->db->query("INSERT INTO `oc_product_to_store` SET product_id = :product_id, store_id = :store_id",
                    [
                        ':product_id' => $product_id,
                        ':store_id' => $store_id
                    ]);
			}
		}

		$this->db->query("DELETE FROM `oc_product_attribute` WHERE product_id = :product_id",
            [
                ':product_id' => $product_id
            ]);

		if (!empty($data['product_attribute'])) {
			foreach ($data['product_attribute'] as $product_attribute) {
				if ($product_attribute['attribute_id']) {
					// Removes duplicates
					$this->db->query("DELETE FROM `oc_product_attribute` WHERE product_id = :product_id AND attribute_id = :attribute_id",
                        [
                            ':product_id' => $product_id,
                            ':attribute_id' => $product_attribute['attribute_id']
                        ]);

					foreach ($product_attribute['product_attribute_description'] as $language_id => $product_attribute_description) {
						$this->db->query("INSERT INTO `oc_product_attribute` SET product_id = :product_id, attribute_id = :attribute_id, language_id = :language_id, text = :text",
                            [
                                ':product_id' => $product_id,
                                ':attribute_id' => $product_attribute['attribute_id'],
                                ':language_id' => $language_id,
                                ':text' => $product_attribute_description['text']
                            ]);
					}
				}
			}
		}

		$this->db->query("DELETE FROM `oc_product_option` WHERE `product_id` = :product_id",
            [
                ':product_id' => $product_id
            ]);

		$this->db->query("DELETE FROM `oc_product_option_value` WHERE `product_id` = :product_id",
            [
                ':product_id' => $product_id
            ]);


		if (isset($data['product_option'])) {
			foreach ($data['product_option'] as $product_option) {
				if ($product_option['type'] == 'select' || $product_option['type'] == 'radio' || $product_option['type'] == 'checkbox' || $product_option['type'] == 'image') {
					if (isset($product_option['product_option_value'])) {
						$this->db->query("INSERT INTO `oc_product_option` SET product_option_id = :product_option_id, product_id = :product_id, option_id = :option_id, required = :required",
                            [
                                ':product_option_id' => $product_option['product_option_id'],
                                ':product_id' => $product_id,
                                ':option_id' => $product_option['option_id'],
                                ':required' => $product_option['required']
                            ]);

						$product_option_id = $this->db->getLastId();

						foreach ($product_option['product_option_value'] as $product_option_value) {
							$this->db->query("INSERT INTO `oc_product_option_value` SET product_option_value_id = :product_option_value_id, product_option_id = :product_option_id, product_id = :product_id, option_id = :option_id, option_value_id = :option_value_id, quantity = :quantity, subtract = :subtract, price = :price, price_prefix = :price_prefix, weight = :weight, weight_prefix = :weight_prefix",
                                [
                                    ':product_option_value_id' => $product_option_value['product_option_value_id'],
                                    ':product_option_id' => $product_option_id,
                                    ':product_id' => $product_id,
                                    ':option_id' => $product_option['option_id'],
                                    ':option_value_id' => $product_option_value['option_value_id'],
                                    ':quantity' => $product_option_value['quantity'],
                                    ':subtract' => $product_option_value['subtract'],
                                    ':price' => $product_option_value['price'],
                                    ':price_prefix' => $product_option_value['price_prefix'],
                                    ':weight' => $product_option_value['weight'],
                                    ':weight_prefix' => $product_option_value['weight_prefix'],
                                ]);
						}
					}
				} else {
					$this->db->query("INSERT INTO `oc_product_option` SET product_option_id = :product_option_id, product_id = :product_id, option_id = :option_id, value = :value, required = :required",
                        [
                            ':product_option_id' => $product_option['product_option_id'],
                            ':product_id' => $product_id ,
                            ':option_id' => $product_option['option_id'],
                            ':value' => $product_option['value'],
                            ':required' => $product_option['required']
                        ]);
				}
			}
		}

		$this->db->query("DELETE FROM `oc_product_recurring` WHERE product_id = :product_id",
            [
                ':product_id' => $product_id
            ]);


		if (isset($data['product_recurring'])) {
			foreach ($data['product_recurring'] as $product_recurring) {
				$this->db->query("INSERT INTO `oc_product_recurring` SET `product_id` = " . (int)$product_id . ", customer_group_id = " . (int)$product_recurring['customer_group_id'] . ", `recurring_id` = " . (int)$product_recurring['recurring_id']);
			}
		}
		
		$this->db->query("DELETE FROM oc_product_discount WHERE product_id = :product_id",
            [
                ':product_id' => $product_id
            ]);


		if (isset($data['product_discount'])) {
			foreach ($data['product_discount'] as $product_discount) {
				$this->db->query("INSERT INTO oc_product_discount SET product_id = :product_id, customer_group_id = :customer_group_id, quantity = :quantity, priority = :priority, price = :price, date_start = :date_start, date_end = :date_end",
                    [
                        ':product_id' => $product_id ,
                        ':customer_group_id' => $product_discount['customer_group_id'],
                        ':quantity' => $product_discount['quantity'],
                        ':priority' => $product_discount['priority'],
                        ':price' => $product_discount['price'],
                        ':date_start' => $product_discount['date_start'],
                        ':date_end' => $product_discount['date_end']
                    ]);
			}
		}

		$this->db->query("DELETE FROM oc_product_special WHERE product_id = :product_id",
            [
                ':product_id' => $product_id
            ]);

		if (isset($data['product_special'])) {
			foreach ($data['product_special'] as $product_special) {
				$this->db->query("INSERT INTO oc_product_special SET product_id = :product_id, customer_group_id = :customer_group_id, priority = :priority, price = :price, date_start = :date_start, date_end = :date_end",
                    [
                        ':product_id' => $product_id,
                        ':customer_group_id' => $product_special['customer_group_id'],
                        ':priority' => $product_special['priority'],
                        ':price' => $product_special['price'],
                        ':date_start' => $product_special['date_start'],
                        ':date_end' => $product_special['date_end']
                    ]);
			}
		}

		$this->db->query("DELETE FROM oc_product_image WHERE product_id = :product_id",
            [
                ':product_id' => $product_id
            ]);

		if (isset($data['product_image'])) {
			foreach ($data['product_image'] as $product_image) {
				$this->db->query("INSERT INTO oc_product_image SET product_id = :product_id, image = :image, sort_order = :sort_order",
                    [
                        ':product_id' => $product_id,
                        ':image' => $product_image['image'],
                        ':sort_order' => $product_image['sort_order']
                    ]);
			}
		}

		$this->db->query("DELETE FROM oc_product_to_download WHERE product_id = :product_id",
            [
                ':product_id' => $product_id
            ]);

		if (isset($data['product_download'])) {
			foreach ($data['product_download'] as $download_id) {
				$this->db->query("INSERT INTO oc_product_to_download SET product_id = ':product_id, download_id = :download_id",
                    [
                        ':product_id' => $product_id,
                        ':download_id' => $download_id
                    ]);
			}
		}

		$this->db->query("DELETE FROM oc_product_to_category WHERE product_id = :product_id",
            [
                ':product_id' => $product_id
            ]);

		if (isset($data['product_category'])) {
			foreach ($data['product_category'] as $category_id) {
				$this->db->query("INSERT INTO oc_product_to_category SET product_id = :product_id, category_id = :category_id",
                    [
                        ':product_id' => $product_id,
                        ':category_id' => $category_id
                    ]);

			}
		}

		$this->db->query("DELETE FROM oc_product_filter WHERE product_id = :product_id",
            [
                ':product_id' => $product_id
            ]);


		if (isset($data['product_filter'])) {
			foreach ($data['product_filter'] as $filter_id) {
				$this->db->query("INSERT INTO oc_product_filter SET product_id = :product_id, filter_id = :filter_id",
                    [
                        ':product_id' => $product_id,
                        ':filter_id' => $filter_id
                    ]);
			}
		}

		$this->db->query("DELETE FROM oc_product_related WHERE product_id = :product_id",
            [
                ':product_id' => $product_id
            ]);
		$this->db->query("DELETE FROM oc_product_related WHERE related_id = :product_id",
            [
                ':product_id' => $product_id
            ]);

		if (isset($data['product_related'])) {
			foreach ($data['product_related'] as $related_id) {
				$this->db->query("DELETE FROM oc_product_related WHERE product_id = :product_id AND related_id = :related_id",
                    [
                        ':product_id' => $product_id,
                        ':related_id' => $related_id,
                    ]);
				$this->db->query("INSERT INTO oc_product_related SET product_id = :product_id, related_id = :related_id",
                    [
                        ':product_id' => $product_id,
                        ':related_id' => $related_id,
                    ]);
				$this->db->query("DELETE FROM oc_product_related WHERE product_id = :related_id AND related_id = :product_id",
                    [
                        ':product_id' => $product_id,
                        ':related_id' => $related_id,
                    ]);
				$this->db->query("INSERT INTO oc_product_related SET product_id = :related_id, related_id = :product_id",
                    [
                        ':product_id' => $product_id,
                        ':related_id' => $related_id,
                    ]);
			}
		}

		// SEO URL
		$this->db->query("DELETE FROM oc_seo_url WHERE query = :query",
            [
                ':query' => 'product_id=' . $product_id
            ]);
		
		if (isset($data['product_seo_url'])) {
			foreach ($data['product_seo_url']as $store_id => $language) {
				foreach ($language as $language_id => $keyword) {
					if (!empty($keyword)) {
						$this->db->query("INSERT INTO oc_seo_url SET store_id = :store_id, language_id = :language_id, query = :query, keyword = :keyword",
                            [
                                ':store_id' => $store_id,
                                ':language_id' => $language_id,
                                ':query' => 'product_id=' . $product_id,
                                ':keyword' => $keyword
                            ]);
					}
				}
			}
		}
		
		$this->db->query("DELETE FROM oc_product_to_layout WHERE product_id = '" . (int)$product_id . "'");

		if (isset($data['product_layout'])) {
			foreach ($data['product_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO oc_product_to_layout SET product_id = :product_id, store_id = :store_id, layout_id = :layout_id",
                    [
                        ':product_id' => $product_id,
                        ':store_id' => $store_id ,
                        ':layout_id' => $layout_id
                    ]);
			}
		}

		$this->cache->delete('product');
	}

	public function copyProduct($product_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM oc_product p WHERE p.product_id = '" . (int)$product_id . "'");

		if ($query->num_rows) {
			$data = $query->row;

			$data['keyword'] = '';
			$data['status'] = '0';

			$data['product_attribute'] = $this->getProductAttributes($product_id);
			$data['product_description'] = $this->getProductDescriptions($product_id);
			$data['product_discount'] = $this->getProductDiscounts($product_id);
			$data['product_filter'] = $this->getProductFilters($product_id);
			$data['product_image'] = $this->getProductImages($product_id);
			$data['product_option'] = $this->getProductOptions($product_id);
			$data['product_related'] = $this->getProductRelated($product_id);
			$data['product_special'] = $this->getProductSpecials($product_id);
			$data['product_category'] = $this->getProductCategories($product_id);
			$data['product_download'] = $this->getProductDownloads($product_id);
			$data['product_layout'] = $this->getProductLayouts($product_id);
			$data['product_store'] = $this->getProductStores($product_id);
			$data['product_recurrings'] = $this->getRecurrings($product_id);

			$this->addProduct($data);
		}
	}

	public function deleteProduct($product_id) {
		$this->db->query("DELETE FROM oc_product WHERE product_id = :product_id",
            [
                ':product_id' => $product_id,
            ]);
		$this->db->query("DELETE FROM oc_product_attribute WHERE product_id = :product_id",
            [
                ':product_id' => $product_id,
            ]);
		$this->db->query("DELETE FROM oc_product_description WHERE product_id = :product_id",
            [
                ':product_id' => $product_id,
            ]);
		$this->db->query("DELETE FROM oc_product_discount WHERE product_id = :product_id",
            [
                ':product_id' => $product_id,
            ]);
		$this->db->query("DELETE FROM oc_product_filter WHERE product_id = :product_id",
            [
                ':product_id' => $product_id,
            ]);
		$this->db->query("DELETE FROM oc_product_image WHERE product_id = :product_id",
            [
                ':product_id' => $product_id,
            ]);
		$this->db->query("DELETE FROM oc_product_option WHERE product_id = :product_id",
            [
                ':product_id' => $product_id,
            ]);
		$this->db->query("DELETE FROM oc_product_option_value WHERE product_id = :product_id",
            [
                ':product_id' => $product_id,
            ]);
		$this->db->query("DELETE FROM oc_product_related WHERE product_id = :product_id",
            [
                ':product_id' => $product_id,
            ]);
		$this->db->query("DELETE FROM oc_product_related WHERE related_id = :product_id",
            [
                ':product_id' => $product_id,
            ]);
		$this->db->query("DELETE FROM oc_product_special WHERE product_id = :product_id",
            [
                ':product_id' => $product_id,
            ]);
		$this->db->query("DELETE FROM oc_product_to_category WHERE product_id = :product_id",
            [
                ':product_id' => $product_id,
            ]);
		$this->db->query("DELETE FROM oc_product_to_download WHERE product_id = :product_id",
            [
                ':product_id' => $product_id,
            ]);
		$this->db->query("DELETE FROM oc_product_to_layout WHERE product_id = :product_id",
            [
                ':product_id' => $product_id,
            ]);
		$this->db->query("DELETE FROM oc_product_to_store WHERE product_id = :product_id",
            [
                ':product_id' => $product_id,
            ]);
		$this->db->query("DELETE FROM oc_product_recurring WHERE product_id = :product_id",
            [
                ':product_id' => $product_id,
            ]);
		$this->db->query("DELETE FROM oc_review WHERE product_id = :product_id",
            [
                ':product_id' => $product_id,
            ]);
		$this->db->query("DELETE FROM oc_seo_url WHERE query = :query",
		    [
		        ':query' => 'product_id=' . $product_id
            ]);
		$this->db->query("DELETE FROM oc_coupon_product WHERE product_id = :product_id",
            [
                ':product_id' => $product_id,
            ]);

		$this->cache->delete('product');
	}

	public function getProduct($product_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM oc_product p LEFT JOIN oc_product_description pd ON (p.product_id = pd.product_id) WHERE p.product_id = :product_id AND pd.language_id = :language_id",
            [
                ':product_id' => $product_id,
                ':language_id' => $this->config->get('config_language_id')
            ]);

		return $query->row;
	}

	public function getProducts($data = []) {
		$sql = "SELECT * FROM oc_product p LEFT JOIN oc_product_description pd ON (p.product_id = pd.product_id) WHERE pd.language_id = :language_id";

        $args[':language_id'] = $this->config->get('config_language_id');

		if (!empty($data['filter_name'])) {
			$sql .= " AND pd.name LIKE :name";
            $args[':language_id'] = $data['filter_name'] . '%';
		}

		if (!empty($data['filter_model'])) {
			$sql .= " AND p.model LIKE :model";
            $args[':model'] = $data['filter_model'] . '%';
		}

		if (!empty($data['filter_price'])) {
			$sql .= " AND p.price LIKE :price";
            $args[':price'] = $data['filter_price'] . '%';
		}

		if (isset($data['filter_quantity']) && $data['filter_quantity'] !== '') {
			$sql .= " AND p.quantity = :quantity";
            $args[':quantity'] = $data['filter_quantity'];
		}

		if (isset($data['filter_status']) && $data['filter_status'] !== '') {
			$sql .= " AND p.status = :status";
            $args[':status'] = $data['filter_status'];
		}

		$sql .= " GROUP BY p.product_id";

		$sort_data = [
			'pd.name',
			'p.model',
			'p.price',
			'p.quantity',
			'p.status',
			'p.sort_order'
		];

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY pd.name";
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

	public function getProductsByCategoryId($category_id) {
		$query = $this->db->query("SELECT * FROM oc_product p LEFT JOIN oc_product_description pd ON (p.product_id = pd.product_id) LEFT JOIN oc_product_to_category p2c ON (p.product_id = p2c.product_id) WHERE pd.language_id = :language_id AND p2c.category_id = :category_id  ORDER BY pd.name ASC",
            [
                ':language_id' => $this->config->get('config_language_id'),
                ':category_id' => $category_id
            ]);

		return $query->rows;
	}

	public function getProductDescriptions($product_id) {
		$product_description_data = [];

		$query = $this->db->query("SELECT * FROM oc_product_description WHERE product_id = :product_id",
            [
                ':product_id' => $product_id
            ]);

		foreach ($query->rows as $result) {
			$product_description_data[$result['language_id']] = [
				'name'             => $result['name'],
				'description'      => $result['description'],
				'meta_title'       => $result['meta_title'],
				'meta_description' => $result['meta_description'],
				'meta_keyword'     => $result['meta_keyword'],
				'tag'              => $result['tag']
			];
		}

		return $product_description_data;
	}

	public function getProductCategories($product_id) {
		$product_category_data = [];

		$query = $this->db->query("SELECT * FROM oc_product_to_category WHERE product_id = :product_id",
            [
                ':product_id' => $product_id
            ]);

		foreach ($query->rows as $result) {
			$product_category_data[] = $result['category_id'];
		}

		return $product_category_data;
	}

	public function getProductFilters($product_id) {
		$product_filter_data = [];

		$query = $this->db->query("SELECT * FROM oc_product_filter WHERE product_id = :product_id",
            [
                ':product_id' => $product_id
            ]);

		foreach ($query->rows as $result) {
			$product_filter_data[] = $result['filter_id'];
		}

		return $product_filter_data;
	}

	public function getProductAttributes($product_id) {
		$product_attribute_data = [];

		$product_attribute_query = $this->db->query("SELECT attribute_id FROM oc_product_attribute WHERE product_id = :product_id GROUP BY attribute_id",
            [
                ':product_id' => $product_id
            ]);

		foreach ($product_attribute_query->rows as $product_attribute) {
			$product_attribute_description_data = [];

			$product_attribute_description_query = $this->db->query("SELECT * FROM oc_product_attribute WHERE product_id = :product_id AND attribute_id = :attribute_id",
                [
                    ':product_id' => $product_id,
                    ':attribute_id' => $product_attribute['attribute_id']
                ]);

			foreach ($product_attribute_description_query->rows as $product_attribute_description) {
				$product_attribute_description_data[$product_attribute_description['language_id']] = [
				    'text' => $product_attribute_description['text']
                ];
			}

			$product_attribute_data[] = [
				'attribute_id'                  => $product_attribute['attribute_id'],
				'product_attribute_description' => $product_attribute_description_data
			];
		}

		return $product_attribute_data;
	}

	public function getProductOptions($product_id) {
		$product_option_data = [];

		$product_option_query = $this->db->query("SELECT * FROM `oc_product_option` po LEFT JOIN `oc_option` o ON (po.option_id = o.option_id) LEFT JOIN `oc_option_description` od ON (o.option_id = od.option_id) WHERE po.product_id = :product_id AND od.language_id = :language_id",
            [
                ':product_id' => $product_id,
                ':language_id' => $this->config->get('config_language_id')
            ]);

		foreach ($product_option_query->rows as $product_option) {
			$product_option_value_data = [];

			$product_option_value_query = $this->db->query("SELECT * FROM oc_product_option_value pov LEFT JOIN oc_option_value ov ON(pov.option_value_id = ov.option_value_id) WHERE pov.product_option_id = :product_option_id ORDER BY ov.sort_order ASC",
                [
                    ':product_option_id' => $product_option['product_option_id']
                ]);

			foreach ($product_option_value_query->rows as $product_option_value) {
				$product_option_value_data[] = [
					'product_option_value_id' => $product_option_value['product_option_value_id'],
					'option_value_id'         => $product_option_value['option_value_id'],
					'quantity'                => $product_option_value['quantity'],
					'subtract'                => $product_option_value['subtract'],
					'price'                   => $product_option_value['price'],
					'price_prefix'            => $product_option_value['price_prefix'],
					'weight'                  => $product_option_value['weight'],
					'weight_prefix'           => $product_option_value['weight_prefix']
                ];
			}

			$product_option_data[] = [
				'product_option_id'    => $product_option['product_option_id'],
				'product_option_value' => $product_option_value_data,
				'option_id'            => $product_option['option_id'],
				'name'                 => $product_option['name'],
				'type'                 => $product_option['type'],
				'value'                => $product_option['value'],
				'required'             => $product_option['required']
            ];
		}

		return $product_option_data;
	}

	public function getProductOptionValue($product_id, $product_option_value_id) {
		$sql  = "SELECT pov.option_value_id, ovd.name, pov.quantity, pov.subtract, pov.price, pov.price_prefix, pov.weight, pov.weight_prefix ";
	    $sql .= "FROM oc_product_option_value pov LEFT JOIN oc_option_value ov ON (pov.option_value_id = ov.option_value_id) ";
        $sql .= "LEFT JOIN oc_option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) ";
        $sql .= "WHERE pov.product_id = :product_id AND pov.product_option_value_id = :product_option_value_id AND ovd.language_id = :language_id";
	    $query = $this->db->query($sql,
            [
                ':product_id' => $product_id,
                ':product_option_value_id' => $product_option_value_id,
                ':language_id' => $this->config->get('config_language_id')
            ]);

		return $query->row;
	}

	public function getProductImages($product_id) {
		$query = $this->db->query("SELECT * FROM oc_product_image WHERE product_id = :product_id ORDER BY sort_order ASC",
            [
                ':product_id' => $product_id
            ]);

		return $query->rows;
	}

	public function getProductDiscounts($product_id) {
		$query = $this->db->query("SELECT * FROM oc_product_discount WHERE product_id = :product_id ORDER BY quantity, priority, price",
            [
                ':product_id' => $product_id
            ]);

		return $query->rows;
	}

	public function getProductSpecials($product_id) {
		$query = $this->db->query("SELECT * FROM oc_product_special WHERE product_id = :product_id ORDER BY priority, price",
            [
                ':product_id' => $product_id
            ]);

		return $query->rows;
	}

	public function getProductDownloads($product_id) {
		$product_download_data = [];

		$query = $this->db->query("SELECT * FROM oc_product_to_download WHERE product_id = :product_id",
            [
                ':product_id' => $product_id
            ]);

		foreach ($query->rows as $result) {
			$product_download_data[] = $result['download_id'];
		}

		return $product_download_data;
	}

	public function getProductStores($product_id) {
		$product_store_data = [];

		$query = $this->db->query("SELECT * FROM oc_product_to_store WHERE product_id = :product_id",
            [
                ':product_id' => $product_id
            ]);

		foreach ($query->rows as $result) {
			$product_store_data[] = $result['store_id'];
		}

		return $product_store_data;
	}
	
	public function getProductSeoUrls($product_id) {
		$product_seo_url_data = [];
		
		$query = $this->db->query("SELECT * FROM oc_seo_url WHERE query = :query",
            [
                ':query' => 'product_id=' . $product_id
            ]);

		foreach ($query->rows as $result) {
			$product_seo_url_data[$result['store_id']][$result['language_id']] = $result['keyword'];
		}

		return $product_seo_url_data;
	}
	
	public function getProductLayouts($product_id) {
		$product_layout_data = [];

		$query = $this->db->query("SELECT * FROM oc_product_to_layout WHERE product_id = :product_id",
            [
                ':product_id' => $product_id
            ]);

		foreach ($query->rows as $result) {
			$product_layout_data[$result['store_id']] = $result['layout_id'];
		}

		return $product_layout_data;
	}

	public function getProductRelated($product_id) {
		$product_related_data = [];

		$query = $this->db->query("SELECT * FROM oc_product_related WHERE product_id = :product_id",
            [
                ':product_id' => $product_id
            ]);

		foreach ($query->rows as $result) {
			$product_related_data[] = $result['related_id'];
		}

		return $product_related_data;
	}

	public function getRecurrings($product_id) {
		$query = $this->db->query("SELECT * FROM `oc_product_recurring` WHERE product_id = :product_id",
            [
                ':product_id' => $product_id
            ]);

		return $query->rows;
	}

	public function getTotalProducts($data = []) {
		$sql = "SELECT COUNT(DISTINCT p.product_id) AS total FROM oc_product p LEFT JOIN oc_product_description pd ON (p.product_id = pd.product_id)";

		$sql .= " WHERE pd.language_id = :language_id";

        $args[':language_id'] = $this->config->get('config_language_id');

		if (!empty($data['filter_name'])) {
			$sql .= " AND pd.name LIKE :filter_name";
            $args[':language_id'] = $data['filter_name'] . '%';
        }

		if (!empty($data['filter_model'])) {
			$sql .= " AND p.model LIKE :filter_model";
            $args[':filter_model'] = $data['filter_model'] . '%';
        }

		if (isset($data['filter_price']) && !is_null($data['filter_price'])) {
			$sql .= " AND p.price LIKE :filter_price";
            $args[':filter_price'] = $data['filter_price'] . '%';
        }

		if (isset($data['filter_quantity']) && $data['filter_quantity'] !== '') {
			$sql .= " AND p.quantity = :quantity";
            $args[':quantity'] = $data['filter_quantity'];
        }

		if (isset($data['filter_status']) && $data['filter_status'] !== '') {
			$sql .= " AND p.status = :status";
            $args[':status'] = $data['filter_status'];
        }

		$query = $this->db->query($sql, $args);

		return $query->row['total'];
	}

	public function getTotalProductsByTaxClassId($tax_class_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_product WHERE tax_class_id = :tax_class_id",
            [
                ':tax_class_id' => $tax_class_id
            ]);

		return $query->row['total'];
	}

	public function getTotalProductsByStockStatusId($stock_status_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_product WHERE stock_status_id = :stock_status_id",
            [
                ':stock_status_id' => $stock_status_id
            ]);

		return $query->row['total'];
	}

	public function getTotalProductsByWeightClassId($weight_class_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_product WHERE weight_class_id = :weight_class_id",
            [
                ':weight_class_id' => $weight_class_id
            ]);

		return $query->row['total'];
	}

	public function getTotalProductsByLengthClassId($length_class_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_product WHERE length_class_id = :length_class_id",
            [
                ':length_class_id' => $length_class_id
            ]);

		return $query->row['total'];
	}

	public function getTotalProductsByDownloadId($download_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_product_to_download WHERE download_id = :download_id ",
            [
                ':download_id' => $download_id
            ]);

		return $query->row['total'];
	}

	public function getTotalProductsByManufacturerId($manufacturer_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_product WHERE manufacturer_id = :manufacturer_id ",
            [
                ':manufacturer_id' => $manufacturer_id
            ]);

		return $query->row['total'];
	}

	public function getTotalProductsByAttributeId($attribute_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_product_attribute WHERE attribute_id = :attribute_id ",
            [
                ':attribute_id ' => $attribute_id
            ]);

		return $query->row['total'];
	}

	public function getTotalProductsByOptionId($option_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_product_option WHERE option_id = :option_id ",
            [
                ':option_id' => $option_id
            ]);

		return $query->row['total'];
	}

	public function getTotalProductsByProfileId($recurring_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_product_recurring WHERE recurring_id = :recurring_id",
            [
                ':recurring_id' => $recurring_id
            ]);

		return $query->row['total'];
	}

	public function getTotalProductsByLayoutId($layout_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_product_to_layout WHERE layout_id = :layout_id",
            [
                ':layout_id' => $layout_id
            ]);

		return $query->row['total'];
	}
}
