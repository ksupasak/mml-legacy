<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'patient-form',
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'name'); ?>
		<?php echo $form->textField($model,'name',array('size'=>45,'maxlength'=>45)); ?>
		<?php echo $form->error($model,'name'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'hn'); ?>
		<?php echo $form->textField($model,'hn',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'hn'); ?>
	</div>


    <?php

	if(Yii::app()->session['user.type'] == 'CLINICIAN_STAFF'){  
    
	$customer = Customer::getFromUser(Yii::app()->session['user.id']);
	$clinicians = Clinician::dropdownOptions($customer->id)
	

    ?>
	<?php echo CHtml::activeHiddenField($model,'customer_id',array('value'=>$customer->id)); 
	
		
	
	?>

	
	
	<div class="row">
		<?php echo $form->labelEx($model,'clinician_id'); ?>
		<?php echo CHtml::activeDropDownList($model,'clinician_id',$clinicians, 
				array(
					'template'=>'{label} {input}', 'separator'=>' ', 'encode'=>true,'style'=>''
					));  
		?>

	</div>
	<?php 
	}
	
	?>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->