<?php
class ModelSettingEvent extends Model {
	function getEvents() {
		$query = $this->db->query("SELECT * FROM `oc_event` WHERE `trigger` LIKE 'catalog/%' AND status = '1' ORDER BY `sort_order` ASC");

		return $query->rows;
	}
}