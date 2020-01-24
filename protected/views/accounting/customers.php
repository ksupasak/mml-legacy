<table>
	<tr>
		<th>Customer ID</th>
		<th>Account Name</th>
		<th>Total Orders</th>
		<th>Balance</th>
	</tr>
<?php

$this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$customer,
	'itemView'=>'_customer',
	'template'=>'{summary} {pager}{items}<tr><td>{pager} {summary}</td></tr>'
));

?>
</table>