<h2>System Logs</h2>

<h3>User Logs</h3>
<p>delete products, new products, edit products</p>
<?php 
	$this->widget('zii.widgets.CListView', array(
		'dataProvider'=>$userLog,
		'itemView'=>'//site/_logItem'
		)
	); ?>
	
<h3>Order Logs</h3>
<?php 
	$this->widget('zii.widgets.CListView', array(
		'dataProvider'=>$orderLog,
		'itemView'=>'//site/_logItem'
		)
	); ?>