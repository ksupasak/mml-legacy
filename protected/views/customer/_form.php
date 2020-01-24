<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'customer-form',
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($customer); ?>


	<div class="row">
		<?php echo $form->labelEx($customer,'account_name'); ?>
		<?php echo $form->textField($customer,'account_name',array('size'=>40,'maxlength'=>500)); ?>
		<?php echo $form->error($customer,'account_name'); ?>
	</div>
	<div class="row">
		<?php echo $form->labelEx($customer,'hospital_id'); ?>
		<p class="hint">Start typing or press DOWN to get hospital list.</p>
		<?php 
		if ( isset($customer->hospital)) {
			$value = $customer->hospital->name; 
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
             'methodChain'=>".result(function(event,item){\$(\"#Customer_hospital_id\").val(item[1]);})",
             ));
		?>
		<?php echo CHtml::activeHiddenField($customer,'hospital_id'); ?>
		<?php echo $form->error($customer,'hospital_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($customer,'billing_address'); ?>
		<?php echo $form->textArea($customer,'billing_address',array('rows'=>5,'cols'=>30)); ?>
		<?php echo $form->error($customer,'billing_address'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($customer,'logo_url'); ?>
		<?php echo $form->textField($customer,'logo_url',array('size'=>40)); ?>
		<?php echo $form->error($customer,'logo_url'); ?>
	</div>
	
	<div class="row">
	<?php echo CHtml::activeLabel($customer,'cutoff_date'); ?>
	<?php echo CHtml::activeDropDownList($customer,'cutoff_date',array('',1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30), 
	array('template'=>'{label} {input}', 'separator'=>' ', 'encode'=>true));  
	?>
	</div>
	<div class="row">
	<?php echo CHtml::activeLabel($customer,'payment_date'); ?>
	<?php echo CHtml::activeDropDownList($customer,'payment_date',array('',1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30), 
	array('template'=>'{label} {input}', 'separator'=>' ', 'encode'=>true));  
	?>
	</div>
	<div class="row">
	<?php echo CHtml::activeLabel($customer,'cutoff_date_2'); ?>
	<?php echo CHtml::activeDropDownList($customer,'cutoff_date_2',array('',1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30), 
	array('template'=>'{label} {input}', 'separator'=>' ', 'encode'=>true));  
	?>
	</div>
	<div class="row">
	<?php echo CHtml::activeLabel($customer,'payment_date_2'); ?>
	<?php echo CHtml::activeDropDownList($customer,'payment_date_2',array('',1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30), 
	array('template'=>'{label} {input}', 'separator'=>' ', 'encode'=>true));  
	?>
	</div>
	
	<div class="row">
		<?php echo CHtml::activeLabel($customer,'discount'); ?>
		<?php echo $form->textField($customer,'discount',array('size'=>40)); ?>
	</div>
	
	<div class="row">
		<?php echo CHtml::activeLabel($customer,'default_marketing_code'); ?>
		<?php echo $form->textField($customer,'default_marketing_code',array('size'=>40)); ?>
	</div>
	
	<div class="row buttons">
		<?php echo CHtml::submitButton($customer->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->