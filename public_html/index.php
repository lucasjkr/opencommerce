<?php
// Version
define('VERSION', '0.1');

// Configuration
if (is_file('../config/config.php')) {
	require_once('../config/config.php');
}

// Install
if (!defined('DIR_APPLICATION')) {
    echo "You need to execute the command line installer first!";
	exit();
}

// Startup
require_once(DIR_SYSTEM . 'startup.php');

start('catalog');