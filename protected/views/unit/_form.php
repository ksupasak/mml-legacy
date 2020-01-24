<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'unit-form',
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'id'); ?>
		<?php echo $form->textField($model,'id'); ?>
		<?php echo $form->error($model,'id'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'display_rank'); ?>
		<?php echo $form->textField($model,'display_rank'); ?>
		<?php echo $form->error($model,'display_rank'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'display_name'); ?>
		<?php echo $form->textField($model,'display_name',array('size'=>60,'maxlength'=>100)); ?>
		<?php echo $form->error($model,'display_name'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'gram_conversion_factor'); ?>
		<?php echo $form->textField($model,'gram_conversion_factor',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'gram_conversion_factor'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->