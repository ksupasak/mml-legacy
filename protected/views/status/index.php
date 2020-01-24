<?php
$this->breadcrumbs=array(
	'Statuses',
);

$this->menu=array(
	array('label'=>'Create Status', 'url'=>array('create')),
	
);
?>

<h1>Statuses</h1>

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'dataProvider'=>$dataProvider,
	'columns'=>array(
		array('name'=>'Name', 'value'=>'$data->name'),
		array('name'=>'Icon', 'value'=>'$data->iconImage()','type'=>'raw'),
		array('name'=>'Remarks','value'=>'$data->remark')
	)
)); ?>