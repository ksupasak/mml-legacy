<div class="grid_4 ">
<fieldset>
	<legend>Inventory</legend>
<?php	// Product Inventory (initial)
		echo CHtml::activeLabel($model,'initial_inventory');
		echo CHtml::activeTextField($model,'initial_inventory', array('size'=>30)); ?><br/>
<?php	// Inventory remarks (initial)
		echo CHtml::activeLabel($model,'initial_inventory_remarks');
		echo CHtml::activeTextarea($model,'initial_inventory_remarks', array('size'=>30,'rows'=>5,'cols'=>30)); ?>
</fieldset>
</div>