<?php
$this->breadcrumbs=array(
	'Categories',
);

$this->menu=array(
	array('label'=>'Create Category', 'url'=>array('create')),

);
?>

<h1>Categories</h1>

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'dataProvider'=>$dataProvider,
	'columns'=>array(
		array('name'=>'Name', 'value'=>'$data->name'),
		array('name'=>'Parent Category', 'value'=>'$data->parentName()'),
		array('name'=>'Sort Rank', 'value'=>'$data->sel_rank'),
		array('class'=>'CButtonColumn'),	
	),
	'enableSorting'=>true,
	'template' => '{summary}<br />{pager}<br />{items}<br />{pager}<br />{summary}',
));
