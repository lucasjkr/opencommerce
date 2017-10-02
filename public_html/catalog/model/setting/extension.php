<?php
class ModelSettingExtension extends Model {
	function getExtensions($type) {
		$query = $this->db->query("SELECT * FROM oc_extension WHERE `type` = '" . $this->db->escape($type) . "'");

		return $query->rows;
	}
}