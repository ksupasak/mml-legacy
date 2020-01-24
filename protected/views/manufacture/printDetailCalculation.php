<html>
<body style="padding:20px">
	<table style='width:400px;border:1px solid' >
		<tr>
			<th>Supplement</th><th>Order per day</th><th>Engine</th>
<?php

	$sum = 0.0;
	$delegation = array();

	if (count($order->items)){
		$sum = 0.0;
		foreach ($order->items as $item) {
			$value = $item->calculatePrice($order);
			
			echo "<tr><td>".$item->product->display_name."</td><td>".$item->order_per_day."</td><td>".$value."</td></tr>";
			// var_dump(''.$item->product->display_name.' : '.$item->order_per_day.' = '.$value.'<br/>');
			if($value>=0){
				$sum += $value; //make sure days is up-to-date by using current instance of Order
			}else{
				// register delegation
				if(!isset($delegation[$value%10])){
					$delegation[$value%10]=array();
				}
				$delegation[$value%10][]=$item->order_per_day;
				
			}
		}
		
		// var_dump($delegation);
			if(isset($delegation[0])){
			$v = 0;
			foreach ($delegation[0] as $i) {
			    $v+= intval($i);
			}
			if($v<=500){
			$v = 6;
			}
			else if($v<=1000){
			$v = 10;
			}
			else if($v<=1500){
			$v = 13;
			}
			else if($v<=2000){
			$v = 16;
			}
			else if($v<=2500){
			$v = 19;
			}
			else{
			$v = 4+ceil($v/500)*3;
			}
			$sum+=$v;
			
			
			echo "<tr><td>Vitamin B group</td><td>-</td><td>".$v."</td></tr>";
			
			
			}
			
		}
		echo "</table>";
		
		$e130 = $sum;
		
		 // var_dump('sum = '.$sum);
		
		$e131 = 16.0;
		$d = 31;
		$e132 = floatval($order->discount_factor);
		if($order->packaging==0){
			$e131=0;
			$d = 30;
		}
		$monthly = 0;
		
		if($e132==1.0){
			$monthly = 0;
		}else{
			$monthly = ($d*(1-$e132)*($e130+$e131));
			if($monthly<1200&&$order->packaging!=0){
				$monthly=1200;
			}
		}
		
		if($order->marketing_charge=='y'){
			$monthly*=1.15;
		}
		
		
		// =(IF(E132=100,
		// 	0,	--> free
		// 	IF((31*(1-(E132/100))*(E130+E131))<1200,
		// 		1200,
		// 		(31*(1-(E132/100))*(E130+E131)))))*(IF(E133="y",1.15,1))
		echo "<p>Monthly Price : ".$monthly."</p>";
		
		$order->amount = $monthly*( $order->days / 30 );
		echo "<p>Sub Total : ".$order->amount."</p>";
		
		$order->amount_total = 	ceil($order->amount * 1.07 +  ($order->additional_charge));
		echo "<p>Total : ".$order->amount_total."</p>";
		
		$order->monthly_price = $order->amount_total / ( $order->days / 30 );
		$order->daily_price = $order->amount_total / $order->days;
		
	
?>
</body>
</html>
