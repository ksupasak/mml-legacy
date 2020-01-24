<?php
$this->breadcrumbs=array(
	'Customers',
);

$this->menu=array(
	array('label'=>'Create Customer', 'url'=>array('create')),

);
?>

<h1>Customers</h1>

<?php 
$dataProvider->pagination->pageSize = 40;

$this->widget('zii.widgets.grid.CGridView',array(
	'dataProvider' => $dataProvider,
	'columns' => array(
		'account_name',
		array(
			'name'=>'hospital',
			'value'=>'$data->hospital->name'
		),
		'logo_url',
		array(            // display a column with "view", "update" and "delete" buttons
            'class'=>'CButtonColumn',
        ),

	),
	'enableSorting'=>true,
	'template' => '{summary}<br />{pager}<br />{items}<br />{pager}<br />{summary}',
)); ?>
