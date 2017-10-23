<?php
class ModelIoInput extends Model {
    public function validateEmail($email){
        return trim(mb_strtolower($email, 'UTF-8'));
    }
}