<?php
$this->breadcrumbs=array(
	'Units',
);

$this->menu=array(
	array('label'=>'Create Unit', 'url'=>array('create')),

);
?>

<h1>Units</h1>

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'dataProvider'=>$dataProvider,
	'columns'=>array(
		array('name'=>'Unit', 'value'=>'$data->display_name'),
		array('name'=>'Sort Rank', 'value'=>'$data->display_rank'),
		array('name'=>'Gram Conversion','value'=>'$data->gram_conversion_factor')
	)
)); ?>
