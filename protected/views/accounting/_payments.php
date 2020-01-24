<?php
echo "Transaction count: ".$transactions->totalItemCount; ?>
<?php foreach( $payments->data as $payment ) :?>

<?php endforeach; ?>



<?php 
	echo CHtml::beginForm($this->createUrl('accounting/MakePayment', array('customer'=>$this->customer_id)));
?>



<?php $this->widget('zii.widgets.grid.CGridView', array(
	'dataProvider'=>$transactions,
	'columns'=>array(
		array('name'=>'Updated', 'value'=>'$data->updated'),
		array('name'=>'Transaction ID', 'value'=>'$data->id'),
		array('name'=>'Credit', 'value'=>'$data->credit'),
		array('name'=>'Debit', 'value'=>'$data->debit'),
		array('name'=>'Balance', 'value'=>'$data->balance'),
		array('name'=>'Due date', 'value'=>'$data->due_date'),
		array('name'=>'Paid', 'value'=>'$data->renderPaidCheckBox()', 'type'=>'raw')
		
	)
))?>


<h3>Account update form</h3>

<label style="width:80px;display:inline-block">Type: </label><?php echo CHtml::dropdownList('category', 2, array('2'=>'Payment','3'=>'Deduction')); ?><br/>
<label style="width:80px;display:inline-block">Amount: </label><?php echo CHtml::textField('amount','',array('size'=>30)); ?><br />
<label style="width:80px;display:inline-block">Remarks: </label><?php echo CHtml::textArea('remarks','',array('cols'=>30,'rows'=>'5','style'=>'vertical-align:text-top')); ?>

<?php echo CHtml::hiddenField('customer_id', $this->customer_id); ?><br/>
<label style="width:80px;display:inline-block">&nbsp;</label>
<?php 
	echo  CHtml::submitButton('Submit');
	echo  CHtml::endForm();
?>