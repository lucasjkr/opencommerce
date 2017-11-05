<?php

use Phinx\Migration\AbstractMigration;
use Phinx\Db\Adapter\MysqlAdapter;

class AddTimestamps extends AbstractMigration
{
    public function change()
    {

        $results = $this->fetchAll("SHOW TABLES");

        foreach($results as $result) {

            $table_name = $result[0];

            if($this->table($table_name)->hasColumn('date_added')) {
                $this->table($table_name)->removeColumn('date_added')->update();
            }

            $table = $this->table($table_name);
            $table->addColumn('date_added', 'timestamp', ['null' => true, 'default' => 'CURRENT_TIMESTAMP'])->update();

            if($this->table($table_name)->hasColumn('date_modified')) {
                $this->table($table_name)->removeColumn('date_modified')->update();
            }

            $table = $this->table($table_name);
            $table->addColumn('date_modified', 'timestamp', ['null' => true, 'default' => 'CURRENT_TIMESTAMP', 'update' => 'CURRENT_TIMESTAMP', 'after' => 'date_added'])->update();

        }

    }
}
