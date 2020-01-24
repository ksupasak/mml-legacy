<?php
$this->pageTitle=Yii::app()->name . ' - Invoice Detail';
$this->breadcrumbs=array(
	'Customer Billing'=>array( 'accounting/CustomerBilling?customer='.$invoice->customer->id),
	'Invoice Detail');
?>

<H1>Invoice # <?php echo $invoice->id; ?></H1>

<p>
Invoice Date: <?php echo $invoice->updated; ?>
</p>

<table>
<tr>
	<th>Order ID</th>
	<th>Customer Account</th>
	<th>Order Price</th>
</tr>
<?php foreach( $invoice->orders as $order): ?>
	<tr>
		<td> <?php echo $order->order->uuid; ?>						</td>
		<td> <?php echo $order->order->customer->account_name; ?>	</td>
		<td> <?php echo $order->order->quote_price; ?>				</td>
	</tr>
<?php endforeach; ?>
<tr>
	<td colspan="3"><hr /></td>
</tr>
<tr>
	<td colspan="2">Invoice total amount</td>
	<td><?php echo $invoice->credit; ?></td>
</tr>
</table>

<?php echo CHtml::link('Cancel', $this->createUrl('/accounting/CancelInvoice?invoice='.$invoice->id)); ?>
