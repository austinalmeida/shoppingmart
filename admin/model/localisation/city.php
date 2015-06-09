<?php
class ModelLocalisationCity extends Model {
	public function addCity($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "cities SET status = '" . (int)$data['status'] . "', city_name = '" . $this->db->escape($data['city_name']) . "', zone_id = '" . (int)$data['country_id'] . "'");

		$this->cache->delete('city');
	}

	public function editCity($city_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "cities SET status = '" . (int)$data['status'] . "', city_name = '" . $this->db->escape($data['city_name']) . "', zone_id = '" . (int)$data['country_id'] . "' WHERE city_id = '" . (int)$city_id . "'");

		$this->cache->delete('city');
	}

	public function deleteCity($city_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "cities WHERE city_id = '" . (int)$city_id . "'");

		$this->cache->delete('city');
	}

	public function getCity($city_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "cities WHERE city_id = '" . (int)$city_id . "'");

		return $query->row;
	}

	public function getCities($data = array()) {
		$sql = "SELECT *, z.city_name, c.name AS country FROM " . DB_PREFIX . "cities z LEFT JOIN " . DB_PREFIX . "country c ON (z.zone_id = c.country_id)";

		$sort_data = array(
			'c.name',
			'z.city_name'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY c.name";
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

	public function getCitiesByZoneId($zone_id) {
		$city_data = $this->cache->get('city.' . (int)$zone_id);

		if (!$city_data) {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "cities WHERE zone_id = '" . (int)$zone_id . "' AND status = '1' ORDER BY city_name");

			$city_data = $query->rows;

			$this->cache->set('city.' . (int)$zone_id, $city_data);
		}

		return $city_data;
	}

	public function getTotalCities() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "cities");

		return $query->row['total'];
	}

	public function getTotalCitiesByCountryId($country_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "cities WHERE country_id = '" . (int)$country_id . "'");

		return $query->row['total'];
	}
}