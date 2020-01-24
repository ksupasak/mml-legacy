<?php 
?>

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>
<fieldset>
	<legend>Filter</legend>
    <label for="from">From:</label> <input type="text" name="Filter[from]" id="Filter_from" size="8" />
	   <label for="to">To:</label> <input type="text" name="Filter[to]" id="Filter_to" size="8" />
	<label for="status">Status:</label>
		<?php
			if ( isset($_GET) && isset($_GET['Order']) && isset($_GET['status'])) {
				$options = array($_GET['Order']['status'] => array('selected'=>'selected'));
			} else {
				$options = array();
			}
			echo CHtml::activeDropDownList($order,'status',Status::dropdownOptions(), 
					array(
						'template'=>'{label} {input}', 'separator'=>' ', 'encode'=>false,
						'onchange'=>'javascript:submit();',
						'options' => $options,
						)); ?>
	<?php echo CHtml::submitButton('filter'); echo CHtml::resetButton('reset'); ?>	

</fieldset>
<?php $this->endWidget(); ?>

<script>
	$(document).ready(function() {
		$.datepicker.setDefaults({dateFormat: 'yy-mm-dd'});
		$( "#Filter_from" ).datepicker();
		$( "#Filter_to" ).datepicker();
	});

</script>