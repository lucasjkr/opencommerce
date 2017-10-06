<?php
// Config
if(is_file('../config/config.php')){
    require_once('../config/config.php');
} else {
    exit("/config/config.php not found, please re-run installer");
}

// Paths
if (is_file(DIR_ROOT . 'config/paths.php')) {
    require_once(DIR_ROOT . 'config/paths.php');
} else {
    exit("/config/paths.php not found, please re-run installer");
}

// TEMPORARY - these will eventually be moved to paths.php
define('DIR_APPLICATION',   '/vb_shared/_forks/opencommerce/public_html/catalog/');
define('DIR_IMAGE',         '/vb_shared/_forks/opencommerce/public_html/image/');
define('DIR_LANGUAGE',      DIR_APPLICATION . 'language/');
define('DIR_TEMPLATE',      DIR_APPLICATION . 'view/theme/');

// Startup
require_once(DIR_SYSTEM . 'startup.php');

start('catalog');