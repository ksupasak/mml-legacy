<div class="form grid_12">
<?php echo CHtml::beginForm(); ?>
<?php echo CHtml::errorSummary($model); ?>


<div class="grid_3 alpha">
<center><IMG src="<?php echo Yii::app()->request->baseUrl; ?>/images/512-odbc-administrator.png" /></center>
</div>
<div class="grid_4 ">
<fieldset>
	<legend>Product Information</legend>
   




<?php	// Product Name 
		echo CHtml::activeLabel($model,'display_name');
		echo CHtml::activeTextField($model,'display_name', array('size'=>30)); ?>
<br/> 
<?php	// Product Name 
		echo CHtml::activeLabel($model,'label');
		echo CHtml::activeTextField($model,'label', array('size'=>30)); ?>
<br/>   
<?php	// Product Code
		echo CHtml::activeLabel($model,'code');
		echo CHtml::activeTextField($model,'code', array('size'=>30)); ?>
<br/>     
<?php 	// Product Category
		echo CHtml::activeLabel($model,'category_id');
		echo CHtml::activeDropDownList($model, 'category_id', Category::model()->productCategoryOptions()); ?><br/>
<?php	// Product Note
		echo CHtml::activeLabel($model,'note');
		echo CHtml::activeTextArea($model,'note', array('size'=>30,'rows'=>5,'cols'=>30)); ?><br/>
<?php	// Product Name 
		echo CHtml::activeLabel($model,'product_name');
		echo CHtml::activeTextField($model,'product_name', array('size'=>30)); ?><br/>
<?php	// Product Name 
		echo CHtml::activeLabel($model,'manufacture');
		echo CHtml::activeTextField($model,'manufacture', array('size'=>30)); ?><br/>
<?php	// Product Name 
		echo CHtml::activeLabel($model,'appearance');
		echo CHtml::activeTextField($model,'appearance', array('size'=>30)); ?><br/>
<?php	// Product Name 
		echo CHtml::activeLabel($model,'assay');
		echo CHtml::activeTextField($model,'assay', array('size'=>30)); ?><br/>
<?php	// Product Note
		echo CHtml::activeLabel($model,'pharmacology');
		echo CHtml::activeTextArea($model,'pharmacology', array('size'=>30,'rows'=>5,'cols'=>50)); ?><br/>
<?php	// Product Note
		echo CHtml::activeLabel($model,'safety');
		echo CHtml::activeTextArea($model,'safety', array('size'=>30,'rows'=>5,'cols'=>50)); ?><br/>
<?php	// Product Note
		echo CHtml::activeLabel($model,'description');
		echo CHtml::activeTextArea($model,'description', array('size'=>30,'rows'=>5,'cols'=>30)); ?><br/>
<?php	// Product Formula
		echo CHtml::activeLabel($model,'percent_active');
		echo CHtml::activeTextField($model,'percent_active', array('size'=>20)); ?>  ( 1.0 = 100% )<br/>
<?php	// Product Formula
		echo CHtml::activeLabel($model,'minimum');
		echo CHtml::activeTextField($model,'minimum', array('size'=>20)); ?> <br/>
<?php	// Product Expired
   		echo CHtml::activeLabel($model,'expired_at');
		echo CHtml::activeTextField($model,'expired_at', array('size'=>20)); ?>
		<?php	// Default Consume Time
		 ?><br/>
<?php	// Product Excluded
   	
		echo CHtml::activeCheckBoxList($model, 'excluded', array(1=>'Excluded'), array('template'=>'{label} {input}','separator'=>'<br/>'));
?>		<br/>
<?php	// Product Soldout
   	
		echo CHtml::activeCheckBoxList($model, 'soldout', array(1=>'Soldout'), array('template'=>'{label} {input}','separator'=>'<br/>'));
?>
</fieldset>
</div>
<script>
	$.datepicker.setDefaults({dateFormat: 'yy-mm-dd'});
	$("#Product_expired_at").ready().datepicker();
</script>

<?php 
	/* Inventory: 
	 *    if create, enter initial inventory 
	 *    if update, display current inventory and last update, and link to Update Stock
	 */
	if ($this->add)	$this->renderPartial('_newInventory', array('model'=>$model));
	if ($this->update) 	$this->renderPartial('_viewInventory', array('model'=>$model));
?>

<div class="grid_4 ">

<fieldset>
	<legend>Calculation Formula (Price)</legend>

<?php if (Yii::app()->session['user.type'] == 'ADMIN') {?>
	
<?php	// Product Formula
		echo CHtml::activeLabel($model,'price_base');
		echo CHtml::activeTextField($model,'price_base', array('size'=>20)); ?>  ( $PRICE in formula ) 
<br />
<?php	// Product Formula
		echo CHtml::activeLabel($model,'price_formula');
		echo CHtml::activeTextArea($model,'price_formula', array('rows'=>5,'cols'=>30)); ?><br/>
<?php	// Product Formula Variable
		echo CHtml::activeLabel($model,'price_var');
		echo CHtml::activeTextField($model,'price_var', array('size'=>30)); ?> ( $QUANTITY in formula )
<br />
<label>&nbsp;</label>
<button id="price-formula-test" class="">Test</button>

<?php	// Product Formula Variable
		echo CHtml::activeLabel($model,'price_test_calc');
		echo CHtml::activeTextField($model,'price_test_calc', array('size'=>10, 'disabled'=>true)); ?> (test output)

<?php  }else{ 
	echo 'Not available, please contact adminstration';
} ?>


</fieldset>


</div>

<div class="grid_4 ">
<fieldset>
	<legend>Calculation Formula (Volume)</legend>
<?php	// Product Formula
		echo CHtml::activeLabel($model,'volume_base');
		echo CHtml::activeTextField($model,'volume_base', array('size'=>20)); ?>  ( $UNIT / WEIGHT ) 
<br />
	<?php	// Product Formula
		echo CHtml::activeLabel($model,'volume_formula');
		echo CHtml::activeTextArea($model,'volume_formula',array('rows'=>5,'cols'=>30)); ?>	<br />
		( How many UNIT in 1 gram of product? )		
		<br/> 
<?php	// Product Formula Variable
		echo CHtml::activeLabel($model,'volume_var');
		echo CHtml::activeTextField($model,'volume_var', array('size'=>30)); ?> <br />
		( How many gram will this amount of unit weigh? )
<br />
<label>&nbsp;</label>
<button id="volume-formula-test" class="">Test</button>

<?php	// Product Formula Variable
		echo CHtml::activeLabel($model,'volume_test_calc');
		echo CHtml::activeTextField($model,'volume_test_calc', array('size'=>10, 'disabled'=>true)); ?> (test output)
</fieldset>
</div>
<div class="grid_4">
<fieldset>
	<legend>Instruction</legend>
<style>
ul.consume_time { display: inline; position: relative; }
ul.consume_time li { float: left; padding-right:1em; list-style:none; text-align:center; vertical-align:center; }
</style>

<?php	// Recommended Dosage
		echo CHtml::activeLabel($model,'recommended_dosage');
		echo CHtml::activeTextField($model,'recommended_dosage', array('size'=>30)); ?><br/>
<?php 	// Product Unit
		echo CHtml::activeLabel($model,'unit_id');
		echo CHtml::activeDropDownList($model, 'unit_id', Unit::model()->productUnitOptions()); ?><br/>

<label for="Product_default_consume_time">เวลารับประทาน</label><br />
<?php	// Default Consume Time
		echo CHtml::activeCheckBoxList($model, 'default_consume_time', ConsumeTime::checkboxListOptions(), array('template'=>'{label} {input}','separator'=>'<br/>'));
 ?>
</fieldset>
</div>

<div class="grid_6 omega">
	<button id="update-product" class="" type="submit">Update</button>
	<a href="" id="update-reset" class="">Reset</a>
	<a href="ManageProducts" id="back" class="">Back</a>
</div>

<?php echo CHtml::endForm(); ?>
</div>



<script>
YUI().use('yui2-button', function (Y) {
		var YAHOO = Y.YUI2;
		var button = new YAHOO.widget.Button("update-product");
		var button = new YAHOO.widget.Button("update-reset");
		var button = new YAHOO.widget.Button("back");

		var button = new YAHOO.widget.Button("price-formula-test", { onclick: { fn: RunPriceFormula} });
		var button = new YAHOO.widget.Button("volume-formula-test", { onclick: { fn: RunVolumeFormula} });
})

function RunPriceFormula() {
	$.post('<?php echo $this->createUrl('product/PriceFormulaTest'); ?>', 
			{ price: $("#Product_price_base").val() , 
			  formula: $("#Product_price_formula").val() , 
			  quantity: $("#Product_price_var").val() 
			},
			function(res) {
				$("#Product_price_test_calc").val(res);
			}
	);
}
function RunVolumeFormula() {
	$.post('<?php echo $this->createUrl('product/VolumeFormulaTest'); ?>', 
			{ 
			  volume: $("#Product_volume_base").val() , 
			  formula: $("#Product_volume_formula").val() , 
			  quantity: $("#Product_volume_var").val() 
			},
			function(res) {
				$("#Product_volume_test_calc").val(res);
			}
	);
}
</script>

<?php $this->renderPartial('/site/ajax-load'); ?>