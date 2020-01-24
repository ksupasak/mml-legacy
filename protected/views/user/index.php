<h1>Manage System Users</h1>
<p>
<?php echo CHtml::link('Create New User', $this->createUrl('AddUser')); ?>
</p>
<?php
$this->pageTitle=Yii::app()->name . ' - Manage Users';
$this->breadcrumbs=array(
	'System Administration', 
	'Manage Users');
	
$dataProvider =$model->search();
$dataProvider->pagination->pageSize = 25;
$this->widget('zii.widgets.grid.CGridView',array(
	'dataProvider' => $dataProvider,
	'columns' => array(
        'id',
		'username',
		'email',
		'type',
		array(
		'name'=>'pin',
		'value'=>'$data->pin->pin'
		),
		array(
		'name'=>'customer',
		'value'=>'$data->customer->account_name'
		),
		array('class'=>'CButtonColumn')
	),
	'enableSorting'=>true,
	'template' => '{summary}<br />{pager}<br />{items}<br />{pager}<br />{summary}',
));