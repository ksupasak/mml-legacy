<style>

#tracking-input { float:right; }
#barcode, #pin { font-size: 1.5em; }

</style>
<div id="tracking-input">
<?php 
	echo CHtml::beginForm($this->createUrl('manufacture/Tracking'));
?>
	<?php echo CHtml::label('Order ID : ','barcode'); ?>
	<input id="barcode" name="barcode" type="text" />&nbsp;<input id="barcode_submit" name="barcode_submit" type="submit" value="Submit"/>
</div>
<script>
YUI().use('yui2-button', function (Y) {
		var YAHOO = Y.YUI2;
		var button = new YAHOO.widget.Button("barcode_submit");

})
</script>
<?php 

	echo  CHtml::endForm();
?>
<Style>
	.focus {
		border-color:red;
	}
</Style>
<script>
/* Force input to focus at barcode input every 1 second after out of focus */
 
 $(document).ready(function() {
				$('#barcode').focus();
				$("#barcode").focusout(function(){
					setTimeout("$('#barcode').focus()" , 1000);
				});
 	});


// $(function() { $("#login-user-name").focus(); }); 
 
 $(document.activeElement)  	// current focus
 
 $(document).ready(function() {    

	    $('input').blur(function(){
	                $('input').removeClass("focus");
	        })
	             .focus(function() {                
	                 $(this).addClass("focus")
	        });

	});
	 
</script>

