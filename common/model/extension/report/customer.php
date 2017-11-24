<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ModelExtensionReportCustomer extends Model {
    public function getTotalCustomersByDay() {
        $customer_data = [];

        for ($i = 0; $i < 24; $i++) {
            $customer_data[$i] = [
                'hour'  => $i,
                'total' => 0
            ];
        }

        $query = $this->db->query("SELECT COUNT(*) AS total, HOUR(date_added) AS hour FROM `oc_customer` WHERE DATE(date_added) = DATE(NOW()) GROUP BY HOUR(date_added) ORDER BY date_added ASC");

        foreach ($query->rows as $result) {
            $customer_data[$result['hour']] = [
                'hour'  => $result['hour'],
                'total' => $result['total']
            ];
        }

        return $customer_data;
    }

    public function getTotalCustomersByWeek() {
        $customer_data = [];

        $date_start = strtotime('-' . date('w') . ' days');

        for ($i = 0; $i < 7; $i++) {
            $date = date('Y-m-d', $date_start + ($i * 86400));

            $customer_data[date('w', strtotime($date))] = [
                'day'   => date('D', strtotime($date)),
                'total' => 0
            ];
        }

        $query = $this->db->query("SELECT COUNT(*) AS total, date_added FROM `oc_customer` WHERE DATE(date_added) >= DATE(:date_added) GROUP BY DAYNAME(date_added)",
            [
                ':date_added' => date('Y-m-d', $date_start)
            ]);

        foreach ($query->rows as $result) {
            $customer_data[date('w', strtotime($result['date_added']))] = [
                'day'   => date('D', strtotime($result['date_added'])),
                'total' => $result['total']
            ];
        }

        return $customer_data;
    }

    public function getTotalCustomersByMonth() {
        $customer_data = [];

        for ($i = 1; $i <= date('t'); $i++) {
            $date = date('Y') . '-' . date('m') . '-' . $i;

            $customer_data[date('j', strtotime($date))] = [
                'day'   => date('d', strtotime($date)),
                'total' => 0
            ];
        }

        $query = $this->db->query("SELECT COUNT(*) AS total, date_added FROM `oc_customer` WHERE DATE(date_added) >= :date_added GROUP BY DATE(date_added)",
            [
                ':date_added' => date('Y') . '-' . date('m') . '-1'
            ]);

        foreach ($query->rows as $result) {
            $customer_data[date('j', strtotime($result['date_added']))] = [
                'day'   => date('d', strtotime($result['date_added'])),
                'total' => $result['total']
            ];
        }

        return $customer_data;
    }

    public function getTotalCustomersByYear() {
        $customer_data = [];

        for ($i = 1; $i <= 12; $i++) {
            $customer_data[$i] = [
                'month' => date('M', mktime(0, 0, 0, $i)),
                'total' => 0
            ];
        }

        $query = $this->db->query("SELECT COUNT(*) AS total, date_added FROM `oc_customer` WHERE YEAR(date_added) = YEAR(NOW()) GROUP BY MONTH(date_added)");

        foreach ($query->rows as $result) {
            $customer_data[date('n', strtotime($result['date_added']))] = [
                'month' => date('M', strtotime($result['date_added'])),
                'total' => $result['total']
            ];
        }

        return $customer_data;
    }

    public function getOrders($data = []) {
        $sql = "SELECT c.customer_id, CONCAT(c.firstname, ' ', c.lastname) AS customer, c.email, cgd.name AS customer_group, c.status, o.order_id, SUM(op.quantity) as products, o.total AS total FROM `oc_order` o LEFT JOIN `oc_order_product` op ON (o.order_id = op.order_id) LEFT JOIN `oc_customer` c ON (o.customer_id = c.customer_id) LEFT JOIN `oc_customer_group_description` cgd ON (c.customer_group_id = cgd.customer_group_id) WHERE o.customer_id > 0 AND cgd.language_id = :language_id";
        $args[':language_id'] = $this->config->get('config_language_id');

        if (!empty($data['filter_date_start'])) {
            $sql .= " AND DATE(o.date_added) >= :date_start";
            $args[':date_start'] = $data['filter_date_start'];
        }

        if (!empty($data['filter_date_end'])) {
            $sql .= " AND DATE(o.date_added) <= :date_end";
            $args[':date_end'] = $data['filter_date_end'];
        }

        if (!empty($data['filter_customer'])) {
            $sql .= " AND CONCAT(c.firstname, ' ', c.lastname) LIKE :customer";
            $args[':customer'] = $data['filter_customer'] . '%';
        }

        if (!empty($data['filter_order_status_id'])) {
            $sql .= " AND o.order_status_id = :order_status_id";
            $args[':order_status_id'] = $data['filter_order_status_id'];
        } else {
            $sql .= " AND o.order_status_id > :order_status_id";
            $args[':order_status_id'] = 0;
        }

        $sql .= " GROUP BY o.order_id";

        $sql = "SELECT t.customer_id, t.customer, t.email, t.customer_group, t.status, COUNT(DISTINCT t.order_id) AS orders, SUM(t.products) AS products, SUM(t.total) AS total FROM (" . $sql . ") AS t GROUP BY t.customer_id ORDER BY total DESC";

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

    public function getTotalOrders($data = []) {
        $sql = "SELECT COUNT(DISTINCT o.customer_id) AS total FROM `oc_order` o LEFT JOIN `oc_customer` c ON (o.customer_id = c.customer_id) WHERE o.customer_id > :customer_id";
        $args[':customer_id'] = 0;

        if (!empty($data['filter_date_start'])) {
            $sql .= " AND DATE(o.date_added) >= :date_end";
            $args[':date_start'] = $data['filter_date_start'];
        }

        if (!empty($data['filter_date_end'])) {
            $sql .= " AND DATE(o.date_added) <= :date_end";
            $args[':date_end'] = $data['filter_date_end'];
        }

        if (!empty($data['filter_customer'])) {
            $sql .= " AND CONCAT(c.firstname, ' ', c.lastname) LIKE :customer";
            $args[':customer'] = $data['filter_customer'] . '%';
        }

        if (!empty($data['filter_order_status_id'])) {
            $sql .= " AND o.order_status_id = :order_status_id";
            $args[':order_status_id'] = $data['filter_order_status_id'];
        } else {
            $sql .= " AND o.order_status_id > :order_status_id";
            $args[':order_status_id'] = 0;
        }

        $query = $this->db->query($sql, $args);

        return $query->row['total'];
    }

    public function getCustomerActivities($data = []) {
        $sql = "SELECT ca.customer_activity_id, ca.customer_id, ca.key, ca.data, ca.ip, ca.date_added FROM oc_customer_activity ca LEFT JOIN oc_customer c ON (ca.customer_id = c.customer_id)";

        $implode = [];
        $args = [];

        if (!empty($data['filter_date_start'])) {
            $implode[] = "DATE(ca.date_added) >= :date_start";
            $args[':date_start'] = $data['filter_date_start'];
        }

        if (!empty($data['filter_date_end'])) {
            $implode[] = "DATE(ca.date_added) <= :date_end";
            $args[':date_end'] = $data['filter_date_end'];
        }

        if (!empty($data['filter_customer'])) {
            $implode[] = "CONCAT(c.firstname, ' ', c.lastname) LIKE :customer";
            $args[':customer'] = $data['filter_customer'] . '%';
        }

        if (!empty($data['filter_ip'])) {
            $implode[] = "ca.ip LIKE :ip";
            $args[':ip'] = $data['filter_ip'];
        }

        if ($implode) {
            $sql .= " WHERE " . implode(" AND ", $implode);
        }

        $sql .= " ORDER BY ca.date_added DESC";

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

    public function getTotalCustomerActivities($data = []) {
        $sql = "SELECT COUNT(*) AS total FROM `oc_customer_activity` ca LEFT JOIN oc_customer c ON (ca.customer_id = c.customer_id)";

        $implode = [];
        $args = [];

        if (!empty($data['filter_date_start'])) {
            $implode[] = "DATE(ca.date_added) >= :date_start";
            $args[':date_start'] = $data['filter_date_start'];
        }

        if (!empty($data['filter_date_end'])) {
            $implode[] = "DATE(ca.date_added) <= :date_end";
            $args[':date_end'] = $data['filter_date_end'];
        }

        if (!empty($data['filter_customer'])) {
            $implode[] = "CONCAT(c.firstname, ' ', c.lastname) LIKE :customer";
            $args[':customer'] = $data['filter_customer'] . '%';
        }

        if (!empty($data['filter_ip'])) {
            $implode[] = "ca.ip LIKE :ip";
            $args[':ip'] = $data['filter_ip'];
        }

        if ($implode) {
            $sql .= " WHERE " . implode(" AND ", $implode);
        }

        $query = $this->db->query($sql, $args);

        return $query->row['total'];
    }

    public function getCustomerSearches($data = []) {
        $sql = "SELECT cs.customer_id, cs.keyword, cs.category_id, cs.products, cs.ip, cs.date_added, CONCAT(c.firstname, ' ', c.lastname) AS customer FROM oc_customer_search cs LEFT JOIN oc_customer c ON (cs.customer_id = c.customer_id)";

        $implode = [];
        $args = [];

        if (!empty($data['filter_date_start'])) {
            $implode[] = "DATE(cs.date_added) >= :date_start";
            $args[':date_start'] = $data['filter_date_start'];
        }

        if (!empty($data['filter_date_end'])) {
            $implode[] = "DATE(cs.date_added) <= :date_end";
            $args[':date_end'] = $data['filter_date_end'];
        }

        if (!empty($data['filter_keyword'])) {
            $implode[] = "cs.keyword LIKE :keyword";
            $args[':keyword'] = $data['filter_keyword'] . '%';
        }

        if (!empty($data['filter_customer'])) {
            $implode[] = "CONCAT(c.firstname, ' ', c.lastname) LIKE :customer";
            $args[':customer'] = $data['filter_customer'] . '%';
        }

        if (!empty($data['filter_ip'])) {
            $implode[] = "cs.ip LIKE :ip";
            $args[':ip'] = $data['filter_ip'];
        }

        if ($implode) {
            $sql .= " WHERE " . implode(" AND ", $implode);
        }

        $sql .= " ORDER BY cs.date_added DESC";

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

    public function getTotalCustomerSearches($data = []) {
        $sql = "SELECT COUNT(*) AS total FROM `oc_customer_search` cs LEFT JOIN oc_customer c ON (cs.customer_id = c.customer_id)";

        $implode = [];
        $args = [];

        if (!empty($data['filter_date_start'])) {
            $implode[] = "DATE(cs.date_added) >= :date_start";
            $args[':date_start'] = $data['filter_date_start'];
        }

        if (!empty($data['filter_date_end'])) {
            $implode[] = "DATE(cs.date_added) <= :date_end";
            $args[':date_end'] = $data['filter_date_end'];
        }

        if (!empty($data['filter_keyword'])) {
            $implode[] = "cs.keyword LIKE :keyword";
            $args[':keyword'] = $data['filter_keyword'] . '%';
        }

        if (!empty($data['filter_customer'])) {
            $implode[] = "CONCAT(c.firstname, ' ', c.lastname) LIKE :customer";
            $args[':customer'] = $data['filter_customer'];
        }

        if (!empty($data['filter_ip'])) {
            $implode[] = "cs.ip LIKE :ip";
            $args[':ip'] = $data['filter_ip'];
        }

        if ($implode) {
            $sql .= " WHERE " . implode(" AND ", $implode);
        }

        $query = $this->db->query($sql, $args);

        return $query->row['total'];
    }
}