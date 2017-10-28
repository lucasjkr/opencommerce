<?php

class Mailer {
    public  $subject = null;
    public  $body    = null;
    public  $altbody = null;
    private $mailer = null;

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
        $this->mailer->isSMTP();
        $this->mailer->isHTML(true);

        // During construction, we should check that the SMTP server stuff was already defined and either throw an error
        // or exit gracefully depending.
        $this->mailer->Host = SMTP_SERVER;
        $this->mailer->Username = SMTP_USERNAME;
        $this->mailer->Password = SMTP_PASSWORD;
        $this->mailer->Port = SMTP_PORT;
        $this->mailer->SMTPSecure = 'tls';
        $this->mailer->SMTPAuth = true;

    }


    public function send($email){
        // Turn off emails during development
        if(!defined('SUPPRESS_SMTP') && SUPPRESS_MAIL == 1) {
            return;
        }
        try {
            // Need to validate $email

            $this->mailer->addAddress($email);
            $this->mailer->addReplyTo(SMTP_REPLYTO, SMTP_NAME);
            $this->mailer->setFrom(SMTP_REPLYTO, SMTP_NAME);

            // Need to make sure subject is not superlong. At least send a warning to the admin if we think the subject
            // is too long
            $this->mailer->Subject = $this->subject;
            $this->mailer->Body = $this->body;
            $this->mailer->Altbody = $this->altbody;
            return $this->mailer->send();
        } catch (Exception $e) {
            echo "Mailer error: " . $this->mailer->ErrorInfo;
        }
    }
}
