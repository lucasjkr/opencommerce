<?php
class ModelExtensionFraudIpAdmin extends Model {
	public function install() {
		$this->db->query("
            CREATE TABLE IF NOT EXISTS `oc_fraud_ip` (
              `ip` varchar(40) NOT NULL,
              `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
              `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
              PRIMARY KEY (`ip`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
		");
	}

	public function uninstall() {
		$this->db->query("DROP TABLE IF EXISTS `oc_ip`");
	}

    public function addIp($ip) {
        $this->db->query("INSERT INTO `oc_fraud_ip` SET `ip` = :ip",
            [
                ':ip' => $ip
            ]);
    }

    public function removeIp($ip) {
        $this->db->query("DELETE FROM `oc_fraud_ip` WHERE `ip` = :ip",
            [
                ':ip' => $ip
            ]);
    }

	public function getIps($start = 0, $limit = 10) {
        if ($start < 0) {
			$start = 0;
		}

		if ($limit < 1) {
			$limit = 10;
		}

        $query = $this->db->query("SELECT * FROM `oc_fraud_ip` ORDER BY `ip` ASC LIMIT " . (int)$start . "," . (int)$limit);

		return $query->rows;
	}

	public function getTotalIps() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `oc_fraud_ip`");

		return $query->row['total'];
	}

	public function getTotalIpsByIp($ip) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `oc_fraud_ip` WHERE ip = :ip",
            [
                ':ip' => $ip
            ]);

		return $query->row['total'];
	}
}
