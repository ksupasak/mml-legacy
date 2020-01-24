<h1>Receipt (Order#<?php echo $order->uuid; ?>)</h1>
<?php 
/* 
 * URL maps to/mml/order/PrintInvoice?orderId=91 
 */

echo $order->id;
echo $order->customer->clinician->full_name;
echo $order->patient->name;
echo $order->days;
echo $order->customer->hospital->name;
echo $order->customer->billing_address;
$items = $order->items;
echo count($items);
foreach( $items as $item ) {
	echo "<li>";
	echo $item->product->display_name;
	echo $item->order_per_day;
	echo $item->price;
	echo "</li>";
}

?>