<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ModelIoOutput extends Model {
    // New Item, need to test.
    // Usage in controllers:
    //
    //          $this->load->model('io/output');
    //          $output = $this->model_io_output;
    //          echo $output->safe('<HELLO>&nbsp;');

    public function safe($string){
        return htmlspecialchars($string, ENT_COMPAT, 'UTF-8');
    }
}