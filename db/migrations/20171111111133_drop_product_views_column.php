<?php

use Phinx\Migration\AbstractMigration;
use Phinx\Db\Adapter\MysqlAdapter;

class DropProductViewsColumn extends AbstractMigration
{
    public function change()
    {
        if($this->table('oc_product')->hasColumn('viewed')) {
            $this->table("oc_product")->removeColumn('viewed')->update();
        }

    }
}
