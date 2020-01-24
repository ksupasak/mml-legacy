
<style type="text/css" media="all">
    #morder{
	   border:1px solid ;
	    border-top:0px;
	border-right:0px;
	border-collapse:collapse;
	width:600px;
	font-size:0.8em;
	
     }
	#morder td{
		border:1px solid ;
		border-left:0px;
		border-bottom:0px;
		text-align:center;
		padding:3px;
	}
	#morder th{
		border:1px solid ;
		border-left:0px;
		border-bottom:0px;
		text-align:left;
		background:#e0dc36;
height:30px;
text-align:center;
	}
	     #morder1{
	   border:1px solid ;
	    border-top:0px;
	border-right:0px;
	border-collapse:collapse;
	width:300px;
	font-size:0.8em;
	
     }
	 	#morder1 th{
		border:1px solid ;
		border-left:0px;
		border-bottom:0px;
		text-align:left;
		background:#e0dc36;
height:30px;
text-align:center;
	}
	#morder1 td{
		border:1px solid ;
		border-left:0px;
		border-bottom:0px;
		text-align:left;
		padding:3px;
	}	
	

.printtable table{
background:#fff;

}
.printtable th{


}
.hline td {
background:#000000;
color:fff;
}

#odd{
background:#ccc;
}

</style>



	
<?php 
   $days = $order->days; 
   $table = array();
   $items =  $order->items;
   foreach($items as $i ):
     $table[$i->product->id]=$i;
   endforeach;
 
   $cost = 0 ;

/*
 echo '<div style="float:right; width:300px; margin-left: 30px;"> ';
  echo '';
  echo '<br />'.$order->customer->getClinician()->full_name;
  echo '<br />'.$order->delivery_date;
   echo '<br />';
     echo '<br />การจัดส่งสินค้า : ......................';
  echo '<br />สินค้าส่งคืน : ......................';
  echo '<br />วันที่ส่ง : .......................';
    echo '<br />ผู้ออกใบสั่งผลิต : ....................';
  echo '<br />สถานะการผลิต : ...............';
  echo '<br />รายละเอียด : .................';
 echo '</div>';

*/


   //echo '<div style="float:left;"><table id="morder" style=" padding:10px;">';

   $categories = Category::model()->findAll('name!=:name',array(':name'=>'Compound'));
   // $categories = $cs->children;
   $total =  array(0,0,0,0,0,0,0);
   $vtotal = array(0,0,0,0,0,0,0);
	//echo '<tr><th>No.</th><th>Product (Compounded)</th><th>Per day</th><th>Total</th><th>เช้า</th><th>กลางวัน</th><th>เย็น</th><th>ก่อนนอน</th></tr>';
	
   foreach($categories as $c):

// var_dump($c);

  // echo '<tr><td>&nbsp;</td><td colspan="" bgcolor="#DBEEFD"><strong>'.$c->name.'</strong></td><td colspan="6" bgcolor="#DBEEFD">&nbsp;</td></tr>';
   $products = Product::inCategory($c);
     $o=0;

		foreach($products as $p):
		$color='';
		if($o%2==1){
			$color='id="odd"';
		}
			
			if(isset($table[$p->id])&&$table[$p->id]->order_per_day>0){
						$i = $table[$p->id];
	//			echo '<tr '.$color.'><td>'.++$o.'</td><td colspan="1" style="text-align:left">'.$p->display_name.'</td><td>'.$i->order_per_day.' '.$p->unit->display_name.'</td>';
				
		
				
				if($i->order_per_day>0){
				
				$per_day = $i->order_per_day;
				
				
				
				if ($p->unit->gram_conversion_factor&&$p->category->name!='Dispensed') {
	                $conversion_factor = $p->unit->gram_conversion_factor;
	            } else {
	                $conversion_factor = 1;
	            }

				$adj=1;
				if($p->unit->display_name=='IU'){
					switch (trim($p->note)) {
					    case "vitamin_a":
					        $adj = 0.3;
					        break;
					    case "vitamin_d":
					        $adj = 0.025;
					        break;
					    case "vitamin_e":
					        $adj = 0.735*1000;
						    break;
						case "d_gamma":
						 	$adj = 1/0.15*1000;
					}
				}

	            $used = $per_day * $days / $conversion_factor/ $p->percent_active * $adj ;
				$cost += $used * $p->price_base; 
				
				
				
			
				// var_dump($i->consume_time);
				$times = ConsumeTime::fromJson($i->consume_time);
				// echo var_dump($times);
		
				if($times->has('morning_and_evening')){
					$sum = 2;
				}else{
					$sum = 0;
					if($times->hasNum(2))$sum+=1;
					if($times->hasNum(4))$sum+=1;
					if($times->hasNum(8))$sum+=1;
					if($times->hasNum(16))$sum+=1;	
				}
				
				$adj = 1.0;
				
				if($p->unit->display_name=='IU'){
					switch (trim($p->note)) {
					    case "vitamin_a":
					        $adj = 0.3;
					        break;
					    case "vitamin_d":
					        $adj = 0.025;
					        break;
					    case "vitamin_e":
					        $adj = 0.735*1000;
						    break;
						case "d_gamma":
						 	$adj = 1/0.15*1000;
					}
					// var_dump($p->display_name.$adj);
					
				}
				
				
				
				$sub = $per_day*$days/$p->percent_active/$p->unit->gram_conversion_factor*$adj;
				if($sum==0)$sum=1;
				$usub = 1.0/$sum;
			
				$v = $p->getVolume($sub); 
				
		//		echo '<td>'.$sub.' g</td>';
				$total[0]+=$sub; 
				$vtotal[0]+=$v;  
				if($times->hasNum(2)||$times->hasNum(1)){ 
		//			echo '<td>'.($sub *$usub).'</td>';
					$total[1]+=$sub * $usub;
					$vtotal[1]+=$v *$usub;
				}else{
		//			echo '<td>&nbsp;</td>';
				}
				if($times->hasNum(4)){ 
		//			echo '<td>'.$sub*$usub.'</td>';
						$total[2]+=$sub * $usub;
						$vtotal[2]+=$v *$usub;
				}	else{
		//				echo '<td>&nbsp;</td>';
					}
				if($times->hasNum(8)||$times->hasNum(1)){ 
		//			echo '<td>'.$sub *$usub.'</td>';
						$total[3]+=$sub * $usub;
						$vtotal[3]+=$v *$usub;
				}	else{
		//				echo '<td>&nbsp;</td>';
					}
				if($times->hasNum(16)){ 
		//			echo '<td>'.$sub *$usub.'</td>';
						$total[4]+=$sub * $usub;
						$vtotal[4]+=$v *$usub;
				}	else{
		//				echo '<td>&nbsp;</td>';
				}
					
				
				// var_dump($total);
				// echo '<td>'.$sum.'</td>';
				
				}
				// echo '<td>'.$p->display_name.'->'.$consume.'</td>';
				// echo '<td>'.$p->display_name.'->'.$consume.'</td>';
				// echo '<td>'.$p->display_name.'->'.$consume.'</td>';
				// echo '<td>'.$p->display_name.'->'.$consume.'</td>';
		//		echo '</tr>';
				
		    }	else{
				//	echo '<td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>';
				}
		//	echo '</tr>';
		endforeach;
   endforeach;
  // echo '</table>';
	$hasdispensed = false;
	
   $c = Category::model()->find('name=:name',array(':name'=>'Dispensed'));
   //echo '<br /><table id="morder" style=" padding:10px;"><tr><th>No.</th><th>Product ('.$c->name.')</th><th>&nbsp;</th><th>Total</th><th>เช้า</th><th>กลางวัน</th><th>เย็น</th><th>ก่อนนอน</th></tr>';
   $products = Product::inCategory($c);
$o=0;
   foreach($products as $p):
  
	
	if(isset($table[$p->id])){
		
		$i = $table[$p->id];
		
		if($i->order_per_day>0){
		$hasdispensed =true;
		
		
			$times = ConsumeTime::fromJson($i->consume_time);
			// echo var_dump($times);
	
			if($times->has('morning_and_evening')){
				$sum = 2;
			}else{
				$sum = 0;
				if($times->hasNum(2))$sum+=1;
				if($times->hasNum(4))$sum+=1;
				if($times->hasNum(8))$sum+=1;
				if($times->hasNum(16))$sum+=1;	
			}
			if($sum==0)$sum=1;
			$usub = 1.0/$sum;
		    $sub = $i->order_per_day*(31*$days/30)*$usub;
		    $m0 = $m1 = $m2 = $m3 = 0;
			if($times->has('morning_and_evening')){
				$m0=$sub;
				$m2=$sub;
			}else{
	   			if($times->hasNum(2))$m0=$sub;
				if($times->hasNum(4))$m1=$sub;
				if($times->hasNum(8))$m2=$sub;
				if($times->hasNum(16))$m3=$sub;
			}
//		echo '<tr><td> D'.++$o.'</td><td colspan="1" width="200px" style="text-align:left">'.$p->display_name.'</td><td width="50px">'.$i->order_per_day.' '.$p->unit->display_name.'</td>';
//		echo '<td>'.$i->order_per_day*(31*$days/30).'</td><td>'.$m0.'</td></td><td>'.$m1.'</td></td><td>'.$m2.'</td></td><td>'.$m3.'</td>';
//echo '</tr>';
}	
}
		
   endforeach;
//	echo '<table id="morder" style="margin-top:10px; float:left; width: 300px;">';
//	echo '<tr><th>Additional Information</th></tr>';
//	echo '<tr><td style="height:50px;text-align:left">
//	<textarea style="font-size:0.6em;border:0px" cols="70" rows="4">'.$order->remarks2.'</textarea></td></tr><tr><td style="height:50px;">&nbsp;</td></tr></table>';

   if (!$hasdispensed)
   {// echo '<tr><td colspan="8">&nbsp;-</td></tr>';
}
//	echo '</table></div>';


//	echo '<div style="margin-top:10px;  float:right; width: 300px;border:0px solid" ><table border="0" style="border:0px solid" >';
//	echo '<tr><td align="right" style="text-align:left">Order # <br/><img width="300" src="'.Yii::app()->request->baseUrl.'/barcode/gen?barcode='.$order->uuid.'" /><br/>Lot #<br/><img width="300" src="'.Yii::app()->request->baseUrl.'/barcode/gen?barcode='.$order->lotid().'" /></td></tr></table>';
//	echo '<table id="morder1" style=" padding:10px;float:right;">';
//	echo '<tr><th>Order Information</th></tr>';
//	echo '<tr><td align="left">เลขที่ใบสั่งซื้อ : '.$order->uuid.'</td></tr>';
//	echo '<tr><td>ผู้สั่ง : '.$order->getClinician()->full_name.'</td></tr>';
//	echo '<tr><td>คนไข้ : '.$order->patient->name.'</td></tr>';
//	echo '<tr><td>HN : '.$order->patient->hn.'</td></tr>';
//	echo '<tr><td>วันที่จัดส่ง : '.$order->delivery_date.'</td></tr>';
//	echo '<tr><td>Supplement Days : '.$order->days.'วัน</td></tr>';
//	echo '</table>';
	
	
  
//   echo '<table id="morder" style="margin-top:10px; float:right; width: 300px;">';
//  echo '<tr><th colspan="2">Product #0</th><th>Total</th><th>เช้า</th><th>กลางวัน</th><th>เย็น</th><th>ก่อนนอน</th></tr>';
//   echo '<tr><td colspan="2">Total (mg)</td>';
//   echo '<td>'.$total[0].'</td>';
//   echo '<td>'.$total[1].'</td>';
//   echo '<td>'.$total[2].'</td>';
//   echo '<td>'.$total[3].'</td>';
//   echo '<td>'.$total[4].'</td>';
//   echo '</tr>';
   
   //  Todo : per cap is filler scale 
   $per_cap = 1;

//   echo '<tr><td colspan="2">Total (Caps)</td>';
//   echo '<td>'.number_format($vtotal[0],3).'</td>';
//   echo '<td>'.number_format($vtotal[1],3).'</td>';
//   echo '<td>'.number_format($vtotal[2],3).'</td>';
//   echo '<td>'.number_format($vtotal[3],3).'</td>';
//   echo '<td>'.number_format($vtotal[4],3).'</td>';
//   echo '</tr>';
   
   // $days == 0 ? $days = 1 ; // Prevent divide by zero error
   if($days==0)$days=1;


   $tdays = $days/30;
   if($tdays==0){
	$tdays = $days;
   }else{
	$tdays = 31*$tdays;
   }
// echo 'Tday '.$tdays.'='.$days;


	
   $vtotal[1] = $vtotal[1]/$per_cap/$tdays;
   $vtotal[2] = $vtotal[2]/$per_cap/$tdays;
   $vtotal[3] = $vtotal[3]/$per_cap/$tdays;
   $vtotal[4] = $vtotal[4]/$per_cap/$tdays;
   $vtotal[0] = $vtotal[1]+$vtotal[2]+$vtotal[3]+$vtotal[4];

   

   $vtotal[11] = ceil($vtotal[1]);
   $vtotal[12] = ceil($vtotal[2]);
   $vtotal[13] = ceil($vtotal[3]);
   $vtotal[14] = ceil($vtotal[4]);
   $vtotal[10] = $vtotal[11]+$vtotal[12]+$vtotal[13]+$vtotal[14];
   
   $fill_v = 0.418;
   
   // echo '<tr><td colspan="2">In (Caps)</td>';
   // echo '<td>'.number_format($vtotal[0],3).'</td>';
   // echo '<td>'.number_format($vtotal[1],3).'</td>';
   // echo '<td>'.number_format($vtotal[2],3).'</td>';
   // echo '<td>'.number_format($vtotal[3],3).'</td>';
   // echo '<td>'.number_format($vtotal[4],3).'</td>';
   // echo '</tr>';

   // echo '<tr><td colspan="2">Caps per day</td>';
   // echo '<td>'.$vtotal[10].'</td>';
   // echo '<td>'.$vtotal[11].'</td>';
   // echo '<td>'.$vtotal[12].'</td>';
   // echo '<td>'.$vtotal[13].'</td>';
   // echo '<td>'.$vtotal[14].'</td>';
   // echo '</tr>';

   // echo '<tr><td colspan="2">Total caps</td>';
   // echo '<td>'.$vtotal[10]*$tdays.'</td>';
   // echo '<td>'.$vtotal[11]*$tdays.'</td>';
   // echo '<td>'.$vtotal[12]*$tdays.'</td>';
   // echo '<td>'.$vtotal[13]*$tdays.'</td>';
   // echo '<td>'.$vtotal[14]*$tdays.'</td>';
   // echo '</tr>';

   // echo '<tr><td colspan="2">Min filler</td>';
   // echo '<td>'.number_format(($vtotal[10]-$vtotal[0])*$fill_v*$tdays,3).'</td>';
   // echo '<td>'.number_format(($vtotal[11]-$vtotal[1])*$fill_v*$tdays,3).'</td>';
   // echo '<td>'.number_format(($vtotal[12]-$vtotal[2])*$fill_v*$tdays,3).'</td>';
   // echo '<td>'.number_format(($vtotal[13]-$vtotal[3])*$fill_v*$tdays,3).'</td>';
   // echo '<td>'.number_format(($vtotal[14]-$vtotal[4])*$fill_v*$tdays,3).'</td>';
   // echo '</tr></table>';


  // echo '</div>';


$order->caps_per_day = ''.$vtotal[10].' ('.$vtotal[11].'+'.$vtotal[12].'+'.$vtotal[13].'+'.$vtotal[14].')';
$order->caps_to_be_made = $vtotal[10]*$tdays;
$order->filler_needed = number_format(($vtotal[10]-$vtotal[0])*$fill_v*$tdays,2);
$order->order_cost =  number_format($cost,2);
$order-> total_weight =   number_format($total[0],2);

?>
<div class="setbackground">
<?php  if($order->status_id >= Status::PENDING && User::authorize('manage') ): ?>	
	
<fieldset>
	<legend>Price Summary</legend>
<?php // 31-Day Total:
	echo CHtml::activeLabel($order, 'monthly_price');
	echo CHtml::activeTextField($order,'monthly_price'); ?>
<?php // Price Per Day:
	echo CHtml::activeLabel($order, 'daily_price');
	echo CHtml::activeTextField($order,'daily_price'); ?>
<?php /* Do not display for clinician */
    if (!(Yii::app()->session['user.type'] == 'CLINICIAN')):?>
<?php // Total Weigh (g):
	echo CHtml::activeLabel($order, 'total_weight (g)');
	echo CHtml::activeTextField($order,'total_weight'); ?>
<?php endif;?>
</fieldset>
<?php endif;?>
</div>



<?php /* Do not display for clinician */
    if (User::authorize('manage')):

if (Yii::app()->session['user.type'] == 'ADMIN') {
?>	


<div class="setbackground">
<fieldset>
	<legend>Cost</legend>
	<?php // Cap to be made:
		echo CHtml::activeLabel($order, 'marketing_code');
		echo CHtml::activeTextField($order,'marketing_code'); ?>	
<?php // Cap to be made:
	echo CHtml::activeLabel($order, 'order_cost');
	echo CHtml::activeTextField($order,'order_cost'); ?>
</fieldset>
</div>
<? } ?>

<div class="setbackground">
<fieldset>
	<legend>Manufacture</legend>
<?php // Cap to be made:
	echo CHtml::activeLabel($order, 'caps_per_day');
	echo CHtml::activeTextField($order,'caps_per_day'); ?>
	
<?php // Cap to be made:
	echo CHtml::activeLabel($order, 'caps_to_be_made');
	echo CHtml::activeTextField($order,'caps_to_be_made'); ?>

<?php // Filler Needed
	echo CHtml::activeLabel($order, 'filler_needed (g)');
	echo CHtml::activeTextField($order,'filler_needed'); ?>
	
</fieldset>
</div>
<?php endif;?>

