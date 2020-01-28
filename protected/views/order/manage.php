<h1>Manage Orders</h1>

<div style="float:left;">
	
	<?php if(User::authorize('manage')):?>
	<a href="Query" id="query-order">Query Order </a>
	
	<a href="SelectCustomer" type="submit" id="new-order">New Order</a>
	<?php endif;?>
	
	
</div>
<?php 
	$this->renderPartial('_barcode');
	
	
	$columns =  array(
		array('name'=>'Updated', 'value'=>'$data->latestStatus()', 'type'=>'raw'),
		array('name'=>'Order ID','value'=>'$data->updateLink()', 'type'=>'raw'),
		array('name'=>'Customer', 'value'=>'$data->customer->viewLink()','type'=>'raw'),
		array('name'=>'Clinician', 'value'=>'$data->clinician->full_name','type'=>'raw'),
		array('name'=>'Patient', 'value'=>'isset($data->patient)?$data->patient->viewLink():"-";','type'=>'raw'),
		array('name'=>'Price',		'value'=>'number_format($data->amount_total,2)'),
		array('name'=>'Requested',	'value'=>'date("d/m/y / H:i",strtotime($data->request_received))', 'type'=>'raw')
		
	);
	
	
?>

<div class="clear">
	
</div>


<script>
YUI().use('yui2-button', function (Y) {
		var YAHOO = Y.YUI2;
		var button = new YAHOO.widget.Button("query-order");
		var button = new YAHOO.widget.Button("new-order");
		

})
</script>
<?php
$this->pageTitle=Yii::app()->name . ' - Auto Updates';
$this->breadcrumbs=array('Manage Orders'=>array('order/ManageOrders'), 'Auto Updates');
?>

<style type="text/css" media="screen">
	#payment-list h3{
		display:inline;
	}
</style>

<div id="payment-list"  >
<?php $this->widget('zii.widgets.grid.CGridView', array(
			'dataProvider'=>	$order->statusUpdated(Status::REQUEST, false, 30),
			'template' => '<h3>New Request Orders.</h3> {pager}  {items}  {summary}',
			'columns' => $columns
		)); ?>
</div>

<div id="payment-list" >
<?php $this->widget('zii.widgets.grid.CGridView', array(
			'dataProvider'=>	$order->statusUpdated(Status::PENDING),
			'template' => '	<h3>Recently Pending Orders</h3>
			{pager} {items} {summary}',
			'columns' => $columns
		)); ?>
</div>

<div id="payment-list">
<?php $this->widget('zii.widgets.grid.CGridView', array(
			'dataProvider'=>	$order->statusUpdated(Status::CONFIRMED),
			'template' => '	<h3>New Confirmed Orders</h3>
			{pager}{items}  {summary}',
			'columns' => $columns
		)); ?>
</div>

<div id="payment-list"  >
<?php $this->widget('zii.widgets.grid.CGridView', array(
			'dataProvider'=>	$order->statusUpdated(Status::PROCESSING),
			'template' => '	<h3>Recently Processing Orders</h3>
			{pager} {items}  {summary}',
			'columns' => $columns
		)); ?>
</div>

<div id="payment-list"  >
<?php $this->widget('zii.widgets.grid.CGridView', array(
			'dataProvider'=>	$order->statusUpdated(Status::COMPLETE, false, 100),
			'template' => '	<h3>Complete Processing Orders.</h3>
			{pager} {items}  {summary}',
			'columns' => $columns
		)); ?>
</div>
<script>
<!--

/*
Auto Refresh Page with Time script
By JavaScript Kit (javascriptkit.com)
Over 200+ free scripts here!
*/

//enter refresh time in "minutes:seconds" Minutes should range from 0 to inifinity. Seconds should range from 0 to 59
var limit="60:00"

if (document.images){
var parselimit=limit.split(":")
parselimit=parselimit[0]*60+parselimit[1]*1
}
function beginrefresh(){
if (!document.images)
return
if (parselimit==1)
window.location.reload()
else{ 
parselimit-=1
curmin=Math.floor(parselimit/60)
cursec=parselimit%60
if (curmin!=0)
curtime=curmin+" minutes and "+cursec+" seconds left until page refresh!"
else
curtime=cursec+" seconds left until page refresh!"
window.status=curtime
setTimeout("beginrefresh()",10000)
}
}

window.onload=beginrefresh
//-->
</script>
