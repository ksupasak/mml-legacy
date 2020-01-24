<?php
$this->pageTitle=Yii::app()->name . ' - '.$product->display_name;
$this->breadcrumbs=array(
		'Manage Products'=>array('ManageProducts'),
		'Product Detail'
	);
?>
<h1><?php echo $product->display_name; ?></h1>
<?php $row = '<tr><td>%s</td><td>%s</td></tr>'; ?>
<table>
<?php
	echo sprintf($row, 'ID', $product->id);
	echo sprintf($row, 'Name', $product->display_name);
	echo sprintf($row, 'Code', $product->code);
	echo sprintf($row, 'Category (id)', $product->category->name.' ('.$product->category->id.')');
	echo sprintf($row, 'Unit (id)', $product->unit->display_name.' ('.$product->unit->id.')');
	echo sprintf($row, 'Recommend Dosage', $product->recommended_dosage);
	echo sprintf($row, 'Default Consume Time', ConsumeTime::toString($product->default_consume_time));
	echo sprintf($row, 'Note', $product->note);
?>
</table>