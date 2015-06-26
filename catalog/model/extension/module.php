<?php
class ModelExtensionModule extends Model {
	public function getModule($module_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "module WHERE module_id = '" . (int)$module_id . "'");
		
		if ($query->row) {
			return unserialize($query->row['setting']);
		} else {
			return array();	
		}
	}
	
	public function getModuleByCode($code) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "module WHERE code = '" . $code . "'");
	
		if ($query->row) {
			return unserialize($query->row['setting']);
		} else {
			return array();
		}
	}		
}