<h1>Manage Payments</h1>
<?php
$this->pageTitle=Yii::app()->name . ' - Payments';
$this->breadcrumbs=array(
	'Accounting'=>array('accounting'), 
	'Manage Paymants');
?>

<div id="payment-list-filter" class="prefix_6 grid_4 alpha omega">
<?php $this->renderPartial('_paymentFilter'); ?>
</div>

<div id="payment-list" class="grid_10" >
<?php  $this->renderPartial('_paymentList'); ?>
</div>