<div style="font-size:1.3em;margin-left:auto;margin-right:auto">
<div id="name" style="border:0px solid;width:480px;font-size:0.8em;line-height:1.4em;">
<div style="font-size:0.8em;padding-left:20px;padding-right:10px; ">
<span>Patient : <?php echo $order->patient->name;?></span>
<span style="float:right;width:120px">HN: <?php echo $order->patient->hn;?></span>
<div class="clear"></div>
<span>Doctor : <?php 
	if(isset($_GET['lang'])){ 
		echo $order->getClinician()->full_name_en;}
else{
		echo $order->getClinician()->full_name; 
}
?></span>
<span style="float:right;width:120px">Date: <?php echo date('d F Y',$d);?></span>
<div class="clear"></div>
<span>Instructions :</span>&nbsp;
<input type="text" style="border:0px;vertical-align:text-bottom;width:300px;font-size:1em" value="
<?php 
if(isset($_GET['lang'])){ 
	echo 'Taken with breakfast and dinner daily';
}else{
	echo 'รับประทานพร้อมอาหารเช้าและเย็น';
}
?>">
</div>
<hr style="margin-bottom:0px"/>

<div id="name" style="border:0px solid;width:480px;font-size:0.9em;height:185px; line-height:1.4em">
<center style="margin-bottom:10px"><b>Supplement Facts: Amount per Daily Dose. <?php echo $title; ?></b></center>
<?php 
  
  $c=0;
  // $k= count($order->items)/$n;
  $n = ceil(count($items)/15);
  $s = 460/$n;
  $s = 147;
  $padding = (3-$n)*50;

  // if($n==1)$padding+=60;
?>
<div style="margin-left:15px;font-size:0.6em;line-height:1.1em;border:0px solid  ">
<?php
  echo '<div style="margin-left:'.$padding.'px;float:left;width:'.$s.'px;border:0px solid;overflow:hidden;display:block;margin-right:5px">';
  foreach($items as $i):
 
  $x =  ConsumeTime::fromJson($i->consume_time);
  
  $name = $i->product->display_name;
  
  if(isset($i->product->label)&&$i->product->label!=""){
	$name = $i->product->label; 
  }
		$sa = explode('/',$i->product->unit->display_name);
		if(count($sa)>1){
			$sa = $sa[1].'(s)';
		}else{
			$sa = $sa[0];
		}

  echo '<span style="height:1.2em;border:0px solid;width:105px;overflow:hidden;display:inline-block;font-size:7px">'.$name."</span><span style='float:right;font-size:7px;border:0px solid'>".number_format($i->order_per_day, 0, '.', ',')." ".$sa."&nbsp;</span><br/>";
  echo '</div><div style="margin-left:'.$padding.'px;float:left;width:'.$s.'px;border:0px solid;overflow:hidden;display:block;margin-right:5px;margin-bottom:2px">';
  $c+=1;
  endforeach;
  echo '</div>';
?>
<div class='clear'></div>
</div>
</div>

<center>
<textarea style="width:300px;border:0px;height:30px;vertical-align:text-top;font-size:0.6em;margin:0px; ">
<?php echo $order->remarks2; ?></textarea>
</center>
<hr style="margin-top:10px"/>
<table border="0" cellspacing="5" cellpadding="5" width="100%" style="font-size:0.8em; line-height:1em; margin-top:-5px">
	<tr><td><center>
		<?php 
		if(isset($_GET['lang'])){ 
			echo 'This supplement may cause urine discoloration<br/>Store at temperature below 30C,<br/>protect form sun light and moisture.';
		}else{
			echo 'ระหว่างรับประทานยา ปัสสาวะจะมีสีและกลิ่น<br/>เก็บในอุณหภูมิต่ำกว่า 30 C<br/> ไม่ให้โดนแสงแดดและความชื้น';
		}
		?>		
	
	</center></td>
	<td><span style="float:right;font-size:1.0em;">Expiry Date: <?php echo date('d F Y',mktime(0, 0, 0, date("m",$d),   date("d",$d),   date("Y",$d)+1));?></span></td></tr>
</table>
</div>
</div>