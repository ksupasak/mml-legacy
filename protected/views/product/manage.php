<?php
$this->pageTitle=Yii::app()->name . ' - Manage Products';
$this->breadcrumbs=array(
		'Manage Products'=>array('ManageProducts') 
	);
?>
<h1>Manage Products</h1>
<div  style="float:right;">
	<a href="AddProduct" id="new-product">New Product</a>
</div>
<div class="clear">
	
</div>


<?php $this->renderPartial('_dir',array('product'=>Product::model(),'category'=>Category::model())); ?>

<hr>
<script>
YUI().use('yui2-button', function (Y) {
		var YAHOO = Y.YUI2;
		var button = new YAHOO.widget.Button("new-product");

})
</script>

<?php /*
<div id="product-list" >
<?php $this->renderPartial('_list'); ?>
</div>

*/
?>