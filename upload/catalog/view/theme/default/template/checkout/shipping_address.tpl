<form class="form-horizontal">
  <?php if ($addresses) { ?>
  <div class="radio">
    <label>
      <input type="radio" name="shipping_address" value="existing" checked="checked" />
      <?php echo $text_address_existing; ?></label>
  </div>
  <div id="shipping-existing">
    <select name="address_id" class="form-control">
      <?php foreach ($addresses as $address) { ?>
      <?php if ($address['address_id'] == $address_id) { ?>
      <option value="<?php echo $address['address_id']; ?>" selected="selected"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
      <?php } else { ?>
      <option value="<?php echo $address['address_id']; ?>"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
      <?php } ?>
      <?php } ?>
    </select>
  </div>
  <div class="radio">
    <label>
      <input type="radio" name="shipping_address" value="new" />
      <?php echo $text_address_new; ?></label>
  </div>
  <?php } ?>
  <br />
  <div id="shipping-new" style="display: <?php echo ($addresses ? 'none' : 'block'); ?>;">
    <div class="form-group required">
      <label class="col-sm-2 control-label" for="input-shipping-firstname"><?php echo $entry_firstname; ?></label>
      <div class="col-sm-10">
        <input type="text" name="firstname" value="" placeholder="<?php echo $entry_firstname; ?>" id="input-shipping-firstname" class="form-control" />
      </div>
    </div>
    <div class="form-group required">
      <label class="col-sm-2 control-label" for="input-shipping-lastname"><?php echo $entry_lastname; ?></label>
      <div class="col-sm-10">
        <input type="text" name="lastname" value="" placeholder="<?php echo $entry_lastname; ?>" id="input-shipping-lastname" class="form-control" />
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-2 control-label" for="input-shipping-company"><?php echo $entry_company; ?></label>
      <div class="col-sm-10">
        <input type="text" name="company" value="" placeholder="<?php echo $entry_company; ?>" id="input-shipping-company" class="form-control" />
      </div>
    </div>
    <div class="form-group required">
      <label class="col-sm-2 control-label" for="input-shipping-address-1"><?php echo $entry_address_1; ?></label>
      <div class="col-sm-10">
        <input type="text" name="address_1" value="" placeholder="<?php echo $entry_address_1; ?>" id="input-shipping-address-1" class="form-control" />
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-2 control-label" for="input-shipping-address-2"><?php echo $entry_address_2; ?></label>
      <div class="col-sm-10">
        <input type="text" name="address_2" value="" placeholder="<?php echo $entry_address_2; ?>" id="input-shipping-address-2" class="form-control" />
      </div>
    </div>
    <div class="form-group required">
      <label class="col-sm-2 control-label" for="input-shipping-city"><?php echo $entry_city; ?></label>
      <div class="col-sm-10">
        <input type="text" name="city" value="" placeholder="<?php echo $entry_city; ?>" id="input-shipping-city" class="form-control" />
      </div>
    </div>
    <div class="form-group required">
      <label class="col-sm-2 control-label" for="input-shipping-postcode"><?php echo $entry_postcode; ?></label>
      <div class="col-sm-10">
        <input type="text" name="postcode" value="<?php echo $postcode; ?>" placeholder="<?php echo $entry_postcode; ?>" id="input-shipping-postcode" class="form-control" />
      </div>
    </div>
    <div class="form-group required">
      <label class="col-sm-2 control-label" for="input-shipping-country"><?php echo $entry_country; ?></label>
      <div class="col-sm-10">
        <select name="country_id" id="input-shipping-country" class="form-control">
          <option value=""><?php echo $text_select; ?></option>
          <?php foreach ($countries as $country) { ?>
          <?php if ($country['country_id'] == $country_id) { ?>
          <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
          <?php } else { ?>
          <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
          <?php } ?>
          <?php } ?>
        </select>
      </div>
    </div>
    <div class="form-group required">
      <label class="col-sm-2 control-label" for="input-shipping-zone"><?php echo $entry_zone; ?></label>
      <div class="col-sm-10">
        <select name="zone_id" id="input-shipping-zone" class="form-control">
        </select>
      </div>
    </div>
  </div>
  <div class="buttons clearfix">
    <div class="pull-right">
      <input type="button" value="<?php echo $button_continue; ?>" id="button-shipping-address" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />
    </div>
  </div>
</form>
<script type="text/javascript"><!--
$('input[name=\'shipping_address\']').on('change', function() {
	if (this.value == 'new') {
		$('#shipping-existing').hide();
		$('#shipping-new').show();
	} else {
		$('#shipping-existing').show();
		$('#shipping-new').hide();
	}
});
//--></script> 
<script type="text/javascript"><!--
$('#collapse-shipping-address input[name=\'customer_group_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=checkout/register/custom_field&customer_group_id=' + this.value,
		dataType: 'json',	
		success: function(json) {
			$('.custom-field').hide();
			
			for (i = 0; i < json.length; i++) {
				custom_field = json[i];
				
				if (!$('input[name^=\'custom_field[' + custom_field['custom_field_id'] + ']\'], textarea[name=\'custom_field[' + custom_field['custom_field_id'] + ']\']').length) {
					html = '';
					
					if (custom_field['type'] == 'select') {
						html += '<div class="form-group custom-field">';
						html += '  <label class="control-label" for="input-shipping-custom-field' + custom_field['custom_field_id'] + '">' + custom_field['name'] + '</label>';
						html += '  <select name="custom_field[' + custom_field['custom_field_id'] + ']" id="input-shipping-custom-field' + custom_field['custom_field_id'] + '" class="form-control">';
						html += '    <option value=""><?php echo $text_select; ?></option>';
					
						for (j = 0; j < custom_field['custom_field_value'].length; j++) {
							html += '<option value="' + custom_field['custom_field_value'][j]['custom_field_value_id'] + '">' + custom_field['custom_field_value'][j]['name'] + '</option>';
						}
							
						html += '  </select>';

						html += '</div>';					
					}
					
					if (custom_field['type'] == 'radio') {
						html += '<div class="form-group custom-field">';
						html += '  <label class="control-label">' + custom_field['name'] + '</label>';
						html += '  <div id="input-shipping-custom-field' + custom_field['custom_field_id'] + '">';
						
						for (j = 0; j < custom_field['custom_field_value'].length; j++) {
							custom_field_value = custom_field['custom_field_value'][j];
							
							html += '<div class="radio">';
							html += '  <label><input type="radio" name="custom_field[' + custom_field['custom_field_id'] + ']" value="' + custom_field_value['custom_field_value_id'] + '" /> ' + custom_field_value['name'] + '</label>';
							html += '</div>';
						}
						
						html += '  </div>';
						html += '</div>';				
					}
					
					if (custom_field['type'] == 'checkbox') {
						html += '<div class="form-group custom-field">';
						html += '  <label class="control-label">' + custom_field['name'] + '</label>';
						html += '  <div id="input-shipping-custom-field' + custom_field['custom_field_id'] + '">';
						
						for (j = 0; j < custom_field['custom_field_value'].length; j++) {
							custom_field_value = custom_field['custom_field_value'][j];
							
							html += '<div class="checkbox">';
							html += '  <label><input type="checkbox" name="custom_field[' + custom_field['custom_field_id'] + '][]" value="' + custom_field_value['custom_field_value_id'] + '" /> ' + custom_field_value['name'] + '</label>';
							html += '</div>';
						}
						
						html += '  </div>';					
						html += '</div>';				
					}
					
					if (custom_field['type'] == 'text') {
						html += '<div class="form-group custom-field">';
						html += '  <label class="control-label" for="input-shipping-custom-field' + custom_field['custom_field_id'] + '">' + custom_field['name'] + '</label>';
						html += '  <input type="text" name="custom_field[' + custom_field['custom_field_id'] + ']" value="' + custom_field['value'] + '" placeholder="' + custom_field['name'] + '" id="input-shipping-custom-field' + custom_field['custom_field_id'] + '" class="form-control" />';
						html += '</div>';					
					}
					
					if (custom_field['type'] == 'textarea') {
						html += '<div class="form-group custom-field">';
						html += '  <label class="control-label" for="input-shipping-custom-field' + custom_field['custom_field_id'] + '">' + custom_field['name'] + '</label>';
						html += '  <textarea name="custom_field[' + custom_field['custom_field_id'] + ']" rows="5" placeholder="' + custom_field['name'] + '" id="input-shipping-custom-field' + custom_field['custom_field_id'] + '" class="form-control">' + custom_field['value'] + '</textarea>';
						html += '</div>';
					}
					
					if (custom_field['type'] == 'file') {
						html += '<div class="form-group custom-field">';
						html += '  <label class="control-label">' + custom_field['name'] + '</label>';
						html += '  <button type="button" id="button-shipping-custom-field' + custom_field['custom_field_id'] + '" class="btn btn-default"><i class="fa-upload"></i> <?php echo $button_upload; ?></button>';
						html += '  <input type="hidden" name="custom_field[' + custom_field['custom_field_id'] + ']" value="" id="input-shipping-custom-field' + custom_field['custom_field_id'] + '" />';
						html += '</div>';
					}
					
					if (custom_field['type'] == 'date') {
						html += '<div class="form-group custom-field">';
						html += '  <label class="control-label" for="input-shipping-custom-field' + custom_field['custom_field_id'] + '">' + custom_field['name'] + '</label>';
						html += '  <input type="date" name="custom_field[' + custom_field['custom_field_id'] + ']" value="" id="input-shipping-custom-field' + custom_field['custom_field_id'] + '" class="form-control" />';
						html += '</div>';
					}
					
					if (custom_field['type'] == 'datetime') {
						html += '<div class="form-group custom-field">';
						html += '  <label class="control-label" for="input-shipping-custom-field' + custom_field['custom_field_id'] + '">' + custom_field['name'] + '</label>';
						html += '  <input type="datetime-local" name="custom_field[' + custom_field['custom_field_id'] + ']" value="' + custom_field['value'] + '" id="input-shipping-custom-field' + custom_field['custom_field_id'] + '" class="form-control" />';
						html += '</div>';					
					}
					
					if (custom_field['type'] == 'time') {
						html += '<div class="form-group custom-field">';
						html += '  <label class="control-label" for="input-shipping-custom-field' + custom_field['custom_field_id'] + '">' + custom_field['name'] + '</label>';
						html += '  <input type="time" name="custom_field[' + custom_field['custom_field_id'] + ']" value="' + custom_field['value'] + '" id="input-shipping-custom-field' + custom_field['custom_field_id'] + '" class="form-control" />';
						html += '</div>';					
					}
					
					$('#collapse-shipping-address .form-group:eq(' + custom_field['sort_order'] + ')').after(html);
				} else {
					$('#input-shipping-custom-field' + custom_field['custom_field_id']).parent().show();
				}
				
				if (custom_field['required']) {
					$('#input-shipping-custom-field' + custom_field['custom_field_id']).parent().addClass('required');
				} else {
					$('#input-shipping-custom-field' + custom_field['custom_field_id']).parent().removeClass('required');
				}
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('#collapse-shipping-address input[name=\'customer_group_id\']:checked').trigger('change');
//--></script> 
<script type="text/javascript"><!--
$('#input-shipping-country').on('change', function() {
	if (this.value == '') return;
	$.ajax({
		url: 'index.php?route=checkout/checkout/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('#shipping-address select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('.wait').remove();
		},			
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#input-shipping-postcode').parent().parent().addClass('required');
			} else {
				$('#input-shipping-postcode').parent().parent().removeClass('required');
			}
			
			html = '<option value=""><?php echo $text_select; ?></option>';
			
			if (json['zone']) {
				for (i = 0; i < json['zone'].length; i++) {
        			html += '<option value="' + json['zone'][i]['zone_id'] + '"';
	    			
					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
	      				html += ' selected="selected"';
	    			}
	
	    			html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}
			
			$('#input-shipping-zone').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('#input-shipping-country').trigger('change');
//--></script>