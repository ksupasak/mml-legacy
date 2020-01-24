<?php
	$payments = Payment::listAsJson();
?>
<script>
	YUI().use('datatable', 'datasource', 'yui2-button', function (Y) {

var formatAction = function (o) {
	var grouping = o.record.getValue("grouping");
	if ((grouping == "top") || (grouping == "category")){
		return  "";
	}
	var html = "";
	var id = o.record.getValue("id");
	var actions = [ {t:"ViewProduct?productId="+id, u:'list.gif'},
					{t:"EditProduct?productId="+id, u:"edit_action.gif"},
					{t:"DeleteProduct?productId="+id, u:"action4.gif"} ];
	for (i in actions) {
		html += '<a class="action_btn" href="'+actions[i].t+'"><img src="<?php echo $this->createUrl('/images/icon/'); ?>'+'/'+actions[i].u+'" alt="'+actions[i].t+'" /></a>'+" ";
	} 
	return html;
}
var formatInventory = function (o) {
		var inv = o.record.getValue("current_inventory");
		if ( inv ) {
			return inv;
		} else {
			return "";
		}
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
var data = <?php echo $payments; ?>;
var pmtBtn = '<button id="make-payment" class="yui-button">Pay</button>';
var cols = [ 
		{key:"updated", label:"อัพเดทล่าสุด", sortable: true},
		{key:"status", label:"Status", sortable: true},
		{key:"order_uuid", label:"Order No.", sortable: true},
		{key:"clinician", label:"Clinician",sortable: true},
		{key:"total_amount", label:"Total Charge"},
		{key:"balance", label:"Balance " + pmtBtn}, 
		{key:"actions", label:"Action"},
	];
var table = new Y.DataTable.Base({
				columnset: cols,
				recordset: data,
				summary: "Product List"
			});
table.render("#payment-list");

	var YAHOO = Y.YUI2;
	var button = new YAHOO.widget.Button("make-payment");
	
});
</script>