<?php 
?>

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>
<fieldset>
    <p><label for="from">From:</label> <input type="text" name="from" id="from" size="8" />
	   <label for="to">To:</label> <input type="text" name="to" id="to" size="8" /></p>
	<p><label for="status">Status:</label> <select name="status" id="status"><option value="0">--select--</option></select>
	   <button id="filter-button" class="yui-button">Filter</button></p>
</fieldset>
<?php $this->endWidget(); ?>

<script>
	$(document).ready(function() {
		$( "#from" ).datepicker();
		$( "#to" ).datepicker();
	});

	YUI().use('yui2-button', function(Y) {
		var YAHOO = Y.YUI2;
		var button = new YAHOO.widget.Button("filter-button");

	});
</script>

<div class="wide form">
<?php
$filter = new Order; ?>

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

	<div class="row">
		<?php echo $form->label($filter,'id'); ?>
		<?php echo $form->textField($filter,'id'); ?>
	</div>



	<div class="row">
		<?php echo $form->label($filter,'status'); ?>
		<?php echo $form->textField($filter,'status',array('size'=>60,'maxlength'=>500)); ?>
	</div>


	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- filter-form -->