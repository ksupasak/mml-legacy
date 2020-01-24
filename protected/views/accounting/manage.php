<?php
$this->pageTitle=Yii::app()->name . ' - Manage Billings';
$this->breadcrumbs=array(
	'Manage Billings');
?>
<h1>Manage Accounts</h1>


<h3>By Customers</h3>
<?php   /* Customer List: list customers with complete orders*/   ?>
<div id="customer-list" class="grid_12" >
<?php $this->renderPartial('_customers', array('customers'=>$customers)); ?>
</div>
