<?php
class ControllerPaymentKlarnaInvoice extends Controller {
    private $error = array();

    public function index() {
		$this->language->load('payment/klarna_invoice');
        
		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
        
        $this->data['country_names'] = array(
            'DEU' => $this->language->get('text_germany'),
            'NLD' => $this->language->get('text_netherlands'),
            'DNK' => $this->language->get('text_denmark'),
            'SWE' => $this->language->get('text_sweden'),
            'NOR' => $this->language->get('text_norway'),
            'FIN' => $this->language->get('text_finland'),
        );

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->model_setting_setting->editSetting('klarna_invoice', $this->request->post);
			
            $klarnaCountry = array();
            $status = false;
            
            foreach (array_keys($this->data['country_names']) as $iso3) {
				if (isset($this->request->post['klarna_invoice_country'][$iso3]['status']) && $this->request->post['klarna_invoice_country'][$iso3]['status'] == 1) {
                    $klarnaCountry[$iso3] = $this->request->post['klarna_invoice_country'][$iso3];
                    $status = true;
                } else {
                    $klarnaCountry[$iso3] = array(
                        'merchant' => '',
                        'secret' => '',
                        'server' => '',
                        'minimum' => '',
                        'status' => '',
                        'sort_order' => '',
                        'geo_zone_id' => '',
                    );
                }
            }
            
            $settings = array(
                'klarna_invoice_country' => $klarnaCountry,
                'klarna_invoice_status' => $status,
                'klarna_invoice_pending_order_status_id' => (int) $this->request->post['klarna_invoice_pending_order_status_id'],
                'klarna_invoice_accepted_order_status_id' => (int) $this->request->post['klarna_invoice_accepted_order_status_id'],
            );
            
            
            
            $this->fetchPClasses($klarnaCountry);

            if ($this->error) {
                $this->session->data['error'] = $this->language->get('error_update');
            } else {
                $this->session->data['success'] = $this->language->get('text_success');
            }

            $this->redirect($this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'));
        }
		
 		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_all_zones'] = $this->language->get('text_all_zones');
		$this->data['text_live'] = $this->language->get('text_live');
		$this->data['text_beta'] = $this->language->get('text_beta');
		$this->data['text_sweden'] = $this->language->get('text_sweden');
		$this->data['text_norway'] = $this->language->get('text_norway');
		$this->data['text_finland'] = $this->language->get('text_finland');
		$this->data['text_denmark'] = $this->language->get('text_denmark');
		$this->data['text_germany'] = $this->language->get('text_germany');
		$this->data['text_netherlands'] = $this->language->get('text_netherlands');
				
		$this->data['entry_merchant'] = $this->language->get('entry_merchant');
		$this->data['entry_secret'] = $this->language->get('entry_secret');
		$this->data['entry_server'] = $this->language->get('entry_server');
		$this->data['entry_total'] = $this->language->get('entry_total');	
		$this->data['entry_pending_status'] = $this->language->get('entry_pending_status');
		$this->data['entry_accepted_status'] = $this->language->get('entry_accepted_status');		
		$this->data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_clear'] = $this->language->get('button_clear');
		
		$this->data['tab_general'] = $this->language->get('tab_general');
		$this->data['tab_log'] = $this->language->get('tab_log');
				       
        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }

        if (isset($this->error['merchant'])) {
            $this->data['error_merchant'] = $this->error['merchant'];
        } else {
            $this->data['error_merchant'] = '';
        }

        if (isset($this->error['secret'])) {
            $this->data['error_secret'] = $this->error['secret'];
        } else {
            $this->data['error_secret'] = '';
        }
        
        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_payment'),
            'href'      => $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('heading_title'),
            'href'      => $this->url->link('payment/klarna_invoice', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );
		
		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
		
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}
		
        $this->data['action'] = $this->url->link('payment/klarna_invoice', 'token=' . $this->session->data['token'], 'SSL');
       
	    $this->data['cancel'] = $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL');





        if ($this->request->server['REQUEST_METHOD'] == 'POST') {
            $this->data['klarna_invoice_country'] = $klarnaCountry;
        } else {
            $this->data['klarna_invoice_country'] = $this->config->get('klarna_invoice_country');
        }


        if (isset($this->request->post['klarna_invoice_pending_status_id'])) {
            $this->data['klarna_invoice_pending_status_id'] = $this->request->post['klarna_invoice_pending_status_id'];
        } else {
            $this->data['klarna_invoice_pending_status_id'] = $this->config->get('klarna_invoice_pending_status_id');
        }

        if (isset($this->request->post['klarna_invoice_accepted_status_id'])) {
            $this->data['klarna_invoice_accepted_status_id'] = $this->request->post['klarna_invoice_accepted_status_id'];
        } else {
            $this->data['klarna_invoice_accepted_status_id'] = $this->config->get('klarna_invoice_accepted_status_id');
        }
		
        $this->load->model('localisation/order_status');
        
		$this->data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();
        
		
		
		$this->load->model('localisation/geo_zone');
		
		$this->data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();
        
		$file = DIR_LOGS . 'klarna_invoice.log';
        
        if (file_exists($file)) {
            $this->data['log'] = file_get_contents($file, FILE_USE_INCLUDE_PATH, null);
        } else {
            $this->data['log'] = '';
        }
        
        $this->data['clear'] = $this->url->link('payment/klarna_invoice/clear', 'token=' . $this->session->data['token'], 'SSL'); 

        $this->template = 'payment/klarna_invoice.tpl';
        $this->children = array(
            'common/header',
            'common/footer',
        );

        $this->response->setOutput($this->render());
    }

    private function validate() {
        if (!$this->user->hasPermission('modify', 'payment/klarna_invoice')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }
    
    public function clear() {
        $this->language->load('payment/klarna_invoice');
		
		$file = DIR_LOGS . 'klarna_invoice.log';
		
		$handle = fopen($file, 'w+'); 
				
		fclose($handle); 
				
		$this->session->data['success'] = $this->language->get('text_success');
        
        $this->redirect($this->url->link('payment/klarna_invoice', 'token=' . $this->session->data['token'], 'SSL'));
    }
    
    private function fetchPClasses($klarnaCountries) {
        $log = new Log('klarna_invoice.log');
        
		$countries = array(
            'NOR' => array(
                'currency' => 1,
                'country'  => 164,
                'language' => 97,
            ),
            'SWE' => array(
                'currency' => 0,
                'country'  => 209,
                'language' => 138,
            ),
            'FIN' => array(
                'currency' => 2,
                'country'  => 73,
                'language' => 101,
            ),
            'DNK' => array(
                'currency' => 3,
                'country'  => 59,
                'language' => 27,
            ),
            'DEU' => array(
                'currency' => 2,
                'country'  => 81,
                'language' => 28,
            ),
            'NLD' => array(
                'currency' => 2,
                'country'  => 154,
                'language' => 101,
            ),
        );
        
        $log = new Log('klarna_invoice.log');
        
        $result = array();
        
        foreach ($countries as $code => $country) {
            if ($klarnaCountries[$code]['status'] != 1) {
                continue;
            }
            
            $digest = base64_encode(pack("H*", hash('sha256', $klarnaCountries[$code]['merchant']  . ':' . $country['currency'] . ':' . $klarnaCountries[$code]['secret'])));
            
            $xml  = "<methodCall>";
            $xml .= "  <methodName>get_pclasses</methodName>";
            $xml .= '  <params>';
            $xml .= ' <param><value><string>4.1</string></value></param>';
            $xml .= ' <param><value><string>API:OPENCART:' . VERSION . '</string></value></param>';
            $xml .= ' <param><value><int>' . (int) $klarnaCountries[$code]['merchant'] . '</int></value></param>';
            $xml .= ' <param><value><int>' . $country['currency'] . '</int></value></param>';
            $xml .= ' <param><value><string>' . $digest . '</string></value></param>';
            $xml .= ' <param><value><int>' . $country['country'] . '</int></value></param>';
            $xml .= ' <param><value><int>' . $country['language'] . '</int></value></param>';
            $xml .= "  </params>";
            $xml .= "</methodCall>";
            
            if ($klarnaCountries[$code]['server'] == 'live') {
                $server = 'https://payment.klarna.com';
            } else {
                $server = 'https://payment-beta.klarna.com';
            }
            
            $ch = curl_init($server);

            $headers = array(
                'Content-Type: text/xml',
                'Content-Length: ' . strlen($xml),
            );

            curl_setopt($ch, CURLOPT_URL, $server);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
            curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'POST');
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $xml);

            $responseString = curl_exec($ch);
            
            if ($responseString !== False) {
                $responseXml = new DOMDocument();
                $responseXml->loadXML($responseString);

                $xpath = new DOMXPath($responseXml);

                $nodes = $xpath->query('//methodResponse/params/param/value');

                if ($nodes->length == 0) {
                    $errorCode = $xpath->query('//methodResponse/fault/value/struct/member/value/int')->item(0)->nodeValue;
                    $errorMessage = $xpath->query('//methodResponse/fault/value/struct/member/value/string')->item(0)->nodeValue;

                    $this->error['error_pclass'] = sprintf($this->language->get('error_retrieve_pclass'), $code, $errorCode, $errorMessage);
                    
                    $log->write(sprintf($this->language->get('error_retrieve_pclass'), $countryCode, $errorCode, $errorMessage));
                    continue;
                }

                $pclasses = $this->parseResponse($nodes->item(0)->firstChild, $responseXml);

                while ($pclasses) {
                    $pclass = array_slice($pclasses, 0, 10);
                    $pclasses = array_slice($pclasses, 10);

                    $pclass[3] /= 100;
                    $pclass[4] /= 100;
                    $pclass[5] /= 100;
                    $pclass[6] /= 100;
                    $pclass[9] = ($pclass[9] != '-') ? strtotime($pclass[9]) : $pclass[9];

                    array_unshift($pclass, $klarnaCountries[$countryCode]['merchant']);

                    $result[$countryCode][] = array(
                        'eid' => intval($pclass[0]),
                        'id' => intval($pclass[1]),
                        'description' => $pclass[2],
                        'months' => intval($pclass[3]),
                        'startfee' => floatval($pclass[4]),
                        'invoicefee' => floatval($pclass[5]),
                        'interestrate' => floatval($pclass[6]),
                        'minamount' => floatval($pclass[7]),
                        'country' => intval($pclass[8]),
                        'type' => intval($pclass[9]),
                    );
                }
            } else {
                $this->error['errro_http'] = sprintf($this->language->get('error_http_error'), curl_errno($ch), curl_error($ch));
                $log->write(sprintf($this->language->get('error_http_error'), curl_errno($ch), curl_error($ch)));
            }

            curl_close($ch);
        }
        
        $settings = $this->model_setting_setting->getSetting('klarna_invoice');
        $settings['klarna_invoice_pclasses'] = $result;
        $this->model_setting_setting->editSetting('klarna_invoice', $settings);
    }
    
    private function parseResponse($node, $document) {
        $child = $node;

        switch ($child->nodeName) {
            case 'string':
                $value = $child->nodeValue;
                break;

            case 'boolean':
                $value = (string) $child->nodeValue;

                if ($value == '0') {
                    $value = false;
                } elseif ($value == '1') {
                    $value = true;
                } else {
                    $value = null;
                }

                break;

            case 'integer':
            case 'int':
            case 'i4':
            case 'i8':
                $value = (int) $child->nodeValue;
                break;

            case 'array':
                $value = array();
                
                $xpath = new DOMXPath($document);
                $entries = $xpath->query('.//array/data/value', $child);
                
                for ($i = 0; $i < $entries->length; $i++) {
                    $value[] = $this->parseResponse($entries->item($i)->firstChild, $document);
                }

                break;

            default:
                $value = null;
        }

        return $value;
    }
    
}