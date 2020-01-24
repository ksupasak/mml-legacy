


<?php $this->renderPartial('_menus'); ?>
<div class="clear">
</div>
<h1>Product Summary</h1>


<a href="productSummary">Usage Order</a> | 

<a href="productSummary?type=frequency">Frequency Order</a> | 

<a href="productSummary?type=current">Current Inventory</a>


<?php if(isset($_GET['type'])&&$_GET['type']=='current'){?>
<table width="98%" border="0" cellspacing="0" cellpadding="3" align="center">
  <tr> 
    <td valign="top" class="text" align="center"> <div id="chartdiv" align="center"> 
        FusionCharts. </div>
      <script type="text/javascript">
		   var chart = new FusionCharts("<?php echo $this->createUrl('/FusionChartsFree/Charts/FCF_StackedBar2D.swf');?>", "ChartId", "900", "2500");
		   chart.setDataURL("<?php echo $this->createUrl('/reports/productData',array('type'=>'current'));?>");		   
		   chart.render("chartdiv");
		</script> </td>
  </tr>
  <tr>
    <td valign="top" class="text" align="center">&nbsp;</td>
  </tr>
</table>
<?php }else{
	if(isset($_GET['type'])&&$_GET['type']=='frequency'){
		?>
		
		
		<table width="98%" border="0" cellspacing="0" cellpadding="3" align="center">
		  <tr> 
		    <td valign="top" class="text" align="center"> <div id="chartdiv" align="center"> 
		        FusionCharts. </div>
		      <script type="text/javascript">
				   var chart = new FusionCharts("<?php echo $this->createUrl('/FusionChartsFree/Charts/FCF_StackedBar2D.swf');?>", "ChartId", "900", "2500");
				   chart.setDataURL("<?php echo $this->createUrl('/reports/productData',array('type'=>'high-freq'));?>");		   
				   chart.render("chartdiv");
				</script> </td>
		  </tr>
		  <tr>
		    <td valign="top" class="text" align="center">&nbsp;</td>
		  </tr>
		</table>

		<table width="98%" border="0" cellspacing="0" cellpadding="3" align="center">
		  <tr> 
		    <td valign="top" class="text" align="center"> <div id="chartdiv-2" align="center"> 
		        FusionCharts. </div>
		      <script type="text/javascript">
				   var chart = new FusionCharts("<?php echo $this->createUrl('/FusionChartsFree/Charts/FCF_StackedBar2D.swf');?>", "ChartId", "900", "2500");
				   chart.setDataURL("<?php echo $this->createUrl('/reports/productData',array('type'=>'low-freq'));?>");		   
				   chart.render("chartdiv-2");
				</script> </td>
		  </tr>
		  <tr>
		    <td valign="top" class="text" align="center">&nbsp;</td>
		  </tr>
		</table>
		
		<?php 
		
	}else{

?>

<table width="98%" border="0" cellspacing="0" cellpadding="3" align="center">
  <tr> 
    <td valign="top" class="text" align="center"> <div id="chartdiv" align="center"> 
        FusionCharts. </div>
      <script type="text/javascript">
		   var chart = new FusionCharts("<?php echo $this->createUrl('/FusionChartsFree/Charts/FCF_StackedBar2D.swf');?>", "ChartId", "900", "2500");
		   chart.setDataURL("<?php echo $this->createUrl('/reports/productData',array('type'=>'high'));?>");		   
		   chart.render("chartdiv");
		</script> </td>
  </tr>
  <tr>
    <td valign="top" class="text" align="center">&nbsp;</td>
  </tr>
</table>

<table width="98%" border="0" cellspacing="0" cellpadding="3" align="center">
  <tr> 
    <td valign="top" class="text" align="center"> <div id="chartdiv-2" align="center"> 
        FusionCharts. </div>
      <script type="text/javascript">
		   var chart = new FusionCharts("<?php echo $this->createUrl('/FusionChartsFree/Charts/FCF_StackedBar2D.swf');?>", "ChartId", "900", "2500");
		   chart.setDataURL("<?php echo $this->createUrl('/reports/productData',array('type'=>'low'));?>");		   
		   chart.render("chartdiv-2");
		</script> </td>
  </tr>
  <tr>
    <td valign="top" class="text" align="center">&nbsp;</td>
  </tr>
</table>

<?php }}?>