<?php
$this->pageTitle=Yii::app()->name . ' - My Orders';
$this->breadcrumbs=array(
	'Manage Orders'=>array('order/ManageOrders'), 
	'My Orders');
?>
<h1>Manage Orders</h1>

<div class="clear">
	
</div>
<script>
YUI().use('yui2-button', function (Y) {
		var YAHOO = Y.YUI2;
		var button = new YAHOO.widget.Button("new-order");

})
</script>

<div id="order-list-filter" class="Filter1">
<?php $filter = '' ;?>
<?php $this->renderPartial('_filter', array('order'=>$order));?>
</div>

<hr>


<?php   /* Order List*/   ?>
<?php 
	$criteria = $order->filter()->getCriteria();
	$total = $order->count($criteria);
	$pages=new CPagination($total);
	$pages->pageSize=10;
	$pages->applyLimit($criteria);
	$pages->pageVar = 'Order_page';
	$widget = $this->widget('CLinkPager', array('pages' => $pages));
	echo "total: ".$total;

?>



<div id="order-list" class="grid_12" >
<?php /* $this->renderPartial('_orderList', array('order'=>$order, 'orders'=>$orders)); */ ?>
</div>

<?php 
	$this->widget('zii.widgets.grid.CGridView', array(
		'dataProvider'=>$order->filter(),
		'columns'=>array(
			array('name'=>'Updated',	'value'=>'date("d/m/y / H:i",strtotime($data->lastUpdated()))'),
			array('name'=>'Status',     'value'=>'$data->status->renderIcon()',	'type'=>'raw'),
			array('name'=>'Order ID',	'value'=>'$data->updateLink()', 		'type'=>'raw'),
			array('name'=>'Clinician',	'value'=>'$data->clinicianInfo()',		'type'=>'raw'),
			
			array('name'=>'Price',		'value'=>'number_format($data->amount_total,2)'),
			array('name'=>'Requested',	'value'=>'date("d/m/y / H:i",strtotime($data->request_received))', 'type'=>'raw'),
			array('name'=>'Actions',	'value'=>'$data->printQuotationLink()',	'type'=>'raw')
		)
	)); ?>