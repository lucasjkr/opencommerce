<?php
function token($length = 32) {
	if(!isset($length) || intval($length) <= 8 ){
		$length = 32;
	}	

    $token = bin2hex(random_bytes($length));

	return substr($token, -$length, $length);
}