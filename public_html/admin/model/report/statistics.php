<?php
class ModelReportStatistics extends Model {
	public function getStatistics() {
		$query = $this->db->query("SELECT * FROM oc_statistics");

		return $query->rows;
	}
	
	public function getValue($code) {
		$query = $this->db->query("SELECT value FROM oc_statistics WHERE `code` = :code",
            [
                ':code' => $code
            ]);

		if ($query->num_rows) {
			return $query->row['value'];
		} else {
			return null;	
		}
	}
	
	public function addValue($code, $value) {
		$this->db->query("UPDATE oc_statistics SET `value` = (`value` + :value) WHERE `code` = :code",
            [
                ':value' => $value,
                ':code' => $code
            ]);
	}
	
	public function editValue($code, $value) {
		$this->db->query("UPDATE oc_statistics SET `value` = :value WHERE `code` = :code",
            [
                ':value' => $value,
                ':code' => $code
            ]);
	}
		
	public function removeValue($code, $value) {
		$this->db->query("UPDATE oc_statistics SET `value` = (`value` - :value) WHERE `code` = :code",
            [
                ':value' => $value,
                ':code' => $code
            ]);
	}	
}
