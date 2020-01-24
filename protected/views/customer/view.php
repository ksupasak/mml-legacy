<?php
$this->breadcrumbs=array(
	'Customers'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List Customer', 'url'=>array('index')),
	array('label'=>'Create Customer', 'url'=>array('create')),
	array('label'=>'Update Customer', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Customer', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Customer', 'url'=>array('admin')),
);
?>

<h1>View Customer #<?php echo $model->id; ?></h1>
<div>

<img src="<?php echo $model->logo_url; ?>" alt="<?php echo $model->account_name; ?>" />
<?php /* Do not display for clinician */
	    if (!(Yii::app()->session['user.type'] == 'CLINICIAN')):?>
<?php echo CHtml::link('Upload',$this->createUrl('customer/UploadLogo',array('customer'=>$model->id))); ?>
<?php endif;?>
</div>
<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		array(
			'name'=>'hospital',
			'value'=>$model->hospital->name
		),
		'account_name',
		'billing_address',
		array(
			'name'=>'clinician_id',
			'value'=>$model->clinician->full_name
		),
		
	),
)); ?>



<div>
<h3>Patients (<?php echo $customerPatients->totalItemCount; ?>)</h3>
<?php
$this->widget('zii.widgets.grid.CGridView',array(
		'dataProvider'=>$customerPatients
	));
?>
</div>

<h3>Recent Orders</h3>
<?php
$this->widget('zii.widgets.grid.CGridView',array(
		'dataProvider'=>$recentOrders,
		'columns' => array(
			array('name'=>'Requested', 'value'=>'$data->displayRequestedDateTime()'),
			array('name'=>'Status / Last Updated', 'value'=>'$data->latestStatus()', 'type'=>'raw'),
			array('name'=>'ID', 'value'=>'$data->updateLink()', 'type'=>'raw'),
			array('name'=>'Clinician', 'value'=>'$data->clinicianInfo()', 'type'=>'raw'),
			array('name'=>'Patient', 'value'=>'$data->patient->name', 'type'=>'raw'),
			array('name'=>'Amount', 'value'=>'$data->amount', 'type'=>'raw')
			
		)
	));
?>
