<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ModelSettingModification extends Model {
	public function addModification($data) {
		$this->db->query("INSERT INTO `oc_modification` SET `extension_install_id` = extension_install_id, `name` = :name, `code` = :code, `author` = :author, `version` = :version, `link` = :link, `xml` = :xml, `status` = :status",
            [
                ':extension_install_id' => $data['extension_install_id'],
                ':name' => $data['name'],
                ':code' => $data['code'],
                ':author' => $data['author'],
                ':version' => $data['version'],
                ':link' => $data['link'],
                ':xml' => $data['xml'],
                ':status' => $data['status'],
            ]);
	}

	public function deleteModification($modification_id) {
		$this->db->query("DELETE FROM `oc_modification` WHERE `modification_id` = :modification_id",
            [
                ':modification_id' => $modification_id
            ]);
	}

	public function deleteModificationsByExtensionInstallId($extension_install_id) {
		$this->db->query("DELETE FROM `oc_modification` WHERE `extension_install_id` = :extension_install_id",
            [
                ':extension_install_id' => $extension_install_id
            ]);
	}
	
	public function enableModification($modification_id) {
		$this->db->query("UPDATE `oc_modification` SET `status` = '1' WHERE `modification_id` = :modification_id",
            [
                ':modification_id' => $modification_id
            ]);
	}

	public function disableModification($modification_id) {
		$this->db->query("UPDATE `oc_modification` SET `status` = '0' WHERE `modification_id` = :modification_id",
            [
                ':modification_id' => $modification_id
            ]);
	}

	public function getModification($modification_id) {
		$query = $this->db->query("SELECT * FROM `oc_modification` WHERE `modification_id` = :modification_id",
            [
                ':modification_id' => $modification_id
            ]);

		return $query->row;
	}

	public function getModifications($data = []) {
		$sql = "SELECT * FROM `oc_modification`";

		$sort_data = [
			'name',
			'author',
			'version',
			'status',
			'date_added'
		];

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY name";
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
	}

	public function getTotalModifications() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `oc_modification`");

		return $query->row['total'];
	}
	
	public function getModificationByCode($code) {
		$query = $this->db->query("SELECT * FROM `oc_modification` WHERE `code` = :code",
            [
                ':code' => $code
            ]);

		return $query->row;
	}	
}