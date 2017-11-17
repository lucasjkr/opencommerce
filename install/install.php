<?php

//
// Command line tool for installing opencart
// Author: Vineet Naik <vineet.naik@kodeplay.com> <naikvin@gmail.com>
//
// (Currently tested on linux only)
//
// Usage:
//
//   cd install
//   php cli_install.php install --db_hostname localhost \
//                               --db_username root \
//                               --db_password pass \
//                               --db_database opencart \
//                               --db_driver mysqli \
//								 --db_port 3306 \
//                               --username admin \
//                               --password admin \
//                               --email youremail@example.com \
//

// TODO: Mandatory check that mod_rewrite is enabled for Apache;
// TODO: Mandate that APache is the server
// Until someone creates a Nginx Config for having smart URL's

ini_set('display_errors', 1);

error_reporting(E_ALL);

// DIR
define('DIR_ROOT',          (dirname(__FILE__) . '/../'));
define('DIR_APPLICATION',   str_replace('\\', '/', realpath(dirname(__FILE__))) . '/');
define('DIR_SYSTEM',        str_replace('\\', '/', realpath(dirname(__FILE__) . '/../')) . '/system/');
define('DIR_STORAGE',       DIR_ROOT . 'storage/');
define('DIR_OPENCART',      str_replace('\\', '/', realpath(DIR_APPLICATION . '../')) . '/');
define('DIR_DATABASE',      DIR_SYSTEM . 'database/');
define('DIR_CONFIG',        DIR_SYSTEM . 'config/');
define('DIR_MODIFICATION',  DIR_SYSTEM . 'modification/');
define('DIR_PUBLIC',        DIR_OPENCART . "public_html/");

echo "Pre-Install Diagnostics:\n";
echo "DIR_APPLICATION:  " . DIR_APPLICATION . "\n";
echo "DIR_SYSTEM:       " . DIR_SYSTEM . "\n";
echo "DIR_STORAGE:      " . DIR_STORAGE . "\n";
echo "DIR_OPENCART:     " . DIR_OPENCART . "\n";
echo "DIR_DATABASE:     " . DIR_DATABASE . "\n";
echo "DIR_CONFIG:       " . DIR_CONFIG . "\n";
echo "DIR_MODIFICATION: " . DIR_MODIFICATION . "\n";
echo "DIR_PUBLIC:       " . DIR_PUBLIC . "\n";

// Startup
require_once(DIR_SYSTEM . 'startup.php');

// Registry
$registry = new Registry();

// Loader
$loader = new Loader($registry);
$registry->set('load', $loader);


function handleError($errno, $errstr, $errfile, $errline, array $errcontext) {
	// error was suppressed with the @-operator
	if (0 === error_reporting()) {
		return false;
	}
	throw new ErrorException($errstr, 0, $errno, $errfile, $errline);
}

set_error_handler('handleError');

// TODO: Installer chokes if database password contains $ sign
function usage() {
	echo "Usage:\n";
	echo "======\n";
	echo "\n";
	$options = implode(" ", array(
		'--db_hostname', 'localhost',
		'--db_username', 'root',
		'--db_password', 'pass',
		'--db_database', 'opencart',
		'--db_driver', 'mpdo',
		'--db_port', '3306',
		'--username', 'admin',
		'--password', 'admin',
        '--url', 'www.yoursite.com',
		'--email', 'youremail@example.com'
	));
	echo 'php install.php install ' . $options . "\n\n";
}


function get_options($argv) {
	$defaults = array(
		'db_hostname' => 'localhost',
		'db_database' => 'opencart',
		'db_prefix' => 'oc_',
		'db_driver' => 'mpdo',
		'db_port' => '3306',
		'username' => 'admin',
	);

	$options = [];
	$total = count($argv);
	for ($i=0; $i < $total; $i=$i+2) {
		$is_flag = preg_match('/^--(.*)$/', $argv[$i], $match);
		if (!$is_flag) {
			throw new Exception($argv[$i] . ' found in command line args instead of a valid option name starting with \'--\'');
		}
		$options[$match[1]] = $argv[$i+1];
	}
	return array_merge($defaults, $options);
}


function valid($options) {
	$required = array(
		'db_hostname',
		'db_username',
		'db_password',
		'db_database',
		'db_prefix',
		'db_port',
		'username',
		'password',
		'email',
        'url',
	);
	$missing = [];
	foreach ($required as $r) {
		if (!array_key_exists($r, $options)) {
			$missing[] = $r;
		}
	}
	$valid = count($missing) === 0;
	return array($valid, $missing);
}


function install($options) {
	$check = check_requirements();
	if ($check[0]) {
		write_config_files($options);
		setup_db($options);
		dir_permissions();
	} else {
		echo 'FAILED! Pre-installation check failed: ' . $check[1] . "\n\n";
		exit(1);
	}
}


function check_requirements() {
	$error = null;

// TODO: Verify this recognizes PHP version
    if (phpversion() < '7.0') {
        $error = 'Warning: You need to use PHP7.0+ or above for OpenCommerce to work!';
    }

	if (!ini_get('file_uploads')) {
		$error = 'Warning: file_uploads needs to be enabled!';
	}

	if (ini_get('session.auto_start')) {
		$error = 'Warning: OpenCommerce will not work with session.auto_start enabled!';
	}

// TODO: LJK check that this actually gets triggered if PDO isn't installed
    if (!defined('PDO::ATTR_DRIVER_NAME')) {
        $error = 'PDO unavailable';
    }

// TODO: Check for PDO/MySQL driver
// TODO: Check for Apache mod_rewrite

	if (!extension_loaded('gd')) {
		$error = "Warning: GD extension needs to be loaded for OpenCommerce to work!\n";
        $error .= "Needed for things like image resize, caching, etc";
	}

	if (!extension_loaded('curl')) {
		$error = "Warning: CURL extension needs to be loaded for OpenCommerce to work!\n";
        $error .= "Needed for currency lookups (CURL requests to Yahoo API)";
	}

	if (!function_exists('openssl_encrypt')) {
		$error = 'Warning: OpenSSL extension needs to be loaded for OpenCommerce to work!';
	}

	if (!extension_loaded('zlib')) {
		$error = 'Warning: ZLIB extension needs to be loaded for OpenCommerce to work!';
	}

	return array($error === null, $error);
}


function setup_db($data)
{
    $db = new DB($data['db_driver'], htmlspecialchars_decode($data['db_hostname']), htmlspecialchars_decode($data['db_username']), htmlspecialchars_decode($data['db_password']), htmlspecialchars_decode($data['db_database']), $data['db_port']);

    $phinx = exec(DIR_OPENCART . '/vendor/bin/phinx migrate -e production -c ../phinx.yml');

    $result = strtolower(substr($phinx, 0, 14));

    if ($result == 'all done. took') {

        $email = $data['email'];
        $password = password_hash($data['password'], PASSWORD_DEFAULT);
        $prefix = 'INV-' . date('Y') . '-00';

        $db->query("DELETE FROM `oc_user` WHERE user_id = '1'");

        $db->query("INSERT INTO `oc_user` SET user_id = '1', user_group_id = '1', password = ?, firstname = 'John', lastname = 'Doe', email = ?, status = '1'",
            [
                $password, $email
            ]);

        $db->query("DELETE FROM `oc_setting` WHERE `key` = 'config_email'");
        $db->query("INSERT INTO `oc_setting` SET `code` = 'config', `key` = 'config_email', value = '" . $email . "'");

        $db->query("UPDATE `oc_product` SET `viewed` = '0'");
        $db->query("UPDATE `oc_setting` SET value = '" . $prefix . "' WHERE `key` = 'config_invoice_prefix'");
    }
}

function write_config_files($options) {
    // Config file (database, email, etc)
    $output  = "<?php\n";
    $output .= "\n";
    $output .= "define('STORE_URL',         '" . $options['url'] . "');\n";
    $output .= "define('DIR_ROOT',          '" . DIR_OPENCART . "');\n";
    $output .= "define('DIR_CATALOG',       DIR_ROOT . 'public_html/catalog');\n";
    $output .= "\n";
    $output .= "// Stored Credentials\n";
    $output .= "\n";
    $output .= "define('DB_HOSTNAME',       '" . $options['db_hostname'] . "');\n";
    $output .= "define('DB_USERNAME',       '" . $options['db_username'] . "');\n";
    $output .= "define('DB_PASSWORD',       '" . $options['db_password'] . "');\n";
    $output .= "define('DB_DATABASE',       '" . $options['db_database'] . "');\n";
    $output .= "define('DB_DRIVER',         'mpdo');\n";
    $output .= "define('DB_PORT',           '" . $options['db_port'] ."');\n";
    $output .= "\n";
    $output .= "// email server credentials\n";
    $output .= "define('SMTP_SERVER',       null);  // The SMTP Server address\n";
    $output .= "define('SMTP_USERNAME',     null);  // Username for sending email\n";
    $output .= "define('SMTP_PASSWORD',     null);  // Password for authenticating\n";
    $output .= "define('SMTP_PORT',         25);    // SMTP Server port\n";
    $output .= "define('SMTP_TIMEOUT',      5);     // SMTP Server Timeout (not implemented yet)\n";
    $output .= "define('SMTP_NAME',         null);  // The Name that appears in outgoing messages\n";
    $output .= "define('SMTP_REPLYTO',      null);  // The Reply-To email address\n";
    $output .= "\n";
    $output .= "define('DEBUG_SQL',         1);\n";
    $output .= "define('PHP_ERROR_DISPLAY', 1);\n";
    $output .= "define('PHP_ERROR_LOG',     1);\n";
    $output .= "define('PHP_ERROR_HALT',    1);\n;";
    $output .= "define('SUPPRESS_MAIL',     1);    // If this is defined AND set to 1, we won't send mail even if an event calls for it\n";
    $file = fopen(DIR_OPENCART . 'config/config.php', 'w');
    fwrite($file, $output);
    fclose($file);

    // Phinx.yml (for database migrations)
    $output  = "paths:\n";
    $output .= "    migrations: %%PHINX_CONFIG_DIR%%/db/migrations\n";
    $output .= "    seeds: %%PHINX_CONFIG_DIR%%/db/seeds\n";
    $output .= "\n";
    $output .= "environments:\n";
    $output .= "    default_migration_table: phinxlog\n";
    $output .= "    default_database: development\n";
    $output .= "    production:\n";
    $output .= "        adapter: mysql\n";
    $output .= "        host: " . $options['db_hostname'] . "\n";
    $output .= "        name: " . $options['db_database'] . "\n";
    $output .= "        user: " . $options['db_username'] . "\n";
    $output .= "        pass: " . $options['db_password'] . "\n";
    $output .= "        port: " . $options['db_port']     . "\n";
    $output .= "        charset: utf8\n";
    $output .= "\n";
    $output .= "    development:\n";
    $output .= "        adapter: mysql\n";
    $output .= "        host: " . $options['db_hostname'] . "\n";
    $output .= "        name: " . $options['db_database'] . "\n";
    $output .= "        user: " . $options['db_username'] . "\n";
    $output .= "        pass: " . $options['db_password'] . "\n";
    $output .= "        port: " . $options['db_port']     . "\n";
    $output .= "        charset: utf8\n";
    $output .= "\n";
    $output .= "    testing:\n";
    $output .= "        adapter: mysql\n";
    $output .= "        host: " . $options['db_hostname'] . "\n";
    $output .= "        name: " . $options['db_database'] . "\n";
    $output .= "        user: " . $options['db_username'] . "\n";
    $output .= "        pass: " . $options['db_password'] . "\n";
    $output .= "        port: " . $options['db_port']     . "\n";
    $output .= "        charset: utf8\n";
    $output .= "\n";
    $output .= "version_order: creation";
    $file = fopen(DIR_OPENCART . 'phinx.yml', 'w');
    fwrite($file, $output);
    fclose($file);
}


function dir_permissions() {
	$dirs = [
		DIR_PUBLIC . 'image/',
		DIR_SYSTEM . '/storage/download/',
        DIR_SYSTEM . '/storage/upload/',
        DIR_SYSTEM . '/storage/cache/',
        DIR_SYSTEM . '/storage/logs/',
        DIR_SYSTEM . '/storage/modification/',
    ];
	exec('chmod o+w -R ' . implode(' ', $dirs));
}

$argv = $_SERVER['argv'];
$script = array_shift($argv);
$subcommand = array_shift($argv);


switch ($subcommand) {

case "install":
	try {
		$options = get_options($argv);
		$valid = valid($options);
		if (!$valid[0]) {
			echo "FAILED! Following inputs were missing or invalid: ";
			echo implode(', ', $valid[1]) . "\n\n";
			exit(1);
		}
		install($options);
		echo "SUCCESS! OpenCommerce successfully installed on your server\n";
	} catch (ErrorException $e) {
		echo 'FAILED!: ' . $e->getMessage() . "\n";
		exit(1);
	}
	break;
case "usage":
default:
	echo usage();
}
