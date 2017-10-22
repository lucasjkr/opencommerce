<?php
class ModelSettingModificationAdmin extends Model {
	public function addModification($data) {
		$this->db->query("INSERT INTO `oc_modification` SET `extension_install_id` = '" . (int)$data['extension_install_id'] . "', `name` = '" . $this->db->escape((string)$data['name']) . "', `code` = '" . $this->db->escape((string)$data['code']) . "', `author` = '" . $this->db->escape((string)$data['author']) . "', `version` = '" . $this->db->escape((string)$data['version']) . "', `link` = '" . $this->db->escape((string)$data['link']) . "', `xml` = '" . $this->db->escape((string)$data['xml']) . "', `status` = '" . (int)$data['status'] . "'");
	}

	public function deleteModification($modification_id) {
		$this->db->query("DELETE FROM `oc_modification` WHERE `modification_id` = '" . (int)$modification_id . "'");
	}

	public function deleteModificationsByExtensionInstallId($extension_install_id) {
		$this->db->query("DELETE FROM `oc_modification` WHERE `extension_install_id` = '" . (int)$extension_install_id . "'");
	}
	
	public function enableModification($modification_id) {
		$this->db->query("UPDATE `oc_modification` SET `status` = '1' WHERE `modification_id` = '" . (int)$modification_id . "'");
	}

	public function disableModification($modification_id) {
		$this->db->query("UPDATE `oc_modification` SET `status` = '0' WHERE `modification_id` = '" . (int)$modification_id . "'");
	}

	public function getModification($modification_id) {
		$query = $this->db->query("SELECT * FROM `oc_modification` WHERE `modification_id` = '" . (int)$modification_id . "'");

		return $query->row;
	}

	public function getModifications($data = []) {
		$sql = "SELECT * FROM `oc_modification`";

		$sort_data = array(
			'name',
			'author',
			'version',
			'status',
			'date_added'
		);

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
		$query = $this->db->query("SELECT * FROM `oc_modification` WHERE `code` = '" . $this->db->escape($code) . "'");

		return $query->row;
	}	
}