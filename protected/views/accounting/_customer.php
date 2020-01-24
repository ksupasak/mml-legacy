<tr>
	<td><?php echo "ID: ".$data->id; ?></td>
	<td><?php echo CHtml::link('manage', $this->createUrl('accounting/ManageBillings', array('accountId'=>$data->id))); ?></td>

	<td>
		<p>
			<?php echo count($data->orders); ?>
		</p>
	</td>
</tr>