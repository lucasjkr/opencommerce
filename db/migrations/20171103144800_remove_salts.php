<?php

use Phinx\Migration\AbstractMigration;
use Phinx\Db\Adapter\MysqlAdapter;

class RemoveSalts extends AbstractMigration
{
    public function change()
    {
        if($this->table('oc_customer')->hasColumn('salt')) {
            $this->table("oc_customer")->removeColumn('salt')->update();
        }

        if($this->table('oc_user')->hasColumn('salt')) {
            $this->table("oc_user")->removeColumn('salt')->update();
        }
    }
}
