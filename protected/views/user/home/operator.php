<h1 id="welcome" >Welcome</h1>

<div class="grid_3 alpha">
	<h3><img src="<?php echo $this->createUrl('/images/icon/items.png'); ?>"/>Products</h3>
	<ul>
		<li><a href="product/ManageProducts">Products</a></li>
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
