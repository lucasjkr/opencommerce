<?php
namespace CronJobs;

class ScheduledTaskTwo extends \Controller {
    public $name = 'ScheduledTaskTwo';

    public $interval = 'day';

    public function run(){
        return "Second Scheduled Task Ran";
    }
}