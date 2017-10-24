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
$_['session_autostart'] = true;

// Template
$_['template_cache']    = true;

// Actions
$_['action_pre_action'] = [
	'startup/startup',
	'startup/error',
	'startup/event',
	'startup/sass',
	'startup/login',
	'startup/permission'
];

// Actions
$_['action_default'] = 'common/dashboard';

// Action Events
$_['action_event'] = [
	'controller/*/before' => [
		'event/language/before'
	],
	'controller/*/after' => [
		'event/language/after'
	],
	'view/*/before' => [
		999  => 'event/language',
		1000 => 'event/theme'
	],
	'view/*/before' => [
		'event/language'
	]
];
