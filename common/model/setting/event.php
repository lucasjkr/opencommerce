<?php
class ModelSettingEvent extends Model {
	function getEvents() {
		$query = $this->db->query("SELECT * FROM `oc_event` WHERE `trigger` LIKE :trigger AND status = '1' ORDER BY `sort_order` ASC",
            [
                ':trigger' => 'catalog/%'
            ]);

		return $query->rows;
	}
}