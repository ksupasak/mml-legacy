<?
   $customer = Customer::getFromUser(Yii::app()->session['user.id']);

?><h1 id="welcome" >Nurse UI : <?php echo  $customer->account_name;?> </h1>

<div class="grid_3 alpha">
	<h3><img src="<?php echo $this->createUrl('/images/icon/customers.png'); ?>" ALIGN="middle" />New Patient</h3>
	<ul>
		
	 
		<a href="<?php echo $this->createUrl('/patient/Create');?>" type="submit" id="new-order">New Patient</a>
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
         
        

		$criteria = new CDbCriteria();
		$criteria->together = true; // ADDED THIS

			$criteria->condition = "customer_id=:c_id";
			$criteria->params=array(':c_id'=>$customer->id);


			$data =  new CActiveDataProvider('Patient',array(
				'criteria'=>$criteria,
				'pagination'=>array(
						'pageSize'=>20
				),
			));	
	
			$this->widget('zii.widgets.grid.CGridView', array(
			'dataProvider'=>	$data,
			'template' => '	{pager} {items} {summary}',
			'columns' => array(array('name'=>'Patient', 'value'=>'$data->viewLink()','type'=>'raw'),)
            )); ?>
</div>

<div class="grid_9 alpha">
	<h3><img src="<?php echo $this->createUrl('/images/icon/sales.png'); ?>" ALIGN="middle" />Recent Orders</h3>

	<?php 
        
			

		$criteria = new CDbCriteria();
		$criteria->together = true; // ADDED THIS

		$criteria->condition = "customer_id=:c_id";
		$criteria->params=array(':c_id'=>$customer->id);


		$data =  new CActiveDataProvider('Order',array(
			'criteria'=>$criteria,
			'pagination'=>array(
					'pageSize'=>20
			),
		));	


          $this->widget('zii.widgets.grid.CGridView', array(
			'dataProvider'=>	$data,
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