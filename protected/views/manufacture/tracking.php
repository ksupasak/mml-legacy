<h1>Tracking Order # <?php echo $order->uuid; ?></h1>
<?php
$this->breadcrumbs=array(
	'Manufacturing'=>$this->createUrl('manufacture/ManageOrders'),
	'Track Order',
); ?>

<style>
#order-summary, #station-update {
	margin: 0 auto; padding-left: 1em; 
}
</style>

<div id="order-summary" class="left">
<h3>Summary</h3>
<table>
	<tr>
		<td>Customer ID</td><td><?php echo $order->customer->account_name; ?></td>
	</tr>
	<tr>
		<td>Clinician</td><td><?php echo $order->clinician->full_name; ?></td>
	</tr>
	<tr>
		<td>Status</td><td><?php echo $order->status->name; ?></td>
	</tr>
</table>



<?php $station = new Station; 
	// temp model
?>
<div id="station-update" class="left">
<h3>Station Update</h3>
<?php /*  Ajax inputs */
echo CHtml::beginForm($this->createUrl('manufacture/UpdateStation'),'POST',array('id'=>'up'));
echo '<input type="hidden" name="order_id" value="'.$order->id.'" />';
$this->renderPartial('_stations', array('previous'=>$previous));  ?><br/>
<p style="padding-left:200px;">
<?php echo CHtml::button('Enter', array('onclick'=>'javascript:verifyPIN()','id'=>'submit','style'=>'vertical-align:text-middle'));?>
<?php echo CHtml::link("Back", $this->createUrl('manufacture/ManageOrders'))?>
</p>

	<div id="confirm">
		<h3>Enter PIN</h3>
		<p><?php echo CHtml::activePasswordField($station, 'pin', array('size'=>4)); ?></p>
		<p><?php echo CHtml::hiddenField('yes', 'OK'); ?></p>
	</div>
	<div id="do-submit">
	
	</div>
</div>
<?php echo  CHtml::endForm(); ?>
<style>
#confirm { display:none; width: 360px; height: 120px; }
#confirm p { font-size: 1.4em; text-align: center; }
#do-submit { display:none; }
</style>

<script>
	window.dialog_confirm = $("#confirm").html();
	window.to_submit = {};
	function verifyPIN() {
			$('#confirm.input["yes"]').focus();
			$('#confirm').dialog( {
				title: "Confirm",
				close: restoreConfirmDialog(), 
				modal: true,
				draggable: false,
				resizable: false,
				buttons: { 
					"Ok": function() { $("#confirm").dialog("close"); confirmPIN(); },
					"Cancel": function() { $(this).dialog("close"); } 
				}
					} )
			 .keyup(function(e){
					if(e.keyCode ==13) {
							confirmPIN();
						}
			});
		}
	function restoreConfirmDialog() {
		$("#confirm").html(window.dialog_confirm);
	}
	function confirmPIN() {
		$.post('UpdateStation', $('input'))
			.error(function(msg) { alert('ajax error!');})
			.success(function(data) { confirmResult($.parseJSON(data));});
	}
	function confirmResult(res) {
		if ( res.status == 'verify' ) {
			updates = '';
			for (i in res.data.Station) {
					updates += 'station: ' + i;
				}
			html = '<h3>Confirm Update</h3>';
			html += '<ul>'; 
			html += '<li>Operator: '+res.user.name+' ('+res.user.type+')</li>';
			html += '<li>Order: <?php echo $order->uuid; ?></li>';
			html += '<li>Updates: '+updates+'</li>';
			html += '</ul>';
			data = $('#up').serialize();
			data += "&operator_id="+res.user.id;
			data += "&confirmed=1";
			$("#do-submit").html(html);
			$("#do-submit").dialog({
					title: "Review",
					close: restoreConfirmDialog(), 
					modal: true,
					draggable: false,
					resizable: false,
					buttons: { 
						"Ok": function() {
							 $.post('<?php echo $this->createUrl("manufacture/UpdateStation") ?>',
									 	data,function(response){
										res = $.parseJSON(response);
										if (res.status == 'saved'){
											window.location='<?php echo $this->createUrl("manufacture/ManageOrders") ?>';
										}
							}); 
						},
						"Cancel": function() { $(this).dialog("close"); } 
					}
			});
			return true;
		} else {
			html = '<h3>PIN Error</h3>';
			html += '<p>'+res.reason+'</p>';
			console.log(this);
		}
		$('#confirm').html(html);
	}
</script>

<?php 
	$criteria = new CDbCriteria;
	$criteria->compare('order_id',$order->id);
	$criteria->order = 'updated DESC';
	$criteria->limit = '10';
	$updateHistory = new CActiveDataProvider('OrderTracking', array(
		'criteria'=>$criteria
	));
	$this->widget('zii.widgets.grid.CGridView', array(
		'dataProvider'=>$updateHistory,
		'columns' => array(
			array('name'=>'Date/Time','value'=>'$data->updated'),
			array('name'=>'Station','value'=>'$data->station->name'),
			array('name'=>'By','value'=>'$data->operator->username'),
			array('name'=>'Remarks','value'=>'$data->remarks'),
		)
	))?>

</div>
