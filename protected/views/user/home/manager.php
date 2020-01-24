<?php
$this->pageTitle=Yii::app()->name . ' - Login';
$this->breadcrumbs=array(
	'Clinician Home',
);
?>

<?php echo CHtml::link('Product List', $this->createUrl('product/')); ?>
<?php echo CHtml::link('New Order', $this->createUrl('order/NewOrder')); ?>

<div class="grid_5 alpha">
<h1>Recent Orders</h1>
	<div id="recent-orders"></div>
	<a href="">View All</a>
</div>
<div class="grid_5 omega">
<h1>Recent Patients</h1>
	<div id="recent-patients"></div>
	<a href="">View All</a>
</div>

<script>
YUI().use('datatable', 'datasource', function (Y) {

var hiligher = function (o) {
    var item  = o.record.getValue("type");
	if ( item == 'etc.') {
		o.tr.setStyle('background', 'red');
	}
    return item;
};

var cols = [ 
		{key:"order_uuid", label:"Order No.", sortable: true} ,
		{key:"status", label:"Status",sortable: true} ,
		{key:"order_requested", label:"Requested", sortable: true},
	];
var data = [
    {order_uuid:'<a href="order/1">ga-3475</a>', status:"Recieved", patient:'นาย ก.', hospital:'รามา', order_requested:"<?php echo date('D jM h:i A', time()-360*100) ?>"},
    {order_uuid:'<a href="order/2">01-123-1112</a>', status:"Canceled", patient:'นาย ด.', hospital:'ศิริราช', order_requested:"<?php echo date('D jM h:i A', time()-360*300) ?>"},
    {order_uuid:'<a href="order/3">43-125-1550</a>', status:"Approved", patient:'นาย ถ.', hospital:'กรุงเทพ', order_requested:"<?php echo date('D jM h:i A', time()-360*500) ?>"}
];

var myData = new Y.DataSource.Get({
    source: "getUpdates"
}); 
myData
    .plug(Y.Plugin.DataSourceJSONSchema, {
        schema: {
            resultListLocator: "query.results.Result",
            resultFields: ["Title", "Phone", "Rating.AverageRating"]
        }
    })
    .plug(Y.Plugin.DataSourceCache, {
        max: 3
    });

// Creates recent orders DataTable 
var table = new Y.DataTable.Base({
	caption: "Current Orders",
    columnset: cols,
    recordset: data,
	plugins: [ Y.Plugin.DataTableSort ]
	});
table.plug(Y.Plugin.DataTableDataSource, {datasource: myData})
table.render("#recent-orders");

var cols = [ 
		{key:"patient", label:"Patient",sortable: true} ,
		{key:"hospital", label:"Hospital", sortable: true},
		{key:"order_uuid", label:"Order No.", sortable: true} ,
	];
// Creates recent patients DataTable 
var table = new Y.DataTable.Base({
	caption: "Recent Patients",
    columnset: cols,
    recordset: data,
	plugins: [ Y.Plugin.DataTableSort ]
	});
table.plug(Y.Plugin.DataTableDataSource, {datasource: myData})
table.render("#recent-patients");
})
</script>

