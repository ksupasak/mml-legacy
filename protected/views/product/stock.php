<h1>Inventory Stock</h1>
<?php
$this->breadcrumbs=array(
	'Manage Product'=>$this->createUrl('product/ManageProducts'),
	$product->display_name=> $this->createUrl('product/ViewProduct',array('id'=>$product->id)),
	'Inventory'
); ?>

<style>
#inventory-history, #inventory-update { margin: 0 auto; padding-left: 1em; }
#inventory-history { max-width: 30em; }
</style>

<h3><?php echo $product->display_name; ?></h3>
<p>Current Stock: <b><?php echo number_format($product->stock_balance,2); ?></b> g | Display Unit: <?php echo $product->unit->display_name; ?></p>

<div id="inventory-history" class="left">
<h3>History</h3>
<?php $this->widget('zii.widgets.grid.CGridView', array(
		'dataProvider'=>$inventory->filter(),
		'columns'=> array(
			array('name'=>'Date/Time','value'=>'$data->updated'),
			array('name'=>'Count','value'=>'number_format($data->count,2)'),
			array('name'=>'In','value'=>'number_format($data->in,2)'),
			array('name'=>'Out','value'=>'number_format($data->out,2)'),
			array('name'=>'Remarks','value'=>'$data->remarks'),
			array('name'=>'Operator','value'=>'$data->operator->username'),
		)
	)); 
?>
* Compound (g) and Dispense (capsules or packages)
</div>

<div id="inventory-update" class="form left">
<h3>Update Form</h3>
<?php echo CHtml::beginForm('','POST', array('name'=>'up')); ?>
<?php echo CHtml::errorSummary($inventory); ?>

<?php	// Product Name 
		echo CHtml::activeLabel($inventory,'product_name');
		echo CHtml::textField('product_name', $product->display_name , array('size'=>60, 'readonly'=>true)); 
		echo CHtml::activeHiddenField($inventory, 'product_id');
		?>

<?php	// Count
		echo CHtml::activeLabel($inventory,'count');
		echo CHtml::activeTextField($inventory,'count', array('size'=>30)); ?>
		
<?php	// Remarks 
		echo CHtml::activeLabel($inventory,'remarks');
		echo CHtml::activeTextArea($inventory,'remarks', array('cols'=>30, 'rows'=>5)); ?>
<?php 		
	//	echo CHtml::activeLabel($inventory,'operator');
	//	echo CHtml::activeTextField($inventory,'operator', array('size'=>30));

		?>

<?php	// Operator -- enter PIN to verify ?>
<br/>
<?php echo CHtml::button('Update Inventory',array('onclick'=>'javascript:confirm();')); ?>
<?php echo CHtml::endForm(); ?>

<style> #confirm { display: none; } </style>
<div id="confirm" title="Update Inventory?">
	<p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>Confirm the inventory update?</p>
</div>
<script>
	function confirm() {
		// a workaround for a flaw in the demo system (http://dev.jqueryui.com/ticket/4375), ignore!
		$( "#dialog:ui-dialog" ).dialog( "destroy" );
	
		$( "#confirm" ).dialog({
			resizable: false,
			height:140,
			buttons: {
				"Update Inventory": function() {
					$( this ).dialog( "close" );
					document.up.submit();
				},
				Cancel: function() {
					$( this ).dialog( "close" );
				}
			}
		});

	}
</script>
</div>