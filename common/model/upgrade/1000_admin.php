<?php
class ModelUpgrade1000Admin extends Model {
	public function upgrade() {
		// marketing_report
		$query = $this->db->query("SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = '" . DB_DATABASE . "' AND TABLE_NAME = 'oc_marketing_report'");

		if (!$query->num_rows) {
			$this->db->query("
			CREATE TABLE `oc_marketing_report` (
				`marketing_report_id` int(11) NOT NULL AUTO_INCREMENT,
				`marketing_id` int(11) NOT NULL,
				`store_id` int(11) NOT NULL,
				`ip` varchar(40) NOT NULL,
				`country` varchar(2) NOT NULL,
				`date_added` datetime NOT NULL,
				PRIMARY KEY (`marketing_report_id`)
			) ENGINE=InnoDB DEFAULT CHARSET=utf8;");
		}

		// download_report
		$query = $this->db->query("SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = '" . DB_DATABASE . "' AND TABLE_NAME = 'oc_download_report'");

		if (!$query->num_rows) {
			$this->db->query("
			CREATE TABLE `oc_download_report` (
				`download_report_id` int(11) NOT NULL AUTO_INCREMENT,
				`download_id` int(11) NOT NULL,
				`store_id` int(11) NOT NULL,
				`ip` varchar(40) NOT NULL,
				`country` varchar(2) NOT NULL,
				`date_added` datetime NOT NULL,
				PRIMARY KEY (`download_report_id`)
			) ENGINE=InnoDB DEFAULT CHARSET=utf8;");
		}

		// customer_ip
		$query = $this->db->query("SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = '" . DB_DATABASE . "' AND TABLE_NAME = 'oc_customer_ip' AND COLUMN_NAME = 'store_id'");

		if (!$query->num_rows) {
			$this->db->query("ALTER TABLE `oc_customer_ip` ADD `store_id` varchar(2) NOT NULL AFTER `ip`");
		}

		// customer_ip
		$query = $this->db->query("SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = '" . DB_DATABASE . "' AND TABLE_NAME = 'oc_customer_ip' AND COLUMN_NAME = 'country'");

		if (!$query->num_rows) {
			$this->db->query("ALTER TABLE `oc_customer_ip` ADD `country` varchar(2) NOT NULL AFTER `store_id`");
		}

		// Update events because we moved the affiliate functions out of the customer class
		$this->db->query("UPDATE `oc_event` SET `trigger` = 'catalog/model/account/affiliate/addAffiliate/after' WHERE `code` = 'activity_affiliate_add'");
		$this->db->query("UPDATE `oc_event` SET `trigger` = 'catalog/model/account/affiliate/editAffiliate/after' WHERE `code` = 'activity_affiliate_edit'");

		if (!is_dir(DIR_STORAGE . 'backup')) {
			mkdir(DIR_STORAGE . 'backup', '0644');

			$handle = fopen(DIR_STORAGE . 'backup/index.html', 'w');

			fclose($handle);
		}

		if (!is_dir(DIR_STORAGE . 'marketplace')) {
			mkdir(DIR_STORAGE . 'marketplace', '0644');

			$handle = fopen(DIR_STORAGE . 'marketplace/index.html', 'w');

			fclose($handle);
		}
	}
}