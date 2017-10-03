<?php
// Configuration
if (is_file('config.php')) {
	require_once('config.php');
}

// Credentials
if (is_file(DIR_ROOT . 'config/credentials.php')) {
    require_once(DIR_ROOT . 'config/credentials.php');
}

// Install
if (!defined('DIR_APPLICATION')) {
    exit("You need to execute the command line installer first!");
}

// Startup
require_once(DIR_SYSTEM . 'startup.php');

start('admin');