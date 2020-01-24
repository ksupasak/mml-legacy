<h1>My Patients</h1>
<?php
$this->pageTitle=Yii::app()->name . ' - My Orders';
$this->breadcrumbs=array(
	'Manage Orders'=>array('order/ManageOrders'), 
	'My Orders');
	
	$patientList = array();
	foreach ($patients as $patient) {
		$o = new stdClass;
		$o->name = $patient->name; // Patient::linkOrderByPatient($patient->id);
		$o->hn = $patient->hn;     // Clinician::linkOrderByHospital($hospital_id);
	}
?>

<div id="patient-list"></div>

<script>
	YUI().use('datatable', 'datasource', function (Y) {

var formatAction = function (o) {
	var grouping = o.record.getValue("grouping");
	if (grouping !== "item") {
		return "";
	} else {
		return o.record.getValue("actions");
	}
}
var formatInventory = function (o) {
		var inv = o.record.getValue("current_inventory");
		if ( inv ) {
			return inv;
		} else {
			return "";
		}
	}
var formatUnit = function(o) { return skipCategory(o,'unit'); }
var formatConsumeTime = function (o) { return skipCategory(o,'default_consume_time'); }
var formatDosage = function (o) { return skipCategory(o,'recommended_dosage'); }
var formatCode = function (o) { return skipCategory(o,'code'); }
var skipCategory = function (o, key) {
	var grouping = o.record.getValue("grouping");
	if (grouping == "item") {
		return o.record.getValue(key);
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
var data = <?php echo $products; ?>;
var cols = [ 
		{key:"display_name", label:"Product Name", sortable: true, formatter: hilighter},
		{key:"code", label:"Code", formatter: formatCode},
		{key:"recommended_dosage", label: "Recommended<br />Dosage", formatter: formatDosage}, 
		{key:"default_consume_time", label: "Default<br />Consume Time", formatter: formatConsumeTime},
		{key:"unit", label:"Inventory Unit",sortable: true, formatter: formatUnit} ,
		{key:"actions", label:"Action", sortable: true, formatter: formatAction},
	];
var table = new Y.DataTable.Base({
				columnset: cols,
				recordset: data,
				summary: "Product List"
			});
table.render("#patient-list");
});
</script>