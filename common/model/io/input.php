<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ModelIoInput extends Model {
    public function validateEmail($email){
        return trim(mb_strtolower($email, 'UTF-8'));
    }
}