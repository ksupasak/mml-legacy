<?php  

	/* For user type:
	 *   CLINICIAN, CLINICIAN_STAFF
	 *   
	 *   TODO: 	Replace YUI button with Yii CHtml::submitButton. YUI button need to load library from Net which slow down app.			Unknown	Task	1316176661554

	 */


	 
?>

<style>
td button { width: 14em; }
</style>
<?php
	/* Order hasn't been created
	 * Order can save to status 1. Draft or 2. Request
	 */		
	if (!$order->status_id):	?>
          
<?php if ( $this->currentUser()->isType('CLINICIAN') || $this->currentUser()->isType('CLINICIAN_STAFF') ) : ?>
		<button id="send-request" class="" type="submit" name="save" value="<?php echo Status::REQUEST; ?>">Request Quotation  &raquo;</button>
<?php  elseif (User::authorize('manage') || $this->currentUser()->isType('ADMIN') ): ?>
	 <button id="send-request" class="" type="submit" name="save" value="<?php echo Status::REQUEST; ?>">Send Quotation  &raquo;</button>
<?php endif; ?><br/><br/>
  <button id="save-draft" class="" type="submit" name="save" value="<?php echo Status::DRAFT; ?>">Save Draft</button>
            
<?php  
	/* Order is  already a Draft
	 * Order can move to status 1. Draft or 2. Request
	 */
	elseif($order->status_id == Status::DRAFT) : ?>
	<button id="save2" class="" type="submit" name="save" value="<?php echo Status::REQUEST; ?>">Send Request &raquo;</button>
	<br /><br />
    <button id="save1" class="" type="submit" name="save" value="<?php echo Status::DRAFT; ?>">Save Draft</button>
			
<?php  
	/* Order is a Request
	 * Order can move to status 1. Request, 2. Pending
	 * 
	 */
	elseif($order->status_id == Status::REQUEST) : ?>
			<?php  if ( $this->currentUser()->isType('ADMIN') || $this->currentUser()->isType('MANAGER') || $this->currentUser()->isType('OPERATOR')): ?>
        		<button id="save3" class="" type="submit" name="save" value="<?php echo Status::PENDING; ?>">Reply Request &raquo;</button><br/></br/>
			<?php endif; ?>
	<!--		<button id="save1" class="" type="submit" name="save" value="<?php echo Status::DRAFT; ?>">Save Draft</button>
			<br /><br /> 
            <button id="save2" class="" type="submit" name="save" value="<?php echo Status::REQUEST; ?>">Update Request</button><br/>-->

		
<?php  
	/* Order is a Pending
	 * Order can move to status 1. Pending, 2. Confirmed
	 * -- Pending order means the quotation has been created and submited back to doctor. Wait for doctor to confirm
	 */
	elseif($order->status_id == Status::PENDING) : ?>
	<!--<button id="send-request" class="" type="submit" name="save" value="<?php echo Status::CONFIRMED; ?>">Confirm Order &raquo;</button>
     <br /><br />-->
    <button id="save-draft" class="" type="submit" name="save" value="<?php echo Status::PENDING; ?>">Send Revise Quotation</button>


<?php  
	/* Order is a Confirmed
	 * Order can move to status 1. Pending, 2. Processing
	 * --  Confirmed means quotation is finalized and doctor has agreed to buy. At this stage manager can send the order to start manufacture.
	 */
	elseif($order->status_id == Status::CONFIRMED) : ?>
        <?php /* Do not display for clinician */
            if ((Yii::app()->session['user.type'] == 'CLINICIAN')):?>
           <?php echo $order->status->name; ?>
        <?php elseif ( User::authorize('manage') || $this->currentUser()->isType('MANUFACTURE')): ?>
            <button id="send-request" class="" type="submit" name="save" value="<?php echo Status::PROCESSING; ?>">Start Production &raquo;</button>

        <?php endif; ?>
            <?php  
			/* Order is in manufacturing phase
			 * Order can move to status 1. Pending, 2. Processing
			 * --  Confirmed means quotation is finalized and doctor has agreed to buy. At this stage manager can send the order to start manufacture.
			 */
	elseif($order->status_id == Status::PROCESSING) : ?>
 <?php /* Do not display for clinician */
            if ((Yii::app()->session['user.type'] == 'CLINICIAN')):?>
            <?php echo $order->status->name; ?>
        <?php else: ?>   
            <button id="send-request" class="" type="submit" name="save" value="<?php echo Status::COMPLETE; ?>">Complete &raquo;</button>
        <?php endif; ?>
	<?php endif; ?>
	
	<p>
		<br/><br/>
	
	<?php
	if($order->status_id >= Status::PENDING) :
	 echo CHtml::link('Print Confirmation', $this->createUrl('order/PrintQuotation',array('orderId'=>$order->id)),array('target'=>'_blank'));
	 echo "<br/>";
	 echo CHtml::link('Email Confirmation', $this->createUrl('order/PrintEmailQuotation',array('orderId'=>$order->id)),array('target'=>'_blank'));
	 echo "<br/>";
	 echo CHtml::link('Download Confirmation', $this->createUrl('order/DownloadQuotation',array('orderId'=>$order->id)),array());
	
	 endif;
	 ?><br/><br/>
<?php if(User::authorize('manage')){?>
	<?php echo CHtml::link('Send Quotation Note', $this->createUrl('mail/OrderMail',array('orderId'=>$order->id)),array('target'=>'_blank'))?><br/>
	<?php echo CHtml::link('Print Manufactural Order', $this->createUrl('manufacture/PrintManufactureSheet',array('id'=>$order->id)),array('target'=>'_blank'))?><br/>
Print Label SV: <?php echo CHtml::link('TH', $this->createUrl('manufacture/PrintLabel',array('id'=>$order->id)),array('target'=>'_blank'))?> |
	<?php echo CHtml::link('EN', $this->createUrl('manufacture/PrintLabel',array('id'=>$order->id,'lang'=>'en')),array('target'=>'_blank'))?><br/>
Print Label VT: <?php echo CHtml::link('TH', $this->createUrl('manufacture/PrintLabel',array('id'=>$order->id,'type'=>'VT')),array('target'=>'_blank'))?> |
	<?php echo CHtml::link('EN', $this->createUrl('manufacture/PrintLabel',array('id'=>$order->id,'type'=>'VT','lang'=>'en')),array('target'=>'_blank'))?><br/>
	
	<?php echo CHtml::link('Detail Calculation', $this->createUrl('manufacture/PrintDetailCalculation',array('id'=>$order->id)),array('target'=>'_blank'))?><br/>
	<?php echo CHtml::link('Show Label Info', $this->createUrl('manufacture/ShowLabelInfo',array('id'=>$order->id)),array('target'=>'_blank'))?><br/>
<?php } ?>
	</p>

	
	<p>
		<?php 
			if( isset($order->status) && in_array($order->status->id, array(
					 Status::PROCESSING, Status::COMPLETE))) {
				// echo "- Order is Complete <br/>- Waiting for devliery";
			} 
		?>
	</p>

<script>
	YUI().use('yui2-button', function(Y){
		var YAHOO = Y.YUI2;
		var button = new YAHOO.widget.Button("send-processing");

	});
</script>