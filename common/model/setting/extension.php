<?php
class ModelSettingExtension extends Model {
    function getExtensions($type) {
        $query = $this->db->query("SELECT * FROM oc_extension WHERE `type` = :type",
            [
                ':type' => $type
            ]);

        return $query->rows;
    }

	public function getInstalled($type) {
		$extension_data = [];

		$query = $this->db->query("SELECT * FROM `oc_extension` WHERE `type` = :type ORDER BY `code`",
            [
                ':type' => $type
            ]);

		foreach ($query->rows as $result) {
			$extension_data[] = $result['code'];
		}

		return $extension_data;
	}

	public function install($type, $code) {
		$extensions = $this->getInstalled($type);

		if (!in_array($code, $extensions)) {
			$this->db->query("INSERT INTO `oc_extension` SET `type` = :type, `code` = :code",
                [
                    ':type' => $type,
                    ':code' => $code
                ]);
		}
	}

	public function uninstall($type, $code) {
		$this->db->query("DELETE FROM `oc_extension` WHERE `type` = :type AND `code` = :code",
            [
                ':type' => $type,
                ':code' => $code
            ]);
		$this->db->query("DELETE FROM `oc_setting` WHERE `code` = :code",
            [
                ':code' => $type . "_" . $code
            ]);
	}	

	public function addExtensionInstall($filename, $extension_id = 0, $extension_download_id = 0) {
		$this->db->query("INSERT INTO `oc_extension_install` SET `filename` = :filename, `extension_id` = :extension_id, `extension_download_id` = :extension_download_id",
            [
                ':filename' => $filename,
                ':extension_id' => $extension_id,
                ':extension_download_id' => $extension_download_id
            ]);
	
		return $this->db->getLastId();
	}
	
	public function deleteExtensionInstall($extension_install_id) {
		$this->db->query("DELETE FROM `oc_extension_install` WHERE `extension_install_id` = :extension_install_id",
            [
                ':extension_install_id' => $extension_install_id
            ]);
	}

	public function getExtensionInstalls($start = 0, $limit = 10) {
		if ($start < 0) {
			$start = 0;
		}

		if ($limit < 1) {
			$limit = 10;
		}		
		
		$query = $this->db->query("SELECT * FROM `oc_extension_install` ORDER BY date_added DESC LIMIT " . (int)$start . "," . (int)$limit);
	
		return $query->rows;
	}

	public function getExtensionInstallByExtensionDownloadId($extension_download_id) {
		$query = $this->db->query("SELECT * FROM `oc_extension_install` WHERE `extension_download_id` = :extension_download_id",
            [
                ':extension_download_id' => $extension_download_id
            ]);

		return $query->row;
	}
		
	public function getTotalExtensionInstalls() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `oc_extension_install`");

		return $query->row['total'];
	}
		
	public function addExtensionPath($extension_install_id, $path) {
		$this->db->query("INSERT INTO `oc_extension_path` SET `extension_install_id` = :extension_install_id, `path` = :path",
            [
                ':extension_install_id' => $extension_install_id,
                ':path' => $path
            ]);
	}
		
	public function deleteExtensionPath($extension_path_id) {
		$this->db->query("DELETE FROM `oc_extension_path` WHERE `extension_path_id` = :extension_path_id",
            [
                ':extension_path_id' => $extension_path_id
            ]);
	}
	
	public function getExtensionPathsByExtensionInstallId($extension_install_id) {
		$query = $this->db->query("SELECT * FROM `oc_extension_path` WHERE `extension_install_id` = :extension_install_id ORDER BY `date_added` ASC",
            [
                ':extension_install_id' => $extension_install_id
            ]);

		return $query->rows;
	}
}