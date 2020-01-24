<h1>New Order </h1>
<p><i>Step 2 : Select clinician</i></p>

<?php

$msg='';
$this->pageTitle=Yii::app()->name . ' - New Order';
$this->breadcrumbs=array(
	'Manage Orders'=>array('ManageOrders'), 
	'New Order');
$size = 16;
?>

<?php echo CHtml::beginForm(); ?>


<div style="border:0px solid;width:600px;float:left">


<label>Customer ID</label><br/>
<span style="font-size:1.5em;"><?php echo $order->customer->account_name?></span>
<?php echo CHtml::activeHiddenField($order,'customer_id'); ?>
<br/>
<br/>

<label>Clinician ID</label><br/>
<?php echo CHtml::activeDropDownList($order,'clinician_id',Clinician::dropdownOptions($order->customer_id), 
array(
	'template'=>'{label} {input}', 'separator'=>' ', 'encode'=>true,'style'=>'font-size:1.5em;background:#eee'
	));  
?><br/>
* Hospital's clinicians

<br/>
<?php echo $msg;?>
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
	<a id="back-order" href="SelectCustomer">Back</a>
	<button id="new-order" class="yui-button" type="submit" >Next &raquo;</button>
	<input type="reset" value="Reset" id="reset-order"/>
	
	<br/><br/>
</div>



<?php echo CHtml::endForm(); ?>

<script>
	YUI().use('yui2-button', function(Y){
		var YAHOO = Y.YUI2;
		var button = new YAHOO.widget.Button("new-order");
		var button = new YAHOO.widget.Button("back-order");
		var button = new YAHOO.widget.Button("reset-order");
		
	});
</script>

