<h1><?php echo $model->display_name; ?></h1>
<p>Update Product Detail / ปรับปรุงข้อมูลผลิตภัณฑ์</p>
<?php
$this->pageTitle=Yii::app()->name . ' - Update ('.$model->display_name.')';
$this->breadcrumbs=array(
	'Manage Products'=>array('ManageProducts'),
	'Update Product Detail' );
?>
<?php $this->renderPartial('_form', array('model'=>$model)); ?>
