<?php ($index % 2) ? $css="odd" : $css="even"; ?>
<tr class="<?php echo $css; ?>">
	<td>
	<?php // Show display_name and link to update
		echo CHtml::link($data->display_name,
						 $this->createUrl('product/UpdateProduct', array('id'=>$data->id))); ?>
	</td>
	<td>
	<?php echo $data->code; ?>
	</td>
	<td>
	<?php 
		echo sprintf('%s (%s)',$data->recommended_dosage, $data->unit->display_name); ?>
	</td>
	<td>
	<?php 
		echo ConsumeTime::toString($data->default_consume_time);	?>
	</td>
	
	<td>
	<?php echo $data->price_base; ?>
	</td>

	
	<td>
	<?php echo $data->volume_base; ?>
	</td>
	<td>
	<?php echo $data->getCurrentInventory(); ?>
	</td>
	<td>
	<?php echo CHtml::link('Update Stock', $this->createUrl('product/UpdateStock',array('product'=>$data->id))); ?>
	</td>
</tr>