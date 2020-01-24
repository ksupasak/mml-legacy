<?php $this->renderPartial('_menus'); ?>
<div class="clear">
</div>
<h1>Customer Summary</h1>

<table width="98%" border="0" cellspacing="0" cellpadding="3" align="center">
  <tr> 
    <td valign="top" class="text" align="center"> <div id="chartdiv" align="center"> 
        FusionCharts. </div>
      <script type="text/javascript">
		   var chart = new FusionCharts("<?php echo $this->createUrl('/FusionChartsFree/Charts/FCF_StackedColumn2D.swf');?>", "ChartId", "900", "600");
		   chart.setDataURL("<?php echo $this->createUrl('/reports/customerData',array());?>");		   
		   chart.render("chartdiv");
		</script> </td>
  </tr>
  <tr>
    <td valign="top" class="text" align="center">&nbsp;</td>
  </tr>
</table>