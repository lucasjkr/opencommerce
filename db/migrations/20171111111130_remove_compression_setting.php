<?php

use Phinx\Migration\AbstractMigration;
use Phinx\Db\Adapter\MysqlAdapter;

class RemoveCompressionSetting extends AbstractMigration
{
    public function change()
    {
        // Remove setting
        $this->execute("DELETE FROM `oc_setting` WHERE `key` LIKE 'config_compression%'");

    }
}
