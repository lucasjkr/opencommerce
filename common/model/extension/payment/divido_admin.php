<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ModelExtensionPaymentDividoAdmin extends Model {
	const CACHE_KEY_PLANS = 'divido_plans';

	public function getAllPlans() {
		if ($plans = $this->cache->get(self::CACHE_KEY_PLANS)) {
			// OpenCart 2.1 decodes json objects to associative arrays so we
			// need to make sure we're getting a list of simple objects back.
			$plans = array_map(function ($plan) {
				return (object)$plan;
			}, $plans);

			return $plans;
		}

		$api_key = $this->config->get('payment_divido_api_key');
		if (!$api_key) {
			throw new Exception("No Divido api-key defined");
		}

		Divido::setMerchant($api_key);

		$response = Divido_Finances::all();
		if ($response->status != 'ok') {
			throw new Exception("Can't get list of finance plans from Divido!");
		}

		$plans = $response->finances;

		// OpenCart 2.1 switched to json for their file storage cache, so
		// we need to convert to a simple object.
		$plans_plain = [];
		foreach ($plans as $plan) {
			$plan_copy = new stdClass();
			$plan_copy->id                 = $plan->id;
			$plan_copy->text               = $plan->text;
			$plan_copy->country            = $plan->country;
			$plan_copy->min_amount         = $plan->min_amount;
			$plan_copy->min_deposit        = $plan->min_deposit;
			$plan_copy->max_deposit        = $plan->max_deposit;
			$plan_copy->interest_rate      = $plan->interest_rate;
			$plan_copy->deferral_period    = $plan->deferral_period;
			$plan_copy->agreement_duration = $plan->agreement_duration;

			$plans_plain[] = $plan_copy;
		}

		$this->cache->set(self::CACHE_KEY_PLANS, $plans_plain);

		return $plans_plain;
	}

	public function getLookupByOrderId($order_id) {
		return $this->db->query("SELECT * FROM `oc_divido_lookup` WHERE `order_id` = " . (int)$order_id);
	}

	public function install() {
		$this->db->query("
			CREATE TABLE IF NOT EXISTS `oc_divido_product` (
				`product_id` INT(11) NOT NULL,
				`display` CHAR(7) NOT NULL,
				`plans` text,
				`date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
				PRIMARY KEY (`product_id`)
			) ENGINE=InnoDB DEFAULT CHARSET=utf8;");

		$this->db->query("
			CREATE TABLE IF NOT EXISTS `oc_divido_lookup` (
				`order_id` INT(11) NOT NULL,
				`salt` CHAR(64) NOT NULL,
				`proposal_id` CHAR(40),
				`application_id` CHAR(40),
				`deposit_amount` NUMERIC(6,2),
				`date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			  PRIMARY KEY (`order_id`)
			) ENGINE=InnoDB DEFAULT CHARSET=utf8;");
	}

	public function uninstall() {
		$this->db->query("DROP TABLE IF EXISTS `oc_divido_product`;");
		$this->db->query("DROP TABLE IF EXISTS `oc_divido_lookup`;");
	}
}
