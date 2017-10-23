<?php
class ModelSettingStore extends Model {
    // getStores appears to be used by model and catalog.
    public function getStores($data = []) {
        $store_data = $this->cache->get('store');

        if (!$store_data) {
            $query = $this->db->query("SELECT * FROM oc_store ORDER BY url");

            $store_data = $query->rows;

            $this->cache->set('store', $store_data);
        }

        return $store_data;
    }

    // The rest are admin only
    public function addStore($data) {
        $this->db->query("INSERT INTO oc_store SET `name` = :name, `url` = :url, `ssl` = :ssl",
            [
                ':name' => $data['config_name'],
                ':url' => $data['config_url'],
                ':ssl' => $data['config_ssl']
            ]);

        $store_id = $this->db->getLastId();

        // Layout Route
        $query = $this->db->query("SELECT * FROM oc_layout_route WHERE store_id = '0'");

        foreach ($query->rows as $layout_route) {
            $this->db->query("INSERT INTO oc_layout_route SET layout_id = :layout_id, route = :route, store_id = :store_id",
                [
                    ':layout_id' => $layout_route['layout_id'],
                    ':route' => $layout_route['route'],
                    ':store_id' => $store_id,
                ]);
        }

        $this->cache->delete('store');

        return $store_id;
    }

    public function editStore($store_id, $data) {
        $this->db->query("UPDATE oc_store SET name = :name, `url` = :url, `ssl` = :ssl WHERE store_id = :store_id",
            [
                ':name' => $data['config_name'],
                ':url' => $data['config_url'],
                ':ssl' => $data['config_ssl'],
                ':store_id' => $store_id
            ]);

        $this->cache->delete('store');
    }

    public function deleteStore($store_id) {
        $this->db->query("DELETE FROM oc_store WHERE store_id = :store_id",
            [
                ':store_id' => $store_id
            ]);
        $this->db->query("DELETE FROM oc_layout_route WHERE store_id = :store_id",
            [
                ':store_id' => $store_id
            ]);

        $this->cache->delete('store');
    }

    public function getStore($store_id) {
        $query = $this->db->query("SELECT DISTINCT * FROM oc_store WHERE store_id = :store_id",
            [
                ':store_id' => $store_id
            ]);

        return $query->row;
    }

    public function getTotalStores() {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM oc_store");

        return $query->row['total'];
    }

    public function getTotalStoresBy($key, $value) {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM oc_setting WHERE `key` = :key AND `value` = :value  AND store_id != :store_id",
            [
                ':key' => $key,
                ':value' => $value,
                ':store_id' => 0
            ]);

        return $query->row['total'];
    }
}