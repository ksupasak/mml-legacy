
<tr>
	<td><?php echo CHtml::link(CHtml::encode($data->name), array('update', 'id'=>$data->id)); ?>
		<br />Contact: <?php echo CHtml::encode($data->hospital); ?>
	</td>
	<td>
		<?php echo CHtml::encode($data->user_account); ?> 
	
	</td>
	
</tr>