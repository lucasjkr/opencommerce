<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
      </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-6">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-shopping-cart"></i> <?php echo $text_shipping_address; ?></h3>
          </div>
          <table class="table">
            <tbody>
              <tr>
                <td><?php echo $shipping_address; ?></td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
      <div class="col-md-6">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-user"></i> <?php echo $text_order_info; ?></h3>
          </div>
          <table class="table">
            <tr>
              <td><button data-toggle="tooltip" title="<?php echo $text_opencart_order; ?>" class="btn btn-info btn-xs"><i class="fa fa-group fa-fw"></i></button></td>
              <td><a href="<?php echo $order_link; ?>"><?php echo $order_id; ?></a></td>
            </tr>
            <tr>
              <td style="width: 1%;"><button data-toggle="tooltip" title="<?php echo $text_status; ?>" class="btn btn-info btn-xs"><i class="fa fa-truck fa-fw"></i></button></td>
              <td><?php echo $status_options[$fba_order_status]; ?></td>
            </tr>
          </table>
        </div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-info-circle"></i> <?php echo $text_order; ?></h3>
      </div>
      <div class="panel-body">
        <table class="table table-bordered">
          <thead>
          <tr>
            <td class="text-left"><?php echo $column_product; ?></td>
            <td class="text-left"><?php echo $column_sku; ?></td>
            <td class="text-right"><?php echo $column_quantity; ?></td>
            <td class="text-right"><?php echo $column_fba; ?></td>
          </tr>
          </thead>
          <tbody>
          <?php foreach ($products as $product) { ?>
          <tr>
            <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
              <?php foreach ($product['option'] as $option) { ?>
              <br />
              <?php if ($option['type'] != 'file') { ?>
              &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
              <?php } ?>
              <?php } ?></td>
            <td class="text-left">
              <?php if (!empty($product['sku'])) { ?>
                <?php echo $product['sku']; ?>
              <?php } else { ?>
                <span class="label label-danger"><?php echo $text_no_sku; ?></span>
              <?php } ?>
            </td>
            <td class="text-right"><?php echo $product['quantity']; ?></td>
            <td class="text-right">
              <?php if ($product['fba'] == 1) { ?>
                <span class="btn btn-success btn-sm"><i class="fa fa-check fa-fw"></i></span>
              <?php } else { ?>
              <span class="btn btn-danger btn-sm"><i class="fa fa-minus fa-fw"></i></span>
              <?php } ?>
            </td>
          </tr>
          <?php } ?>
          </tbody>
        </table>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-comment-o"></i> <?php echo $text_history; ?></h3>
      </div>
      <div class="panel-body">
        <table class="table table-bordered">
          <thead>
          <tr>
            <td class="text-left"><?php echo $column_fulfillment_id; ?></td>
            <td class="text-left"><?php echo $column_created; ?></td>
            <td class="text-right"><?php echo $column_response_code; ?></td>
            <td class="text-right"><?php echo $column_actions; ?></td>
          </tr>
          </thead>
          <tbody>
          <?php foreach ($fulfillments as $fulfillment) { ?>
          <tr>
            <td class="text-left"><?php echo $fulfillment['fba_order_fulfillment_id']; ?></td>
            <td class="text-left"><?php echo $fulfillment['created']; ?></td>
            <td class="text-right"><?php echo $fulfillment['response_header_code']; ?></td>
            <td class="text-right">
              <button data-toggle="tooltip" title="<?php echo $text_show_request; ?>" class="btn btn-info btn-sm" onclick="$('#request-row-<?php echo $fulfillment['fba_order_fulfillment_id']; ?>').toggle();"><i class="fa fa-mail-forward fa-fw"></i></button>
              <button data-toggle="tooltip" title="<?php echo $text_show_response; ?>" class="btn btn-info btn-sm" onclick="$('#response-row-<?php echo $fulfillment['fba_order_fulfillment_id']; ?>').toggle();"><i class="fa fa-mail-reply fa-fw"></i></button>
              <button data-toggle="tooltip" title="<?php echo $text_show_errors; ?>" class="btn btn-danger btn-sm" onclick="$('#error-row-<?php echo $fulfillment['fba_order_fulfillment_id']; ?>').toggle();"><i class="fa fa-exclamation fa-fw"></i></button>
            </td>
          </tr>
          <tr id="error-row-<?php echo $fulfillment['fba_order_fulfillment_id']; ?>" style="display:none;">
            <td class="text-left" colspan="4">
              <?php if (empty($fulfillment['errors'])) { ?>
              <div class="alert alert-info" style="width:100%;"><?php echo $text_no_errors; ?></div>
              <?php } ?>
              <?php foreach($fulfillment['errors'] as $fulfillment_error) { ?>
              <div class="alert alert-warning" style="width:100%;">(<?php echo $fulfillment_error['code']; ?>) <?php echo str_replace(array("\r\n", "\r", "\n"), '', $fulfillment_error['message']); ?></div>
              <?php } ?>
            </td>
          </tr>
          <tr id="request-row-<?php echo $fulfillment['fba_order_fulfillment_id']; ?>" style="display:none;">
            <td class="text-left" colspan="4">
              <pre><?php print_r($fulfillment['request_body']); ?></pre>
            </td>
          </tr>
          <tr id="response-row-<?php echo $fulfillment['fba_order_fulfillment_id']; ?>" style="display:none;">
            <td class="text-left" colspan="4">
              <pre><?php print_r($fulfillment['response_body']); ?></pre>
            </td>
          </tr>
          <?php } ?>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>
