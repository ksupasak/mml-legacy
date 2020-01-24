<table>
<?php foreach($products as $product) :?>
	<tr>
		<td><?php echo $product->grouping; ?></td>
		<td><?php echo $product->display_name ?></td>
	</tr>
<?php endforeach; ?>
</table>