<h1 id="welcome" >Manufacture Home</h1>
<div class="grid_3 alpha">
	<h3><img src="<?php echo $this->createUrl('/images/icon/items.png'); ?>"/>Products</h3>
	<ul>
		<li><a href="product/ManageProducts">Products</a></li>
	</ul>
</div>
<div class="grid_3">
	<h3><img src="<?php echo $this->createUrl('/images/icon/suppliers.png'); ?>" ALIGN="middle" />Manufacture</h3>
	<ul>
		<li><a href="manufacture/ManageOrders">Manage Orders</a></li>
		<li><a href="<?php echo $this->createUrl('manufacture/UpdateStock'); ?>">Manage Inventory</a></li>
	</ul>
</div>

