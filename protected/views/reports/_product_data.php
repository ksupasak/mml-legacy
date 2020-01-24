<?php if($_GET['type']!='current'){?>
<graph xaxisname="Month" yaxisname="Weight (g)" hovercapbg="DEDEBE" hovercapborder="889E6D" rotateNames="0" yAxisMaxValue="100" numdivlines="9" divLineColor="CCCCCC" divLineAlpha="80" decimalPrecision="0" showAlternateHGridColor="1" AlternateHGridAlpha="30" AlternateHGridColor="CCCCCC" caption="<?php echo $title?>" subcaption="">
<categories font="Arial" fontSize="11" fontColor="000000">
<?php  foreach ($products as $p) { ?>
<category name="<?php echo $p['display_name'];?>    " />
<?php } ?>
</categories>
<?php 
$color = array('AFD8F8','F6BD0F','8BBA00','FF8E46','008E8E','D64646','8E468E','588526','B3AA00','008ED6','9D080D','A186BE');

$c=0;
foreach ($range as $r) { 
?>	
<dataset seriesname="<?php echo $r['date'];?>" color="<?php echo $color[$c]; ?>">
<?php  foreach ($products as $p) { 
	$map = $list[$p['id']];
	if(isset($map[$r['date']])){
		$i = $map[$r['date']];
	}else{
		$i = NULL;
	}
	
if(isset($i)&&$i['check_out']>0){
?><set value="<?php echo $i['check_out']?>"/>
<?php }else{?><set value="0"/>
<?php }} ?>
</dataset>
<?php 
$c+=1;
} ?>
</graph> 
<?php }else{?>
	<graph xaxisname="Month" yaxisname="Amount" hovercapbg="DEDEBE" hovercapborder="889E6D" rotateNames="0" yAxisMaxValue="100" numdivlines="9" divLineColor="CCCCCC" divLineAlpha="80" decimalPrecision="0" showAlternateHGridColor="1" AlternateHGridAlpha="30" AlternateHGridColor="CCCCCC" caption="Current Inventory" subcaption="">
	<categories font="Arial" fontSize="11" fontColor="000000">
		<?php  foreach ($products as $p) { ?>
		<category name="<?php echo $p['display_name'];?>    " />
		<?php } ?>
	</categories>
	<?php 
	$color = array('AFD8F8','F6BD0F','8BBA00','FF8E46','008E8E','D64646','8E468E','588526','B3AA00','008ED6','9D080D','A186BE');
	
	?>
		
	<dataset seriesname="Current Inventory" color="<?php echo $color[8]; ?>">
	<?php  foreach ($products as $p) { 
		$value=0;
		if($p['stock_balance']>0){
			$value = $p['stock_balance'];
		}
	?><set value="<?php echo $value;?>"/>
	<?php } ?>
	</dataset>
	<dataset seriesname="Usage 3 months" color="<?php echo $color[9]; ?>">
	<?php  foreach ($products as $p) {
			$value=0;
			if($p['amount']>0){
				$value = $p['amount'];
			} 
	?><set value="<?php echo $value;?>"/>
	<?php } ?>
	</dataset>
	</graph>	
<?php } ?>
