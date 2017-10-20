<?php
class ModelToolUpload extends Model {
//  These models are used by catalog AND admin
    public function addUpload($name, $filename) {
        $code = sha1(random_bytes(32), true);

        $this->db->query("INSERT INTO `oc_upload` SET `name` = :name, `filename` = :filename, `code` = :code",
            [
                ':name' => $name,
                ':filename' => $filename,
                ':code' => $code,
            ]);

        return $code;
    }

    public function getUploadByCode($code) {
        $query = $this->db->query("SELECT * FROM oc_upload WHERE code = :code",
            [
                ':code' => $code
            ]);

        return $query->row;
    }

//  Admin-only models
    public function deleteUpload($upload_id) {
        $this->db->query("DELETE FROM oc_upload WHERE upload_id = :upload_id",
            [
                ':upload_id' => $upload_id
            ]);
    }

    public function getUpload($upload_id) {
        $query = $this->db->query("SELECT * FROM `oc_upload` WHERE upload_id = :upload_id",
            [
                ':upload_id' => $upload_id
            ]);
        return $query->row;
    }

    public function getUploads($data = array()) {
        $sql = "SELECT * FROM oc_upload";

        $implode = [];
        $args = [];

        if (!empty($data['filter_name'])) {
            $implode[] = "name LIKE :name";
            $args[':name'] = $data['filter_name'] . '%';
        }

        if (!empty($data['filter_filename'])) {
            $implode[] = "filename LIKE :filename";
            $args[':filename'] = $data['filter_filename'] . '%';
        }

        if (!empty($data['filter_date_added'])) {
            $implode[] = "date_added = :date_added";
            $args[':date_added'] = $data['filter_date_added'];
        }

        if ($implode) {
            $sql .= " WHERE " . implode(" AND ", $implode);
        }

        $sort_data = array(
            'name',
            'filename',
            'date_added'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY date_added";
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

        $query = $this->db->query($sql, $args);

        return $query->rows;
    }

    public function getTotalUploads($data = array()) {
        $sql = "SELECT COUNT(*) AS total FROM oc_upload";

        $implode = [];
        $args = [];

        if (!empty($data['filter_name'])) {
            $implode[] = "name LIKE :name";
            $args[':name'] = $data['filter_name'] . '%';
        }

        if (!empty($data['filter_filename'])) {
            $implode[] = "filename LIKE filename";
            $args[':filename'] = $data['filter_filename'] . '%';
        }

        if (!empty($data['filter_date_added'])) {
            $implode[] = "date_added = :date_added";
            $args[':date_added'] = $data['filter_date_added'];
        }

        if ($implode) {
            $sql .= " WHERE " . implode(" AND ", $implode);
        }

        $query = $this->db->query($sql);

        return $query->row['total'];
    }
}