<?php
namespace CronJobs;

class ScheduledTaskOne extends \Controller {
    // So we can call a scheduled task by name
    public $name = 'ScheduledTaskOne';

    // How often the task should run. Valid options are:
    // minute    hour    day    week
    public $interval = 'minute';

    public function run(){
        return "First Scheduled Task Ran";
    }
}