<?php

$this->breadcrumbs=array(
	'Clinicians'=>array('index'),
	$model->full_name=>array('view','id'=>$model->id),
	'Update',
);
$this->menu=array(
	array('label'=>'Create Clinician', 'url'=>array('create')),

);

?>

<h1>Update Clinician <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form', array('clinician'=>$model)); ?>