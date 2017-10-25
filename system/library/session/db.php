<?php
/*
CREATE TABLE IF NOT EXISTS `session` (
  `session_id` varchar(32) NOT NULL,
  `data` text NOT NULL,
  `expire` datetime NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
*/
namespace Session;
final class DB {
	public $expire = '';
	
	public function __construct($registry) {
		$this->db = $registry->get('db');
		
		$this->expire = ini_get('session.gc_maxlifetime');
	}
	
	public function read($session_id) {
		$query = $this->db->query("SELECT `data` FROM `oc_session` WHERE session_id = :session_id AND expire > :expire",
            [
                ':session_id' => $session_id,
                ':expire' => time()
            ]);
		
		if ($query->num_rows) {
			return json_decode($query->row['data'], true);
		} else {
			return false;
		}
	}
	
	public function write($session_id, $data) {
        if ($session_id) {
            $this->db->query("REPLACE INTO `oc_session` SET session_id = :session_id, `data` = :data, expire = :expire",
                [
                    ':session_id' => $session_id,
                    ':data' => json_encode($data),
                    ':expire' => date('Y-m-d H:i:s', time() + $this->expire)
                ]);
        }
		return true;
	}
	
	public function destroy($session_id) {
		$this->db->query("DELETE FROM `oc_session` WHERE session_id = :session_id",
            [
                ':session_id' => $session_id
            ]);
		
		return true;
	}
	
	public function gc($expire) {
		$this->db->query("DELETE FROM `oc_session` WHERE expire < :expire",
        [
            ':expire' => time() + $expire
        ]);
		
		return true;
	}
}
