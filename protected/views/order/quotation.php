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
table th{background:#D2D2D2;}
	.rr{text-align: right;}
	.cc{text-align: center;width:25%;}
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


<div >
 
      	   <table width="100%" border="1" style="border:0px solid;mmargin:20px">
			<tr><td rowspan="6" valign="top"><img src="<?php echo $order->customer->logo_url; ?>"></td>
            <tr>
				<td class="rr" width="140px">Patient name :</td><td class="cc"><?php echo $order->patient->name; ?><hr /></td>
				<td class="rr">Order Date :</td><td class="cc"> <?php echo date('d/m/y',strtotime( $order->request_received ));?><hr />
			</tr>
            <tr>
				<td class="rr" >Doctor name :</td><td class="cc"><?php echo $order->getClinician()->full_name; ?><hr /></td>
				<td class="rr">Supplement Days :</td><td class="cc"><?php echo $order->days;?><hr /></td>
			</tr>
			<tr><td class="rr">HN :</td><td class="cc"><?php echo $order->patient->hn; ?><hr /></td>
				<td class="rr">Delivery Days :</td><td class="cc"><?php echo date('d/m/y',strtotime( $order->delivery_date ));?><hr /></td>
			</tr>
			<tr style="height:50px">
				<td colspan="1" class="cc">Additional Information</th><td colspan="3"><?php echo $order->remarks; ?>&nbsp;<hr /></td>
			</tr>
				
			<?php 
				if(Yii::app()->request->getQuery('show_price')!='false'):
			?>	
			<tr style="height:30px" valign="bottom">
		
				<?php //if(User::authorize('manage')): ?>	<td class="rr">
				Amount :</td><td class="cc"> <?php echo number_format($order->getFinalTotalAmount(),2); ?><hr />	</td>
				<?//else:?>
				<td>&nbsp;</td><td>&nbsp;</td>
				<?//endif?>	
		
			<td class="rr" style="border:0px solid">Authorized Signature :</td><td style="width:150px">&nbsp;<hr /></td>
			</tr>
			
			<?endif?>	
		
		   </table>
		  <table>
          <br/><br/>
<hr/>
 

<table  width="90%" border="1" style="margin:20px">
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

<div  style="background:#D2D2D2;border:1px solid;width:90%;display:block;text-align:center;margin-left:20px"><b>Sachet Info</b></div>
<div style="margin-left:20px;padding:10px">
<textarea style="width:100%;height:90px">
<?php echo $order->remarks2; ?>
</textarea>

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
	
<pre style="font-size:0.7em;height:70px;overflow:auto"><?php //echo $order->remarks2; ?></pre>
<hr/>
</div>
</div>
 </div>



