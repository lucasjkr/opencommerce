<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ModelExtensionFeedGoogleBaseAdmin extends Model {
	public function install() {
		$this->db->query("
			CREATE TABLE `oc_google_base_category` (
				`google_base_category_id` INT(11) NOT NULL AUTO_INCREMENT,
				`name` varchar(255) NOT NULL,
			    `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
				PRIMARY KEY (`google_base_category_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
		");

		$this->db->query("
			CREATE TABLE `oc_google_base_category_to_category` (
				`google_base_category_id` INT(11) NOT NULL,
				`category_id` INT(11) NOT NULL,
				`date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
				PRIMARY KEY (`google_base_category_id`, `category_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
		");
	}

	public function uninstall() {
		$this->db->query("DROP TABLE IF EXISTS `oc_google_base_category`");
		$this->db->query("DROP TABLE IF EXISTS `oc_google_base_category_to_category`");
	}

    public function import($string) {
        $this->db->query("DELETE FROM oc_google_base_category");

        $lines = explode("\n", $string);

        foreach ($lines as $line) {
			if (substr($line, 0, 1) != '#') {
	            $part = explode(' - ', $line, 2);

	            if (isset($part[1])) {
	                $this->db->query("INSERT INTO oc_google_base_category SET google_base_category_id = google_base_category_id, name = :name",
                        [
                            ':google_base_category_id' => $part[0],
                            ':name' => $part[1]
                        ]);
	            }
			}
        }
    }

    public function getGoogleBaseCategories($data = []) {
        $sql = "SELECT * FROM `oc_google_base_category` WHERE name LIKE :filter_name ORDER BY name ASC";
        $args[':filter_name'] = '%' . $data['filter_name'] . '%';

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

	public function addCategory($data) {
		$this->db->query("DELETE FROM oc_google_base_category_to_category WHERE category_id = :category_id",
            [
                ':category_id' => $data['category_id']
            ]);

		$this->db->query("INSERT INTO oc_google_base_category_to_category SET google_base_category_id = :google_base_category_id, category_id = :category_id",
            [
                ':google_base_category_id' => $data['google_base_category_id'],
                ':category_id' => $data['category_id']
            ]);
	}

	public function deleteCategory($category_id) {
		$this->db->query("DELETE FROM oc_google_base_category_to_category WHERE category_id = :category_id",
            [
                ':category_id' => $category_id
            ]);
	}

    public function getCategories($data = []) {
        $sql = "SELECT google_base_category_id, (SELECT name FROM `oc_google_base_category` gbc WHERE gbc.google_base_category_id = gbc2c.google_base_category_id) AS google_base_category, category_id, (SELECT name FROM `oc_category_description` cd WHERE cd.category_id = gbc2c.category_id AND cd.language_id = :language_id) AS category FROM `oc_google_base_category_to_category` gbc2c ORDER BY google_base_category ASC";
        $args[':language_id'] = $this->config->get('config_language_id');

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

	public function getTotalCategories() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `oc_google_base_category_to_category`");

		return $query->row['total'];
    }
}
