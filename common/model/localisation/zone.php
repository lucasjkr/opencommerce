<?php
class ModelLocalisationZone extends Model {
	public function getZone($zone_id) {
		$query = $this->db->query("SELECT * FROM oc_zone WHERE zone_id = :zone_id AND status = '1'",
            [
                ':zone_id' => $zone_id
            ]);

		return $query->row;
	}

	public function getZonesByCountryId($country_id) {
		$zone_data = $this->cache->get('zone.' . (int)$country_id);

		if (!$zone_data) {
			$query = $this->db->query("SELECT * FROM oc_zone WHERE country_id = :country_id AND status = '1' ORDER BY name",
                [
                    ':country_id' => $country_id
                ]);

			$zone_data = $query->rows;

			$this->cache->set('zone.' . (int)$country_id, $zone_data);
		}

		return $zone_data;
	}
}