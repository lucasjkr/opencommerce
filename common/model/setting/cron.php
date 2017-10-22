<?php
class ModelSettingCron extends Model {
    // Catalog only models
	public function getCronJobs() {
		$query = $this->db->query("SELECT * FROM `oc_cron` WHERE (cycle = 'hour' AND date_modified >= DATE_ADD(NOW(), INTERVAL 1 HOUR)) OR (cycle = 'day' AND date_modified >= DATE_ADD(NOW(), INTERVAL 1 DAY)) OR (cycle = 'month' AND date_modified >= DATE_ADD(NOW(), INTERVAL 1 MONTH)) ORDER BY `date_modified` ASC");

		foreach ($query->rows as $result) {
			$this->db->query("UPDATE `oc_cron` SET `date_modified` = NOW() WHERE cron_id = :cron_id",
                [
                    ':cron_id' => $result['cron_id']
                ]);
		}

		return $query->rows;
	}

    // Admin only models
    public function addCron($code, $cycle = 'day', $action, $status) {
        $this->db->query("INSERT INTO `oc_cron` SET `code` = :code, `cycle` = :cycle, `action` = :action, `status` = :status",
            [
                ':code' => $code,
                ':cycle' => $cycle,
                ':action' => $action,
                ':status' => $status
            ]);

        return $this->db->getLastId();
    }

    public function deleteCron($cron_id) {
        $this->db->query("DELETE FROM `oc_cron` WHERE `cron_id` = :cron_id",
            [
                ':cron_id' => $cron_id
            ]);
    }

    public function deleteCronByCode($code) {
        $this->db->query("DELETE FROM `oc_cron` WHERE `code` = :code",
            [
                ':code' => $code
            ]);
    }

    public function editStatus($cron_id, $status) {
        $this->db->query("UPDATE `oc_cron` SET `status` = :status WHERE cron_id = :cron_id",
            [
                ':status' => $status,
                ':cron_id' => $cron_id
            ]);
    }

    public function getCron($cron_id) {
        $query = $this->db->query("SELECT DISTINCT * FROM `oc_cron` WHERE `cron_id` = :cron_id",
            [
                ':cron_id' => $cron_id
            ]);

        return $query->row;
    }

    public function getCronByCode($code) {
        // LJK TODO: There's a LIMIT 1 here. Find out why the code field isn't indexed?
        $query = $this->db->query("SELECT DISTINCT * FROM `oc_cron` WHERE `code` = :code LIMIT 1",
            [
                ':code' => $code
            ]);

        return $query->row;
    }

    public function getCrons($data = array()) {
        $sql = "SELECT * FROM `oc_cron`";

        $sort_data = array(
            'code',
            'cycle',
            'action',
            'status',
            'date_added',
            'date_modified'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY `" . $data['sort'] . "`";
        } else {
            $sql .= " ORDER BY `date_added`";
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

    public function getTotalCrons() {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM `oc_cron`");

        return $query->row['total'];
    }
}