<?php

use Phinx\Migration\AbstractMigration;
use Phinx\Db\Adapter\MysqlAdapter;

class AddIndexLanguageId extends AbstractMigration
{
    public function change()
    {

        $results = $this->fetchAll("SHOW TABLES");

        foreach($results as $result) {

            $table_name = $result[0];

            // Dont remove and replace the language index on the oc_langauge table.
            // It needs to be unique on that table.
            if($table_name != 'oc_language') {

                // Delete the existing index
                if($this->table($table_name)->hasIndex('language_id')) {
                    $this->table($table_name)->removeIndexByName('language_id')->update();
                }

                // Create an index on language_id if that column exists
                if($this->table($table_name)->hasColumn('language_id')) {
                    $this->table($table_name)->addIndex(['language_id'], ['name' => "language_id", 'unique' => false])->save();
                }
            }
        }
    }
}
