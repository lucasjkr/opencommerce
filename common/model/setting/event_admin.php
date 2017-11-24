<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ModelSettingEventAdmin extends Model {
	public function addEvent($code, $trigger, $action, $status = 1, $sort_order = 0) {
		$this->db->query("INSERT INTO `oc_event` SET `code` = :code, `trigger` = :trigger, `action` = :action, `sort_order` = :sort_order, `status` = :status",
            [
                ':code' => $code,
                ':trigger' => $trigger,
                ':action' => $action,
                ':sort_order' => $sort_order,
                ':status' => $status
            ]);
	
		return $this->db->getLastId();
	}

    // LJK CAN THESE TWO DELETES BE COMBINED INTO A SINGLE function WITH A where?
    // DELETE from WHERE event_id = ? or code = ?
    // The same placeholder could be used twice, so only one variable still
	public function deleteEvent($event_id) {
		$this->db->query("DELETE FROM `oc_event` WHERE `event_id` = :event_id",
            [
                ':event_id' => $event_id
            ]);
	}
	
	public function deleteEventByCode($code) {
		$this->db->query("DELETE FROM `oc_event` WHERE `code` = :code",
            [
                ':code' => $code
            ]);
	}

	public function editStatus($event_id, $status) {
		$this->db->query("UPDATE `oc_event` SET `status` = :status WHERE event_id = :event_id",
            [
                ':status' => $status,
                ':event_id' => $event_id
            ]);
	}
	
	public function uninstall($type, $code) {
		$this->db->query("DELETE FROM `oc_extension` WHERE `type` = :type AND `code` = :code",
            [
                ':type' => $type,
                ':code' => $code
            ]);
		$this->db->query("DELETE FROM `oc_setting` WHERE `code` = :code",
            [
                ':code' => $code
            ]);
	}

	public function getEvent($event_id) {
		$query = $this->db->query("SELECT * FROM `oc_event` WHERE `event_id` = :event_id",
            [
                ':event_id' => $event_id
            ]);

		return $query->row;
	}

	public function getEventByCode($code) {
		$query = $this->db->query("SELECT DISTINCT * FROM `oc_event` WHERE `code` = :code LIMIT 1",
            [
                ':code' => $code
            ]);

		return $query->row;
	}
		
	public function getEvents($data = []) {
		$sql = "SELECT * FROM `oc_event`";

		$sort_data = [
			'code',
			'trigger',
			'action',
			'sort_order',
			'status',
			'date_added'
        ];

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY `" . $data['sort'] . "`";
		} else {
			$sql .= " ORDER BY `sort_order`";
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

	public function getTotalEvents() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `oc_event`");

		return $query->row['total'];
	}
}