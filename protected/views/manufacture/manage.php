<?php
$this->pageTitle=Yii::app()->name . ' - Manufacture Home';
$this->breadcrumbs=array(
	'Manufacture Home');
?>

<h1 >Manage Orders (manufacture) </h1>

<?php 
	$this->renderPartial('_barcode');
?>
<div class="clear">
	
</div>
<div id="new-queue">
<h3>New Processing Order</h3>
<!--<p>Status = PROCESSING and order_station</p>-->
<?php 
	$this->widget('zii.widgets.grid.CGridView', array(
		'dataProvider'=>$newOrders,
		'columns'=>array(
			array('name'=>'Updated', 'value'=>'$data->lastUpdated()'),
			array('name'=>'Order ID', 'value'=>'$data->uuid'),
			array('name'=>'Customer', 'value'=>'$data->customer->viewLink()','type'=>'raw'),
			array('name'=>'Patient', 'value'=>'$data->patient->viewLinkWithHN()','type'=>'raw'),
			array('name'=>'Track','value'=>'$data->displayTrackingAction()','type'=>'raw')
		)
	));
?>
</div>

<div id="process-queue">
<h3>Current Processing</h3>
<?php 
	$this->widget('zii.widgets.grid.CGridView', array(
		'dataProvider'=>$currentOrders,
		'columns'=>array(
			array('name'=>'Updated', 'value'=>'$data->lastUpdated()'),
			array('name'=>'Order ID', 'value'=>'$data->uuid'),
			array('name'=>'Customer', 'value'=>'$data->customer->viewLink()','type'=>'raw'),
			array('name'=>'Patient', 'value'=>'$data->patient->viewLinkWithHN()','type'=>'raw'),
			array('name'=>'Track','value'=>'$data->displayTrackingAction()','type'=>'raw')
		)
	));
?>

</div>
<div id="process-queue">
<h3>Complete Processing</h3>
<?php 
	$this->widget('zii.widgets.grid.CGridView', array(
		'dataProvider'=>$completeOrders,
		'columns'=>array(
			array('name'=>'Updated', 'value'=>'$data->lastUpdated()'),
			array('name'=>'Order ID', 'value'=>'$data->uuid'),
			array('name'=>'Customer', 'value'=>'$data->customer->viewLink()','type'=>'raw'),
			array('name'=>'Patient', 'value'=>'$data->patient->viewLinkWithHN()','type'=>'raw'),
			array('name'=>'Track','value'=>'$data->displayTrackingAction()','type'=>'raw')
		)
	));
?>
</div>
<?php /*
<h1 class="grid_6 alpha">Current Manufacturing Queue</h1>
<div class="grid_4 omega">
	<?php $this->renderPartial('_filter'); ?>
</div>
<div id="order-list" class="grid_12">
	<?php $this->renderPartial('_orderList', array('orders'=>$orders)); ?>
</div>

*/ 

?>
<script>
<!--

/*
Auto Refresh Page with Time script
By JavaScript Kit (javascriptkit.com)
Over 200+ free scripts here!
*/

//enter refresh time in "minutes:seconds" Minutes should range from 0 to inifinity. Seconds should range from 0 to 59
var limit="0:10"

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
setTimeout("beginrefresh()",1000)
}
}

window.onload=beginrefresh
//-->
</script>