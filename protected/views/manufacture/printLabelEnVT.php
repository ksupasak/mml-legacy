<!--//////////////////////////////////////////////-->




<?php

$d = date_parse($order->confirm_date);
$d = mktime(0,0,0,$d['month'],$d['day'],$d['year']);


?>
<?php

    $lunch = false;
	$bedtime = false;
 	
?>
<div style="font-size:1.3em;margin-left:auto;margin-right:auto">
<div id="name" style="border:0px solid;width:480px;font-size:0.8em;line-height:1.4em;">
<div style="font-size:0.8em;padding-left:20px;padding-right:10px; ">
<span>Patient : <?php echo $order->patient->name;?></span>
<span style="float:right;width:120px">HN: <?php echo $order->patient->hn;?></span>
<div class="clear"></div>
<span>Doctor : <?php echo $order->getClinician()->full_name_en;?></span>
<span style="float:right;width:120px">Date: <?php echo date('d F Y',$d);?></span>
<div class="clear"></div>
<span>Instructions :</span>&nbsp;
Taken with breakfast and dinner daily
</div>

<hr style="margin-bottom:0px"/>

<div id="name" style="border:0px solid;width:480px;font-size:0.9em;height:165px; line-height:1.4em">
<center><b>Supplement Facts: Amount per Daily Dose.</b></center>	


<?php 
  
  $c=0;
  // $k= count($order->items)/$n;
  $n = ceil(count($order->items)/13);
  $s = 460/$n;
  $s = 152;
  $padding = (3-$n)*50;
  if($n==1)$padding+=50;
?>
<div style="margin-left:15px;font-size:0.6em;line-height:1.0em;  ">

<?php
 
  echo '<div style="margin-left:'.$padding.'px;float:left;width:'.$s.'px;border:0px solid;height:1.5em;overflow:hidden;display:block;margin-right:0px">';
  foreach($order->items as $i):
 
  $x =  ConsumeTime::fromJson($i->consume_time);
  if($x->has('morning_and_evening')||$x->has('morning')||$x->has('evening')){
  $name = $i->product->display_name;
  
  if(isset($i->product->label)&&$i->product->label!=""){
	$name = $i->product->label; 
  }
  echo ''.$name."<span style='float:right'>".$i->order_per_day." ".$i->product->unit->display_name."&nbsp;</span><br/>";
  echo '</div><div style="margin-left:'.$padding.'px;float:left;width:'.$s.'px;height:1.5em;border:0px solid;overflow:hidden;display:block;margin-right:0px">';
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
<div class="clear"></div>
<center>
<textarea style="width:300px;border:0px;height:50px;vertical-align:text-top;font-size:0.7em;margin:0px; ">
<?php echo $order->remarks2; ?></textarea>
</center>
<hr style="margin-top:10px"/>
<table border="0" cellspacing="5" cellpadding="5" width="100%" style="font-size:0.8em; line-height:1em; margin-top:-5px">
	<tr><td><center>This supplement may cause urine discoloration<br/>
	Refrigerate / Do not freeze</center></td>
	<td><span style="float:right;font-size:1.1em;">Expiry Date: <?php echo date('d F Y',mktime(0, 0, 0, date("m",$d),   date("d",$d),   date("Y",$d)+1));?></span></td></tr>
</table>


</div>

