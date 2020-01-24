<div class="setbackground">
<fieldset  style="background-color:#ffd">
	<legend><?php echo CHtml::label('Actions',''); ?></legend>
			<?php $this->renderPartial('_orderProcessing', array('order'=>$order)); ?>
</fieldset>
</div>
<div class="setbackground">
<fieldset>
	<legend>Order</legend>
<?php /* Do not display for clinician */
if ( User::authorize('manage') ):?>	
<?php // Allow update price only if not confirmed
if ($order->status_id < Status::CONFIRMED): ?>
<button id="calculate-price" type="submit" name="save" value="<?php echo isset($order->status_id) ? $order->status_id : Status::DRAFT; ?>">Calculate</button>
<?php else: ?>
<button id="calculate-price" type="submit" name="save" value="<?php echo isset($order->status_id) ? $order->status_id : Status::DRAFT; ?>">Update</button>
<?php endif; ?>

<?php endif; ?>

    
<?php // Supplement Day:
	echo CHtml::activeLabel($order,'days');
	echo CHtml::activeTextField($order, 'days'); ?>



<?php /* Do not display for clinician */
    if (User::authorize('manage')):?>
<?php // Discount Factor (%)
	echo CHtml::activeLabel($order, 'discount_factor');
	echo CHtml::activeDropDownList($order,'discount_factor', DiscountFactor::dropDownOptions(), array('prompt'=>'Please Select', 'select'=>$order->discount_factor)); ?>
<?php endif;?>



<?php /* Do not display for clinician */
    if ( User::authorize('manage') ):?>	
<?php  // Order Amount:
		echo CHtml::activeLabel($order, 'amount');
		echo CHtml::activeTextField($order, 'amount',array('editable'=>false)); ?>
		
<?php //Marketing Charge
	echo CHtml::activeLabel($order, 'marketing_charge');
	echo CHtml::activeTextField($order, 'marketing_charge'); ?>

<?php  // Additional Charges:
		echo CHtml::activeLabel($order, 'additional_charge');
		echo CHtml::activeTextField($order,'additional_charge'); ?>

<?php  // Additional Charges:
		echo CHtml::activeLabel($order, 'packaging');
		echo CHtml::activeCheckBox($order,'packaging'); ?>


<?php //Order + VAT + Charges:
	echo CHtml::activeLabel($order, 'amount_total');
	echo CHtml::textField('net_price',number_format($order->getFinalTotalAmount(),2), array('style'=>'background:#dfd;font-size:1em','size'=>17)); ?>

<?php else: 
    if($order->status_id < Status::REQUEST):
//$order->status_id >= Status::PENDING && User::authorize('manage') 
?> <br/><br/>

  <button id="calculate-price" type="submit" name="save" value="<?php echo isset($order->status_id) ? $order->status_id : Status::DRAFT; ?>">Recalculate</button><br/><br/>

	<?php //Order + VAT + Charges:
				echo CHtml::activeLabel($order, 'amount_total');
				echo CHtml::textField('net_price',number_format($order->getFinalTotalAmount(),2), array('readonly'=>true,'style'=>'background:#dfd;font-size:1em','size'=>17)); ?>
			   <br/><i style="color:gray">*Approximate Value</i>
	<?php endif;?>
<?php endif;?>
	
</fieldset>
</div>



<script>
	YUI().use('yui2-button', function(Y){
		var YAHOO = Y.YUI2;
		var button = new YAHOO.widget.Button("save-draft");
		var button = new YAHOO.widget.Button("send-request");
		var button = new YAHOO.widget.Button("calculate-price");
		var button = new YAHOO.widget.Button("save1");
		var button = new YAHOO.widget.Button("save2");
		var button = new YAHOO.widget.Button("save3");
		var button = new YAHOO.widget.Button("save4");
	});
</script>


<?php $this->renderPartial('_orderManufacture', array('order'=>$order)); ?>
