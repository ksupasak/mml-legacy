<?php
$this->breadcrumbs=array(
	'Hospitals'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Hospital', 'url'=>array('index')),
		
);
?>

<h1>Create Hospital</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>