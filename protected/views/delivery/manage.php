<div id="new-queue">
<h3>Pending Delivery Orders</h3>
<p>Status = PROCESSING and order_station</p>
<?php 
	$this->widget('zii.widgets.grid.CGridView', array(
		'dataProvider'=>$deliveryOrders,
		'columns'=>array(
			array('name'=>'Updated', 'value'=>'$data->lastUpdated()'),
			array('name'=>'Order ID', 'value'=>'$data->uuid'),
			array('name'=>'Lot ID', 'value'=>'$data->lotid()'),
			array('name'=>'Customer', 'value'=>'$data->customer->viewLink()','type'=>'raw'),
			array('name'=>'Patient', 'value'=>'$data->patient->viewLinkWithHN()','type'=>'raw'),
			array('name'=>'Delivery','value'=>'$data->customer->viewBillsLink()','type'=>'raw')
		)
	));
?>
</div>



