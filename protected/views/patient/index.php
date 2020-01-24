<?php
$this->breadcrumbs=array(
	'Patients',
);

$this->menu=array(
	array('label'=>'Create Patient', 'url'=>array('create')),

);
?>


<h1>Patients</h1>
<?php if(Yii::app()->session['user.type'] != 'CLINICIAN'):?>
<a href="<?php echo $this->createUrl('patient/create'); ?>">Create</a>
<?php endif;?>
<?php $this->widget('zii.widgets.grid.CGridView', array(
	'dataProvider'=>$dataProvider,
	'columns'=>array(
		array('name'=>'Patient','value'=> '$data->name','type'=>'raw'),
		array('name'=>'HN','value'=> '$data->viewLinkWithHN()','type'=>'raw'),
		array('name'=>'Customer','value'=> '$data->customer->hospital->name','type'=>'raw'),
	),
	'enableSorting'=>true,
	'template' => '{summary} {pager} <table>{items}</table> {pager}'
)); ?>

<script>
YUI().use('yui2-button', function (Y) {
		var YAHOO = Y.YUI2;
		var button = new YAHOO.widget.Button("new-order");
		

})
</script>