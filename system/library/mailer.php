<?php

class Mailer {
    public  $subject = null;
    public  $message = null;
    public  $altbody = null;
    private $mailer  = null;

    public function __get($property)
    {
        if (property_exists($this, $property)) {
            return $this->$property;
        }
    }

    public function __set($property, $value)
    {
        if (property_exists($this, $property)) {
            $this->$property = $value;
        }

        return $this;
    }

    public function __construct() {
        $this->mailer = new PHPMailer\PHPMailer\PHPMailer(true);
        // if we're set to suppress mail, then we don't need to make sure all of the other settings are correct
        if(defined('SUPPRESS_MAIL') && SUPPRESS_MAIL == 1) {
            return;
        }
        // It would be nice to do more validation of the settings here, but I'm not sure how we'd give useful feedback
        // since a visitor could trigger an email and therefore see these messages.

        // Could write to log and say "please look at the log for more details"
        if(!defined('SMTP_SERVER')) {
            throw new Exception('Error: ' . 'SMTP_SERVER not defined in config.php');
        }

        if(!defined('SMTP_USERNAME')) {
            throw new Exception('Error: ' . 'SMTP_USERNAME not defined in config.php');
        }

        if(!defined('SMTP_PASSWORD')) {
            throw new Exception('Error: ' . 'SMTP_PASSWORD not defined in config.php');
        }

        if(!defined('SMTP_PORT')) {
            // LJK TODO: We COULD try to send via port 25, or have a table of known SMTP ports for different service,
            throw new Exception('Error: ' . 'SMTP_PORT not defined in config.php');
        }

        $this->mailer->isSMTP();
        $this->mailer->isHTML(true);

        $this->mailer->Host       = SMTP_SERVER;
        $this->mailer->Username   = SMTP_USERNAME;
        $this->mailer->Password   = SMTP_PASSWORD;
        $this->mailer->Port       = SMTP_PORT;
        $this->mailer->SMTPSecure = 'tls';
        $this->mailer->SMTPAuth   = true;
    }


    public function send($email){
        // Turn off emails during development
        if(defined('SUPPRESS_MAIL') && SUPPRESS_MAIL == 1) {
            return;
        }
        try {
            $this->mailer->addAddress($email);
            $this->mailer->addReplyTo(SMTP_REPLYTO, SMTP_NAME);
            $this->mailer->setFrom(SMTP_REPLYTO, SMTP_NAME);

            // Need to make sure subject is not superlong. At least send a warning to the admin if we think the subject
            // is too long
            $this->mailer->Subject  = $this->subject;
            $this->mailer->Body     = $this->message;
            $this->mailer->Altbody  = $this->altbody;
            return $this->mailer->send();
        } catch (Exception $e) {
            echo "Mailer error: " . $this->mailer->ErrorInfo;
        }
    }
}
