<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-layout" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-layout" class="form-horizontal">
          <fieldset>
            <legend><?php echo $text_legend; ?></legend>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
              <div class="col-sm-10">
                <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
                <?php if ($error_name) { ?>
                <div class="text-danger"><?php echo $error_name; ?></div>
                <?php } ?>
              </div>
            </div>
            <table id="route" class="table table-striped table-bordered table-hover">
              <thead>
                <tr>
                  <td class="text-left"><?php echo $entry_store; ?></td>
                  <td class="text-left"><?php echo $entry_route; ?></td>
                  <td></td>
                </tr>
              </thead>
              <tbody>
                <?php $route_row = 0; ?>
                <?php foreach ($layout_routes as $layout_route) { ?>
                <tr id="route-row<?php echo $route_row; ?>">
                  <td class="text-left"><select name="layout_route[<?php echo $route_row; ?>][store_id]" class="form-control">
                      <option value="0"><?php echo $text_default; ?></option>
                      <?php foreach ($stores as $store) { ?>
                      <?php if ($store['store_id'] == $layout_route['store_id']) { ?>
                      <option value="<?php echo $store['store_id']; ?>" selected="selected"><?php echo $store['name']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $store['store_id']; ?>"><?php echo $store['name']; ?></option>
                      <?php } ?>
                      <?php } ?>
                    </select></td>
                  <td class="text-left"><input type="text" name="layout_route[<?php echo $route_row; ?>][route]" value="<?php echo $layout_route['route']; ?>" placeholder="<?php echo $entry_route; ?>" class="form-control" /></td>
                  <td class="text-left"><button type="button" onclick="$('#route-row<?php echo $route_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                </tr>
                <?php $route_row++; ?>
                <?php } ?>
              </tbody>
              <tfoot>
                <tr>
                  <td colspan="2"></td>
                  <td class="text-left"><button type="button" onclick="addRoute();" data-toggle="tooltip" title="<?php echo $button_route_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                </tr>
              </tfoot>
            </table>
          </fieldset>
          <fieldset>
            <legend><?php echo $text_legend; ?></legend>
            <?php $module_row = 0; ?>
            <div class="row">
              <div class="col-lg-3 col-md-4 col-sm-12">
                <table id="module-column-left" class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-center"><?php echo $text_column_left; ?></td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php foreach ($layout_modules as $layout_module) { ?>
                    <?php if ($layout_module['position'] == 'column_left') { ?>
                    <tr id="module-row<?php echo $module_row; ?>">
                      <td class="text-left"><div class="input-group">
                          <select name="layout_module[<?php echo $module_row; ?>][code]" class="form-control input-sm">
                            <?php foreach ($extensions as $extension) { ?>
                            <optgroup label="<?php echo $extension['name']; ?>">
                            <?php if (!$extension['module']) { ?>
                            <?php if ($extension['code'] == $layout_module['code']) { ?>
                            <option value="<?php echo $extension['code']; ?>" selected="selected"><?php echo $extension['name']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $extension['code']; ?>"><?php echo $extension['name']; ?></option>
                            <?php } ?>
                            <?php } else { ?>
                            <?php foreach ($extension['module'] as $module) { ?>
                            <?php if ($module['code'] == $layout_module['code']) { ?>
                            <option value="<?php echo $module['code']; ?>" selected="selected"><?php echo $module['name']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $module['code']; ?>"><?php echo $module['name']; ?></option>
                            <?php } ?>
                            <?php } ?>
                            <?php } ?>
                            </optgroup>
                            <?php } ?>
                          </select>
                          <input type="hidden" name="layout_module[<?php echo $module_row; ?>][position]" value="<?php echo $layout_module['position']; ?>" />
                          <input type="hidden" name="layout_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $layout_module['sort_order']; ?>" />
                          <div class="input-group-btn">
                            <a href="<?php echo $layout_module['edit']; ?>" type="button" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary btn-sm"><i class="fa fa-pencil"></i></a>
                            <button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-sm"><i class="fa fa fa-minus-circle"></i></button>
                          </div>
                        </div></td>
                    </tr>
                    <?php $module_row++; ?>
                    <?php } ?>
                    <?php } ?>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td class="text-left"><div class="input-group">
                          <select name="layout_module[<?php echo $module_row; ?>][code]" class="form-control input-sm">
                            <?php foreach ($extensions as $extension) { ?>
                            <optgroup label="<?php echo $extension['name']; ?>">
                            <?php if (!$extension['module']) { ?>
                            <option value="<?php echo $extension['code']; ?>"><?php echo $extension['name']; ?></option>
                            <?php } else { ?>
                            <?php foreach ($extension['module'] as $module) { ?>
                            <option value="<?php echo $module['code']; ?>"><?php echo $module['name']; ?></option>
                            <?php } ?>
                            <?php } ?>
                            </optgroup>
                            <?php } ?>
                          </select>
                          <input type="hidden" name="layout_module[<?php echo $module_row; ?>][position]" value="<?php echo $layout_module['position']; ?>" />
                          <input type="hidden" name="layout_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $layout_module['sort_order']; ?>" />
                          <div class="input-group-btn">
                            <button type="button" onclick="addModule('layout-column-left');" data-toggle="tooltip" title="<?php echo $button_module_add; ?>" class="btn btn-primary btn-sm"><i class="fa fa-plus-circle"></i></button>
                          </div>
                        </div></td>
                    </tr>
                  </tfoot>
                </table>
              </div>
              <div class="col-lg-6 col-md-4 col-sm-12">
                <table id="module-content-top" class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-center"><?php echo $text_content_top; ?></td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php foreach ($layout_modules as $layout_module) { ?>
                    <?php if ($layout_module['position'] == 'content_top') { ?>
                    <tr id="module-row<?php echo $module_row; ?>">
                      <td class="text-left"><div class="input-group">
                          <select name="layout_module[<?php echo $module_row; ?>][code]" class="form-control input-sm">
                            <?php foreach ($extensions as $extension) { ?>
                            <optgroup label="<?php echo $extension['name']; ?>">
                            <?php if (!$extension['module']) { ?>
                            <?php if ($extension['code'] == $layout_module['code']) { ?>
                            <option value="<?php echo $extension['code']; ?>" selected="selected"><?php echo $extension['name']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $extension['code']; ?>"><?php echo $extension['name']; ?></option>
                            <?php } ?>
                            <?php } else { ?>
                            <?php foreach ($extension['module'] as $module) { ?>
                            <?php if ($module['code'] == $layout_module['code']) { ?>
                            <option value="<?php echo $module['code']; ?>" selected="selected"><?php echo $module['name']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $module['code']; ?>"><?php echo $module['name']; ?></option>
                            <?php } ?>
                            <?php } ?>
                            <?php } ?>
                            </optgroup>
                            <?php } ?>
                          </select>
                          <input type="hidden" name="layout_module[<?php echo $module_row; ?>][position]" value="<?php echo $layout_module['position']; ?>" />
                          <input type="hidden" name="layout_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $layout_module['sort_order']; ?>" />
                          <div class="input-group-btn">
                            <a href="<?php echo $layout_module['edit']; ?>" type="button" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary btn-sm"><i class="fa fa-pencil"></i></a>
                            <button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-sm"><i class="fa fa fa-minus-circle"></i></button>
                          </div>
                        </div></td>
                    </tr>
                    <?php $module_row++; ?>
                    <?php } ?>
                    <?php } ?>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td class="text-left"><div class="input-group">
                          <select name="layout_module[<?php echo $module_row; ?>][code]" class="form-control input-sm">
                            <?php foreach ($extensions as $extension) { ?>
                            <optgroup label="<?php echo $extension['name']; ?>">
                            <?php if (!$extension['module']) { ?>
                            <option value="<?php echo $extension['code']; ?>"><?php echo $extension['name']; ?></option>
                            <?php } else { ?>
                            <?php foreach ($extension['module'] as $module) { ?>
                            <option value="<?php echo $module['code']; ?>"><?php echo $module['name']; ?></option>
                            <?php } ?>
                            <?php } ?>
                            </optgroup>
                            <?php } ?>
                          </select>

                          <div class="input-group-btn">
                            <button type="button" onclick="addModule('layout-column-left');" data-toggle="tooltip" title="<?php echo $button_module_add; ?>" class="btn btn-primary btn-sm"><i class="fa fa-plus-circle"></i></button>
                          </div>
                        </div></td>
                    </tr>
                  </tfoot>
                </table>
                <table id="module-content-bottom" class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-center"><?php echo $text_content_bottom; ?></td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php foreach ($layout_modules as $layout_module) { ?>
                    <?php if ($layout_module['position'] == 'content_bottom') { ?>
                    <tr id="module-row<?php echo $module_row; ?>">
                      <td class="text-left"><div class="input-group">
                          <select name="layout_module[<?php echo $module_row; ?>][code]" class="form-control input-sm">
                            <?php foreach ($extensions as $extension) { ?>
                            <optgroup label="<?php echo $extension['name']; ?>">
                            <?php if (!$extension['module']) { ?>
                            <?php if ($extension['code'] == $layout_module['code']) { ?>
                            <option value="<?php echo $extension['code']; ?>" selected="selected"><?php echo $extension['name']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $extension['code']; ?>"><?php echo $extension['name']; ?></option>
                            <?php } ?>
                            <?php } else { ?>
                            <?php foreach ($extension['module'] as $module) { ?>
                            <?php if ($module['code'] == $layout_module['code']) { ?>
                            <option value="<?php echo $module['code']; ?>" selected="selected"><?php echo $module['name']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $module['code']; ?>"><?php echo $module['name']; ?></option>
                            <?php } ?>
                            <?php } ?>
                            <?php } ?>
                            </optgroup>
                            <?php } ?>
                          </select>
                          <input type="hidden" name="layout_module[<?php echo $module_row; ?>][position]" value="<?php echo $layout_module['position']; ?>" />
                          <input type="hidden" name="layout_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $layout_module['sort_order']; ?>" />
                          <div class="input-group-btn">
                            <a href="<?php echo $layout_module['edit']; ?>" type="button" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary btn-sm"><i class="fa fa-pencil"></i></a>
                            <button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-sm"><i class="fa fa fa-minus-circle"></i></button>
                          </div>
                        </div></td>
                    </tr>
                    <?php $module_row++; ?>
                    <?php } ?>
                    <?php } ?>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td class="text-left"><div class="input-group">
                          <select name="layout_module[<?php echo $module_row; ?>][code]" class="form-control input-sm">
                            <?php foreach ($extensions as $extension) { ?>
                            <optgroup label="<?php echo $extension['name']; ?>">
                            <?php if (!$extension['module']) { ?>
                            <option value="<?php echo $extension['code']; ?>"><?php echo $extension['name']; ?></option>
                            <?php } else { ?>
                            <?php foreach ($extension['module'] as $module) { ?>
                            <option value="<?php echo $module['code']; ?>"><?php echo $module['name']; ?></option>
                            <?php } ?>
                            <?php } ?>
                            </optgroup>
                            <?php } ?>
                          </select>
                          <div class="input-group-btn">
                            <button type="button" data-toggle="tooltip" title="<?php echo $button_module_add; ?>" class="btn btn-primary btn-sm"><i class="fa fa-plus-circle"></i></button>
                          </div>
                        </div></td>
                    </tr>
                  </tfoot>
                </table>
              </div>
              <div class="col-lg-3 col-md-4 col-sm-12">
                <table id="module-column-right" class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-center"><?php echo $text_column_right; ?></td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php foreach ($layout_modules as $layout_module) { ?>
                    <?php if ($layout_module['position'] == 'column_right') { ?>
                    <tr id="module-row<?php echo $module_row; ?>">
                      <td class="text-left"><div class="input-group">
                          <select name="layout_module[<?php echo $module_row; ?>][code]" class="form-control input-sm">
                            <?php foreach ($extensions as $extension) { ?>
                            <optgroup label="<?php echo $extension['name']; ?>">
                            <?php if (!$extension['module']) { ?>
                            <?php if ($extension['code'] == $layout_module['code']) { ?>
                            <option value="<?php echo $extension['code']; ?>" selected="selected"><?php echo $extension['name']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $extension['code']; ?>"><?php echo $extension['name']; ?></option>
                            <?php } ?>
                            <?php } else { ?>
                            <?php foreach ($extension['module'] as $module) { ?>
                            <?php if ($module['code'] == $layout_module['code']) { ?>
                            <option value="<?php echo $module['code']; ?>" selected="selected"><?php echo $module['name']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $module['code']; ?>"><?php echo $module['name']; ?></option>
                            <?php } ?>
                            <?php } ?>
                            <?php } ?>
                            </optgroup>
                            <?php } ?>
                          </select>
                          <input type="hidden" name="layout_module[<?php echo $module_row; ?>][position]" value="<?php echo $layout_module['position']; ?>" />
                          <input type="hidden" name="layout_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $layout_module['sort_order']; ?>" />
                          <div class="input-group-btn">
                            <a href="<?php echo $layout_module['edit']; ?>" type="button" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary btn-sm"><i class="fa fa-pencil"></i></a>
                            <button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-sm"><i class="fa fa fa-minus-circle"></i></button>
                          </div>
                        </div></td>
                    </tr>
                    <?php $module_row++; ?>
                    <?php } ?>
                    <?php } ?>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td class="text-left"><div class="input-group">
                          <select name="layout_module[<?php echo $module_row; ?>][code]" class="form-control input-sm">
                            <?php foreach ($extensions as $extension) { ?>
                            <optgroup label="<?php echo $extension['name']; ?>">
                            <?php if (!$extension['module']) { ?>
                            <option value="<?php echo $extension['code']; ?>"><?php echo $extension['name']; ?></option>
                            <?php } else { ?>
                            <?php foreach ($extension['module'] as $module) { ?>
                            <option value="<?php echo $module['code']; ?>"><?php echo $module['name']; ?></option>
                            <?php } ?>
                            <?php } ?>
                            </optgroup>
                            <?php } ?>
                          </select>
                          <div class="input-group-btn">
                            <button type="button" data-toggle="tooltip" title="<?php echo $button_module_add; ?>" class="btn btn-primary btn-sm"><i class="fa fa-plus-circle"></i></button>
                          </div>
                        </div></td>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>
          </fieldset>
        </form>
      </div>
    </div>
  </div>
  <script type="text/javascript"><!--
var route_row = <?php echo $route_row; ?>;

function addRoute() {
	html  = '<tr id="route-row' + route_row + '">';
	html += '  <td class="text-left"><select name="layout_route[' + route_row + '][store_id]" class="form-control">';
	html += '  <option value="0"><?php echo $text_default; ?></option>';
	<?php foreach ($stores as $store) { ?>
	html += '<option value="<?php echo $store['store_id']; ?>"><?php echo addslashes($store['name']); ?></option>';
	<?php } ?>   
	html += '  </select></td>';
	html += '  <td class="text-left"><input type="text" name="layout_route[' + route_row + '][route]" value="" placeholder="<?php echo $entry_route; ?>" class="form-control" /></td>';
	html += '  <td class="text-left"><button type="button" onclick="$(\'#route-row' + route_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';
	
	$('#route tbody').append(html);
	
	route_row++;
}

var module_row = <?php echo $module_row; ?>;

function addModule(type) {
	html  = '<tr id="module-row<?php echo $module_row; ?>">
    html += '  <td class="text-left"><div class="input-group"><select name="layout_module[' + module_row + '][code]" class="form-control input-sm">';
	<?php foreach ($extensions as $extension) { ?>
	html += '  <optgroup label="<?php echo addslashes($extension['name']); ?>">';
	<?php if (!$extension['module']) { ?>
	html += '  <option value="<?php echo $extension['code']; ?>"><?php echo $extension['name']; ?></option>';
	<?php } else { ?>
	<?php foreach ($extension['module'] as $module) { ?>
	html += '  <option value="<?php echo $module['code']; ?>"><?php echo addslashes($module['name']); ?></option>';
	<?php } ?>
	<?php } ?>
	html += '  </optgroup>';
	<?php } ?>
	html += '  </select>';
    html += '<input type="hidden" name="layout_module[' + module_row + '][position]" value="<?php echo $layout_module['position']; ?>" />';
    html += '<input type="hidden" name="layout_module[' + module_row + '][sort_order]" value="<?php echo $layout_module['sort_order']; ?>" />';
	html += '<div class="input-group-btn"><a href="<?php echo $layout_module['edit']; ?>" type="button" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary btn-sm"><i class="fa fa-pencil"></i></a> <button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-sm"><i class="fa fa fa-minus-circle"></i></button></div></div></td>';
	html += '</tr>';
	
	$('#module tbody').append(html);
	
	module_row++;
}

$('#layout-column-left tbody, #layout-column-right tbody, #layout-content-top tbody, #layout-content-bottom tbody').delegate('button', 'click', function() {
	$(this).parent().parent().parent().parent().remove();
});
//--></script> 
</div>
<?php echo $footer; ?>