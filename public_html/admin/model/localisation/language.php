<?php
class ModelLocalisationLanguage extends Model {
	public function addLanguage($data) {
		$this->db->query("INSERT INTO oc_language SET name = :name, code = :code, locale = :locale, sort_order = :sort_order, status = :status",
            [
                ':name' => $data['name'],
                ':code' => $data['code'],
                ':locale' => $data['locale'],
                ':sort_order' => $data['sort_order'],
                ':status' => $data['status'] ,
            ]);

		$this->cache->delete('catalog.language');
		$this->cache->delete('admin.language');

		$language_id = $this->db->getLastId();

		// Attribute
		$query = $this->db->query("SELECT * FROM oc_attribute_description WHERE language_id = :language_id",
            [
                ':language_id' => $this->config->get('config_language_id')
            ]);

		foreach ($query->rows as $attribute) {
			$this->db->query("INSERT INTO oc_attribute_description SET attribute_id = :attribute_id, language_id = :language_id, name = :name",
                [
                    ':attribute_id' => $attribute['attribute_id'],
                    ':language_id' => $language_id,
                    ':name' => $attribute['name'],
                ]);
		}

		// Attribute Group
		$query = $this->db->query("SELECT * FROM oc_attribute_group_description WHERE language_id = :language_id",
            [
                ':language_id' => $this->config->get('config_language_id')
            ]);

		foreach ($query->rows as $attribute_group) {
			$this->db->query("INSERT INTO oc_attribute_group_description SET attribute_group_id = :attribute_group_id, language_id = :language_id, name = :name",
                [
                    ':attribute_group_id' => $attribute_group['attribute_group_id'],
                    ':language_id' => $language_id,
                    ':name' => $attribute_group['name']
                ]);
		}

		$this->cache->delete('attribute');

		// Banner
		$query = $this->db->query("SELECT * FROM oc_banner_image WHERE language_id = language_id = :language_id",
            [
                ':language_id' => $this->config->get('config_language_id')
            ]);

		foreach ($query->rows as $banner_image) {
			$this->db->query("INSERT INTO oc_banner_image SET banner_id = :banner_id, language_id = :language_id, title = :title, link = :link, image = :image, sort_order = :sort_order",
                [
                    ':banner_id' => $banner_image['banner_id'],
                    ':language_id' => $language_id,
                    ':title' => $banner_image['title'],
                    ':link' => $banner_image['link'],
                    ':image' => $banner_image['image'],
                    ':sort_order' => $banner_image['sort_order',
                ]);
		}

		$this->cache->delete('banner');

		// Category
		$query = $this->db->query("SELECT * FROM oc_category_description WHERE language_id = :language_id",
            [
                ':language_id' => $this->config->get('config_language_id')
            ]);

		foreach ($query->rows as $category) {
			$this->db->query("INSERT INTO oc_category_description SET category_id = :category_id, language_id = :language_id, name = :name, description = :description, meta_title = :meta_title, meta_description = :meta_desciption, meta_keyword = :meta_keyword",
                [
                    ':category_id' => $category['category_id'] ,
                    ':language_id' => $language_id ,
                    ':name' => $category['name'],
                    ':description' => $category['description'],
                    ':meta_title' => $category['meta_title'],
                    ':meta_desciption' => $category['meta_description'],
                    ':meta_keyword' => $category['meta_keyword']
                ]);
		}

		$this->cache->delete('category');

		// Customer Group
		$query = $this->db->query("SELECT * FROM oc_customer_group_description WHERE language_id = language_id = :language_id",
            [
                ':language_id' => $this->config->get('config_language_id')
            ]);

		foreach ($query->rows as $customer_group) {
			$this->db->query("INSERT INTO oc_customer_group_description SET customer_group_id = :customer_group_id , language_id = :language_id, name = :name, description = :description",
                [
                    ':customer_group_id' => $customer_group['customer_group_id'],
                    ':language_id' => $language_id,
                    ':name' => $customer_group['name'],
                    ':description' => $customer_group['description']

                ]);
		}

		// Custom Field
		$query = $this->db->query("SELECT * FROM oc_custom_field_description WHERE language_id = language_id = :language_id",
            [
                ':language_id' => $this->config->get('config_language_id')
            ]);

		foreach ($query->rows as $custom_field) {
			$this->db->query("INSERT INTO oc_custom_field_description SET custom_field_id = :custom_field_id, language_id = :language_id, name = :name",
                [
                    ':custom_field_id' => $custom_field['custom_field_id'],
                    ':language_id' => $language_id,
                    ':name' => $custom_field['name']
                ]);
		}

		// Custom Field Value
		$query = $this->db->query("SELECT * FROM oc_custom_field_value_description WHERE language_id = :language_id",
            [
                ':language_id' => $this->config->get('config_language_id')
            ]);

		foreach ($query->rows as $custom_field_value) {
			$this->db->query("INSERT INTO oc_custom_field_value_description SET custom_field_value_id = :custom_field_value_id, language_id = :language_id, custom_field_id = :custom_field_id, name = :name",
                [
                    ':custom_field_value_id' => $custom_field_value['custom_field_value_id'],
                    ':language_id' => $language_id,
                    ':custom_field_id' => $custom_field_value['custom_field_id'],
                    ':name' => $custom_field_value['name']
                ]);
		}

		// Download
		$query = $this->db->query("SELECT * FROM oc_download_description WHERE language_id = :language_id",
            [
                ':language_id' => $this->config->get('config_language_id')
            ]);

		foreach ($query->rows as $download) {
			$this->db->query("INSERT INTO oc_download_description SET download_id = :download_id, language_id = :language_id, name = :name",
                [
                    ':download_id' => $download['download_id'],
                    ':language_id' => $language_id,
                    ':name' => $download['name']
                ]);
		}

		// Filter
		$query = $this->db->query("SELECT * FROM oc_filter_description WHERE language_id = language_id = :language_id",
            [
                ':language_id' => $this->config->get('config_language_id')
            ]);

		foreach ($query->rows as $filter) {
			$this->db->query("INSERT INTO oc_filter_description SET filter_id = :filter_id, language_id = :language_id, filter_group_id = :filter_group_id, name = :name",
                [
                    ':filter_id' => $filter['filter_id'],
                    ':language_id' => $language_id,
                    ':filter_group_id' => $filter['filter_group_id'],
                    ':name' => $filter['name']
                ]);
		}

		// Filter Group
		$query = $this->db->query("SELECT * FROM oc_filter_group_description WHERE language_id = :language_id",
            [
                ':language_id' => $this->config->get('config_language_id')
            ]);

		foreach ($query->rows as $filter_group) {
			$this->db->query("INSERT INTO oc_filter_group_description SET filter_group_id = :filter_group_id, language_id = :language_id, name = :name",
                [
                    ':filter_group_id' => $filter_group['filter_group_id'],
                    ':language_id' => $language_id,
                    ':name' => $filter_group['name']
                ]);
		}

		// Information
		$query = $this->db->query("SELECT * FROM oc_information_description WHERE language_id = :language_id",
            [
                ':language_id' => $this->config->get('config_language_id')
            ]);

		foreach ($query->rows as $information) {
			$this->db->query("INSERT INTO oc_information_description SET information_id = :information_id, language_id = :language_id, title = :title, description = :description, meta_title = :meta_title, meta_description = :meta_description, meta_keyword = :meta_keyword",
                [
                    ':information_id' => $information['information_id'],
                    ':language_id' => $language_id,
                    ':title' => $information['title'],
                    ':description' => $information['description'],
                    ':meta_title' => $information['meta_title'],
                    ':meta_description' => $information['meta_description'],
                    ':meta_keyword' => $information['meta_keyword']
                ]);
		}

		$this->cache->delete('information');

		// Length
		$query = $this->db->query("SELECT * FROM oc_length_class_description WHERE language_id = :language_id",
            [
                ':language_id' => $this->config->get('config_language_id')
            ]);

		foreach ($query->rows as $length) {
			$this->db->query("INSERT INTO oc_length_class_description SET length_class_id = :length_class_id, language_id = :language_id, title = :title, unit = :unit",
                [
                    ':length_class_id' => $length['length_class_id'],
                    ':language_id' => $language_id ,
                    ':title' => $length['title'],
                    ':unit' => $length['unit']
                ]);
		}

		$this->cache->delete('length_class');

		// Option
		$query = $this->db->query("SELECT * FROM oc_option_description WHERE language_id = language_id = :language_id",
            [
                ':language_id' => $this->config->get('config_language_id')
            ]);

		foreach ($query->rows as $option) {
			$this->db->query("INSERT INTO oc_option_description SET option_id = :option_id, language_id = :language_id, name = :name",
                [
                    ':option_id' => $option['option_id'],
                    ':language_id' => $language_id ,
                    ':name' => $option['name']
                ]
            );
		}

		// Option Value
		$query = $this->db->query("SELECT * FROM oc_option_value_description WHERE language_id = language_id = :language_id",
            [
                ':language_id' => $this->config->get('config_language_id')
            ]);

		foreach ($query->rows as $option_value) {
			$this->db->query("INSERT INTO oc_option_value_description SET option_value_id = :order_value_id, language_id = :language_id, option_id = :option_id, name = :name",
                [
                    ':order_value_id' => $option_value['option_value_id'],
                    ':language_id' => $language_id,
                    ':option_id' => $option_value['option_id'],
                    ':name' => $option_value['name']
                ]);
		}

		// Order Status
		$query = $this->db->query("SELECT * FROM oc_order_status WHERE language_id = language_id = :language_id",
            [
                ':language_id' => $this->config->get('config_language_id')
            ]);

		foreach ($query->rows as $order_status) {
			$this->db->query("INSERT INTO oc_order_status SET order_status_id = :order_status_id, language_id = :language_id, name = :name",
                [
                    ':order_status_id' => $order_status['order_status_id'],
                    ':language_id' => $language_id,
                    ':name' => $order_status['name'],
                ]);
		}

		$this->cache->delete('order_status');

		// Product
		$query = $this->db->query("SELECT * FROM oc_product_description WHERE language_id = language_id = :language_id",
            [
                ':language_id' => $this->config->get('config_language_id')
            ]);

		foreach ($query->rows as $product) {
			$this->db->query("INSERT INTO oc_product_description SET product_id = :product_id, language_id = :language_id, name = :name, description = :description, tag = :tag, meta_title = :meta_title, meta_description = :meta_description, meta_keyword = :meta_keyword",
                [
                    ':product_id' => $product['product_id'],
                    ':language_id' => $language_id,
                    ':name' => $product['name'],
                    ':description' => $product['description'],
                    ':tag' => $product['tag'],
                    ':meta_title' => $product['meta_title'],
                    ':meta_description' => $product['meta_description'],
                    ':meta_keyword' => $product['meta_keyword']
                ]);
		}

		$this->cache->delete('product');

		// Product Attribute
		$query = $this->db->query("SELECT * FROM oc_product_attribute WHERE language_id = language_id = :language_id",
            [
                ':language_id' => $this->config->get('config_language_id')
            ]);

		foreach ($query->rows as $product_attribute) {
			$this->db->query("INSERT INTO oc_product_attribute SET product_id = :product_id, attribute_id = :attribute_id, language_id = :language_id, text = :text",
                [
                    ':product_id' => $product_attribute['product_id'] ,
                    ':attribute_id' => $product_attribute['attribute_id'] ,
                    ':language_id' => $language_id,
                    ':text' => $product_attribute['text']
                ]);
		}

		// Return Action
		$query = $this->db->query("SELECT * FROM oc_return_action WHERE language_id = :language_id",
            [
                ':language_id' => $this->config->get('config_language_id')
            ]);

		foreach ($query->rows as $return_action) {
			$this->db->query("INSERT INTO oc_return_action SET return_action_id = :return_action_id, language_id = :language_id, name = :name",
                [
                    ':return_action_id' => $return_action['return_action_id'],
                    ':language_id' => $language_id ,
                    ':name' => $return_action['name']
                ]);
		}

		// Return Reason
		$query = $this->db->query("SELECT * FROM oc_return_reason WHERE language_id = language_id = :language_id",
            [
                ':language_id' => $this->config->get('config_language_id')
            ]);

		foreach ($query->rows as $return_reason) {
			$this->db->query("INSERT INTO oc_return_reason SET return_reason_id = :return_reason_id, language_id = :language_id, name = :name",
                [
                    ':return_reason_id' => $return_reason['return_reason_id'],
                    ':language_id' => $language_id,
                    ':name' => $return_reason['name']
                ]);
		}

		// Return Status
		$query = $this->db->query("SELECT * FROM oc_return_status WHERE language_id = language_id = :language_id",
            [
                ':language_id' => $this->config->get('config_language_id')
            ]);

		foreach ($query->rows as $return_status) {
			$this->db->query("INSERT INTO oc_return_status SET return_status_id = :return_status_id, language_id = :language_id, name = :name",
                [
                    ':return_status_id' => $return_status['return_status_id'] ,
                    ':language_id' => $language_id ,
                    ':name' => $return_status['name']
                ]);
		}

		// Stock Status
		$query = $this->db->query("SELECT * FROM oc_stock_status WHERE language_id = language_id = :language_id",
            [
                ':language_id' => $this->config->get('config_language_id')
            ]);

		foreach ($query->rows as $stock_status) {
			$this->db->query("INSERT INTO oc_stock_status SET stock_status_id = :stock_status_id, language_id = :language_id, name = :name",
                [
                    ':stock_status_id' => $stock_status['stock_status_id'],
                    ':language_id' => $language_id ,
                    ':name' => $stock_status['name']
                ]);
		}

		$this->cache->delete('stock_status');

		// Voucher Theme
		$query = $this->db->query("SELECT * FROM oc_voucher_theme_description WHERE language_id = language_id = :language_id",
            [
                ':language_id' => $this->config->get('config_language_id')
            ]);

		foreach ($query->rows as $voucher_theme) {
			$this->db->query("INSERT INTO oc_voucher_theme_description SET voucher_theme_id = :voucher_theme_id, language_id = :language_id, name = :name",
                [
                    ':voucher_theme_id' => $voucher_theme['voucher_theme_id'],
                    ':language_id' => $language_id,
                    ':name' => $voucher_theme['name']
                ]);
		}

		$this->cache->delete('voucher_theme');

		// Weight Class
		$query = $this->db->query("SELECT * FROM oc_weight_class_description WHERE language_id = language_id = :language_id",
            [
                ':language_id' => $this->config->get('config_language_id')
            ]);

		foreach ($query->rows as $weight_class) {
			$this->db->query("INSERT INTO oc_weight_class_description SET weight_class_id = :weight_class_id, language_id = :language_id, title = :title, unit = :unit",
                [
                    ':weight_class_id' => $weight_class['weight_class_id'],
                    ':language_id' => $language_id,
                    ':title' => $weight_class['title'],
                    ':unit' => $weight_class['unit'],
                ]);
		}

		$this->cache->delete('weight_class');

		// Profiles
		$query = $this->db->query("SELECT * FROM oc_recurring_description WHERE language_id = language_id = :language_id",
            [
                ':language_id' => $this->config->get('config_language_id')
            ]);

		foreach ($query->rows as $recurring) {
			$this->db->query("INSERT INTO oc_recurring_description SET recurring_id = :recurring_id, language_id = :language_id, name = :name",
                [
                    ':recurring_id' => $recurring['recurring_id'] ,
                    ':language_id' => $language_id,
                    ':name' => $recurring['name']
                ]);
		}

		return $language_id;
	}

	public function editLanguage($language_id, $data) {
		$language_query = $this->db->query("SELECT `code` FROM oc_language WHERE language_id = :language_id",
            [
                ':language_id' => $this->config->get('config_language_id')
            ]);
		
		$this->db->query("UPDATE oc_language SET name = :name, code = :code, locale = :locale, sort_order = :sort_order, status = :status WHERE language_id = :language_id".
        [
            ':name' => $data['name'],
            ':code' => $data['code'],
            ':locale' => $data['locale'],
            ':sort_order' => $data['sort_order'],
            ':status' => $data['status'],
            ':language_id' => $language_id
        ]);

		if ($language_query->row['code'] != $data['code']) {
			$this->db->query("UPDATE oc_setting SET value = :value_1 WHERE `key` = 'config_language' AND value = :value_2",
                [
                    ':value_1' => $data['code'],
                    ':value_2' => $language_query->row['code'],
                ]);
			$this->db->query("UPDATE oc_setting SET value = :value_1 WHERE `key` = 'config_admin_language' AND value = :value_2",
                [
                    ':value_1' => $data['code'],
                    ':value_2' => $language_query->row['code'],
                ]);
		}
		
		$this->cache->delete('catalog.language');
		$this->cache->delete('admin.language');
	}
	
	public function deleteLanguage($language_id) {
		$this->db->query("DELETE FROM oc_language WHERE language_id = :language_id",
            [
                ':language_id' => $this->config->get('config_language_id')
            ]);
		$this->db->query("DELETE FROM oc_seo_url WHERE language_id = :language_id",
            [
                ':language_id' => $this->config->get('config_language_id')
            ]);

		$this->cache->delete('catalog.language');
		$this->cache->delete('admin.language');

		/*
		Do not put any delete code for related tables for languages!!!!!!!!!
		
		It is not required as when ever you save to a multi language table then the entries for the deleted language will also be deleted!
		
		Wasting my time with people adding code here!
		*/
	}

	public function getLanguage($language_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM oc_language WHERE language_id = :language_id",
            [
                ':language_id' => $this->config->get('config_language_id')
            ]);

		return $query->row;
	}

	public function getLanguages($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM oc_language";

			$sort_data = array(
				'name',
				'code',
				'sort_order'
			);

			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];
			} else {
				$sql .= " ORDER BY sort_order, name";
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

			$query = $this->db->query($sql);

			return $query->rows;
		} else {
			$language_data = $this->cache->get('language');

			if (!$language_data) {
				$language_data = [];

				$query = $this->db->query("SELECT * FROM oc_language ORDER BY sort_order, name");

				foreach ($query->rows as $result) {
					$language_data[$result['code']] = array(
						'language_id' => $result['language_id'],
						'name'        => $result['name'],
						'code'        => $result['code'],
						'locale'      => $result['locale'],
						'image'       => $result['image'],
						'directory'   => $result['directory'],
						'sort_order'  => $result['sort_order'],
						'status'      => $result['status']
					);
				}

				$this->cache->set('admin.language', $language_data);
			}

			return $language_data;
		}
	}

	public function getLanguageByCode($code) {
		$query = $this->db->query("SELECT * FROM `oc_language` WHERE code = :code",
                [
                    ':code' => $code
                ]);

		return $query->row;
	}

	public function getTotalLanguages() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_language");

		return $query->row['total'];
	}
}
