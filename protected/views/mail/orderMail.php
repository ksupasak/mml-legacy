<style type="text/css" media="screen">
	form label{
		width:100px;
		display:inline-block;
	}
</style>

<form action="<?php echo $this->createUrl('mail/OrderMail',array('orderId'=>$order->id));?>" method="POST">
	<input type="hidden" name="orderId" value="<?php echo $order->id;?>" />
	
<h1>Send Mail</h1>
<p style="color:#0d0"><?php if($_POST['Mail']){echo "Your message has already sent..";}?></p>
<p>
	<label>From :</label> <input type="text" name="Mail[from]" size="50" value="noreply@maxmaxlife.com"/>
</p>
<p>
	<label>To :</label> <input type="text" name="Mail[to]" size="50"  value="<?php echo $order->clinician->email_to; ?>"/>
</p>
<p>
	<label>CC :</label> <input type="text" name="Mail[cc]" size="50"  value="<?php echo $order->clinician->cc_to; ?>"/>
</p>
<p>
	<label>BCC :</label> <input type="text" name="Mail[bcc]" size="50"  value="<?php echo $order->clinician->bcc_to; ?>"/>
</p>
<p>
	<label>Subject :</label>  <input type="text" size="50" name="Mail[subject]" value="[MML] Order Confirmation for HN:<?echo $order->patient->hn;?>" />
</p>
<p>
	<label>Messages :</label>
	
	<textarea name="Mail[body]" cols="80" rows="20" style="vertical-align:text-top"><?php 
	
	echo "\n";
	echo "------- ORDER INFORMATION ------- \n";
	echo "\n";
	echo 'ORDER/REQUEST ID : '.$order->uuid."\n";
	echo 'REQUEST DATE : '.$order->request_received."\n";
	echo 'CUSTOMER : '.$order->customer->account_name."\n";
	echo 'CLINICIAN : '.$order->clinician->full_name."\n";
	echo 'PATIENT : '.$order->patient->name."\n";
	echo "\n";
	echo 'TOTAL AMOUNT : '.$order->getFinalTotalAmount()." บาท\n";
	echo "\n";
	echo 'SUPPLEMENT DAYS : '.$order->days." วัน\n";
	echo 'DELIVERY DATE : '.$order->delivery_date."\n";
	echo "\n";
	echo "------- ORDER DETAIL ------- \n\n";
	
	  foreach($order->items as $i):
	  echo $i->product->display_name."\t\t".$i->order_per_day.' '.$i->product->unit->display_name."\n";
	  endforeach;
	echo "\n";
	echo '*unit per day';
	?>
	
</textarea>
</p>
<p><label>&nbsp;</label>
<input type="submit" name="mysubmit" value="Send" />
</p>
<br/>
</form>

