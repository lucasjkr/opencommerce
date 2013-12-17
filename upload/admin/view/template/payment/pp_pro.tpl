<?php echo $header; ?>
<div id="content" class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if (isset($error['error_warning'])) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error['error_warning']; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="panel panel-default">
    <div class="panel-heading">
      <div class="pull-right">
        <button type="submit" form="form-pp-pro-uk" class="btn btn-primary"><i class="fa fa-check"></i> <?php echo $button_save; ?></button>
        <a href="<?php echo $cancel; ?>" class="btn btn-danger"><i class="fa fa-times"></i> <?php echo $button_cancel; ?></a></div>
      <h1 class="panel-title"><i class="fa fa-pencil-square"></i> <?php echo $heading_title; ?></h1>
    </div>
    <div class="panel-body">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-pp-pro-uk" class="form-horizontal">
        <div class="form-group required">
          <label class="col-sm-2 control-label" for="entry-username"><?php echo $entry_username; ?></label>
          <div class="col-sm-10">
            <input type="text" name="pp_pro_username" value="<?php echo $pp_pro_username; ?>" placeholder="<?php echo $entry_username; ?>" id="entry-username" class="form-control"/>
            <?php if (isset($error['username'])) { ?>
            <div class="text-danger"><?php echo $error['username']; ?></div>
            <?php } ?>
          </div>
        </div>
        <div class="form-group required">
          <label class="col-sm-2 control-label" for="entry-password"><?php echo $entry_password; ?></label>
          <div class="col-sm-10">
            <input type="text" name="pp_pro_password" value="<?php echo $pp_pro_password; ?>" placeholder="<?php echo $entry_password; ?>" id="entry-password" class="form-control"/>
            <?php if (isset($error['password'])) { ?>
            <div class="text-danger"><?php echo $error['password']; ?></div>
            <?php } ?>
          </div>
        </div>
        <div class="form-group required">
          <label class="col-sm-2 control-label" for="entry-signature"><?php echo $entry_signature; ?></label>
          <div class="col-sm-10">
            <input type="text" name="pp_pro_signature" value="<?php echo $pp_pro_signature; ?>" placeholder="<?php echo $entry_signature; ?>" id="entry-signature" class="form-control"/>
            <?php if (isset($error['signature'])) { ?>
            <div class="text-danger"><?php echo $error['signature']; ?></div>
            <?php } ?>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-live-demo"><?php echo $entry_test; ?></label>
          <div class="col-sm-10">
            <select name="pp_pro_test" id="input-live-demo" class="form-control">
              <?php if ($pp_pro_test) { ?>
              <option value="1" selected="selected"><?php echo $text_yes; ?></option>
              <option value="0"><?php echo $text_no; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_yes; ?></option>
              <option value="0" selected="selected"><?php echo $text_no; ?></option>
              <?php } ?>
            </select>
            <span class="help-block"><?php echo $entry_test_help; ?></span>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-total"><?php echo $entry_total; ?></label>
          <div class="col-sm-10">
            <input type="text" name="pp_pro_total" value="<?php echo $pp_pro_total; ?>" placeholder="<?php echo $entry_total; ?>" id="input-total" class="form-control" />
            <span class="help-block"><?php echo $entry_total_help; ?></span>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
          <div class="col-sm-10">
            <select name="pp_pro_status" id="input-status" class="form-control">
              <?php if ($pp_pro_status) { ?>
              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="0"><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_enabled; ?></option>
              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
          <div class="col-sm-10">
            <input type="text" name="pp_pro_sort_order" value="<?php echo $pp_pro_sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-geo-zone"><?php echo $entry_geo_zone; ?></label>
          <div class="col-sm-10">
            <select name="pp_pro_geo_zone_id" id="input-geo-zone" class="form-control">
              <option value="0"><?php echo $text_all_zones; ?></option>
              <?php foreach ($geo_zones as $geo_zone) { ?>
              <?php if ($geo_zone['geo_zone_id'] == $pp_pro_geo_zone_id) { ?>
              <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-order-status"><?php echo $entry_order_status; ?></label>
          <div class="col-sm-10">
            <select name="pp_pro_order_status_id" id="input-order-status" class="form-control">
              <?php foreach ($order_statuses as $order_status) { ?>
              <?php if ($order_status['order_status_id'] == $pp_pro_order_status_id) { ?>
              <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-transaction"><?php echo $entry_transaction; ?></label>
          <div class="col-sm-10">
            <select name="pp_pro_transaction" id="input-transaction" class="form-control">
              <?php if (!$pp_pro_transaction) { ?>
              <option value="0" selected="selected"><?php echo $text_authorization; ?></option>
              <?php } else { ?>
              <option value="0"><?php echo $text_authorization; ?></option>
              <?php } ?>
              <?php if ($pp_pro_transaction) { ?>
              <option value="1" selected="selected"><?php echo $text_sale; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_sale; ?></option>
              <?php } ?>
            </select>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
<?php echo $footer; ?>