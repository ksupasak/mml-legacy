<?php 
  ($index % 2) ? $css="odd" : $css="even"; 
  $inv = Inventory::model()->getByProduct($data); // blank Inventory if no record.
?>
<tr class="<?php echo $css; ?>">

	<td id="product_<?php echo $data->id?>_name">
	<?php // Show display_name and link to update
		echo CHtml::link($data->display_name,
						 $this->createUrl('product/UpdateProduct', array('id'=>$data->id))); ?>
	</td>
	<td id="product_<?php echo $data->id?>_code">
	<?php echo $data->code; ?>
	</td>
	<td>
	<?php echo $inv->updated; ?><br />
    <?php echo $inv->remarks; ?>
	</td>
	<td>
    <?php
		echo sprintf('%s %s',number_format($inv->count,2),'g'); ?>
	</td>
	<td>
	<?php echo $inv->updateTextField(); ?>
    <br />
    <?php echo $inv->viewStockLink($data->id); ?>
	</td>
</tr>