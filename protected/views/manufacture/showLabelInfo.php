<html>
<body style="padding:30px">
	<h1>Label Information</h1>
	
<div id="name" style="border:0px solid;width:500px">
<textarea cols="70" rows="12">Patient: <?php echo $order->patient->name;?>									HN: <?php echo $order->patient->hn;?>

Doctor: <?php echo $order->getClinician()->full_name;?>									Date: <?php echo '<<ConfirmDate>>';?>
	
Instruction: รับประทานพร้อมอาหารเช้าและเย็น
		ซองเช้า 4 แคปซูล/ซอง จำนวน 30 ซอง
		ซองเช้า 3 แคปซูล/ซอง จำนวน 30 ซอง

ระหว่างรับประทานยาปัสสาวะจะมีสีและกลิ่น
กรุณาเก็บไว้ในตู้เย็น ห้ามแช่แข็ง				Expiry Date: <?php echo '<<ExpiryDate>>';?>
</textarea>
<textarea cols="70" rows="12">
<?php 
   $c=0;
  foreach($order->items as $i ):
  echo ''.$i->product->display_name."\n";
  $c+=1;
  // if($c%3==0&&$c!=0)echo "\n\n";
  endforeach;
?>
</textarea>
</div>	
	
<hr/>	
</body>
</html>