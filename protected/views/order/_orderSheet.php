<?php 
if (!isset($orderitems)) {
	$orderitems = OrderItem::listAsJson();
}

?>
<style type="text/css" media="screen">
	 #cell{
		width:100%;
		text-align:center;
	}
	#cell input, #cell label{
		display:inline;
	
	}
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
		o.tr.setStyle('background', '#000');
		o.tr.setStyle('color','#fff');
		html = "<em><b>"+html+"</b></em>";
	}
	if ( item == 'category') {
		o.tr.setStyle('font-weight', 'bold');
		o.tr.setStyle('background', '#ccc');
		o.tr.setStyle('color','#000');
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
table.render("#product-list");
});
</script>

<?php /*
<div id="accordion">
	<?php 
		$list = json_decode($orderitems);
		foreach ($list as $item): ?>
			<?php if ($item->grouping=='category') :?>
				<h3><a href="#"><?php echo $item->display_name; ?></a></h3>
				<div>
					<?php ?>
				
				</div>
			<?php endif; ?>
	<?php endforeach; ?>
</div>
<script>
$(document).ready(function(){
	$("#accordion").accordion();

	$('.accordion .head').click(function() {
		$(this).next().toggle();
		return false;
	}).next().hide();
});
</script>

*/