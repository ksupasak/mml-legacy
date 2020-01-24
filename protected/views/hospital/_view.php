
<tr>
	<td><?php echo CHtml::link(CHtml::encode($data->name), array('update', 'id'=>$data->id)); ?>
		<br />Contact: <?php echo CHtml::encode($data->contact_person); ?>
	</td>
	<td>
		<?php echo CHtml::encode($data->tel_1); ?> <br />
		<?php echo CHtml::encode($data->fax); ?>
	</td>
	<td><?php echo CHtml::encode($data->province); ?></td>
</tr>