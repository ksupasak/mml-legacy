


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

<div style="width:960px">
	
<?php 
   $days = intval($order->days); 
   $table = array();
  $compound_list = array();
	$exclude_list = array();
   $items =  $order->items;
   foreach($items as $i ):
	 if($i->product->excluded){
		array_push($exclude_list,$i);
	}else{
	
		$table[$i->product->id]=$i;
	}
   endforeach;
  
// $r =   array();
// array_push($r,$exclude_list[0]);
// $r = Order::calculateManufactureItem($r,$days,0.418);

// var_dump($r);


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


   echo '<div style="float:left;"><table id="morder" style=" padding:10px;">';

   $cs = Category::model()->find('name=:name',array(':name'=>'Compound'));
   $categories = $cs->children;
	$total = array(0,0,0,0,0,0);
		$vtotal = array(0,0,0,0,0,0);
	echo '<tr><th>No.</th><th>Product (Compounded)</th><th>Per day</th><th>Total</th><th>เช้า</th><th>กลางวัน</th><th>เย็น</th><th>ก่อนนอน</th></tr>';
   foreach($categories as $c):
   echo '<tr><td>&nbsp;</td><td colspan="" bgcolor="#DBEEFD"><strong>'.$c->name.'</strong></td><td colspan="6" bgcolor="#DBEEFD">&nbsp;</td></tr>';
   $products = Product::inCategory($c);
     $o=0;

		foreach($products as $p):
		$color='';
		if($o%2==1){
			$color='id="odd"';
		}
			
			if(isset($table[$p->id])&&$table[$p->id]->order_per_day>0){
				$i = $table[$p->id];
				array_push($compound_list,$i);
				
				
					 $t = $p->display_name;
					 if(isset($i->remarks)&&$i->remarks!='') $t = $t."<span style='color:red'> ( ".$i->remarks." )</span>"	;

				
				echo '<tr '.$color.'><td>'.++$o.'</td><td colspan="1" style="text-align:left">'.$t.'</td><td>'.$i->order_per_day.' '.$p->unit->display_name.'</td>';
				
		
				
				if($i->order_per_day>0){
				
				$per_day = $i->order_per_day;
			
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
							$adj = 10.0;
					        break;
					    case "vitamin_e":
					        $adj = 0.735*1000;
						    break;
						case "d_gamma":
						 	$adj = 0.9*1000;
					}
					// var_dump($p->display_name.$adj);
					
				}
				
				
				
				$sub = $per_day*$days/$p->percent_active/$p->unit->gram_conversion_factor*$adj;
				$usub = 1.0/$sum;
			
				$v = $p->getVolume($sub); 
				
				echo '<td>'.$sub.' g</td>';
				$total[0]+=$sub; 
				$vtotal[0]+=$v;  
				if($times->hasNum(2)||$times->hasNum(1)){ 
					echo '<td>'.($sub *$usub).'</td>';
					$total[1]+=$sub * $usub;
					$vtotal[1]+=$v *$usub;
				}else{
					echo '<td>&nbsp;</td>';
				}
				if($times->hasNum(4)){ 
					echo '<td>'.$sub*$usub.'</td>';
						$total[2]+=$sub * $usub;
						$vtotal[2]+=$v *$usub;
				}	else{
						echo '<td>&nbsp;</td>';
					}
				if($times->hasNum(8)||$times->hasNum(1)){ 
					echo '<td>'.$sub *$usub.'</td>';
						$total[3]+=$sub * $usub;
						$vtotal[3]+=$v *$usub;
				}	else{
						echo '<td>&nbsp;</td>';
					}
				if($times->hasNum(16)){ 
					echo '<td>'.$sub *$usub.'</td>';
						$total[4]+=$sub * $usub;
						$vtotal[4]+=$v *$usub;
				}	else{
						echo '<td>&nbsp;</td>';
				}
					
				
				// var_dump($total);
				// echo '<td>'.$sum.'</td>';
				
				}
				// echo '<td>'.$p->display_name.'->'.$consume.'</td>';
				// echo '<td>'.$p->display_name.'->'.$consume.'</td>';
				// echo '<td>'.$p->display_name.'->'.$consume.'</td>';
				// echo '<td>'.$p->display_name.'->'.$consume.'</td>';
				echo '</tr>';
				
		    }	else{
				//	echo '<td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>';
				}
		//	echo '</tr>';
		endforeach;
   endforeach;
   echo '</table>';
	$hasdispensed = false;

	//============================================================================================================	start exclude list
	

   echo '<table id="morder" style=" padding:10px;">';


	echo '<tr><th>No.</th><th>Product (Exclude Compounded)</th><th>Per day</th><th>Total</th><th>เช้า</th><th>กลางวัน</th><th>เย็น</th><th>ก่อนนอน</th></tr>';

     $o=0;

		$table_ex = array();

		foreach($exclude_list as $i):
		
		$total_ex = array();
		$vtotal_ex = array();
		
		$table_ex[$i->id] = array();

		
		
		$color='';
		if($o%2==1){
			$color='id="odd"';
		}
		$p = $i->product;

			if($i->order_per_day>0){
				
			 $t = $p->display_name;
			 if(isset($i->remarks)&&$i->remarks!='') $t = $t."[".$i->remarks."]"	;
				
				
				echo '<tr '.$color.'><td>'.++$o.'</td><td colspan="1" style="text-align:left">'.$t.'</td><td>'.$i->order_per_day.' '.$p->unit->display_name.'</td>';



				if($i->order_per_day>0){

				$per_day_ex = $i->order_per_day;

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

			
				$sub = $per_day_ex*$days/$p->percent_active/$p->unit->gram_conversion_factor*$adj;
				$usub = 1.0/$sum;

				$v = $p->getVolume($sub); 

				echo '<td>'.$sub.' g</td>';
				$total_ex[0]+=$sub; 
				$vtotal_ex[0]+=$v;  
				if($times->hasNum(2)||$times->hasNum(1)){ 
					echo '<td>'.($sub *$usub).'</td>';
					$total_ex[1]+=$sub * $usub;
					$vtotal_ex[1]+=$v *$usub;
				}else{
					echo '<td>&nbsp;</td>';
				}
				if($times->hasNum(4)){ 
					echo '<td>'.$sub*$usub.'</td>';
						$total_ex[2]+=$sub * $usub;
						$vtotal_ex[2]+=$v *$usub;
				}	else{
						echo '<td>&nbsp;</td>';
					}
				if($times->hasNum(8)||$times->hasNum(1)){ 
					echo '<td>'.$sub *$usub.'</td>';
						$total_ex[3]+=$sub * $usub;
						$vtotal_ex[3]+=$v *$usub;
				}	else{
						echo '<td>&nbsp;</td>';
					}
				if($times->hasNum(16)){ 
					echo '<td>'.$sub *$usub.'</td>';
						$total_ex[4]+=$sub * $usub;
						$vtotal_ex[4]+=$v *$usub;
				}	else{
						echo '<td>&nbsp;</td>';
				}


				// var_dump($total);
				// echo '<td>'.$sum.'</td>';

				}

				echo '</tr>';
				$table_ex[$i->id][0] = $total_ex;
				$table_ex[$i->id][1] = $vtotal_ex;

		    }	
		
		  else{
				//	echo '<td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>';
				}
		//	echo '</tr>';
   endforeach;
	
	
   echo '</table>';	
//============================================================================================================	
	

   $c = Category::model()->find('name=:name',array(':name'=>'Dispensed'));
   echo '<table id="morder" style=" padding:10px;"><tr><th>No.</th><th>Product ('.$c->name.')</th><th>&nbsp;</th><th>Total</th><th>เช้า</th><th>กลางวัน</th><th>เย็น</th><th>ก่อนนอน</th></tr>';
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
			
				$s = explode('/',$i->product->unit->display_name);
				if(count($s)>1){
					$s = $s[1];
				}else{
					$s = $s[0];
				}
		$t = $p->display_name;
		
		if(isset($i->remarks)&&$i->remarks!='') $t = $t."[".$i->remarks."]"	;
							
		echo '<tr><td> D'.++$o.'</td><td colspan="1" width="200px" style="text-align:left">'.$t.'</td><td width="50px">'.$i->order_per_day.' '.$s.'</td>';
		echo '<td>'.$i->order_per_day*(31*$days/30).'</td><td>'.$m0.'</td></td><td>'.$m1.'</td></td><td>'.$m2.'</td></td><td>'.$m3.'</td>';
echo '</tr>';
}	
}
		
   endforeach;
	echo '</table>';
	


	

	echo '<table id="morder" style="margin-top:10px; float:left; width: 300px;">';
	echo '<tr><th>Additional Information</th></tr>';
	echo '<tr><td style="height:50px;text-align:left;font-size:1.2em">
	<textarea style="font-size:1em;border:0px" cols="70" rows="4">'.$order->remarks2.'</textarea></td></tr><tr><td style="height:50px;">&nbsp;</td></tr></table>';

   if (!$hasdispensed)
   { echo '<tr><td colspan="8">&nbsp;-</td></tr>';}
	echo '</table></div>';


	echo '<div style="margin-top:10px;  float:right; width: 300px;border:0px solid" ><table border="0" style="border:0px solid" >';
	echo '<tr><td align="right" style="text-align:left">Order # <br/><img width="300" src="'.Yii::app()->request->baseUrl.'/barcode/gen?barcode='.$order->uuid.'" /><br/>Lot #<br/><img width="300" src="'.Yii::app()->request->baseUrl.'/barcode/gen?barcode='.$order->lotid().'" /></td></tr></table>';
	echo '<table id="morder1" style=" padding:10px;float:right;">';
	echo '<tr><th>Order Information</th></tr>';
	echo '<tr><td align="left">เลขที่ใบสั่งซื้อ : '.$order->uuid.'</td></tr>';
	echo '<tr><td>ผู้สั่ง : '.$order->getClinician()->full_name.'</td></tr>';
	echo '<tr><td>คนไข้ : '.$order->patient->name.'</td></tr>';
	echo '<tr><td>HN : '.$order->patient->hn.'</td></tr>';
	echo '<tr><td>วันที่จัดส่ง : '.$order->delivery_date.'</td></tr>';
	echo '<tr><td>Supplement Days : '.$order->days.'วัน</td></tr>';
	echo '</table>';


  	

	function show_table($title, $days,$total,$vtotal,$fill_v) 
	{ 
   		$cap_number ='0';

   echo '<table id="morder" style="margin-top:10px; float:right; width: 300px;">';
   echo '<tr><td colspan="7">'.$title.'</td></tr>';
   echo '<tr><th colspan="2">Product #'.$cap_number.'</th><th>Total</th><th>เช้า</th><th>กลางวัน</th><th>เย็น</th><th>ก่อนนอน</th></tr>';
   echo '<tr><td colspan="2">Total (g)</td>';
   echo '<td>'.number_format($total[0],3).'</td>';
   echo '<td>'.number_format($total[1],3).'</td>';
   echo '<td>'.number_format($total[2],3).'</td>';
   echo '<td>'.number_format($total[3],3).'</td>';
   echo '<td>'.number_format($total[4],3).'</td>';
   echo '</tr>';
   
   //  Todo : per cap is filler scale 
   $per_cap = 0.418/$fill_v;
   if($days == 0)$days = 1; // Prevent divide by zero error
   
   $tdays = $days/30;
   if($tdays==0){
	$tdays = $days;
   }else{
	$tdays = 31*$tdays;
   }

   echo '<tr><td colspan="2">Total (Caps)</td>';
   echo '<td>'.number_format($vtotal[5]*$tdays,3).'</td>';
   echo '<td>'.number_format($vtotal[6]*$tdays,3).'</td>';
   echo '<td>'.number_format($vtotal[7]*$tdays,3).'</td>';
   echo '<td>'.number_format($vtotal[8]*$tdays,3).'</td>';
   echo '<td>'.number_format($vtotal[9]*$tdays,3).'</td>';
   echo '</tr>';

   echo '<tr><td colspan="2">Caps per day</td>';
   echo '<td>'.$vtotal[10].'</td>';
   echo '<td>'.$vtotal[11].'</td>';
   echo '<td>'.$vtotal[12].'</td>';
   echo '<td>'.$vtotal[13].'</td>';
   echo '<td>'.$vtotal[14].'</td>';
   echo '</tr>';

   echo '<tr><td colspan="2">Total caps</td>';
   echo '<td>'.$vtotal[10]*$tdays.'</td>';
   echo '<td>'.$vtotal[11]*$tdays.'</td>';
   echo '<td>'.$vtotal[12]*$tdays.'</td>';
   echo '<td>'.$vtotal[13]*$tdays.'</td>';
   echo '<td>'.$vtotal[14]*$tdays.'</td>';
   echo '</tr>';


   echo '<tr><td colspan="2">Min filler</td>';
   echo '<td>'.number_format($vtotal[15],3).'</td>';
   echo '<td>'.number_format($vtotal[16],3).'</td>';
   echo '<td>'.number_format($vtotal[17],3).'</td>';
   echo '<td>'.number_format($vtotal[18],3).'</td>';
   echo '<td>'.number_format($vtotal[19],3).'</td>';
   echo '</tr></table>';



	}
	

	
	//show_table('Compound #0',$days,$total,$vtotal,0.418);
	//show_table('Compound #4',$days,$total,$vtotal,0.1546);
	$r = Order::calculateManufactureItem($compound_list,$days,0.418);
	show_table('Compound #0',$days,$r['usage'],$r['volume'],0.418);

	$r = Order::calculateManufactureItem($compound_list,$days,0.1546);
	show_table('Compound #4',$days,$r['usage'],$r['volume'],0.1546);
	
	
	if($exclude_list){
		
		foreach($exclude_list as $i){
		  // var_dump($table_ex[$i->id][1]);
			
			$r =  array();
			array_push($r,$i);
			$r = Order::calculateManufactureItem($r,$days,0.418);
		    
			$total = $r['usage'];
			$vtotal = $r['volume'];
		
			show_table('Compound '.$i->product->display_name.' #0',$order->days,$total,$vtotal,0.418);
		}
		
	}

    echo '<div class="clear"></div>';
	echo  'Printed at '.date(" j F Y, g:i a");
    echo '</div>';
   
?>

</div>




