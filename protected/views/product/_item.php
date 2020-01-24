<?php 

if(isset(Yii::app()->session['user.id'])){
	
 $role = Yii::app()->user->role;	
	
}



($index % 2) ? $css="odd" : $css="even"; 
 if($data->soldout)$css = 'soldout';
 
?>
<tr class="<?php echo $css; ?>">
	<td><?php if($role!='OPERATOR'&&$role!='MANUFACTURE'){
		echo CHtml::link($data->display_name,$this->createUrl('product/UpdateProduct', array('id'=>$data->id)));
		}else{
		echo $data->display_name;
		}
	?>					
	</td>
	<td>
	<?php echo $data->code; ?>
	</td>
	<td>
	<?php echo $data->unit->display_name; ?>
	</td>
	<td>
	<?php 
		echo sprintf('%s (%s)',$data->recommended_dosage, $data->unit->display_name); ?>
	</td>
	<td>
	<?php 
		echo ConsumeTime::toString($data->default_consume_time);	?>
	</td>
	<!--
	<td>
	<?php echo $data->price_base; ?>
	</td>
-->
	
	<td>
	<?php echo $data->volume_base; ?>
	</td>
	<td style="">
	<?php echo $data->minimum; ?>
	</td>
	
	<td>
	<?php 
	 
	 if(isset($data->minimum)&&$data->getCurrentInventory()<$data->minimum):
	echo '<span style="color:red">';
	else:
	echo '<span>';
	endif;
	echo $data->getCurrentInventory(); ?>
	</span>
	</td>
	<td>
		
	<?php 
	if($data->expired_at){
	$d = new DateTime($data->expired_at);
	echo $d->format('d/m/Y');
	}
	?>
	</td>
	<td>
		
	<?php if($role!='OPERATOR'&&$role!='MANUFACTURE'){echo $data->deleteLink(); }?>
	</td>

	<!--
	<td style="overflow:hidden;width:100px">
	<?php echo $data->price_formula; ?>
	</td>
   -->
</tr>