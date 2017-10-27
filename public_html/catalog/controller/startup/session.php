<?php
class ControllerStartupSession extends Controller {
	public function index() {
		if (isset($this->request->get['route']) && substr((string)$this->request->get['route'], 0, 4) == 'api/') {
			$this->db->query("DELETE FROM `oc_api_session` WHERE TIMESTAMPADD(HOUR, 1, date_modified) < CURRENT_TIMESTAMP");
					
			// Make sure the IP is allowed
			$api_query = $this->db->query("SELECT DISTINCT * FROM `oc_api` `a` LEFT JOIN `oc_api_session` `as` ON (a.api_id = as.api_id) LEFT JOIN oc_api_ip `ai` ON (a.api_id = ai.api_id) 
WHERE a.status = :status AND `as`.`session_id` = :session_id AND ai.ip = :ip",
                [
                    ':status' => 1,
                    ':session_id' => $this->request->get['api_token'],
                    ':ip' => $this->request->server['REMOTE_ADDR']

                ]);
		 
			if ($api_query->num_rows) {
				$this->session->start($this->request->get['api_token']);
				
				// keep the session alive
                // https://stackoverflow.com/questions/5270957/update-mysql-timestamp-even-if-row-data-is-unchanged
				$this->db->query("UPDATE `oc_api_session` SET `date_modified` = null WHERE `api_session_id` = :api_session_id_2",
                    [
                        ':api_session_id_1' => $api_query->row['api_session_id'],
                        ':api_session_id_2' => $api_query->row['api_session_id']
                    ]);
			}
		} else {
			if (isset($_COOKIE[$this->config->get('session_name')])) {
				$session_id = $_COOKIE[$this->config->get('session_name')];
			} else {
				$session_id = '';
			}
			
			$this->session->start($session_id);
			
			setcookie($this->config->get('session_name'), $this->session->getId(), ini_get('session.cookie_lifetime'), ini_get('session.cookie_path'), ini_get('session.cookie_domain'));	
		}
	}
}