<?php
use Librecommerce\Components\Controller as Controller;
use Librecommerce\Components\Event as Event;
use Librecommerce\Components\Model as Model;

class ModelExtensionTotalTax extends Model {
	public function getTotal($total) {
		foreach ($total['taxes'] as $key => $value) {
			if ($value > 0) {
				$total['totals'][] = [
					'code'       => 'tax',
					'title'      => $this->tax->getRateName($key),
					'value'      => $value,
					'sort_order' => $this->config->get('total_tax_sort_order')
                ];

				$total['total'] += $value;
			}
		}
	}
}