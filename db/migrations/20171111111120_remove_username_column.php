<?php

use Phinx\Migration\AbstractMigration;
use Phinx\Db\Adapter\MysqlAdapter;

class RemoveUsernameColumn extends AbstractMigration
{
    public function change()
    {

        // Remove username column
        if($this->table('oc_user')->hasColumn('username')) {
            $this->table('oc_user')->removeColumn('username')->update();
        }

        // Create unique index for email column
        if($this->table('oc_user')->hasIndex('email')) {
            $this->table("oc_user")->removeIndexByName('email');
        }
        $this->table("oc_user")->addIndex(['email'], ['name' => "email", 'unique' => true])->save();

    }
}
