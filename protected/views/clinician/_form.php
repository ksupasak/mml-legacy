<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'clinician-form',
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($clinician); ?>

	<div class="row">
		<?php echo $form->labelEx($clinician,'full_name'); ?>
		<?php echo $form->textField($clinician,'full_name',array('size'=>60,'maxlength'=>500)); ?>
		<?php echo $form->error($clinician,'full_name'); ?>
	</div>
	
	<div class="row">
		<?php echo $form->labelEx($clinician,'full_name_en'); ?>
		<?php echo $form->textField($clinician,'full_name_en',array('size'=>60,'maxlength'=>500)); ?>
		<?php echo $form->error($clinician,'full_name_en'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($clinician,'user_id'); ?>
        <?php echo $form->dropDownList($clinician,'user_id',User::listUsers());  ?>
		<?php echo $form->error($clinician,'user_id'); ?>
	</div>
	
	<div class="row">
		<?php echo $form->labelEx($clinician,'hospital_id'); ?>
		<p class="hint">Start typing or press DOWN to get hospital list.</p>
		<?php 
		if ( isset($clinician->hospital)) {
			$value = $clinician->hospital->name; 
		} else {
			$value = '';
		}
		$this->widget('CAutoComplete',
          array(
			 'value'=>$value,
             'name'=>'hospital_name', 
                         //replace controller/action with real ids
             'url'=>array('hospital/autocomplete'), 
             'max'=>10,
             'minChars'=>0, 
             'delay'=>500, //number of milliseconds before lookup occurs
             'matchCase'=>false, //match case when performing a lookup?
                         //any additional html attributes that go inside of 
                         //the input field can be defined here
             'htmlOptions'=>array('size'=>'40'), 
             'methodChain'=>".result(function(event,item){\$(\"#Clinician_hospital_id\").val(item[1]);})",
             ));
		?>
		<?php echo CHtml::activeHiddenField($clinician,'hospital_id'); ?>
		<?php echo $form->error($clinician,'hospital_id'); ?>
	</div>
	
	<div class="row">
		<?php echo $form->labelEx($clinician,'email_to'); ?>
		<?php echo $form->textField($clinician,'email_to',array('size'=>100,'maxlength'=>500)); ?>
		<?php echo $form->error($clinician,'email_to'); ?>
	</div>
	<div class="row">
		<?php echo $form->labelEx($clinician,'cc_to'); ?>
		<?php echo $form->textField($clinician,'cc_to',array('size'=>100,'maxlength'=>500)); ?>
		<?php echo $form->error($clinician,'cc_to'); ?>
	</div>
	<div class="row">
		<?php echo $form->labelEx($clinician,'bcc_to'); ?>
		<?php echo $form->textField($clinician,'bcc_to',array('size'=>100,'maxlength'=>500)); ?>
		<?php echo $form->error($clinician,'bcc_to'); ?>
	</div>
	
	

	<div class="row buttons">
		<?php echo CHtml::submitButton($clinician->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->