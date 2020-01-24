
<?php

$d = date_parse($order->confirm_date);
$d = mktime(0,0,0,$d['month'],$d['day'],$d['year']);


?><div style="font-size:1.2em;margin-left:auto;margin-right:auto">
<div id="name" style="border:0px solid;width:480px">
<span>Patient : <?php echo $order->patient->name;?></span>
<span style="float:right">HN: <?php echo $order->patient->hn;?></span>
<div class="clear"></div>
<span>Doctor : <?php echo $order->getClinician()->full_name_en;?></span>
<span style="float:right">Date: <?php echo date('d-m-Y',$d);?></span>
<div class="clear"></div>
<span>Instructions :</span>&nbsp;<textarea style="width:370px;border:0px;height:60px;vertical-align:text-top;font-size:0.9em">
Taken with breakfast and dinner daily
<?php echo $order->remarks2; ?>
</textarea>
<!--
<span>Patient : รับประทานพร้อมอาหารเช้าและเย็น </span><br/>
<span style="padding-left:50px">ซองเช้า : 4 แคปซูล/ซอง จำนวน 30 ซอง </span><br/>
<span style="padding-left:50px">ซองเย็น : 3 แคปซูล/ซอง จำนวน 30 ซอง </span>
-->
<div class="clear"></div>
<hr/>
This supplement may cause urine discoloration<br/>
Store at temperature below 30C,<br/>
protect form sun light and moisture.
<span style="float:right">Expiry Date: <?php echo date('d-m-Y',mktime(0, 0, 0, date("m",$d),   date("d",$d),   date("Y",$d)+1));?></span>

</div>

<?php

    $lunch = false;
	$bedtime = false;
 	
?>	
<DIV style="page-break-after:always"></DIV>
<div id="name" style="border:0px solid;width:480px;font-size:0.8em;">
<center><b>Supplement Facts: Amount per Daily Dose.</b></center>
<hr/>
<div style="margin-left:10px;font-size:0.8em">

<?php 
  
  $c=0;
  // $k= count($order->items)/$n;
  $n = ceil(count($order->items)/13);
  $s = 460/$n;

 
  echo '<div style="float:left;width:'.$s.'px;border:0px solid;height:1.5em;overflow:hidden;display:block">';
  foreach($order->items as $i):
 
  $x =  ConsumeTime::fromJson($i->consume_time);
  if($x->has('morning_and_evening')||$x->has('morning')||$x->has('evening')){
  $name = $i->product->display_name;
  
  if(isset($i->product->label)&&$i->product->label!=""){
	$name = $i->product->label; 
  }
  echo ''.$name."<br/>";
  echo '</div><div style="float:left;width:'.$s.'px;height:1.5em;border:0px solid;overflow:hidden;display:block">';
  $c+=1;
} else{
	if($x->has('lunch')){$lunch=true;}
	if($x->has('bedtime')){$bedtime=true;}
	
}
  endforeach;

  echo '</div>';
?>

</div>
</div>
<?php if($lunch){?>
<div class="clear">
</div>
<div style="page-break-after:always"></div>
<div id="name" style="border:0px solid;width:480px;font-size:0.8em;">
<center><b>Supplement Facts: Amount per Daily Dose.  (Lunch time)</b></center>
<hr/>
<div style="margin-left:10px;font-size:0.8em">
	
<?php 
  
  $c=0;
  // $k= count($order->items)/$n;
  $n = ceil(count($order->items)/13);
  $s = 460/$n;

 
  echo '<div style="float:left;width:'.$s.'px;border:0px solid;height:1.5em;overflow:hidden;display:block">';
  foreach($order->items as $i):
  $x =  ConsumeTime::fromJson($i->consume_time);
  if($x->has('lunch')){
  $name = $i->product->display_name;

  if(isset($i->product->label)&&$i->product->label!=""){
	$name = $i->product->label; 
  }
  echo ''.$name."<br/>";
  echo '</div><div style="float:left;width:'.$s.'px;height:1.5em;border:0px solid;overflow:hidden;display:block">';
  $c+=1;
	}
  endforeach;
  echo '</div>';
?>

</div>
</div>
<?php } 
?>
<?php if($bedtime){?>
<div class="clear">
</div>
<div style="page-break-after:always"></div>

<div id="name" style="border:0px solid;width:480px;font-size:0.8em;">
<center><b>Supplement Facts: Amount per Daily Dose.  (Bed time)</b></center>
<hr/>
<div style="margin-left:10px;font-size:0.8em">
	
<?php 
  
  $c=0;
  // $k= count($order->items)/$n;
  $n = ceil(count($order->items)/13);
  $s = 460/$n;

 
  echo '<div style="float:left;width:'.$s.'px;border:0px solid;height:1.5em;overflow:hidden;display:block">';
  foreach($order->items as $i):
  $x =  ConsumeTime::fromJson($i->consume_time);
  if($x->has('bedtime')){
  $name = $i->product->display_name;

  if(isset($i->product->label)&&$i->product->label!=""){
	$name = $i->product->label; 
  }
  echo ''.$name."<br/>";
  echo '</div><div style="float:left;width:'.$s.'px;height:1.5em;border:0px solid;overflow:hidden;display:block">';
  $c+=1;
	}
  endforeach;
  echo '</div>';
?>

</div>
</div>
<?php } 
?>