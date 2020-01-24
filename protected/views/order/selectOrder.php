<style type="text/css" media="screen">
	#field{
		
		font-size:1.5em;background:#eee;width:300px;display:block;padding:5px;
		border:1px solid;
	}
</style>
<h1>New Order </h1>
<p><i>Step 2 : Select clinician and patient</i></p>

<?php
$this->pageTitle=Yii::app()->name . ' - New Order';
$this->breadcrumbs=array(
	'Manage Orders'=>array('ManageOrders'), 
	'New Order');
$size = 16;
?>

<?php echo CHtml::beginForm(); ?>

<?php echo CHtml::activeHiddenField($order,'customer_id'); ?>
<div style="border:0px solid;width:600px;float:left">

	<label>Customer ID</label><br/>
	<span style="font-size:1.5em;"><?php echo $order->customer->account_name?></span>
	<?php echo CHtml::activeHiddenField($order,'customer_id'); ?>
	<br/>
	<br/>
	

	<label>Clinician ID</label><br/>
	<span style="font-size:1.5em;"><?php echo $order->clinician->full_name?></span>
	<?php echo CHtml::activeHiddenField($order,'clinician_id'); ?>	
	<br/>
	
	
	
<br/>
<br/>
<label>Patient Name</label><br />
<span id="field"><b><?php echo $order->patient->name?></b></span>

<?echo CHtml::activeHiddenField($order, 'patient_id'); ?>
<br/>
<label>Hospital Number</label><br />
<span id="field"><b><?php echo $order->patient->hn?></b></span>
<br/>
<br/>


</div>

<style>
	td { padding: 1em 1em 1em 1em; vertical-align: top; }
	fieldset.info {	width: 32em; margin: 0 auto;  }
</style>



<div class="clear">
	
</div>

<?php /* Flash Errors */
	if ($order->getErrors()) 
		echo sprintf('<div id="flash" class="ui-state-error ui-corner-all"><span>%s</span>%s</div>', 
						'<span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>',
						CHtml::error($order,'customer_id'));
?>


<script> <?php /* reset patient_id if patient field changed */ ?>
$(document).ready(function(){
	$("#OrderCustomerForm_patient_name").change(function() {
			$("#OrderCustomerForm_patient_id").val('');
		});
});
</script>


<div style="">
	<a id="back-order" href="SelectPatient?customer_id=<?echo $order->customer_id; ?>&clinician_id=<?echo $order->clinician_id; ?>">Back</a>
	<button id="new-order" class="yui-button" type="submit" >Next &raquo;</button>
	<input type="reset" value="reset" id="reset-order"/>

	<a id="hormone-order" href="http://mml.siaminterlink.com/www/CreamOrder/order?customer=<?echo 
$order->customer->account_name; 
?>&clinician=<?echo $order->clinician->full_name; ?>&patient=<?php echo $order->patient->name; ?>&hn=<?php echo $order->patient->hn; 
?>">Hormone Cream</a>
	
	<br/><br/>
</div>

<b>New Order Options:</b>

<li>New order for a patient : 1. search patient > 2. next</li>
<li>New order for a new patient : 1. specify a new patient name > 2. next</li>
<li>New template : 1. search patient for "Template" > 2. next </li>
<li>New order from template for bulk orders : 1. leave patient blank > 2. select a template > 3. next</li>
<li>New order from template for a patient : 1. search a patient > 2. select a template > 3. next </li>

<br/>
<hr/>

<h3>Patient orders</h3>

<?php

	$this->widget('zii.widgets.grid.CGridView', array(
		'dataProvider'=>$order->patient->getCompleteTemplateOrders(),
		'columns' => array(
			array('name'=>'Order ID',	'value'=>'$data->uuid'),
			array('name'=>'Date', 'value'=>'$data->request_received'),
			array('name'=>'Price',	'value'=>'number_format($data->amount_total,2)'),
			array('name'=>'Status / Last Updated', 'value'=>'$data->latestStatus()', 'type'=>'raw'),
			array('name'=>'Patient', 'value'=>'$data->patientInfo()', 'type'=>'raw'),
			array('name'=>'Consume Days', 'value'=>'$data->days', 'type'=>'raw'),
			array('name'=>'Discount', 'value'=>'ceil($data->discount_factor)."%"', 'type'=>'raw'),
			array('name'=>'Select', 'value'=>'$data->renderSelect()', 'type'=>'raw'),
		)
	));
?>

<h3>Template orders</h3>

<?php

	$this->widget('zii.widgets.grid.CGridView', array(
		'dataProvider'=>$order->customer->getTemplateOrders(),
		'columns' => array(
		
			array('name'=>'Remark',	'value'=>'$data->remarks'),
			array('name'=>'Price',	'value'=>'number_format($data->amount_total,2)'),
			array('name'=>'Status / Last Updated', 'value'=>'$data->latestStatus()', 'type'=>'raw'),
			array('name'=>'Patient', 'value'=>'$data->patientInfo()', 'type'=>'raw'),
			array('name'=>'Consume Days', 'value'=>'$data->days', 'type'=>'raw'),
			array('name'=>'Discount', 'value'=>'$data->discount_factor."%"', 'type'=>'raw'),
		
			array('name'=>'Select', 'value'=>'$data->renderSelect()', 'type'=>'raw'),
		)
	));
?>


<?php echo CHtml::endForm(); ?>

<script>
	YUI().use('yui2-button', function(Y){
		var YAHOO = Y.YUI2;
		var button = new YAHOO.widget.Button("new-order");
		var button = new YAHOO.widget.Button("back-order");
		var button = new YAHOO.widget.Button("reset-order");
		var button = new YAHOO.widget.Button("hormone-order");
	});
</script>

