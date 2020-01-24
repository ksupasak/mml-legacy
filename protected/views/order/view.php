<?php
$model = Order::model()->findByPk($order_id);
?>

<h1>Order</h1>
<?php echo $order_id; ?>
<?php echo $model->scenario; ?>
<p>
<img src="<?php echo Yii::app()->request->baseUrl;?>/test/view?barcode=<?php echo $model->uuid ?>">
</p>

ID: <span> // order->uuid </span>
<div>STATUS</div>
<div>ACTION: 
	<button>Update Order</button>
	<button>Approve Order</button>
</div>
<div>
	Doctor: , Patients
</div>
<h3>Order Summary</h3>
<table>
<?php 
$model = Order::model()->findByPk($order_id);
foreach ($model->attributes as $k => $v) {
	echo sprintf("<tr><td>%s</td><td>%s</td></tr>",$k,$v);
}
?>
</table>
<h3>Items</h3>
<table>
<?php 
$items = $model->items;

foreach ($items as $k => $v) {
	echo sprintf("<tr><td>%s</td><td>%s</td></tr>",$k,get_class($v));
	echo sprintf("<tr>Item Info:<td></td><td>%s</td></tr>", implode($v->attributes,' : '));
}
?>
</table>