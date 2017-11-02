<?php

define('STORE_URL',         'example.com');
define('DIR_ROOT',          '/var/www/');
define('DIR_CATALOG',       DIR_ROOT . 'html/catalog/');

// Database Credentials
define('DB_HOSTNAME',       '127.0.0.1');
define('DB_USERNAME',       'username');
define('DB_PASSWORD',       'password');
define('DB_DATABASE',       'opencommerce');
define('DB_DRIVER',         'mpdo');
define('DB_PORT',           '3306');

// Email Credentials
define('SMTP_SERVER',       'smtp.example.com'); // The SMTP Server address
define('SMTP_USERNAME',     'user@example.com'); // Username for sending email
define('SMTP_PASSWORD',     'password'); // Password for authenticating
define('SMTP_PORT',         587);   // SMTP Server port
define('SMTP_TIMEOUT',      5);    // Timeouts (not implemented yet)
define('SMTP_NAME',         'Store Email Account'); // The Name that appears in outgoing messages
define('SMTP_REPLYTO',      'reply-to@exmple.com'); // The Reply-To email address

// Everything below here is optional
define('DEBUG_SQL',         1);
define('PHP_ERROR_DISPLAY', 1);
define('PHP_ERROR_LOG',     1);
define('PHP_ERROR_HALT',    1);
define('SUPPRESS_MAIL',     0);    // If this is defined AND set to 1, we won't send mail even if an event calls for it