<?php 
?>

<fieldset>
    <p><label for="from">From:</label> <input type="text" name="from" id="from" size="8" />
	   <label for="to">To:</label> <input type="text" name="to" id="to" size="8" /></p>
	<p><label for="status">Status:</label> <select name="status" id="status"><option value="0">--select--</option></select>
	   <button id="filter-button" class="yui-button">Filter</button></p>
</fieldset>

<script>
	$(document).ready(function() {
		$( "#from" ).datepicker();
		$( "#to" ).datepicker();
	});

	YUI().use('yui2-button', function(Y) {
		var YAHOO = Y.YUI2;
		var button = new YAHOO.widget.Button("filter-button");

	});
</script>

