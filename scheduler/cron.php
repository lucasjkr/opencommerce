<?php
// ALERT - This should never be placed be in a browser accessible path.

// Usage examples:
// php /path/to/cron.php interval=minute
// php /path/to/cron.php interval=hour
// php /path/to/cron.php interval=day

// Change working directory to location script is located, Since everything the script depends on is relatitve to it.
chdir(dirname(__FILE__));

// Convert arguments passed to the script to an array. Arguments are delimited as key=value on the command line
// This way, we can tell each instance of cron.php what interval jobs it should run. Options are:
// minute, hour, day, week, month
//
// We can get more granular if needed, just need to create another cronjob instance with that interval
$cron['interval'] = '';
$cron['name'] = '';
foreach($_SERVER['argv'] as $argument) {
    $explode = explode('=', $argument);
    if(isset($explode[1])){
        $cron[$explode[0]] = $explode[1];
    } else {
        $cron[$explode[0]] = '';
    }
}
unset($explode);

/***********************************************************************/
/* Initialize the Opencommerce Framework                               */
/***********************&***********************************************/
// Check for standard config.php file
if(!is_file('../config/config.php')){
    exit("/config/config.php not found, please re-run installer");
}
require_once('../config/config.php');

// Check for standard paths.php file
if (!is_file(DIR_ROOT . 'config/paths.php')) {
    exit("/config/paths.php not found, please re-run installer");
}
require_once(DIR_ROOT . 'config/paths.php');

// This is a temporary fix until DIR_APPLICATION and DIR_LANGUAGE are moved out of each index.php file.
define('DIR_APPLICATION',   '');
define('DIR_LANGUAGE',      '');

$application_config = 'cron';

/***********************************************************************/
/* Load the Opencommerce Framework                                     */
/***********************&***********************************************/
require_once(DIR_SYSTEM . 'startup.php');
require_once(DIR_SYSTEM . 'framework.php');

/***********************************************************************/
/* Run scheduled jobs                                                  */
/***********************&***********************************************/
// We'll run the scheduled tasks found in the 'jobs' directory
$jobs = scandir('jobs/');

foreach ($jobs as $job) {

    if(!is_dir('jobs/' . $job)) {
        $explode = explode('.', $job);
        $class   = "\\Cronjobs\\" . $explode[0];
        $ext     = $explode[1];

        if($ext == 'php') {
            require_once('jobs/' . $job);
            $task = new $class($registry);

            if(isset($cron['name']) && $cron['name'] == $task->name) {
                $result = $task->run();
                echo $result . "\n";
            }

            if($cron['interval'] == $task->interval) {
                $result = $task->run();
                echo $result . "\n";
            }
        }
    }
}