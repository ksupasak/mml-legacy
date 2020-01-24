<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'hospital-form',
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'name'); ?>
		<?php echo $form->textField($model,'name',array('size'=>60,'maxlength'=>500)); ?>
		<?php echo $form->error($model,'name'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'contact_person'); ?>
		<?php echo $form->textField($model,'contact_person',array('size'=>60,'maxlength'=>500)); ?>
		<?php echo $form->error($model,'contact_person'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'tel_1'); ?>
		<?php echo $form->textField($model,'tel_1',array('size'=>60,'maxlength'=>500)); ?>
		<?php echo $form->error($model,'tel_1'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'fax'); ?>
		<?php echo $form->textField($model,'fax',array('size'=>60,'maxlength'=>500)); ?>
		<?php echo $form->error($model,'fax'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'province'); ?>
		<?php echo $form->textField($model,'province',array('size'=>60,'maxlength'=>500)); ?>
		<?php echo $form->error($model,'province'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->