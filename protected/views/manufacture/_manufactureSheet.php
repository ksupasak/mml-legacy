<?php
	$orderitems = $order->getItemsAsJson();
?>
<style>
</style>
<script>
	YUI().use('datatable', 'datasource', function (Y) {
var formatConsumeTime = function(o) {
	var ct = o.record.getValue("consume_time");
	if (ct) { return ct; } else { return ""; }
}
var formatOrderPerDay = function(o) {
	var opd = o.record.getValue("order_per_day");
	if (opd) { return opd; } else { return ""; }
}
var formatRecommendDosage = function (o) {
		var rec = o.record.getValue("recommended_dosage");
		if ( rec ) {return rec;} else { return ""; }
	}
var hilighter = function (o) {
    var item  = o.record.getValue("grouping");
	var html = o.record.getValue("display_name");
	if ( item == 'top') {
		o.tr.setStyle('background', '#808000');
		html = "<em><b>"+html+"</b></em>";
	}
	if ( item == 'category') {
		o.tr.setStyle('font-weight', 'bold');
		o.tr.setStyle('font-size', '1.3em');
		html = "<b>"+html+"</b>";
	}
    return html;
};
var data = <?php echo $orderitems; ?>;
var cols = [ 
		{key:"display_name", label:"Product Name", sortable: true, formatter: hilighter} ,
		{key:"recommended_dosage", label:"Recommended<br />Dosage (Unit)", formatter: formatRecommendDosage} ,
		{key:"order_per_day", label:"Order / Day", formatter: formatOrderPerDay},
		{key:"comsume_time", label:"เวลารับประทาน", formatter: formatConsumeTime}
	];
var table = new Y.DataTable.Base({
				columnset: cols,
				recordset: data,
				summary: "Product List"
			});
table.render("#item-list");
});
</script>