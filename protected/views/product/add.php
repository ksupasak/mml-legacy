<h1>Add Product</h1>
<p>สร้างผลิตภัณฑ์ใหม่</p>
<?php
$this->pageTitle=Yii::app()->name . ' - New Product';
$this->breadcrumbs=array(
	'Manage Products'=>array('ManageProducts'), 
	'New Product');
?>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>

