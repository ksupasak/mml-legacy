<?php $this->renderPartial('_menus'); ?>
<div class="clear">
</div>
<h1>Clinician Order Summary</h1>

<form action="clinicianSummary" method="post">
	<select name="customer_id">
		<?php foreach( $customers as $c){?>
	  <option label="<?php echo $c['account_name'];?>" <?php if(isset($_POST['customer_id'])&&$_POST['customer_id']==$c['id']){echo 'selected="selected"';}?> ><?php echo $c['id'];?></option>
	 <?php }?>
	</select>	
<input type='submit' value='Submit'/>	
</form>

<?php if($_POST){?>
<table width="98%" border="0" cellspacing="0" cellpadding="3" align="center">
  <tr> 
    <td valign="top" class="text" align="center"> <div id="chartdiv" align="center"> 
        FusionCharts. </div>
      <script type="text/javascript">
		   var chart = new FusionCharts("<?php echo $this->createUrl('/FusionChartsFree/Charts/FCF_StackedColumn2D.swf');?>", "ChartId", "600", "600");
		   chart.setDataURL("<?php echo $this->createUrl('/reports/clinicianData',array('customer_id'=>$_POST['customer_id']));?>");		   
		   chart.render("chartdiv");
		</script> </td>
  </tr>
  <tr>
    <td valign="top" class="text" align="center">&nbsp;</td>
  </tr>
</table>
<?php }?>
<style type="text/css" media="screen">
	td{
		border:1px solid;
	}
</style>
<table font="Arial" fontSize="11"  fontColor="000000">
<tr><td>Clinician</td>
<?php  foreach ($range as $m) { ?>
<td> <?php echo $m['date'];?> </td>
<?php } ?><td>Total</td>
</tr>
<?php 

$color = array('AFD8F8','F6BD0F','8BBA00','FF8E46','008E8E','D64646','8E468E','588526','B3AA00','008ED6','9D080D','A186BE');

$c=0;

foreach ($clinicians as $clinician) { 
	$row=0;
	$map = $list[$c];
   
?>	
<?php //echo var_dump($map)?>
<tr><td><?php echo $clinician['full_name'];?></td>
<?php  foreach ($range as $m) {
  if(isset($map[$m['date']])){
   
	 $order = $map[$m['date']];
	 $row += $order['amount'];
?><td><?php echo $order['amount'];?></td>
<?php }else{?><td>-</td>
<?php }} ?><td><?php echo $row; ?>
</tr>
<?php 
$c+=1;
} ?>

</table>