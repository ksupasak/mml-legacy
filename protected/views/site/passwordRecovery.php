<?php
$this->pageTitle=Yii::app()->name . ' - Password Recovery';
$this->breadcrumbs=array(
	'Login' => array('Login'),
	'Password Recovery',
);
?>
<h1>Password Recovery</h1>
<div class="grid_6 prefix_2">
  <p>
	<legend>E-mail:</legend> <fieldset><?php echo CHtml::textField('email') ?></fieldset>
	<p class="hint">ใส่อีเมล์ที่ได้เคยลงทะเบียนใช้งานระบบ</p>
	<?php echo CHtml::submitButton('submit'); ?>
  </p>
</div>