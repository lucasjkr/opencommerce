<?php
class ModelSettingModule extends Model {
	public function addModule($code, $data) {
		$this->db->query("INSERT INTO `oc_module` SET `name` = :name, `code` = :code, `setting` = :setting",
            [
                ':name' => $data['name'],
                ':code' => $code,
                ':setting' => json_encode($data)
            ]);
	}
	
	public function editModule($module_id, $data) {
		$this->db->query("UPDATE `oc_module` SET `name` = :name, `setting` = :setting WHERE `module_id` = :module_id",
            [
                ':name' => $data['name'],
                ':setting' => json_encode($data),
                ':module_id' => $module_id
            ]);
	}

	public function deleteModule($module_id) {
		$this->db->query("DELETE FROM `oc_module` WHERE `module_id` = :module_id",
            [
                ':module_id' => $module_id
            ]);
		$this->db->query("DELETE FROM `oc_layout_module` WHERE `code` LIKE :module_id",
            [
                ':module_id' => '%' . $module_id
            ]);
	}
		
	public function getModule($module_id) {
		$query = $this->db->query("SELECT * FROM `oc_module` WHERE `module_id` = :module_id",
            [
                ':module_id' => $module_id
            ]);

		if ($query->row) {
			return json_decode($query->row['setting'], true);
		} else {
			return [];
		}
	}
	
	public function getModules() {
		$query = $this->db->query("SELECT * FROM `oc_module` ORDER BY `code`");

		return $query->rows;
	}	
		
	public function getModulesByCode($code) {
		$query = $this->db->query("SELECT * FROM `oc_module` WHERE `code` = :code ORDER BY `name`",
            [
                ':code' => $code
            ]);

		return $query->rows;
	}	
	
	public function deleteModulesByCode($code) {
		$this->db->query("DELETE FROM `oc_module` WHERE `code` = :code",
            [
                ':code' => $code
            ]);
        // LJK TODO: This seems silly probably doesn't need both criteria
		$this->db->query("DELETE FROM `oc_layout_module` WHERE `code` LIKE :code_1 OR `code` LIKE :code_2",
            [
                ':code_1' => $code,
                ':code_2' => $code . '%'
            ]);
	}	
}