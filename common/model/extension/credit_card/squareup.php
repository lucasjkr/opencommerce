<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ModelExtensionCreditCardSquareup extends Model {
    public function addCustomer($data) {
        // LJK TODO: Should we return the customer id to store anything?
        $this->db->query("INSERT INTO `oc_squareup_customer` SET customer_id = :customer_id, sandbox = :sandbox, square_customer_id = :square_customer_id",
            [
                ':customer_id' => $data['customer_id'],
                ':sandbox' => $data['sandbox'],
                ':square_customer_id' => $data['square_customer_id']
            ]);
    }

    public function getCustomer($customer_id, $sandbox) {
        return $this->db->query("SELECT * FROM `oc_squareup_customer` WHERE customer_id = :customer_id AND sandbox = :sandbox",
            [
                ':customer_id' => $customer_id,
                ':sandbox' => $sandbox
            ])->row;
    }

    public function addCard($customer_id, $sandbox, $data) {
        $this->db->query("INSERT INTO `oc_squareup_token` SET customer_id = :customer_id, sandbox = :sandbox, token = :token, brand = :brand, ends_in = :ends_in ",
            [
                ':customer_id' => $customer_id,
                ':sandbox' => $sandbox,
                ':token' => $data['id'],
                ':brand' => $data['card_brand'],
                ':ends_in' => $data['last_4']
            ]);
    }

    public function getCard($squareup_token_id) {
        return $this->db->query("SELECT * FROM `oc_squareup_token` WHERE squareup_token_id = :squareup_token_id",
            [
                ':squareup_token_id' => $squareup_token_id
            ])->row;
    }
    
    public function getCards($customer_id, $sandbox) {
        return $this->db->query("SELECT * FROM `oc_squareup_token` WHERE customer_id = :customer_id AND sandbox = :sandbox",
            [
                ':customer_id' => $customer_id,
                ':sandbox' => $sandbox
            ])->rows;
    }

    public function cardExists($customer_id, $data) {
        return $this->db->query("SELECT * FROM `oc_squareup_token` WHERE customer_id = :customer_id AND brand = :brand AND ends_in = :ends_in",
            [
                ':customer_id' => $customer_id,
                ':brand' => $data['card_brand'],
                ':ends_in' => $data['last_4'],

            ])->num_rows > 0;
    }

    public function verifyCardCustomer($squareup_token_id, $customer_id) {
        return $this->db->query("SELECT * FROM `oc_squareup_token` WHERE squareup_token_id = :squareup_token_id AND customer_id = :customer_id",
            [
                ':squareup_token_id' => $squareup_token_id,
                ':customer_id' => $customer_id
            ])->num_rows > 0;
    }

    public function deleteCard($squareup_token_id) {
        $this->db->query("DELETE FROM `oc_squareup_token` WHERE squareup_token_id = :squareup_token_id",
            [
                ':squareup_token_id' => $squareup_token_id
            ]);
    }
}