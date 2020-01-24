
<?php 

// 
// var_dump($range);
// 
// var_dump($usage);



?>

<?php $this->renderPartial('_menus');

	$date =  date('Y-m-d');
	if(isset($_GET['date']))$date = $_GET['date'];
	$month = array(1,2,3,4,5,6,7,8,9,10,11,12);
?>
<hr/>


<form  action="" >
<label for="">Date</label><input type="text" name="date" value="<?php echo $date; ?>" id="">
<input type="submit" value="Submit"></input>
</form>

<?

$alt='&asc';

if(isset($_GET['asc'])){
	$alt='&';
	
}

?>
<style type="text/css" media="screen">
	th{
		border-bottom:1px solid
	}
	.number{
		color:blue;
		text-align:right;
	}
	
</style>

<table border="1">
<tr><th><a href="?sort=display_name<?php echo $alt;?>">Products</a></th><th><a href="?sort=price_base<?php echo $alt;?>">Price Base</a></th><th>Minimum</th><th><a href="?sort=amount<?php echo $alt;?>">Inventory(System)</a></th><th><a href="?sort=total<?php echo $alt;?>">Total</a></th>
<?
foreach ($range as $r) { 
  echo "<th>".$r."</th>";	
}
?>	
<th>Sum</th>	
<?php  

$total_amount = 0;

//var_dump($products);

foreach ($products as $p) { 
$amount = $p->amount;	
$total_amount += $p->amount * $p['price_base'];
?>
<tr >
	<td><?php echo $p['display_name'];?></td>
	<td><?php echo $p['price_base']?></td>
	<td><?php echo $p['minimum']?></td>
	
	<?php if($amount < $p['minimum']):?>
	<td style="text-align:right;color:red"><?php echo number_format($amount,3)?></td>
	<?php else: ?>
	<td style="text-align:right"><?php echo number_format($amount,3)?></td>
	<?php endif ?>
	<td style="text-align:right"><?php echo number_format($amount * $p['price_base'],2);?></td>
	<?
	$sum = 0;
	foreach ($range as $r) { 
	 $i = $usage[$p->id][$r]['check_out'];
	  $sum+=$i;	
	  echo "<td class='number'>".number_format($i,3)."</td>";	
	}
	?>
	<td class="number"><u><?php echo number_format($sum,3); ?></u></td>
</tr>
<?php } ?>
<tr><td></td><td></td><td>Total</td><td></td><td style="text-align:right"><?php echo number_format($total_amount,2); ?></td></tr>
</table>

<?php echo $_GET['sort']; ?>