

<table>
	<tr>
		<td> PATIENT: <?php echo CHtml::encode($data->id); ?></td>
		<td>
			<a href="<?php echo $this->createUrl('patient/update', array('id'=> $data->id)); ?>">
				<?php echo CHtml::encode($data->name); ?> ( HN# <?php echo CHtml::encode($data->hn); ?> )
			</a>

		</td>
	</tr>
	<?php if (isset($data->customer_id)): ?>	
	<tr>
		<td> CUSTOMER: 
		</td>
		<td>
			 <?php echo CHtml::encode($data->customer_id); ?>
			<a href="<?php echo $this->createUrl('customer/view', array('id'=> $data->customer->id)); ?>">
				<?php echo CHtml::encode($data->customer->account_name); ?> ( ACC# <?php echo CHtml::encode($data->customer->id); ?> )
			</a>
		</td>
	</tr>
	<?php endif; ?>
</table>