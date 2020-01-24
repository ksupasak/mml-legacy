<h1>New Order</h1>

<?php echo CHtml::errorSummary($order); ?>

<?php
$this->pageTitle=Yii::app()->name . ' - New Order';
$this->breadcrumbs=array(
	'Manage Orders'=>array('ManageOrders'), 
	'New Order');
?>

<?php echo CHtml::beginForm(); ?>
<?php  $this->renderPartial('_orderSummary', array('order'=>$order)); ?>


<div id="product-list" class="form grid_9 alpha" style="float:left;" >	
	<?php $this->renderPartial('_sheet',array('order'=>$order,'product'=>Product::model(),'category'=>Category::model())); ?>	
</div>

<div class="form grid_3  omega">
	<div style="padding-left:10px;margin:0px">
	<?php $this->renderPartial('_orderSheetDetail',array('order'=>$order)); ?>
	<?php $this->renderPartial('_orderSheetDetailPricing',array('order'=>$order)); ?>
</div></div>

<?php echo CHtml::endForm(); ?>