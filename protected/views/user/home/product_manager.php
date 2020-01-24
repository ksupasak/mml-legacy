<h1 id="welcome" >Welcome</h1>
<div class="grid_3 alpha">
	<h3><img src="<?php echo $this->createUrl('/images/icon/items.png'); ?>"/>Products</h3>
	<ul>
		<li><a href="product/ManageProducts">Manage Products</a></li>
		<li><a href="product/AddProduct">Add Product</a></li>
	</ul>
</div>

<div class="grid_3 omega">
	<h3><img src="<?php echo $this->createUrl('/images/icon/reports.png'); ?>" ALIGN="middle" />Manager Reports</h3>
	<ul>
		<li><?php echo CHtml::link('Report', $this->createUrl('/reports/index')); ?></li>
   </ul>

</div>

<?php
Yii::app()->clientScript->registerCss('xx1',
        '.app-mainmenu-group {
					float: left; width: 16em;
                }
        '); //must set .ui-progressbar-value in order to animate
?>

<?php
