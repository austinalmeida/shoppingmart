<?php
class City { 	
	private $code;
	private $cities = array();

	public function __construct($registry) {
		$this->config = $registry->get('config');
		$this->db = $registry->get('db');
		$this->language = $registry->get('language');
		$this->request = $registry->get('request');
		$this->session = $registry->get('session');

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "cities");

		foreach ($query->rows as $result) {
			$this->cities[$result['city_name']] = array(
				'city_id'   => $result['city_id'],
				'city_name' => $result['city_name'],
				'code' 		=> $result['city_name']
			);
		}
		
		if (isset($this->request->get['city']) && (array_key_exists($this->request->get['city'], $this->cities))) {
			$this->set($this->request->get['city']);
		} elseif ((isset($this->session->data['city'])) && (array_key_exists($this->session->data['city'], $this->cities))) {
			$this->set($this->session->data['city']);
		} elseif ((isset($this->request->cookie['city'])) && (array_key_exists($this->request->cookie['city'], $this->cities))) {
			$this->set($this->request->cookie['city']);
		} else {
			//$this->set($this->config->get('config_city'));
			$geoplugin = new geoPlugin();
			$geoplugin->locate($this->getRealIpAddr());
			
			$this->set($geoplugin->city);
		}
		
	}

	public function set($city) {
		$this->code = $city;

		if (!isset($this->session->data['city']) || ($this->session->data['city'] != $city)) {
			$this->session->data['city'] = $city;
		}

		if (!isset($this->request->cookie['city']) || ($this->request->cookie['city'] != $city)) {
			setcookie('city', $city, time() + 60 * 60 * 24 * 30, '/', $this->request->server['HTTP_HOST']);
		}
	}

	

	public function getId($city = '') {
		if (!$city) {
			return $this->cities[$this->code]['city_id'];
		} elseif ($city && isset($this->cities[$city])) {
			return $this->cities[$city]['city_id'];
		} else {
			return 0;
		}
	}
	
	function getRealIpAddr()
	{	
		if ( !empty( $_SERVER['HTTP_CLIENT_IP'] ) )
		{	
			$ip = $_SERVER['HTTP_CLIENT_IP'];	
		}
		elseif( !empty( $_SERVER['HTTP_X_FORWARDED_FOR'] ) )		
		{	
			$ip=$_SERVER['HTTP_X_FORWARDED_FOR'];	
		}
		else
		{	
			$ip = $_SERVER['REMOTE_ADDR'];	
		}	
		
		return $ip;	
	}
	
	
	public function getCode() {
		
		return $this->code;
	}

	public function getValue($city = '') {
		if (!$city) {
			return $this->cities[$this->code]['code'];
		} elseif ($city && isset($this->cities[$city])) {
			return $this->cities[$city]['code'];
		} else {
			return 0;
		}
	}

	public function has($city) {
		return isset($this->cities[$city]);
	}
}
