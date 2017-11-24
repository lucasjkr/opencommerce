<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ModelSettingSetting extends Model {
	public function getSetting($code, $store_id = 0) {
		$setting_data = [];

		$query = $this->db->query("SELECT * FROM oc_setting WHERE store_id = :store_id AND `code` = :code",
            [
                ':store_id' => $store_id,
                ':code' => $code,
            ]);

		foreach ($query->rows as $result) {
			if (!$result['serialized']) {
				$setting_data[$result['key']] = $result['value'];
			} else {
				$setting_data[$result['key']] = json_decode($result['value'], true);
			}
		}

		return $setting_data;
	}

	public function editSetting($code, $data, $store_id = 0) {
		$this->db->query("DELETE FROM `oc_setting` WHERE store_id = :store_id AND `code` = :code",
            [
                ':store_id' => $store_id,
                ':code' => $code

            ]);

		foreach ($data as $key => $value) {
			if (substr($key, 0, strlen($code)) == $code) {
				if (!is_array($value)) {
					$this->db->query("INSERT INTO `oc_setting` SET `store_id` = :store_id, `code` = :code, `key` = :key, `value` = :value",
                        [
                            ':store_id' => $store_id,
                            ':code' => $code,
                            ':key' => $key,
                            ':value' => $value,
                        ]);
				} else {
					$this->db->query("INSERT INTO oc_setting SET store_id = :store_id, `code` = :code, `key` = :key, `value` = :values, serialized = '1'",
                        [
                            ':store_id' => $store_id,
                            ':code' => $code,
                            ':key' => $key,
                            ':values' => json_encode($value, true),
                        ]);
				}
			}
		}
	}

	public function deleteSetting($code, $store_id = 0) {
		$this->db->query("DELETE FROM oc_setting WHERE store_id = :store_id AND `code` = :code".
        [
            ':store_id' => $store_id,
            ':code' => $code,
        ]);
	}
	
	public function getSettingValue($key, $store_id = 0) {
		$query = $this->db->query("SELECT value FROM oc_setting WHERE store_id = :store_id AND `key` = :key",
            [
                ':store_id' => $store_id,
                ':key' => $key,
            ]);

		if ($query->num_rows) {
			return $query->row['value'];
		} else {
			return null;	
		}
	}
	
	public function editSettingValue($code = '', $key = '', $value = '', $store_id = 0) {
		if(!is_array($value)){
		    $serialized = 0;
        } else {
            $value = json_encode($value);
            $serialized = 1;
        }
        $this->db->query("UPDATE oc_setting SET `value` = :value , serialized = :serialized  WHERE `code` = :code AND `key` = :key AND store_id = :store_id",
            [
                ':value' => $value,
                ':serialized' => $serialized,
                ':code' => $code,
                ':key' => $key,
                ':store_id' => $store_id,
            ]);
		}
}
