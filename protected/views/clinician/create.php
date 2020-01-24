<?php
$this->breadcrumbs=array(
	'Clinicians'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Clinician', 'url'=>array('index')),
		
);
?>

<h1>Create Clinician</h1>

<?php echo $this->renderPartial('_form', array('clinician'=>$clinician)); ?>