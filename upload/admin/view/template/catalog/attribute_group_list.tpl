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
        <button type="button" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-attribute-group').submit() : false;"><i class="fa-trash"></i> <?php echo $button_delete; ?></button>
      </div>
      <h1 class="panel-title"><i class="fa-list"></i> <?php echo $heading_title; ?></h1>
    </div>
    <div class="panel-body">
      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-attribute-group">
        <div class="table-responsive">
          <table class="table table-striped table-bordered table-hover">
            <thead>
              <tr>
                <td width="1" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                <td class="text-left"><?php if ($sort == 'agd.name') { ?>
                  <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                  <?php } else { ?>
                  <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                  <?php } ?></td>
                <td class="text-right"><?php if ($sort == 'ag.sort_order') { ?>
                  <a href="<?php echo $sort_sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_sort_order; ?></a>
                  <?php } else { ?>
                  <a href="<?php echo $sort_sort_order; ?>"><?php echo $column_sort_order; ?></a>
                  <?php } ?></td>
                <td class="text-right"><?php echo $column_action; ?></td>
              </tr>
            </thead>
            <tbody>
              <?php if ($attribute_groups) { ?>
              <?php foreach ($attribute_groups as $attribute_group) { ?>
              <tr>
                <td class="text-center"><?php if ($attribute_group['selected']) { ?>
                  <input type="checkbox" name="selected[]" value="<?php echo $attribute_group['attribute_group_id']; ?>" checked="checked" />
                  <?php } else { ?>
                  <input type="checkbox" name="selected[]" value="<?php echo $attribute_group['attribute_group_id']; ?>" />
                  <?php } ?></td>
                <td class="text-left"><?php echo $attribute_group['name']; ?></td>
                <td class="text-right"><?php echo $attribute_group['sort_order']; ?></td>
                <td class="text-right"><?php foreach ($attribute_group['action'] as $action) { ?>
                  <a href="<?php echo $action['href']; ?>" data-toggle="tooltip" title="<?php echo $action['text']; ?>" class="btn btn-primary"><i class="fa-<?php echo $action['icon']; ?> icon-large"></i></a>
                  <?php } ?></td>
              </tr>
              <?php } ?>
              <?php } else { ?>
              <tr>
                <td class="text-center" colspan="4"><?php echo $text_no_results; ?></td>
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