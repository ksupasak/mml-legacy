<?php
$this->pageTitle=Yii::app()->name . ' - Customer Billing';
$this->breadcrumbs=array(
	'Manage Billings'=>$this->createUrl('accounting/ManageBillings'),
	'Customer Billing',
	$customer->id );
?>

<h1>Customer: <?php echo $customer->id." ".$customer->account_name; ?></h1>

<style>
	$tabs { width: 100%; border-bottom: 1px solid; }
	#tabs li {	display: inline; border: 1px solid; margin:0; padding: 0;}
</style>



<?php 
$this->widget('zii.widgets.jui.CJuiTabs', array(
    'tabs'=>array(
        'Orders'=>array(
        			'content'=> $this->renderPartial('_orders', array('orders'=>$orders), true),
        			'id'=>'Orders'
        		),
        'Invoices'=>array(
        			'content'=> $this->renderPartial('_invoices', array('invoices'=>$invoices), true), 
        			'id'=>'Invoices'
        		),
        'Account & Payments'=>array(
        			'content'=> $this->renderPartial('_payments', array('payments'=>$payments, 'transactions'=>$transactions), true),
					'id'=>'Payments'
				),
		),
// additional javascript options for the tabs plugin
    'options'=>array(
        'collapsible'=>true,
		),
));
?>

