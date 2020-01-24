<?php
	//$orders = Order::listAsJson();
?>
<script>
YUI().use('datatable', 'datasource', 'yui2-button', function (Y) {

var hiligher = function (o) {
    var item  = o.record.getValue("type");
	if ( item == 'etc.') {
		o.tr.setStyle('background', 'red');
	}
    return item;
};

var cols = [ 
		{key:"updated", label:"อัพเดทล่าสุด", sortable: true} ,
		{key:"status", label:"สถานะ",sortable: true} ,
		{key:"order_uuid", label:"Order No."},
		{key:"clinician_hospital", label:"Clinician (Hospital)", sortable: true},
		{key:"total_amount",label:"ราคา"},
		{key:"request_received", label:"วันเวลาสั่งซื้อ", sortable: true},
		{key:"actions", label:"Action"}
	];

var data = <?php echo $orders; ?>;


// Creates a DataTable 
var table = new Y.DataTable.Base({
	caption: "Current Orders",
    columnset: cols,
	recordset: data,
	plugins: [ Y.Plugin.DataTableSort ]
	});
	table.render("#order-list");

	var YAHOO = Y.YUI2;
	var button = new YAHOO.widget.Button("new-order");

	$(".action-approve").each( function() {
		var button = new YAHOO.widget.Button(this.id);
	});
	$(".action-cancel").each( function() {
		var button = new YAHOO.widget.Button(this.id);
	});
})
</script>