
<?php

$result = $order->calculateManufacture();
$consume = $result['consume'];




// var_dump($result);

$name =  $order->status->name;
if($name=='complete'){
$name='completed';
}

?>
<h1>Update Order #<?php echo $order->uuid; ?> (<?php echo $name; ?>)</h1>

Calculation Supports
<hr/>

<?php echo CHtml::errorSummary($order); ?>

<?php
$this->pageTitle=Yii::app()->name . ' - Update Order ('.$order->uuid.')';
$this->breadcrumbs=array(
	'Manage Orders'=>array('ManageOrders'), 
	'Update Order');
?>

<?php echo CHtml::beginForm(); ?>
<?php $this->renderPartial('_adminOverride', array('order'=>$order));?>
<?php $this->renderPartial('_orderSummary', array('order'=>$order)); ?>

<h3>Product Selection</h3>

<div id="product-list" class="form grid_9 alpha" style="float:left" >
	<?php  if(isset($order->customer->discount) &&($order->status_id == Status::REQUEST &&!(Yii::app()->session['user.type'] == 'CLINICIAN')) || $order->status_id == Status::PENDING): ?>	
	
	<div class="setbackground">
	<fieldset>
	<?php
	
		$list = array();
	    $dis = array(0,0,0,0,0,0,0,0,0,0,0) ;
		if(isset($order->customer->discount)&&$order->customer->discount!='')$dis = explode(',',$order->customer->discount);
		
		for ($i = 1; $i <= 6; $i++) {
				$days = 30*$i;
				$discount = floatval($dis[$i-1])/100;
				$amount = $order->calculatetotalAmount($days,$discount);
				$total_amount = sprintf('%.2f',ceil($amount * 1.07 +  ($order->additional_charge)));
				$monthly = sprintf('%.2f',$total_amount / ( $days / 30 ));
				$daily = sprintf('%.2f',$total_amount / $days);
		    $list[$i] = array(0=>$days,1=>$discount,2=>$total_amount,3=>$monthly,4=>$daily);
		}
	
		
	
	?>
	
	
	
	
	<legend>Price List</legend>
	<table border="1" cellspacing="5" cellpadding="5">
		<tr align="right"><th>Order</th>
		<?php 	for ($i = 1; $i <= 6; $i++){ ?>	
			<th><?php echo $list[$i][0]; ?> Days</th>
		<?php }?>
		</tr>
		<tr><th>Discount</th>
		
				<?php 	for ($i = 1; $i <= 6; $i++){ ?>	
					<td><?php echo $list[$i][1]*100; ?>%</td>
				<?php }?>
		</tr>
		<tr><th>Total</th>
				<?php 	for ($i = 1; $i <= 6; $i++){ ?>	
					<td><?php echo $list[$i][2]; ?></td>
				<?php }?>
		</tr>
		<tr><th>Monthly AVG</th>
				<?php 	for ($i = 1; $i <= 6; $i++){ ?>	
					<td><?php echo $list[$i][3]; ?></td>
				<?php }?>
		</tr>
		<tr><th>Daily AVG</th>
				<?php 	for ($i = 1; $i <= 6; $i++){ ?>	
					<td><?php echo $list[$i][4]; ?></td>
				<?php }?>
		</tr>
	</table>	

	</fieldset>
	
	
	</div>
	
	<div class="setbackground">
	<fieldset>
		<legend>Sachet Info</legend>
		
	<?php 
	echo 'Morning : '.$consume[0].'<br/>';
	echo 'Midday : '.$consume[1].'<br/>';
	echo 'Evening : '.$consume[2].'<br/>';
	echo 'Bedtime : '.$consume[3].'<br/>';
	?>
	
	</fieldset>
	
	
	</div>
	<?php endif;?>
	
	<?php $this->renderPartial('_sheet',array('order'=>$order,'product'=>Product::model(),'category'=>Category::model())); ?>	
</div>

<div class="form grid_3 omega">
	<div style="padding-left:10px;margin:0px">
		<?php $this->renderPartial('_orderSheetDetail',array('order'=>$order)); ?>
        <?php $this->renderPartial('_orderSheetDetailPricing',array('order'=>$order)); ?>
</div></div>

<?php echo CHtml::endForm(); ?>

<?php
    /* Make form read-only for clinician if already confirmed */
      if ($order->status_id >= Status::CONFIRMED) :?>
<script>
    $("input").each(function(){
        $(this).attr("readonly","readonly");
        });
</script>
<?php endif; ?>
<div class="clear"></div>
