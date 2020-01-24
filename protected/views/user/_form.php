<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'user-form',
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'username'); ?>
		<?php echo $form->textField($model,'username',array('size'=>45,'maxlength'=>45)); ?>
		<?php echo $form->error($model,'username'); ?>
	</div>
	
	<div class="row">
		<?php echo $form->labelEx($model,'password'); ?>
		<?php echo $form->passwordField($model,'password',array('size'=>45,'maxlength'=>45)); ?>
		<?php echo $form->error($model,'password'); ?>
	</div> 

	<div class="row">
		<?php echo $form->error($model,'salt'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'email'); ?>
		<?php echo $form->textField($model,'email',array('size'=>45,'maxlength'=>45)); ?>
		<?php echo $form->error($model,'email'); ?>
	</div>
	

	
<!--
	<div class="row">
		<?php echo $form->labelEx($model,'display_name'); ?>
		<?php echo $form->textField($model,'display_name',array('size'=>45,'maxlength'=>45)); ?>
		<?php echo $form->error($model,'display_name'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'full_name'); ?>
		<?php echo $form->textField($model,'full_name',array('size'=>45,'maxlength'=>45)); ?>
		<?php echo $form->error($model,'full_name'); ?>
	</div>

-->

	<div class="row">
		<?php echo $form->labelEx($model,'type'); ?>
        <?php echo $form->dropDownList($model,'type',User::listTypes());  ?>
		<?php echo $form->error($model,'type'); ?>
	</div>
	
	<div class="row">
	<?php 
			if ( !$model->hasPIN() ){
				$pin = new UserPin;
				$pin->user_id = $model->id;
				$pin->pin = sprintf('%d4',$model->id);
				$pin->save();
				$model->pin = $pin; $model->save();
				echo "create new PIN";
			} else {
				echo "has PIN";
			}
		
	?>
	
		<?php echo $form->labelEx($model->pin,'pin'); ?>
		<?php echo $form->textField($model->pin,'pin',array('size'=>45,'maxlength'=>45)); ?>
		<?php echo $form->error($model->pin,'pin'); ?>
	</div>
	
	
	<div class="row">
		<?php echo CHtml::activeLabel($model,'customer_id'); ?>(For Nurse and Pharmacist)<br/>
		<?php 
		echo CHtml::activeDropDownList($model,'customer_id',Customer::dropdownOptions(), 
		array(
			'template'=>'{label} {input}', 'separator'=>' ', 'encode'=>true,'style'=>''
			));  
		?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->