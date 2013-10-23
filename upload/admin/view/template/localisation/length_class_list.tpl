<?php echo $header; ?>
<div id="content" class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa-exclamation-sign"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa-ok-sign"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="panel panel-default">
    <div class="panel-heading">
      <div class="pull-right"><a href="<?php echo $insert; ?>" class="btn btn-primary"><i class="fa-plus"></i> <?php echo $button_insert; ?></a>
        <button type="button" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-length-class').submit() : false;"><i class="fa-trash"></i> <?php echo $button_delete; ?></button>
      </div>
      <h1 class="panel-title"><i class="fa-list"></i> <?php echo $heading_title; ?></h1>
    </div>
    <div class="panel-body">
      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-length-class">
        <div class="table-responsive">
          <table class="table table-striped table-bordered table-hover">
            <thead>
              <tr>
                <td width="1" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                <td class="text-left"><?php if ($sort == 'title') { ?>
                  <a href="<?php echo $sort_title; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_title; ?></a>
                  <?php } else { ?>
                  <a href="<?php echo $sort_title; ?>"><?php echo $column_title; ?></a>
                  <?php } ?></td>
                <td class="text-left"><?php if ($sort == 'unit') { ?>
                  <a href="<?php echo $sort_unit; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_unit; ?></a>
                  <?php } else { ?>
                  <a href="<?php echo $sort_unit; ?>"><?php echo $column_unit; ?></a>
                  <?php } ?></td>
                <td class="text-right"><?php if ($sort == 'value') { ?>
                  <a href="<?php echo $sort_value; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_value; ?></a>
                  <?php } else { ?>
                  <a href="<?php echo $sort_value; ?>"><?php echo $column_value; ?></a>
                  <?php } ?></td>
                <td class="text-right"><?php echo $column_action; ?></td>
              </tr>
            </thead>
            <tbody>
              <?php if ($length_classes) { ?>
              <?php foreach ($length_classes as $length_class) { ?>
              <tr>
                <td class="text-center"><?php if ($length_class['selected']) { ?>
                  <input type="checkbox" name="selected[]" value="<?php echo $length_class['length_class_id']; ?>" checked="checked" />
                  <?php } else { ?>
                  <input type="checkbox" name="selected[]" value="<?php echo $length_class['length_class_id']; ?>" />
                  <?php } ?></td>
                <td class="text-left"><?php echo $length_class['title']; ?></td>
                <td class="text-left"><?php echo $length_class['unit']; ?></td>
                <td class="text-right"><?php echo $length_class['value']; ?></td>
                <td class="text-right"><?php foreach ($length_class['action'] as $action) { ?>
                  <a href="<?php echo $action['href']; ?>" data-toggle="tooltip" title="<?php echo $action['text']; ?>" class="btn btn-primary"><i class="fa-<?php echo $action['icon']; ?> icon-large"></i></a>
                  <?php } ?></td>
              </tr>
              <?php } ?>
              <?php } else { ?>
              <tr>
                <td class="text-center" colspan="5"><?php echo $text_no_results; ?></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
      </form>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>