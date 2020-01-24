<?php
$this->breadcrumbs=array(
	'Clinicians',
);

$this->menu=array(
	array('label'=>'Create Clinician', 'url'=>array('create')),

);
?>

<h1>Clinician</h1>

<?php 
$dataProvider->pagination->pageSize = 25;

$columns = array(
	array(
		'name'=>'Name',
		'value'=>'$data->full_name'
	),
	array(
		'name'=>'Hospital',
		'value'=>'$data->hospital->name'
	),
	array(
		'name'=>'User Account',
		'value'=>'$data->user->username'
	));


	if(User::authorize('manage')):
	array_push($columns,
		array(            // display a column with "view", "update" and "delete" buttons
        'class'=>'CButtonColumn',
    ));
	endif;


$this->widget('zii.widgets.grid.CGridView',array(
	'dataProvider' => $dataProvider,
	'columns' => $columns,
	'enableSorting'=>true,
	'template' => '{summary}<br />{pager}<br />{items}<br />{pager}<br />{summary}',
)); ?>