<?php
$this->breadcrumbs=array(
	'Hospitals',
);

$this->menu=array(
	array('label'=>'Create Hospital', 'url'=>array('create')),

);
?>

<h1>Manage System Hospitals</h1>

<?php
$dataProvider->pagination->pageSize = 25;
$this->widget('zii.widgets.grid.CGridView',array(
	'dataProvider' => $dataProvider,
	'columns' => array(
        'name',
		'province',
		array('class'=>'CButtonColumn')
	),
	'enableSorting'=>true,
	'template' => '{summary}<br />{pager}<br />{items}<br />{pager}<br />{summary}',
));