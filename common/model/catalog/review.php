<?php
class ModelCatalogReview extends Model {
	public function addReview($product_id, $data) {
		$this->db->query("INSERT INTO oc_review SET author = :name, customer_id = :customer_id, product_id = :product_id, text = :text, rating = :rating",
            [
                ':name' => $data['name'],
                ':customer_id' => $this->customer->getId(),
                ':product_id' => $product_id,
                ':text' => $data['text'],
                ':rating' => $data['rating']
            ]);

		$review_id = $this->db->getLastId();

		if (in_array('review', (array)$this->config->get('config_mail_alert'))) {
			$this->load->language('mail/review');
			$this->load->model('catalog/product');
			
			$product_info = $this->model_catalog_product->getProduct($product_id);

			$subject = sprintf($this->language->get('text_subject'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));

			$message  = $this->language->get('text_waiting') . "\n";
			$message .= sprintf($this->language->get('text_product'), html_entity_decode($product_info['name'], ENT_QUOTES, 'UTF-8')) . "\n";
			$message .= sprintf($this->language->get('text_reviewer'), html_entity_decode($data['name'], ENT_QUOTES, 'UTF-8')) . "\n";
			$message .= sprintf($this->language->get('text_rating'), $data['rating']) . "\n";
			$message .= $this->language->get('text_review') . "\n";
			$message .= html_entity_decode($data['text'], ENT_QUOTES, 'UTF-8') . "\n\n";

            $mail = $this->registry->get('Mail');
            $email = $this->config->get('config_email');
            $mail->setSubject($subject);
            $mail->setText($message);
            $mail->send($email);

			// Send additional alert emails
			$emails = explode(',', $this->config->get('config_mail_alert_email'));
			foreach ($emails as $email) {
				if ($email && filter_var($email, FILTER_VALIDATE_EMAIL)) {
                    $this->mailer->send($email);
				}
			}
		}
	}

	public function getReviewsByProductId($product_id, $start = 0, $limit = 20) {
		if ($start < 0) {
			$start = 0;
		}

		if ($limit < 1) {
			$limit = 20;
		}

		$query = $this->db->query("SELECT r.review_id, r.author, r.rating, r.text, p.product_id, pd.name, p.price, p.image, r.date_added FROM oc_review r LEFT JOIN oc_product p ON (r.product_id = p.product_id) LEFT JOIN oc_product_description pd ON (p.product_id = pd.product_id) WHERE p.product_id = :product_id AND p.date_available <= NOW() AND p.status = :status_1 AND r.status = :status_2 AND pd.language_id = :language_id ORDER BY r.date_added DESC LIMIT " . (int)$start . "," . (int)$limit,
            [
                ':language_id' => $this->config->get('config_language_id'),
                ':product_id' => $product_id,
                ':status_1' => 1,
                ':status_2' => 1,
            ]);

		return $query->rows;
	}

	public function getTotalReviewsByProductId($product_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_review r LEFT JOIN oc_product p ON (r.product_id = p.product_id) LEFT JOIN oc_product_description pd ON (p.product_id = pd.product_id) WHERE p.product_id = :product_id AND p.date_available <= NOW() AND p.status = :status_1 AND r.status = :status_2 AND pd.language_id = :langauge_id",
            [
                ':langauge_id' => $this->config->get('config_language_id'),
                ':product_id' => $product_id,
                ':status_1' => 1,
                ':status_2' => 1,
            ]);

		return $query->row['total'];
	}
}