<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>

	 <?php if( $data->parent_id ) :?> 
	 <b>Parent:</b> 
		<?php echo $data->parent->name; ?>
		(<?php echo CHtml::encode($data->parent_id); ?>)
	<?php endif; ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('name')); ?>:</b>
	<?php echo CHtml::encode($data->name); ?>

	<b><?php echo CHtml::encode($data->getAttributeLabel('sel_rank')); ?>:</b>
	<?php echo CHtml::encode($data->sel_rank); ?>

</div>