<?php

// This class is nothing more than a wrapper for PHPMailer. Only advantages are:
// 1 - Less repeated code throughtout the project
// 2 - Responsibility for development of the mailing code is removed from us.

class Mailer {
    public  $setSubject = null;
    public  $setText    = null;
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
            throw new Exception('Error: ' . 'SMTP_PORT not defined in config.php');
        }

        // Perhaps there COULD be an "admin_alerts" table - where alerts here would be written to that table, and a
        // new module would check that table whenever the Admin user(s) login to the back end?
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
            return true;
        }
        try {
            $this->mailer->addAddress($email);
            $this->mailer->addReplyTo(SMTP_REPLYTO, SMTP_NAME);
            $this->mailer->setFrom(SMTP_REPLYTO, SMTP_NAME);

            // Should send or log a warning for the admin if the subject is too long
            $this->mailer->Subject  = $this->setSubject;
            $this->mailer->Body     = $this->setText;
            $this->mailer->Altbody  = $this->altbody;

            // Sends the email
            $this->mailer->send();

            // Resets the addresses, so we can send additional emails without including the previous recipient(s)
            $this->mailer->ClearAddresses();

            return true;
        } catch (Exception $e) {
            echo "Mailer error: " . $this->mailer->ErrorInfo;
        }
    }
}
