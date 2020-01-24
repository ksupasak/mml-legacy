<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('hospital_id')); ?>:</b>
	<?php echo CHtml::encode($data->hospital->name); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('account_name')); ?>:</b>
	<?php echo CHtml::encode($data->account_name); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('billing_address')); ?>:</b>
	<?php echo CHtml::encode($data->billing_address); ?>
	<br />

	<b></b>
	<?php echo CHtml::encode($data->clinician_id); ?>
	<br />


</div>