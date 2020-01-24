<?php
 header('Content-type: text/plain');
header('Content-Disposition: attachment; filename="confirmation.txt"');
?>
order=<?php echo $order->uuid."\n"; ?>
patient_name=<?php echo $order->patient->name."\n"; ?>
hn=<?php echo $order->patient->hn."\n"; ?>
date=<?php echo date('d/m/y',strtotime( $order->request_received ))."\n";?>
doctor_name=<?php echo $order->getClinician()->full_name."\n"; ?>
supplement_days=<?php echo $order->days."\n";?>
delivery_date=<?php echo date('d/m/y',strtotime( $order->delivery_date ))."\n";?>
additional_info=<?php echo $order->remarks."\n"; ?>
<?php if(User::authorize('manage')): ?>
amount=<?php echo number_format($order->getFinalTotalAmount(),2)."\n"; ?>
<? endif ?>
#COMPOUNDED & DISPENSE
<?php	  
$items = $order->items;
count($items);
$n = 1;
foreach( $items as $item ) {
if( $item->order_per_day>0){
	
		$s = explode('/',$item->product->unit->display_name);
			if(count($s)>1){
				$s = $s[1];
			}else{
				$s = $s[0];
			}
?>
<?php echo trim($item->product->display_name); ?>=<?php echo $item->order_per_day;?> <?php echo $s;?> : <?php echo $item->consume_time."\n"; ?>
<?php } } ?>
#INSTRUCTION
<?php echo $order->remarks2; ?>
