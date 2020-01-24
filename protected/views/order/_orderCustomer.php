<style>
	td { padding: 1em 1em 1em 1em; vertical-align: top; }
	fieldset.info {	width: 32em; margin: 0 auto;  }

</style>

<table class="form">
<tr>
<td>
<fieldset class="info setbackground">
	<legend>Clinician</legend>
		<?php 	/* Clinician text field */
			$size = 60;
			echo CHtml::activeLabel($order,'clinician_name'); ?> 
	<br />
		<?php 
			if ($this->userType() == 'CLINICIAN') {   // For clinician, fill-in information and make readonly.
				echo Chtml::activeTextField($order,'clinician_name', array('readonly'=>true, 'size'=>$size));
				echo CHtml::activeHiddenField($order, 'customer_id');
			}
			 elseif ($order->clinician_name) { 
				$this->userType() == 'CLINICIAN' ? $readonly = true : $readonly = false; 
				echo Chtml::activeTextField($order,'clinician_name', 
						array('readonly'=>$readonly, 'size'=>$size));
	            echo CHtml::activeHiddenField($order, 'customer_id', array());
			 } elseif (($this->userType() == 'ADMIN') 	||			// For admin, manager, clinician staff
			 		   ($this->userType() == 'MANAGER') ||
			 		   ($this->userType() == 'CLINICIAN_STAFF')	) { 	
	            $this->widget('CAutoComplete',
	              array(
	                 'name'=>'clinician_name', 'url'=>array('clinician/lookup'), 
	                 'model'=>$order, 'attribute'=>'clinician_name',
	                 'max'=>10, 'minChars'=>0, 'delay'=>200, 'matchCase'=>false,
	                 'htmlOptions'=>array('size'=>$size), 
	                 'methodChain'=>".result(function(event,item){\$(\"#OrderCustomerForm_customer_id\").val(item[1]); \$(\"#OrderCustomerForm_clinician_name\").val(item[0]);})",
	                 )); 
	     		echo CHtml::activeHiddenField($order, 'customer_id'); 
			 }
	   ?>  
	   <br/> <br />     
	<?php echo CHtml::link('Lookup Customer', $this->createUrl('customer/index')); ?> | 
    <?php echo CHtml::link('Lookup Clinician', $this->createUrl('clinician/')); ?> 
</fieldset>

</td>
<td>
<fieldset class="info setbackground">
	<legend>Patient</legend>
	<?php // Patient Name
		echo CHtml::activeLabel($order,'patient_name'); ?>
	<br />
	<?php 
		$this->widget('CAutoComplete',
          array(
             'name'=>'patient_name', 'url'=>array('clinician/lookupPatient'), 
			 'model'=>$order, 'attribute'=>'patient_name',
			 'max'=>10, 'minChars'=>0, 'delay'=>200, 'matchCase'=>false,
             'htmlOptions'=>array('size'=>$size), 
            // 'methodChain'=>".result(function(event,item){ console.log(item); \$(\"#Order_patient_id\").val(item[2]); console.log($('#Order_patient_id')); \$(\"#patient_hn\").val(item[1]); })",
			 'methodChain'=>".result(function(event,item){ \$(\"#OrderCustomerForm_patient_id\").val(item[2]);})",
             ));
	

	echo CHtml::activeHiddenField($order, 'patient_id'); ?>
	
	<br/><br />
	<?php echo CHtml::link('Browse Patient', $this->createUrl('patient/')); ?>
	
</fieldset>
</td>
</tr>
</table>
<?php /* Flash Errors */
	if ($order->getErrors()) 
		echo sprintf('<div id="flash" class="ui-state-error ui-corner-all"><span>%s</span>%s</div>', 
						'<span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>',
						CHtml::error($order,'customer_id'));
?>
<script> <?php /* reset patient_id if patient field changed */ ?>
$(document).ready(function(){
	$("#OrderCustomerForm_patient_name").change(function() {
			$("#OrderCustomerForm_patient_id").val('');
		});
});
</script>