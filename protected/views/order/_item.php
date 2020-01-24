<?php ($index % 2) ? $css="odd" : $css="even"; 
$disable = '';
if($this->data['order']->status_id>= Status::REQUEST && !User::authorize('manage'))	
$disable = 'disabled="true"';

 if($data->soldout)$css = 'soldout';
?>
<tr class="<?php echo $css; ?> order-item">
	<td>
	<?php // Show display_name and link to update

	if ((Yii::app()->session['user.type'] == 'ADMIN')):
		echo CHtml::link($data->display_name,
						 $this->createUrl('product/UpdateProduct', array('id'=>$data->id)),array('title'=>$data->description)); 
	else:
		echo $data->display_name;
	endif;
	?>
	</td>
<?php /*?>	<td>
	<?php echo $data->code; ?>
	</td> */ ?>
	<td>
	<?php 
		echo sprintf('%s (%s)',$data->recommended_dosage, $data->unit->display_name); ?>
	</td>
	<td>
	<?php
	 	$remarks = '';
		
		if ($this->data['order']->hasAutoFillItems())
			$autofill_items = $this->data['order']->getAutoFillItems();
		
		if ($this->items && isset($this->items[$data->id])) {									// use current quantity
			$quantity = $this->items[$data->id]->order_per_day;
			$remarks = $this->items[$data->id]->remarks;
			
		} elseif (isset($autofill_items) && isset($autofill_items[$data->id])) { 				// use auto-fill
			echo "Auto-fill:";			
			$quantity = $autofill_items[$data->id]->order_per_day;
			// if(isset($autofill_items[$data->id]->consume_time))
			$this->items[$data->id] = new stdClass();;
			$this->items[$data->id]->consume_time= $autofill_items[$data->id]->consume_time;
			
		} else {
			$quantity = "";
		}
        if(!$data->soldout or isset($this->items[$data->id])){
			if($data->isDispensed()){
				echo CHtml::textField('Product['.$data->id.'][OrderPerDay]', $quantity, array('tabindex'=>$data->category_id*1000+$index,'size'=>1,'maxlength'=>1 ,'onclick'=>'this.select()'));
			}else{
				echo CHtml::textField('Product['.$data->id.'][OrderPerDay]', $quantity, array('tabindex'=>$data->category_id*1000+$index,'size'=>7,'onclick'=>'this.select()'));
			}
		}
		else{
			echo 'N/A';
		}
	?>
	</td>
	<td class="consume_time" >
	<?php  
			if ($this->items && isset($this->items[$data->id])) {
				$select = json_decode($this->items[$data->id]->consume_time);
			} else{
				$select =$data->default_consume_time;
			}
		
			if(!isset($select)){
				$select = array();
			}

			$id = 'Product_'.$data->id.'_ConsumeTime';
			$oid= 'Product_'.$data->id.'_OrderPerDay';
			$name = 'Product['.$data->id.'][ConsumeTime][]';
			
			$me=$m=$e=$l=$b='';
			$s = array_flip($select);
			$c='checked="checked"';
			if(array_key_exists('morning_and_evening', $s)){
				$me=$c;
			}
			if(array_key_exists('morning',$s)){
				$m=$c;
			}
			if(array_key_exists('lunch',$s)){
				$l=$c;
			}
			if(array_key_exists('evening',$s)){
				$e=$c;
			}
			if(array_key_exists('bedtime',$s)){
				$b=$c;
			}
	
		
		
			
	?>
	<span><input value="morning_and_evening" id="<?echo $id;?>_0" <?echo $me;?> type="checkbox" <?php echo $disable; ?> name="<?echo $name;?>" /><label for="<?echo $id;?>_0">เช้า / เย็น</label></span>
	<span><input value="morning" onchange="" id="<?echo $id;?>_1" <?echo $m;?> type="checkbox" <?php echo $disable; ?> name="<?echo $name;?>" /><label for="<?echo $id;?>_1">เช้า</label></span>
	<span><input value="lunch" id="<?echo $id;?>_2" <?echo $l;?> type="checkbox" <?php echo $disable; ?> name="<?echo $name;?>" /><label for="<?echo $id;?>_2">กลางวัน</label></span>
	<span><input value="evening" id="<?echo $id;?>_3" <?echo $e;?> type="checkbox" <?php echo $disable; ?> name="<?echo $name;?>" /><label for="<?echo $id;?>_3">เย็น</label></span>
	<span><input value="bedtime" id="<?echo $id;?>_4" <?echo $b;?>type="checkbox"  <?php echo $disable; ?> name="<?echo $name;?>" /><label for="<?echo $id;?>_">ก่อนนอน</label></span>
	<span id="<?echo $id;?>_info" style="color:red;font-size:0.8em"></span>
	<?php
	
	echo CHtml::textField('Product['.$data->id.'][Remarks]', $remarks, array('tabindex'=>$data->category_id*1000+$index,'size'=>8,'maxlength'=>30 ,'onclick'=>'this.select()'));
	
	
	?>
	
<script type="text/javascript" charset="utf-8">
     
	$('#<?echo $id;?>_0').change(function() {
		$('#<?echo $id;?>_1').removeAttr('checked');
		$('#<?echo $id;?>_2').removeAttr('checked');
		$('#<?echo $id;?>_3').removeAttr('checked');
		$('#<?echo $id;?>_4').removeAttr('checked');
	});
	$('#<?echo $id;?>_1').change(function() {
		$('#<?echo $id;?>_0').removeAttr('checked');
		$('#<?echo $id;?>_info').html("");
	});
	$('#<?echo $id;?>_2').change(function() {
		$('#<?echo $id;?>_0').removeAttr('checked');
		$('#<?echo $id;?>_info').html("");
	});	
	$('#<?echo $id;?>_3').change(function() {
		$('#<?echo $id;?>_0').removeAttr('checked');
		$('#<?echo $id;?>_info').html("");
	});
	$('#<?echo $id;?>_4').change(function() {
		$('#<?echo $id;?>_0').removeAttr('checked');
		$('#<?echo $id;?>_info').html("");
	});	
	
	$('#<?echo $id;?>_4').change(function() {
		$('#<?echo $id;?>_0').removeAttr('checked');
		$('#<?echo $id;?>_info').html("");
	});	
	
	$('#<?echo $oid;?>').change(function() {
		
	<?php
		$check=0;
		if($data->isDispensed()){
			$check=1;
		}
	?>	
		
	if(1==<?php echo $check; ?>){
	if(parseInt(this.value)%2==0){
		$('#<?echo $id;?>_0').removeAttr('disabled');
	}else{
		$('#<?echo $id;?>_0').attr('disabled','disabled');
		$('#<?echo $id;?>_0').removeAttr('checked');
		if(!$('#<?echo $id;?>_1').attr('checked')&&!$('#<?echo $id;?>_2').attr('checked')&&!$('#<?echo $id;?>_3').attr('checked')&&!$('#<?echo $id;?>_4').attr('checked'))
		$('#<?echo $id;?>_info').html("please select");
	}	
	
		}
	});	

	
	
</script>	
	</td>
</tr>