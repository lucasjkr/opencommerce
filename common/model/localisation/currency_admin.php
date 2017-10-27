<?php
class ModelLocalisationCurrencyAdmin extends Model {
	public function addCurrency($data) {
		$this->db->query("INSERT INTO oc_currency SET title = :title, code = :code, symbol_left = :symbol_left, symbol_right = :symbol_right, decimal_place = :decimal_place, value = :value, status = :status",
            [
                ':title' => $data['title'],
                ':code' => $data['code'],
                ':symbol_left' => $data['symbol_left'],
                ':symbol_right' => $data['symbol_right'],
                ':decimal_place' => $data['decimal_place'],
                ':value' => $data['value'],
                ':status' => $data['status'] ,
            ]);

		$currency_id = $this->db->getLastId();

		if ($this->config->get('config_currency_auto')) {
			$this->refresh(true);
		}

		$this->cache->delete('currency');
		
		return $currency_id;
	}

	public function editCurrency($currency_id, $data) {
		$this->db->query("UPDATE oc_currency SET title = :title, code = :code, symbol_left = :symbol_left, symbol_right = :symbol_right, decimal_place = :decimal_place, value = :value, status = :status  WHERE currency_id = currency_id",
            [
                ':title' => $data['title'],
                ':code' => $data['code'],
                ':symbol_left' => $data['symbol_left'],
                ':symbol_right' => $data['symbol_right'],
                ':decimal_place' => $data['decimal_place'],
                ':value' => $data['value'],
                ':status' => $data['status'],
                ':currency_id' => $currency_id
            ]);

		$this->cache->delete('currency');
	}

	public function deleteCurrency($currency_id) {
		$this->db->query("DELETE FROM oc_currency WHERE currency_id = :currency_id",
            [
                ':currency_id' => $currency_id
            ]);

		$this->cache->delete('currency');
	}

	public function getCurrency($currency_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM oc_currency WHERE currency_id = :currency_id",
            [
                ':currency_id' => $currency_id
            ]);

		return $query->row;
	}

	public function getCurrencyByCode($code) {
		$query = $this->db->query("SELECT DISTINCT * FROM oc_currency WHERE code = :code",
            [
                ':code' => $code
            ]);

		return $query->row;
	}

	public function getCurrencies($data = []) {
		if ($data) {
			$sql = "SELECT * FROM oc_currency";

			$sort_data = [
				'title',
				'code',
				'value',
				'date_modified'
            ];

			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];
			} else {
				$sql .= " ORDER BY title";
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
		} else {
			$currency_data = $this->cache->get('currency');

			if (!$currency_data) {
				$currency_data = [];

				$query = $this->db->query("SELECT * FROM oc_currency ORDER BY title ASC");

				foreach ($query->rows as $result) {
					$currency_data[$result['code']] = [
						'currency_id'   => $result['currency_id'],
						'title'         => $result['title'],
						'code'          => $result['code'],
						'symbol_left'   => $result['symbol_left'],
						'symbol_right'  => $result['symbol_right'],
						'decimal_place' => $result['decimal_place'],
						'value'         => $result['value'],
						'status'        => $result['status'],
						'date_modified' => $result['date_modified']
                    ];
				}

				$this->cache->set('currency', $currency_data);
			}

			return $currency_data;
		}
	}

	public function refresh($force = false) {
		$currency_data = [];

		if ($force) {
			$query = $this->db->query("SELECT * FROM oc_currency WHERE code != :code",
                [
                    ':code' => $this->config->get('config_currency')
                ]);
		} else {
			$query = $this->db->query("SELECT * FROM oc_currency WHERE code != :code AND date_modified < :date_modified",
                [
                    ':code' => $this->config->get('config_currency'),
                    ':date_modified' => date('Y-m-d H:i:s', strtotime('-1 day'))
                ]);
		}

		foreach ($query->rows as $result) {
			$currency_data[] = $this->config->get('config_currency') . $result['code'] . '=X';
			$currency_data[] = $result['code'] . $this->config->get('config_currency') . '=X';
		}

		//LJK TODO:
        // Convert to Guzzle
        // Add more methods (yahoo could be just one, coincap, google, etc.
		$curl = curl_init();

		curl_setopt($curl, CURLOPT_URL, 'http://download.finance.yahoo.com/d/quotes.csv?s=' . implode(',', $currency_data) . '&f=sl1&e=.json');
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($curl, CURLOPT_HEADER, false);
		curl_setopt($curl, CURLOPT_CONNECTTIMEOUT, 30);
		curl_setopt($curl, CURLOPT_TIMEOUT, 30);

		$content = curl_exec($curl);
		
		curl_close($curl);

		$line = explode("\n", trim($content));

		for ($i = 0; $i < count($line); $i = $i + 2) {
			$currency = utf8_substr($line[$i], 4, 3);
			$value = utf8_substr($line[$i], 11, 6);
			
			if ((float)$value < 1 && isset($line[$i + 1])) {
				$value = (1 / utf8_substr($line[$i + 1], 11, 6));
			}	
						
			if ((float)$value) {
				$this->db->query("UPDATE oc_currency SET value = :value WHERE code = :code",
                    [
                        ':value' => $value,
                        ':code' => $currency,
                    ]);
			}
		}

		$this->db->query("UPDATE oc_currency SET value = :value WHERE code = :code",
            [
                ':value' => 1,
                ':code' => $this->config->get('config_currency')
            ]);

		$this->cache->delete('currency');
	}

	public function getTotalCurrencies() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_currency");

		return $query->row['total'];
	}
}