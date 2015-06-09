<?php
class ModelLocalisationCity extends Model {
	public function getCityByName($city) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "cities WHERE city_name = '" . $this->db->escape($city) . "'");

		return $query->row;
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
	
	public function getCities() {
		
		$city_data = $this->cache->get('city');

		if (!$city_data) {
			$city_data = array();

			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "cities ORDER BY city_name ASC");

			foreach ($query->rows as $result) {
				$city_data[$result['city_name']] = array(
					'city_id'   	=> $result['city_id'],
					'code'          => $result['city_name'],
					'city_name'     => $result['city_name'],
					'status'     	=> $result['status']
				);
			}

			$this->cache->set('city', $city_data);
		}

		return $city_data;
	}
}