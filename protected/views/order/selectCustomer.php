<h1>New Order </h1>
<p><i>Step 1 : Select customer</i></p>
<?php
$this->pageTitle=Yii::app()->name . ' - New Order';
$this->breadcrumbs=array(
	'Manage Orders'=>array('ManageOrders'), 
	'New Order');
?>


<?php echo CHtml::beginForm(); ?>
<div style="border:0px solid;width:400px">

<?php echo CHtml::activeLabel($order,'customer_id'); ?><br/>
<?php echo CHtml::activeDropDownList($order,'customer_id',Customer::dropdownOptions(), 
		array(
			'template'=>'{label} {input}', 'separator'=>' ', 'encode'=>true,'style'=>'font-size:1.5em;background:#eee'
			));  
?>			<br/>
			* Hospitals
<br/>
<br/>

</div>
<div style="">
	<button id="new-order" class="yui-button" type="submit" >Next &raquo;</button>
</div>
<?php echo CHtml::endForm(); ?>
<script>
	YUI().use('yui2-button', function(Y){
		var YAHOO = Y.YUI2;
		var button = new YAHOO.widget.Button("new-order");

	});
</script>