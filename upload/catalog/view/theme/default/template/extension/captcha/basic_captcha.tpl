<fieldset>
  <legend>{{ text_captcha }}</legend>
  <div class="form-group required">
    {% if substr($route, 0, 9) == 'checkout/') { ?>
    <label class="control-label" for="input-payment-captcha">{{ entry_captcha }}</label>
    <input type="text" name="captcha" id="input-payment-captcha" class="form-control" autocomplete="off" />
    <img src="index.php?route=extension/captcha/basic_captcha/captcha" alt="" />
    {% else %}
    <label class="col-sm-2 control-label" for="input-captcha">{{ entry_captcha }}</label>
    <div class="col-sm-10">
      <input type="text" name="captcha" id="input-captcha" class="form-control" />
      <img src="index.php?route=extension/captcha/basic_captcha/captcha" alt="" />
      {% if error_captcha) { ?>
      <div class="text-danger">{{ error_captcha }}</div>
      <?php } ?>
    </div>
    <?php } ?>
  </div>
</fieldset>
