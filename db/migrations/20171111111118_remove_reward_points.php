<?php

use Phinx\Migration\AbstractMigration;
use Phinx\Db\Adapter\MysqlAdapter;

class RemoveRewardPoints extends AbstractMigration
{
    public function change()
    {

        // Remove tables dedicated to rewards points
        if($this->hasTable('oc_customer_reward')) {
            $this->dropTable('oc_customer_reward');
        }

        if($this->hasTable('oc_product_reward')) {
            $this->dropTable('oc_product_reward');
        }

        // Remove columns from other tables related to rewards
        if($this->table('oc_order_product')->hasColumn('reward')) {
            $this->table('oc_order_product')->removeColumn('reward')->update();
        }

        if($this->table('oc_product')->hasColumn('points')) {
            $this->table('oc_product')->removeColumn('points')->update();
        }

        if($this->table('oc_product_option_value')->hasColumn('points')) {
            $this->table('oc_product_option_value')
                ->removeColumn('points')
                ->removeColumn('points_prefix')
                ->update();
        }

        // Remove table data
        $this->execute("DELETE FROM `oc_event` WHERE `code` LIKE '%reward%'");
        $this->execute("DELETE FROM `oc_extension` WHERE `code` LIKE '%reward%'");
        $this->execute("DELETE FROM `oc_setting` WHERE `code` LIKE '%reward%'");


    }
}
