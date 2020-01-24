<?php
$this->breadcrumbs=array(
	'Customers'=>array('index'),
	$customer->id=>array('view','id'=>$customer->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List Customer', 'url'=>array('index'))
);
?>

<h1>Update Customer <?php echo $customer->id; ?></h1>

<?php echo $this->renderPartial('_form', array('customer'=>$customer)); ?>

<?php echo $this->renderPartial('_updatePatient', array('customer'=>$customer)); ?>