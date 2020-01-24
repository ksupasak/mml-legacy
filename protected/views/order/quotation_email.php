<style  type="text/css" media="print">
table{

border:0px solid;
  border-collapse:separate;
    border-style:none;
}
table th{ border:1px solid;
	background:#D2D2D2;
}
	table td{border:0px solid;}
	hr {
		margin:0px;
	padding:0px;

	border-top:0px;
	border-left:0px;
	border-right:0px;
	line-height:0px;
	height:1px;
	display:block;
	}
		.rr{text-align: right;}
	.cc{text-align: center;}
	
</style>

<style type="text/css" media="screen,print">
table{border:0px solid;border-collapse:collapse;}
table td{
	border: 0px solid black;
	padding: 1px;
	height:20px;
	
	}
table th{background:#D2D2D2;padding:5px;}
	.rr{text-align: right;}
	.cc{text-align: center;}
	.cr{border:1px solid #ccc;text-align:center;}
		hr {
		margin:0px;
	padding:0px;

	border-top:0px;
	border-left:0px;
	border-right:0px;
	line-height:0px;
	height:1px;
	display:block;
	}
</style>
<div style=" font-family: Arial, Helvetica, sans-serif;font-size:14px">
Dear <?php echo $order->customer->account_name; ?> Team,
<br/><br/>
Thank you for your inquiry. <br/> <br/>
We would like to inform the customized supplement info as follow:
 <br/> <br/>
	
	
<h3> Order Summary </h3>
<hr/>
<br/>
<table  border="1" style="border:0px solid;width:500px">
<tr>
	<th class="rr">Order ID :</th><td class="cc"> <?php echo $order->uuid ;?></td>
	<th class="rr">Order Date :</th><td class="cc"> <?php echo date('d/m/y',strtotime( $order->request_received ));?></td>
</tr>

<?php
	
	$lname = 'Patient name';
	if($order->patient->hn==''):
	$lname = 'Formula name';
	endif

?>	
	
		<th class="rr" ><?php echo $lname;?> :</td><td class="cc"><?php echo $order->patient->name; ?></td>
			<?php if($order->patient->hn!=''): ?>
			<th class="rr">HN :</th><td class="cc"><?php echo $order->patient->hn; ?></td>
			<?endif?>
	</tr>
 <tr>
		<th class="rr" >Doctor name :</td><td class="cc"><?php echo $order->getClinician()->full_name; ?></td>
		<th class="rr">Supplement Days :</td><td class="cc"><?php echo $order->days;?></td>
	</tr>
	<tr>

	<th class="rr">Delivery Days :</th><td class="cc">3 days after confirmation<?php #echo date('d/m/y',strtotime( $order->delivery_date ));?></td>
	</tr>
	<tr >
		<th colspan="1" class="rr" >Additional Information :</th><td colspan="3" class="cc"><?php echo $order->remarks; ?></td>
	</tr>
			<!--
	<tr style="height:30px" valign="bottom">

	<?php if(User::authorize('manage')): ?>	<td class="rr">
		Amount :</td><td class="cc"> <?php echo number_format($order->getFinalTotalAmount(),2); ?><hr />	</td>
		<?else:?>
		<td>&nbsp;</td><td>&nbsp;</td>
		<?endif?>

		<td class="rr" style="border:0px solid">Authorized Signature :</td><td style="width:150px">&nbsp;<hr /></td>
	</tr>-->
	<tr><th class="rr" valign="top">Sachet Info : </th>
		<td colspan="3">
		<div style="width:500px;white-space: pre;font-size:0.8em"><?php echo trim($order->remarks2); ?>
		</div>
		</td>
	</tr>
</table>
<br/><br/>
<h3> Price Summary </h3>
<hr/>
<br/>
	<div class="setbackground">

	<?php
	
		$list = array();
	    $dis = array(0,0,0,0,0,0,0,0,0,0,0) ;
		if(isset($order->customer->discount)&&$order->customer->discount!='')$dis = explode(',',$order->customer->discount);
		
		for ($i = 1; $i <= 6; $i++) {
				$days = 30*$i;
				$discount = floatval($dis[$i-1])/100;
				$amount = $order->calculatetotalAmount($days,$discount);
				$total_amount = sprintf('%.2f',ceil($amount * 1.07 +  ($order->additional_charge)));
				$monthly = sprintf('%.2f',$total_amount / ( $days / 30 ));
				$daily = sprintf('%.2f',$total_amount / $days);
		    $list[$i] = array(0=>$days,1=>$discount,2=>$total_amount,3=>$monthly,4=>$daily);
		}
	
		
	
	?>
	
	
	
	
	<table border="1"  style="margin:0px;width:500px;font-family: Arial, Helvetica, sans-serif;font-size:14px">
		<tr ><th>Order</th>
		<?php 	for ($i = 1; $i <= 6; $i++){ ?>	
			<th align="center"><?php echo $list[$i][0]; ?> Days</th>
		<?php }?>
		</tr>
		<!--<tr><th>Discount</th>
		
				<?php 	for ($i = 1; $i <= 6; $i++){ ?>	
					<td><?php echo $list[$i][1]*100; ?>%</td>
				<?php }?>
		</tr>-->
		<tr><th>Total</th>
				<?php 	for ($i = 1; $i <= 6; $i++){ ?>	
					<td class="rr"><?php echo $list[$i][2]; ?></td>
				<?php }?>
		</tr>
		<tr><th>Monthly AVG</th>
				<?php 	for ($i = 1; $i <= 6; $i++){ ?>	
					<td  class="rr"><?php echo $list[$i][3]; ?></td>
				<?php }?>
		</tr>
		<tr><th>Daily AVG</th>
				<?php 	for ($i = 1; $i <= 6; $i++){ ?>	
					<td  class="rr"><?php echo $list[$i][4]; ?></td>
				<?php }?>
		</tr>
	</table>	

	
	
	</div>




<div>
 
	
 	<br/>
	<h3> Prescription Summary </h3>
	<hr/><br/>

<table  border="1" style="margin:0px;width:500px">
 <tr><th>Compounded</th><th>Order / Day</th><th>Morning/Evening</th><th>Morning</th><th>Midday</th><th>Evening</th><th>Bedtime</th><th>Note</th></tr>
       	<?php	  $items = $order->items;
count($items);
$n = 1;
foreach( $items as $item ) {
if( $item->order_per_day>0){
	?>
		  <tr>
		  <td class="item-name" style="padding-left:10px"> <?php echo $item->product->display_name; ?></td>
		 <?php if(!$item->product->isDispensed()): ?>
          <td class="rr" style="padding-right:10px"> <?php echo $item->order_per_day; ?> <?php echo $item->product->unit->display_name; ?></td>
		 <?php else: ?>
	      <td class="rr" style="padding-right:10px"> <?php echo $item->order_per_day*floatval($item->product->recommended_dosage); ?> <?php echo $item->product->unit->display_name;?>
		</td>
		 <?php endif;?>    
		
		<?php
		
		$times=0;
		
		foreach(json_decode($item->consume_time) as $t){
		
		switch($t){
			case 'morning_and_evening':$times+=1;break;
			case 'morning':$times+=2;break;
			case 'lunch':$times+=4;break;
			case 'evening':$times+=8;break;
			case 'bedtime':$times+=16;break;
			default:
		}
		
		}

		?> 
		<td class="cr"><?php if($times&1)echo '*';?></td>
		<td class="cr"><?php if($times&2)echo '*';?></td>
		<td class="cr"><?php if($times&4)echo '*';?></td>
		<td class="cr"><?php if($times&8)echo '*';?></td>
		<td class="cr"><?php if($times&16)echo '*';?></td>
		<td class="cr" style="width:100px">&nbsp;</td>
		  </tr>
<?php } }?>
</table>


<?php
// 
// $result = $order->calculateManufacture();
// $consume = $result['consume'];
// 
// echo 'Morning : '.$consume[0].'<br/>';
// echo 'Midday : '.$consume[1].'<br/>';
// echo 'Evening : '.$consume[2].'<br/>';
// echo 'Bedtime : '.$consume[3].'<br/>';

?>
<br/>
<h3>Quotation Detail</h3>
<hr/>
<p>
<ul>
	<li><a target="_blank" href="PrintQuotation?orderId=<?php echo $order->id; ?>">Quotation with price</a></li>
	<li><a target="_blank" href="PrintQuotation?orderId=<?php echo $order->id; ?>&amp;show_price=false">Quotation without price</a></li>
	
</ul>
</p>
<br/>
Your kind confirmation will be highly appreciated. <br/>
<br/>

Best Regards,<br/>
Max MaxLife Service <br/> 
08-8451-5554<br/>

</div>
 </div>


</div>


