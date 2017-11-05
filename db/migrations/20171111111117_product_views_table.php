<?php

use Phinx\Migration\AbstractMigration;
use Phinx\Db\Adapter\MysqlAdapter;

class ProductViewsTable extends AbstractMigration
{
    public function change()
    {
        $table = $this->table("oc_product_views", ['id' => false, 'primary_key' => ["product_view_id"], 'engine' => "InnoDB", 'encoding' => "utf8", 'collation' => "utf8_general_ci", 'comment' => ""]);
        $table->addColumn('product_view_id', 'integer', ['null' => false, 'limit' => 9, 'precision' => 10, 'identity' => 'enable']);
        $table->addColumn('product_id', 'integer', ['null' => false, 'limit' => 9, 'precision' => 10, 'after' => 'product_view_id']);
        $table->addColumn('date_added', 'timestamp', ['null' => true, 'default' => 'CURRENT_TIMESTAMP']);
        $table->addColumn('date_modified', 'timestamp', ['null' => true, 'default' => 'CURRENT_TIMESTAMP', 'update' => 'CURRENT_TIMESTAMP', 'after' => 'date_added']);
        $table->save();

    }
}
