<?php

use Phinx\Migration\AbstractMigration;
use Phinx\Db\Adapter\MysqlAdapter;

class RemoveAffiliates extends AbstractMigration
{
    public function change()
    {

        if($this->hasTable('oc_customer_affiliate')) {
            $this->dropTable('oc_customer_affiliate');
        }

        if($this->hasTable('oc_customer_affiliate_report')) {
            $this->dropTable('oc_customer_affiliate_report');
        }

        if($this->table('oc_order')->hasColumn('affiliate_id')) {
            $this->table('oc_order')->removeColumn('affiliate_id')->update();
            $this->table('oc_order')->removeColumn('commission')->update();
        }

        // Remove Table Entries
        $this->execute("DELETE FROM `oc_layout` WHERE `name` = 'Affiliate'");
        $this->execute("DELETE FROM `oc_layout_route` WHERE `route` LIKE 'affiliate%'");
    }
}
