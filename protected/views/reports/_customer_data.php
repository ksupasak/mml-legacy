<graph xaxisname="Month" yaxisname="Amount" hovercapbg="DEDEBE" hovercapborder="889E6D" rotateNames="0" yAxisMaxValue="100" numdivlines="9" divLineColor="CCCCCC" divLineAlpha="80" decimalPrecision="0" showAlternateHGridColor="1" AlternateHGridAlpha="30" AlternateHGridColor="CCCCCC" caption="Customer Report" subcaption="">
<categories font="Arial" fontSize="11" fontColor="000000">
<?php  foreach ($range as $m) { ?>
<category name="<?php echo $m['date'];?>" hoverText="Total:<?=$m['amount']?>"/>
<?php } ?>
</categories>
<?php 
$color = array('AFD8F8','F6BD0F','8BBA00','FF8E46','008E8E','D64646','8E468E','588526','B3AA00','008ED6','9D080D','A186BE');

$c=0;
foreach ($clinicians as $clinician) { 
	$map = $list[$c];
?>	
<dataset seriesname="<?php echo $clinician['username'];?>" color="<?php echo $color[$c]; ?>">
<?php  foreach ($range as $m) { 
	$order = $map[$m['date']] ;
  if(isset($order)){
?><set value="<?php echo $order['amount'];?>"/>
<?php }else{?><set value="0"/>
<?php }} ?>
</dataset>
<?php 
$c+=1;
} ?>

</graph>