<?php
class ModelToolBackup extends Model {
    // LJK TODO: These are admin-only functions; should add a check somewhere within to make sure that the logged in
    // user is allowed to access it. Leaving it only to the controller for the page means that a stupid dev or bad
    // plugin could open this to regular visitors
	public function getTables() {
		$table_data = [];

		$query = $this->db->query("SHOW TABLES FROM `" . DB_DATABASE . "`");

		foreach ($query->rows as $result) {
			if (utf8_substr($result['Tables_in_' . DB_DATABASE], 0, strlen(DB_PREFIX)) == DB_PREFIX) {
				if (isset($result['Tables_in_' . DB_DATABASE])) {
					$table_data[] = $result['Tables_in_' . DB_DATABASE];
				}
			}
		}

		return $table_data;
	}

	public function getRecords($table, $start = 0, $limit = 100) {
		if ($start < 0) {
			$start = 0;
		}

		if ($limit < 1) {
			$limit = 10;
		}

		$query = $this->db->query("SELECT * FROM `" . $table . "` LIMIT " . (int)$start . "," . (int)$limit);

		if ($query->num_rows) {
			return $query->rows;
		} else {
			return [];
		}
	}

	public function getTotalRecords($table) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . $table . "`");

		if ($query->num_rows) {
			return $query->row['total'];
		} else {
			return 0;
		}
	}
}