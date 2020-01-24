<?php 

$this->widget('zii.widgets.grid.CGridView', array(
		'dataProvider'=>$customers->search(),
		'columns' => array(
			'account_name',
			array('name'=>'Hospital', 'value'=>'$data->hospital->name'),
			array('name'=>'Completed Orders', 'value'=>'$data->countCompletedOrders()'),
			array('name'=>'Invoice Due', 'value'=>'$data->sumInvoiceDue()'),
			array('name'=>'Next Due', 'value'=>'$data->sumNextDue()'),
			array('name'=>'Over Due', 'value'=>'$data->sumOverDue()'),
			'balance',
			array('name'=>'Actions','value'=>'$data->viewBillsLink()','type'=>'raw')
		)
	))?>