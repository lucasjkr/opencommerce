<?php

use Phinx\Migration\AbstractMigration;
use Phinx\Db\Adapter\MysqlAdapter;

class RemoveUnneededSettings extends AbstractMigration
{
    public function change()
    {
        // Remove table data
        $this->execute("DELETE FROM `oc_setting` WHERE `key` LIKE 'config_ftp%'");
        $this->execute("DELETE FROM `oc_setting` WHERE `key` = 'config_mail_engine'");
        $this->execute("DELETE FROM `oc_setting` WHERE `key` = 'config_mail_parameter'");
        $this->execute("DELETE FROM `oc_setting` WHERE `key` LIKE 'config_mail_smtp_%'");

    }
}
