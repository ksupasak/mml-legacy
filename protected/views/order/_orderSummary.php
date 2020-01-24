<style>
.neworder {
width:300px;
margin:5px;
float:left;
}
.neworder legend{
font-weight:bold;
color:#000000;
  }  
.neworder fieldset {
 -moz-box-shadow: 2px 2px 2px #eee;
  -webkit-box-shadow: 2px 2px 2px #eee;
  box-shadow: 2px 2px 2px #eee;
  background:#EFEFEF;
  height:60px;
  padding:5px;
  border:1px solid #ddd;
}

.neworder2 {
width:300px;
margin:5px;
float:left;
}
.neworder2 fieldset {
 -moz-box-shadow: 2px 2px 2px #eee;
  -webkit-box-shadow: 2px 2px 2px #eee;
  box-shadow: 2px 2px 2px #eee;
  background:#EFEFEF;
  height:80px;
  padding:5px;
  border:1px solid #ddd;
}

</style>

<?php /* Order basic information */ ?>
<div class="neworder">
<fieldset>
	<legend>Customer</legend>
	<?php echo $order->customer->viewLink(); ?><br/>
	<?php echo $order->customer->hospital->viewLink(); ?>
	
</fieldset>   
</div>

 <div class="neworder">
<fieldset>
	<legend>Clinician</legend>
	<?php echo $order->clinician->full_name; ?> <br />
	<?php echo $order->customer->hospital->viewLink(); ?>
</fieldset>   
</div>

 <div class="neworder">
<fieldset>
	<legend>Patient</legend>	
	<?php if(isset($order->patient))echo $order->patient->viewLink(); ?>
</fieldset>   
</div>


<?php /* Order summary. appear when saved */ ?>
 <div class="neworder2">
<fieldset>
	<?php /* Do not display for clinician */
		    if (User::authorize('manage')):?>
		
	<legend>Manufacture Instructions</legend>
	
	<?php 
	if(!isset($order->remarks2) or $order->remarks2==''){
	$order->remarks2="ซองเช้า : - แคปซูล/ซอง จำนวน 30 ซอง\nซองเย็น : - แคปซูล/ซอง จำนวน 30 ซอง";
	}
	?>
	
	<?php  echo CHtml::activeTextArea($order,'remarks2', array('rows'=>3,'cols'=>38,'style'=>'font-size:0.8em')); ?>
<br/>	
<i>Manufacture Instruction &amp; Label</i>
<?php endif;?>
</fieldset>
</div>

<div class="neworder2">
<fieldset>
	<legend><?php echo CHtml::activeLabel($order, 'remarks');?></legend>
<?php  echo CHtml::activeTextArea($order,'remarks', array('rows'=>3,'cols'=>38,'style'=>'font-size:0.8em')); ?>
<br/><i>other requests and comments</i>
</fieldset>
</div>


<div class="neworder2">
<fieldset>
	<legend>



		
<?php  // Delivery Date:
	if (! isset($order->delivery_date) ) {
		$order->delivery_date = '00-00-0000';
	}
	
?>	
Request &amp; Confirm &amp; Delivery Date
</legend>
Request Date/Time: 	<?php echo $order->displayRequestedDateTime(); ?><br/>

<?php /* Do not display for clinician */
	    if (User::authorize('manage')):?>

Confirm Date:
<?php
	echo CHtml::activeTextField($order,'confirm_date', array('size'=>'12','style'=>'font-size:1em')); ?>
<script>
	$.datepicker.setDefaults({dateFormat: 'yy-mm-dd'});
	$("#Order_confirm_date").ready().datepicker();
</script>

<br/>
Delivery Date:	
<?php
	echo CHtml::activeTextField($order,'delivery_date', array('size'=>'12','style'=>'font-size:1em')); ?>
<script>
	$.datepicker.setDefaults({dateFormat: 'yy-mm-dd'});
	$("#Order_delivery_date").ready().datepicker();
</script>
<?php else: ?>

	Confirm Date: <?php echo $order->confirm_date;?>
	<br/>
	Delivery Date:  <?php echo $order->delivery_date;?>
<?php endif;?>
</fieldset>
</div>
<hr>
