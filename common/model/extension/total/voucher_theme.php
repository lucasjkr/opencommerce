<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ModelExtensionTotalVoucherTheme extends Model {
	public function getVoucherTheme($voucher_theme_id) {
		$query = $this->db->query("SELECT * FROM oc_voucher_theme vt LEFT JOIN oc_voucher_theme_description vtd ON (vt.voucher_theme_id = vtd.voucher_theme_id) WHERE vt.voucher_theme_id = :voucher_theme_id AND vtd.language_id = :language_id",
            [
                ':voucher_theme_id' => $voucher_theme_id,
                ':language_id' => $this->config->get('config_language_id')
            ]);

		return $query->row;
	}

	public function getVoucherThemes($data = []) {
		if ($data) {
			$sql = "SELECT * FROM oc_voucher_theme vt LEFT JOIN oc_voucher_theme_description vtd ON (vt.voucher_theme_id = vtd.voucher_theme_id) WHERE vtd.language_id = :language_id ORDER BY vtd.name";
            $args[':language_id'] = $this->config->get('config_language_id');

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
		} else {
			$voucher_theme_data = $this->cache->get('voucher_theme.' . (int)$this->config->get('config_language_id'));

			if (!$voucher_theme_data) {
				$query = $this->db->query("SELECT * FROM oc_voucher_theme vt LEFT JOIN oc_voucher_theme_description vtd ON (vt.voucher_theme_id = vtd.voucher_theme_id) WHERE vtd.language_id = :language_id ORDER BY vtd.name",
                    [
                        ':language_id' => $this->config->get('config_language_id')
                    ]);

				$voucher_theme_data = $query->rows;

				$this->cache->set('voucher_theme.' . (int)$this->config->get('config_language_id'), $voucher_theme_data);
			}

			return $voucher_theme_data;
		}
	}
}
