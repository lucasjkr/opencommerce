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
    private $connection = null;
    private $statement  = null;

    // Debug settings
    private $debug      = false;  // If this gets set to true, then it turns on lots of logging features
    private $querylog   = DIR_LOGS . 'database.log';  // Location of database log - eventually this should not be here.
    private $wrap       = 100;   // Wordwrap width of queries saved

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
        try {
            $this->connection = new \PDO("mysql:host=" . $hostname . ";port=" . $port . ";dbname=" . $database, $username, $password, array(\PDO::ATTR_PERSISTENT => true));
        } catch(\PDOException $e) {
            throw new \Exception('Failed to connect to database. Reason: \'' . $e->getMessage() . '\'');
        }

        $this->connection->exec("SET NAMES 'utf8'");
        $this->connection->exec("SET CHARACTER SET utf8");
        $this->connection->exec("SET CHARACTER_SET_CONNECTION=utf8");
        $this->connection->exec("SET SQL_MODE = ''");

        if(defined('DEBUG_SQL') && DEBUG_SQL == 1) {
            $this->debug = true;
        }

        // Create the file to save database logs to, if it doesn't exist
        if($this->debug == true && !file_exists($this->querylog)) {
            touch($this->querylog);
        }
	}

    public function prepare($sql) {
        $this->statement = $this->connection->prepare($sql);
    }

    public function bindParam($parameter, $variable, $data_type = \PDO::PARAM_STR, $length = 0) {
        if ($length) {
            $this->statement->bindParam($parameter, $variable, $data_type, $length);
        } else {
            $this->statement->bindParam($parameter, $variable, $data_type);
        }
    }

    public function execute() {
        try {
            if ($this->statement && $this->statement->execute()) {
                $data = [];

                while ($row = $this->statement->fetch(\PDO::FETCH_ASSOC)) {
                    $data[] = $row;
                }

                $result = new \stdClass();
                $result->row = (isset($data[0])) ? $data[0] : [];
                $result->rows = $data;
                $result->num_rows = $this->statement->rowCount();
            }
        } catch(\PDOException $e) {
            throw new \Exception('Error: ' . $e->getMessage() . ' Error Code : ' . $e->getCode());
        }
    }

    public function query($sql, $params = null) {
        if($this->debug == true) {
            $output = $sql . "\n" . json_encode($params);

            //  Record the query to a logfile BEFORE executing
            //  This way we can see what the last query was that we tried to execute, even if there's an error in it
            $file = fopen($this->querylog, 'a');
            fwrite($file, wordwrap($output, $this->wrap, "\n", true) . "\n");
            $output = '';

            // get starttime in microseconds
            $start    = microtime(true);

            // execute query
            $result   = $this->run($sql, $params);

            // get time
            $time     = number_format((microtime(true) - $start) * 1000, 4, '.', ',');

            // create output
            $output  .= $time . " msec \n\n";

            fwrite($file, $output);
            fclose($file);

            // return query result
            return $result;
        }

        return $this->run($sql, $params);
	}

	private function run($sql, $params = null) {
        $this->statement = $this->connection->prepare($sql);

        $result = false;

        try {
            if ($this->statement && $this->statement->execute($params)) {
                $data = [];

                while ($row = $this->statement->fetch(\PDO::FETCH_ASSOC)) {
                    $data[] = $row;
                }

                $result = new \stdClass();
                $result->row = (isset($data[0]) ? $data[0] : []);
                $result->rows = $data;
                $result->num_rows = $this->statement->rowCount();
            }
        } catch (\PDOException $e) {
            throw new \Exception('Error: ' . $e->getMessage() . ' Error Code : ' . $e->getCode() . ' <br />' . $sql);
        }

        if ($result) {
            return $result;
        } else {
            $result = new \stdClass();
            $result->row = [];
            $result->rows = [];
            $result->num_rows = 0;
            return $result;
        }
    }

	/**
     * @param	string	$value
	 * 
	 * @return	string
     */
    public function escape($value) {
        return str_replace(array("\\", "\0", "\n", "\r", "\x1a", "'", '"'), array("\\\\", "\\0", "\\n", "\\r", "\Z", "\'", '\"'), $value);
    }

	/**
	 * @return	int
     */
    public function countAffected() {
        if ($this->statement) {
            return $this->statement->rowCount();
        } else {
            return 0;
        }
    }

	/**
     *
	 * @return	int
     */
    public function getLastId() {
        return $this->connection->lastInsertId();
    }

    public function __destruct() {
        $this->connection = null;
    }

}