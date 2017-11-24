<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ModelAccountSearch extends Model {
	public function addSearch($data) {
		$this->db->query("INSERT INTO `oc_customer_search` SET `store_id` = :store_id, `language_id` = :language_id, `customer_id` = :customer_id, `keyword` = :keyword, `category_id` = :category_id, `sub_category` = :sub_category, `description` = :description, `products` = :products, `ip` = :ip",
            [
                ':store_id' => $this->config->get('config_store_id'),
                ':language_id' => $this->config->get('config_language_id'),
                ':customer_id' => $data['customer_id'],
                ':keyword' => $data['keyword'],
                ':category_id' => $data['category_id'],
                ':sub_category' => $data['sub_category'],
                ':description' => $data['description'],
                ':products' => $data['products'],
                ':ip' => $data['ip']

            ]);
	}
}
