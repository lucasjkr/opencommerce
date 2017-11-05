<?php

use Phinx\Migration\AbstractMigration;
use Phinx\Db\Adapter\MysqlAdapter;

class RemoveTranslations extends AbstractMigration
{
    public function change()
    {

        if($this->hasTable('oc_translation')) {
            $this->dropTable('oc_translation');
        }

    }
}
