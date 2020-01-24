<p>List customer Invoices</p>
<?php echo "Invoice count: ".$invoices->totalItemCount;	?>
<?php $this->widget('zii.widgets.grid.CGridView', array(
	'dataProvider'=>$invoices,
	'columns'=>array(
					
		array('name'=>'Updated', 'value'=>'$data->updated'),	
		array('name'=>'Invoice ID', 'value'=>'$data->id'),
		array('name'=>'Invoice Amount', 'value'=>'$data->credit'),
		array('name'=>'Order Count', 'value'=>'$data->countOrders()'),
		array('name'=>'Delivery date', 'value'=>'$data->delivery_date'),
		array('name'=>'Due date', 'value'=>'$data->due_date'),
		array('name'=>'Paid', 'value'=>'$data->paid'),
		
		array('name'=>'Detail', 'value'=>'$data->invoiceDetailLink()','type'=>'raw'),
		array('name'=>'Delivery Report', 'value'=>'$data->deliveryReportLink()','type'=>'raw')
		
	)
))?>