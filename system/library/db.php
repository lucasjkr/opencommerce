<?php
/**
 * @package		OpenCart
 * @author		Daniel Kerr
 * @copyright	Copyright (c) 2005 - 2017, OpenCart, Ltd. (https://www.opencart.com/)
 * @license		https://opensource.org/licenses/GPL-3.0
 * @link		https://www.opencart.com
*/

/**
* DB class
*/
class DB {
	private $adaptor;

	/**
	 * Constructor
	 *
	 * @param	string	$adaptor
	 * @param	string	$hostname
	 * @param	string	$username
     * @param	string	$password
	 * @param	string	$database
	 * @param	int		$port
	 *
 	*/
	public function __construct($adaptor, $hostname, $username, $password, $database, $port = NULL) {
		$class = 'DB\\' . $adaptor;

		if (class_exists($class)) {
			$this->adaptor = new $class($hostname, $username, $password, $database, $port);
		} else {
			throw new \Exception('Error: Could not load database adaptor ' . $adaptor . '!');
		}
	}

	/**
     * 
     *
     * @param	string	$sql
	 * 
	 * @return	array
     */
	public function query($sql, $params = null) {

        // Begin Development Code
        // This records the query to a file on disk BEFORE trying execute it.  Useful for seeing where a function failed.
        if (!file_exists(DIR_LOGS . 'queries.log')) {
            touch(DIR_LOGS . 'queries.log');
        }

        $file = fopen(DIR_LOGS . 'queries.log', 'a');
        fwrite($file, $sql . "\n");
//        foreach($params as $p => $k){
//            fwrite($file, $p . ' => ' . $k . "\n");
//        }
        fwrite($file, json_encode($params) . "\n");
        fclose($file);
        // End Development Code

        if(defined('DEBUG_SQL') && DEBUG_SQL == 1){
            // get starttime in microseconds
            $start    = microtime(true);

            // execute query
            $result   = $this->adaptor->query($sql, $params);

            // get time
            $time     = number_format((microtime(true) - $start) * 1000, 4, '.', ',');

            // create output
            $output   = date("Y-m-d h:i:s"). " \t";
            $output  .= $time . " msec \t";
            $output  .= preg_replace('!\s+!', ' ', $sql) . "\n";


            // create log file if it doesn't already exit
            if (!file_exists(DIR_LOGS . 'database.log')) {
                touch(DIR_LOGS . 'database.log');
            }

            // write data to file
            $file = fopen(DIR_LOGS . 'database.log', 'a');
            fwrite($file, $output);
            fclose($file);

            // return query result
            return $result;
        }

        return $this->adaptor->query($sql, $params);
	}

	/**
     * 
     *
     * @param	string	$value
	 * 
	 * @return	string
     */
	public function escape($value) {
		return $this->adaptor->escape($value);
	}

	/**
     * 
	 * 
	 * @return	int
     */
	public function countAffected() {
		return $this->adaptor->countAffected();
	}

	/**
     * 
	 * 
	 * @return	int
     */
	public function getLastId() {
		return $this->adaptor->getLastId();
	}
	
	/**
     * 
	 * 
	 * @return	bool
     */	
	public function connected() {
		return $this->adaptor->connected();
	}
}