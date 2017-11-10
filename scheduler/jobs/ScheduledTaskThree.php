<?php
namespace CronJobs;

class ScheduledTaskThree extends \Controller {
    public $name = 'ScheduledTaskThree';

    public $interval = 'day';

    public function run(){
        return "Third Scheduled Task Ran";
    }
}