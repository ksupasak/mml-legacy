<?php
$this->breadcrumbs=array(
	'Clinicians'=>array('index'),
	$model->id,
);


$this->menu=array(
	array('label'=>'Create Clinician', 'url'=>array('create')),

);

?>
<h1>View Clinician #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'full_name',
		array(
			'name'=>'hospital_id',
			'value'=>$model->hospital->name
		),
		array(
			'name'=>'user_id',
			'value'=>$model->user->username
		),
		'email_to',
		'cc_to',
		'bcc_to'
		)
		));
	
?>
