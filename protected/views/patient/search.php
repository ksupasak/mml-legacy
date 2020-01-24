<?php

$this->widget('zii.widgets.jui.CJuiAutoComplete', array(
	'name'=>'Quotation_patientName',
	'value'=>'...type patient name...',
	'source'=>$this->createUrl('/patient/autocompleteName'),
	'options'=>array(
			'showAnim'=>'fold',
			'select'=>'js:function(event, ui) {
							//fillPatientInfo( {name:$("#Quotation_patientName").val()} );
							console.log("here"); console.log(event); console.log(ui.item);
							alert("done"+ ui.item.label);}'
	),
));
