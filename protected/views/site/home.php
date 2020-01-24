<h1 id="welcome" >Welcome</h1>
<div class="grid_3 alpha">
	<h3><img src="<?php echo $this->createUrl('/images/icon/items.png'); ?>"/>Products</h3>
	<ul>
		<li><a href="product/ManageProducts">Manage Products</a></li>
		<li><a href="product/AddProduct">Add Product</a></li>
	</ul>
</div>

<div class="grid_3">
	<h3><img src="<?php echo $this->createUrl('/images/icon/sales.png'); ?>" ALIGN="middle" />Orders</h3>
	<ul>
		
	    <li><a href="<?php echo $this->createUrl('order/ManageOrders'); ?>">Manage Orders</a></li>
		<li><a href="order/SelectCustomer">Add Order</a></li>
		<li><a href="order/Query">Query Orders </a></li>
	</ul>
</div>
<div class="grid_3">
	<h3><img src="<?php echo $this->createUrl('/images/icon/suppliers.png'); ?>" ALIGN="middle" />Manufacture</h3>
	<ul>
		<li><a href="manufacture/ManageOrders">Manage Orders</a></li>
		<li><a href="<?php echo $this->createUrl('manufacture/UpdateStock'); ?>">Manage Inventory</a></li>
	</ul>
</div>
<div class="grid_3 omega">
	<h3><img src="<?php echo $this->createUrl('/images/icon/giftcards.png'); ?>" ALIGN="middle" />Account &amp; Delivery</h3>
	<ul>
		<li><a href="<?php echo $this->createUrl('/delivery/ManageDelivery'); ?>">Manage Delivery</a></li>
		
		<li><a href="<?php echo $this->createUrl('/accounting/ManageBillings'); ?>">Manage Account</a></li>
	</ul>

</div>
<hr />
<!-- <div class="grid_12"></div> -->

<div class="grid_3 alpha">
	<h3><img src="<?php echo $this->createUrl('/images/icon/config.png'); ?>" ALIGN="middle" />Manage Data</h3>
	<ul>
		<li><a href="<?php echo $this->createUrl('/hospital/'); ?>">Hospital</a></li>
		<li><a href="<?php echo $this->createUrl('/clinician/'); ?>">Clinician</a></li>
		<li><a href="<?php echo $this->createUrl('/customer/'); ?>">Customer</a></li>
		<li><a href="<?php echo $this->createUrl('/patient/'); ?>">Patient</a></li>
		<li><a href="<?php echo $this->createUrl('/category/'); ?>">Category</a></li>
		<li><a href="<?php echo $this->createUrl('/unit/'); ?>">Unit</a></li>
		<li><a href="<?php echo $this->createUrl('/status/'); ?>">Status</a></li>
	</ul>	
</div>

<div class="grid_3">
	<h3><img src="<?php echo $this->createUrl('/images/icon/customers.png'); ?>" ALIGN="middle" />Administration</h3>
	<ul>
		<li><a href="<?php echo $this->createUrl('/user/ManageUsers'); ?>">Manage Users</a></li>
		<li><a href="<?php echo $this->createUrl('/admin/ViewLogs'); ?>">View Logs</a></li>
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
