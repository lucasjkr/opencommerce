<?php
// Site
$_['site_url']          = HTTP_ADMIN;
// TODO: we shouldn't need this at all:
$_['site_ssl']          = HTTP_ADMIN;

// Database
$_['db_autostart']      = true;
$_['db_engine']         = DB_DRIVER; // mpdo, mssql, mysql, mysqli or postgre
$_['db_hostname']       = DB_HOSTNAME;
$_['db_username']       = DB_USERNAME;
$_['db_password']       = DB_PASSWORD;
$_['db_database']       = DB_DATABASE;
$_['db_port']           = DB_PORT;

// Session
$_['session_autostart']    = false;

// Autoload Configs
$_['config_autoload']      = [];