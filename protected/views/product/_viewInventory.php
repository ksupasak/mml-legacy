<div class="grid_4 ">
<fieldset>
	<legend>Inventory</legend>
<?php	// Product Inventory (initial)
		echo CHtml::label('Current Inventory','initial_inventory');
		echo CHtml::textField('current_inventory', $model->getCurrentInventory(true), array('size'=>40, 'readonly'=>true)); ?><br/>

<?php 
		echo Inventory::model()->updateStockLink($model->id); ?>
</fieldset>
</div>