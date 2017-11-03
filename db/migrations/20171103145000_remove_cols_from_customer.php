<?php

use Phinx\Migration\AbstractMigration;
use Phinx\Db\Adapter\MysqlAdapter;

class RemoveColsFromCustomer extends AbstractMigration
{
    public function change()
    {

        if($this->table('oc_customer')->hasColumn('cart')) {
            $this->table('oc_customer')->removeColumn('cart')->update();
        }

        if($this->table('oc_customer')->hasColumn('wishlist')) {
            $this->table('oc_customer')->removeColumn('wishlist')->update();
        }

    }
}
