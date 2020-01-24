<h1>New Order </h1>
<p><i>Step 2 : Select clinician and patient</i></p>

<?php
$this->pageTitle=Yii::app()->name . ' - New Order';
$this->breadcrumbs=array(
	'Manage Orders'=>array('ManageOrders'), 
	'New Order');
$size = 16;
$clinician = $order->clinician;
?>

<?php echo CHtml::beginForm(); ?>

<?php echo CHtml::activeHiddenField($order,'customer_id'); ?>
<div style="border:0px solid;width:600px;float:left">



	<label>Customer ID</label><br/>
	<span style="font-size:1.5em;"><?php echo $order->customer->account_name?></span>
	<?php echo CHtml::activeHiddenField($order,'customer_id'); ?>
	<br/>
	<br/>
	
	<?php
	// $clinician = Clinician::model()->find('user_id=:user_id',array(':user_id'=>Yii::app()->session['user.id']));
    ?>

	<label>Clinician ID</label><br/>
	<span style="font-size:1.5em;"><?php echo $order->clinician->full_name?></span>
	<?php echo CHtml::activeHiddenField($order,'clinician_id'); ?>	
	<br/>
	
<br/>
<label>Patient Name</label><br />
<?php 
	$this->widget('CAutoComplete',
      array(
         'name'=>'patient_name', 'url'=>array('clinician/lookupPatient?clinician_id='.$clinician->id), 
		 'model'=>$order, 'attribute'=>'patient_name',
		 'max'=>10, 'minChars'=>0, 'delay'=>200, 'matchCase'=>false,
         'htmlOptions'=>array('size'=>30,'style'=>'font-size:1.5em;background:#eee'), 
        // 'methodChain'=>".result(function(event,item){ console.log(item); \$(\"#Order_patient_id\").val(item[2]); console.log($('#Order_patient_id')); \$(\"#patient_hn\").val(item[1]); })",
		 'methodChain'=>".result(function(event,item){ \$(\"#Order_patient_id\").val(item[2]);\$(\"#patient_hn\").val(item[1]);})",
         ));
echo CHtml::activeHiddenField($order, 'patient_id'); ?>
<br/>

<label>Hospital Number</label><br />
<?php 
	$this->widget('CAutoComplete',
      array(
         'name'=>'patient_hn', 'url'=>array('clinician/lookupPatientHN?clinician_id='.$clinician->id), 
		 'model'=>$order, 'attribute'=>'patient_hn',
		 'max'=>10, 'minChars'=>0, 'delay'=>200, 'matchCase'=>false,
         'htmlOptions'=>array('size'=>30,'style'=>'font-size:1.5em;background:#eee'), 
        // 'methodChain'=>".result(function(event,item){ console.log(item); \$(\"#Order_patient_id\").val(item[2]); console.log($('#Order_patient_id')); \$(\"#patient_hn\").val(item[1]); })",
		 'methodChain'=>".result(function(event,item){ \$(\"#Order_patient_id\").val(item[2]);\$(\"#patient_name\").val(item[1]);})",
         ));
?>
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
<?php if(Yii::app()->session['user.type'] != 'CLINICIAN'){?>	
	<a id="back-order" href="SelectClinician?customer_id=<?php  echo $order->customer_id; ?>">Back</a>
<?php }?>	
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

