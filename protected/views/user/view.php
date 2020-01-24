<?php
$this->breadcrumbs=array(
	'Users'=>array('ManageUsers'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List User', 'url'=>array('ManageUsers')),
	array('label'=>'Create User', 'url'=>array('create')),
	array('label'=>'Update User', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete User', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage User', 'url'=>array('admin')),
);
?>

<h1>View User #<?php echo $model->id; ?></h1>

<?php 
if ( isset($model->pin) ){
	$pin = $model->pin->pin;
} else {
	$pin = '';
}
$this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'username',
		'display_name',
		'full_name',
		'email',
		'type',
		array('name'=>'PIN', 'value'=> $pin, 'encode'=>false ),
	),
)); ?>
<?php echo CHtml::link('Update', $this->createUrl('Update', array('id'=>$model->id))); ?>
