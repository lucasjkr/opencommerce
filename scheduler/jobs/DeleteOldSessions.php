<?php
namespace CronJobs;

class DeleteOldSessions extends \Controller {
    public $name = 'ScheduledTaskTwo';

    public $interval = 'hour';

    public function run(){
        $this->db->query("DELETE FROM oc_session WHERE expire < NOW()");
    }
}