<?php echo CHtml::dropDownList('Station', '10', Station::listDropDownOptions()); exit;?>
<h1>Manufacture Order (Order Sheet)</h1>
<h2><?php echo $model->uuid; ?></h2>

<h3>Summary</h3>
<div>STATUS: <?php echo $model->status->name; ?></div>
<div>ACTION: 
	<button>Update Order</button>
	<button>Approve Order</button>
</div>
<div>
	Customer ID:
	<?php echo $model->customer->id; ?>
	Hospital: 
	<?php echo $model->getHospital()->name; ?>
	Doctor: 
	<?php echo $model->customer->getClinician()->full_name; ?>
	Patient:
	<?php echo $model->patient->name; ?>
	
</div>

<?php $model = ManufactureOrder::model()->findByPk($order_id); ?>
<h3>Items</h3>
<?php
	$this->renderPartial('_manufactureSheet', array('order'=> $model));
?>
<div id="item-list" class="grid_12"></div>