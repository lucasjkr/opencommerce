<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ModelSettingEvent extends Model {
	function getEvents() {
		$query = $this->db->query("SELECT * FROM `oc_event` WHERE `trigger` LIKE :trigger AND status = '1' ORDER BY `sort_order` ASC",
            [
                ':trigger' => 'catalog/%'
            ]);

		return $query->rows;
	}
}