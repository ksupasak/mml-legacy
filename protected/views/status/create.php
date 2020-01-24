<?php
$this->breadcrumbs=array(
	'Statuses'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Status', 'url'=>array('index')),

);
?>

<h1>Create Status</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>