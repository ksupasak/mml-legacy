<?php
/**
 *  _alertDataTable
 *  Create datatable using YUI3 widget
 *     - Get json data from Alert model
 */

?>
<div id="updates"></div>
<script>
YUI({ filter: 'raw' }).use('datatable', 'datasource',"datasource-get","datasource-io", "datasource-jsonschema", "datatable-base", "datatable-datasource", function (Y) {
	var cols = [ 
			{key:"updated",label:"อัพเดทล่าสุด", sortable: true}, 
			{key:"order_status",label:"สถานะ", sortable: true}, 
			{key:"order_number",label:"Order No.", sortable: true},
			{key:"order_hospital",label:"Hospital", sortable: true},
			{key:"order_clinician",label:"Clinician", sortable: true}
		];
	var data = <?php echo $orders; ?>;
    table = new Y.DataTable.Base(
		{ columnset: cols , recordset: data, 
		  summary:"Latest Updates", caption:"",
		  plugins: [ Y.Plugin.DataTableSort ]}
	);
    table.render("#updates");
}); 
</script>