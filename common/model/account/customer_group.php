<?php
class ModelAccountCustomerGroup extends Model {
	public function getCustomerGroup($customer_group_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM oc_customer_group cg LEFT JOIN oc_customer_group_description cgd ON (cg.customer_group_id = cgd.customer_group_id) WHERE cg.customer_group_id = :customer_group_id AND cgd.language_id = :language_id",
            [
                ':customer_group_id' => $customer_group_id,
                ':language_id' => $this->config->get('config_language_id'),
            ]);

		return $query->row;
	}

	public function getCustomerGroups() {
		$query = $this->db->query("SELECT * FROM oc_customer_group cg LEFT JOIN oc_customer_group_description cgd ON (cg.customer_group_id = cgd.customer_group_id) WHERE cgd.language_id = :language_id ORDER BY cg.sort_order ASC, cgd.name ASC",
            [
                ':language_id' => $this->config->get('config_language_id')
            ]);

		return $query->rows;
	}
}