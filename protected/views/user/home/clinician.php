<?
   $customer = Customer::getFromUser(Yii::app()->session['user.id']);
   $clinician = Clinician::model()->find('user_id=:user_id',array(':user_id'=>Yii::app()->session['user.id']));


?><h1 id="welcome" >Clinician : <?php echo  $clinician->full_name;?> </h1>

<div class="grid_3 alpha">
	<h3><img src="<?php echo $this->createUrl('/images/icon/sales.png'); ?>" ALIGN="middle" />New Order</h3>
	<ul>
		
	 
		<a href="<?php echo $this->createUrl('/order/SelectCustomer');?>" type="submit" id="new-order">New Order</a>
	</ul>
</div>
<!--
<div class="grid_3">
	<h3><img src="<?php echo $this->createUrl('/images/icon/giftcards.png'); ?>" ALIGN="middle" />Account &amp; Delivery</h3>
	<ul>
		<li><a href="<?php echo $this->createUrl('/accounting/ManageBillings'); ?>">Manage Account</a></li>
	</ul>

</div>
-->

<div class="clear">
	
</div>

<div class="grid_3 alpha">

	<h3><img src="<?php echo $this->createUrl('/images/icon/customers.png'); ?>" ALIGN="middle" />Recent Patients</h3>
	<?php 
          $orders = $clinician->recentPatients();
        	
		$this->widget('zii.widgets.grid.CGridView', array(
			'dataProvider'=>	$orders,
			'template' => '	{pager} {items} {summary}',
			'columns' => array(
                array('name'=>'Patient', 'value'=>'$data->viewLink()','type'=>'raw'),
                      )
            )); ?>
</div>

<div class="grid_9 alpha">
	<h3><img src="<?php echo $this->createUrl('/images/icon/sales.png'); ?>" ALIGN="middle" />Recent Orders</h3>
	
	<?php 
          $orders = $clinician->recentOrders();
          $this->widget('zii.widgets.grid.CGridView', array(
			'dataProvider'=>	$orders,
			'template' => '	{pager} {items} {summary}',
			'columns' => array(
                array('name'=>'Updated', 'value'=>'$data->latestStatus()', 'type'=>'raw'),
                array('name'=>'Order ID','value'=>'$data->updateLink()', 'type'=>'raw'),
                array('name'=>'Clinician', 'value'=>'$data->clinician->full_name','type'=>'raw'),
                array('name'=>'Patient', 'value'=>'$data->patient->viewLink()','type'=>'raw'),
                // array('name'=>'Price',		'value'=>'number_format($data->amount_total,2)'),
                array('name'=>'Requested',	'value'=>'date("d/m/y / H:i",strtotime($data->request_received))', 'type'=>'raw')	
                        )
            )); ?>
</div>
<script>
YUI().use('yui2-button', function (Y) {
		var YAHOO = Y.YUI2;
		var button = new YAHOO.widget.Button("new-order");
		

})
</script>