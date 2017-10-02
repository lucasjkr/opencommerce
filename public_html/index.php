<?php
// Configuration
if (is_file('../config/config.php')) {
	require_once('../config/config.php');
}

// Install
if (!defined('DIR_APPLICATION')) {
    exit("You need to execute the command line installer first!");
}

// Startup
require_once(DIR_SYSTEM . 'startup.php');

start('catalog');