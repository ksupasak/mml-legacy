<?php echo CHtml::form('','post',array('enctype'=>'multipart/form-data')); ?>
<?php echo CHtml::fileField('image'); ?>
<?php echo CHtml::submitButton(); ?>
<?php echo CHtml::endForm(); ?>