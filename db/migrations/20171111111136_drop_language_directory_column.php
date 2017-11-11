<?php

use Phinx\Migration\AbstractMigration;
use Phinx\Db\Adapter\MysqlAdapter;

class DropLanguageDirectoryColumn extends AbstractMigration
{
    public function change()
    {
        if($this->table('oc_language')->hasColumn('directory')) {
            $this->table('oc_language')->removeColumn('directory')->update();
        }

    }
}
