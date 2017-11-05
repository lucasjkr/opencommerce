<?php

use Phinx\Migration\AbstractMigration;
use Phinx\Db\Adapter\MysqlAdapter;

class ChangePricePrecision extends AbstractMigration
{
    public function change()
    {
        $this->table("oc_coupon")
            ->changeColumn('discount', 'decimal', ['null' => false, 'default' => '0.00000000', 'precision' => 17, 'scale' => 8])
            ->changeColumn('total', 'decimal', ['null' => false, 'default' => '0.00000000', 'precision' => 17, 'scale' => 8])
            ->update();


        $this->table("oc_coupon_history")
            ->changeColumn('amount', 'decimal', ['null' => false, 'default' => '0.00000000', 'precision' => 17, 'scale' => 8])
            ->update();


        $this->table("oc_customer_transaction")
            ->changeColumn('amount', 'decimal', ['null' => false, 'default' => '0.00000000', 'precision' => 17, 'scale' => 8])
            ->update();


        $this->table("oc_currency")
            ->changeColumn('value', 'decimal', ['null' => false, 'default' => '0.00000000', 'precision' => 17, 'scale' => 8])
            ->update();


        $this->table("oc_order")
            ->changeColumn('total', 'decimal', ['null' => false, 'default' => '0.00000000', 'precision' => 17, 'scale' => 8])
            ->changeColumn('currency_value', 'decimal', ['null' => false, 'default' => '0.00000000', 'precision' => 17, 'scale' => 8])
            ->update();


        $this->table("oc_order_product")
            ->changeColumn('price', 'decimal', ['null' => false, 'default' => '0.00000000', 'precision' => 17, 'scale' => 8])
            ->changeColumn('total', 'decimal', ['null' => false, 'default' => '0.00000000', 'precision' => 17, 'scale' => 8])
            ->changeColumn('tax', 'decimal', ['null' => false, 'default' => '0.00000000', 'precision' => 17, 'scale' => 8])
            ->update();


        $this->table("oc_order_recurring")
            ->changeColumn('recurring_price', 'decimal', ['null' => false, 'default' => '0.00000000', 'precision' => 17, 'scale' => 8])
            ->changeColumn('trial_price', 'decimal', ['null' => false, 'default' => '0.00000000', 'precision' => 17, 'scale' => 8])
            ->update();


        $this->table("oc_order_recurring_transaction")
            ->changeColumn('amount', 'decimal', ['null' => false, 'default' => '0.00000000', 'precision' => 17, 'scale' => 8])
            ->update();


        $this->table("oc_order_total")
            ->changeColumn('value', 'decimal', ['null' => false, 'default' => '0.00000000', 'precision' => 17, 'scale' => 8])
            ->update();


        $this->table("oc_order_voucher")
            ->changeColumn('amount', 'decimal', ['null' => false, 'default' => '0.00000000', 'precision' => 17, 'scale' => 8])
            ->update();


        $this->table("oc_product")
            ->changeColumn('price', 'decimal', ['null' => false, 'default' => '0.00000000', 'precision' => 17, 'scale' => 8])
            ->update();


        $this->table("oc_product_discount")
            ->changeColumn('price', 'decimal', ['null' => false, 'default' => '0.00000000', 'precision' => 17, 'scale' => 8])
            ->update();


        $this->table("oc_product_option_value")
            ->changeColumn('price', 'decimal', ['null' => false, 'default' => '0.00000000', 'precision' => 17, 'scale' => 8])
            ->update();


        $this->table("oc_product_special")
            ->changeColumn('price', 'decimal', ['null' => false, 'default' => '0.00000000', 'precision' => 17, 'scale' => 8])
            ->update();


        $this->table("oc_recurring")
            ->changeColumn('price', 'decimal', ['null' => false, 'default' => '0.00000000', 'precision' => 17, 'scale' => 8])
            ->changeColumn('trial_price', 'decimal', ['null' => false, 'default' => '0.00000000', 'precision' => 17, 'scale' => 8])
            ->update();


        $this->table("oc_tax_rate")
            ->changeColumn('rate', 'decimal', ['null' => false, 'default' => '0.00000000', 'precision' => 17, 'scale' => 8])
            ->update();


        $this->table("oc_voucher")
            ->changeColumn('amount', 'decimal', ['null' => false, 'default' => '0.00000000', 'precision' => 17, 'scale' => 8])
            ->update();


        $this->table("oc_voucher_history")
            ->changeColumn('amount', 'decimal', ['null' => false, 'default' => '0.00000000', 'precision' => 17, 'scale' => 8])
            ->update();

    }
}
