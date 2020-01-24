<style>
#admin-override {
	position: absolute;
	border: 1pa solid #666;
	top: 0em; right: 1em;
	background:#eed;
	text-align:right;
	padding:5px;
}
</style>
<div id="admin-override">
<?php 
	// Admin hack
	if ( $this->currentUser() && $this->currentUser()->isType('ADMIN') || $this->currentUser()->isType('OPERATOR') ) {
		if (isset($order->status) && isset($order->status->id) ) {
			$current_status = $order->status->id;
		} else {
			$current_status = 0;
		}
		echo 'Overide status to : ';
		echo CHtml::dropDownList('save',$current_status, Status::dropDownOptions(), array(
						'onchange'=>'javascript:submit();', 'encode'=>false) );
		echo ' <br />(for Administrator and Operator only)';
	}
?></div>