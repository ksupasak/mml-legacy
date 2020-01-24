<p>list orders, allow user to select which "complete" order to generate invoice</p>
<?php echo "Order count: ".$orders->totalItemCount; ?>

<?php 
	echo CHtml::beginForm($this->createUrl('accounting/CreateInvoice', array('customer'=>$this->customer_id)));
?>


<?php 
	$this->widget('zii.widgets.grid.CGridView', array(
		'dataProvider'=>$orders,
		'columns'=>array(
			array('name'=>'Updated', 'value'=>'$data->lastUpdated()'),
			array('name'=>'Order ID', 'value'=>'$data->uuid'),
			array('name'=>'Lot ID', 'value'=>'$data->lotid()'),
			array('name'=>'Total', 'value'=>'$data->getFinalTotalAmount()'),
			array('name'=>'Customer', 'value'=>'$data->customer->viewLink()','type'=>'raw'),
			array('name'=>'Clinician', 'value'=>'$data->clinician->full_name','type'=>'raw'),
			array('name'=>'Patient', 'value'=>'$data->patient->viewLinkWithHN()','type'=>'raw'),
			array('name'=>'Select','value'=>'CHtml::checkbox("Orders[".$data->id."]", array("htmlOptions"=>array("value"=>$data->uuid)))','type'=>'raw')
		)
	));
?>

<div class="" style="float:left">
<fieldset>
	<legend>
<label for="Order_delivery_date">Delivery Date</label>	
</legend>	
<input size="10" name="Invoice[delivery_date]" id="Invoice_delivery_date" type="text" value="<?php echo date("Y-m-d")?>" /><script>
	$(function() { 
		$("#Invoice_delivery_date" ).datepicker({dateFormat: 'yy-mm-dd'});
	});
</script>
</fieldset>
</div>
<div class="" style="float:left">
<fieldset>
	<legend>
<label for="Order_delivery_date">Due Date</label>	
</legend>	
<input size="10" name="Invoice[due_date]" id="Invoice_due_date" type="text" value="<?php echo date("Y-m-d", mktime(0, 0, 0, date("m")+1, date("d"),   date("Y")))?>" /><script>
	$(function() { 
	    $("#Invoice_due_date").ready().datepicker({dateFormat: 'yy-mm-dd'});
	});
</script>
</fieldset>
</div>
<input name="Invoice[paid]" value="0" type="hidden"/>
<div class="clear">
	
</div>

<?php 
	echo  CHtml::submitButton('Create Invoice');
	echo  CHtml::submitButton('Delivery');
	echo  CHtml::endForm();
?>