TODO

In public_html/admin/controller

replace each instance of
$this->load->mode('xxx/yyy')
with:
$this->load->model('xxx/yyy_admin')

THEN

replace each instance of:

$this->model_xxx_yyy
with
$this->model_xxx_yyy_admin

Once that's complete, we can copy all of the controller models into the common/model directory.

---

The first model to consolidate back down to a single version is Tool/Image - no reason to have two image resizers

---

Add a constructor to each controller, and move the model loading there:

$this->product = $this->load->model("xxx/xxx");

That way, we don't need to load each model individually, nor reference it with the super long form.

Eventually, this could all be in the master model (potentially) and each controller can just access the models


--

Have already replaced all array initializations - array(); with [];
now need to replace initializating arrays that aren't empty

---

Code would be MUCH cleaner if defaults were set differently:

Instead of:

if (isset($this->request->post['config_maintenance'])) {
$data['config_maintenance'] = $this->request->post['config_maintenance'];
} else {
$data['config_maintenance'] = $this->config->get('config_maintenance');
}

Just do:

$data['config_maintenance'] = $this->config->get('config_maintenance');
if (isset($this->request->post['config_maintenance'])) {
    $data['config_maintenance'] = $this->request->post['config_maintenance'];
}

---

ControllerStartupError is reminiscent of error catching in framework.php
---