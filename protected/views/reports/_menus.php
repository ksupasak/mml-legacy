<script language="JavaScript" src="<?php echo $this->createUrl('/FusionChartsFree/JSClass/FusionCharts.js');?>"></script>

<div class="grid_3 omega">
	<h3><img src="<?php echo $this->createUrl('/images/icon/reports.png'); ?>" ALIGN="middle" />Manager Reports</h3>
	<ul>
		<?php if(User::authorize('admin')):?>
		<li><?php echo CHtml::link('Order Report', $this->createUrl('/reports/orderSummary')); ?></li>
		<li><?php echo CHtml::link('Clinician Order Report', $this->createUrl('/reports/clinicianSummary')); ?></li>
		<li><?php echo CHtml::link('Clinician Product Report', $this->createUrl('/reports/clinicianProductSummary')); ?></li>
		<li><?php echo CHtml::link('Inventory Report', $this->createUrl('/reports/inventorySummary')); ?></li>
		<li><?php echo CHtml::link('Patient Report', $this->createUrl('/reports/patientSummary')); ?></li>
		
		<?php endif ?>
		<li><?php echo CHtml::link('Product Usage Summary', $this->createUrl('/reports/productSummary')); ?></li>
		
		

 
  </ul>

</div>