
<div id="header"><center>
	    <strong><h1>QUOTATION </h1> </strong>
        <strong>ใบเสนอราคา</strong>
	  </center>
	  </div>
 <div id="setfont">     
	    <div id="adname1">
<table width="300px">
          <tr>
            <th>Detail :</td><td>rder# <?php echo $order->id; ?></td></tr>
          <tr>
            <th>No :</td><td> <?php echo $order->uuid; ?></td></tr>
              <th>Date:</td>
            <td> <?php echo $order->days;?></td></tr>
          <tr>
            <th>Terms of Payment :
            </td>
  <td> <?php echo $order->customer->hospital->name; ?></td></tr>
          </table>
 		  </div>
 		<div id="adname2">
 		   <table width="300px" border="0">
          <tr>
            <th>Customer : </th><td> <?php echo $order->customer->clinician->full_name;?></td></tr>
          <tr>
            <th >Address :</th><td height="50px"> <?php echo $order->customer->billing_address; ?></td></tr>
              
          <tr><th>Patient :</td><td> <?php echo $order->patient->name; ?></td></tr>
          </table>
 		</div>
  <table id="items">
		
		  <tr>
		      <th>ลำดับที่<br />Item</th>
		      <th>รายละเอียด<br />Description</th>
		      <th>จำนวน<br />Quantity</th>
		      <th>หน่วย<br />Unit</th>
		      <th>ราคาต่อหน่วย<br />		        Unit Price</th>
		      <th>จำนวนเงิน<br />		        Amount</th>
		  </tr>
	
	  <tr class="item-row">
		      <td class="number" align="center" width="40px">1</td>
		      <td class="item-name"> <div style="background-color:#D1EC66; font-weight:bold; font-size:larger">Compound set 1</div></td>
		      <td class="unit">1</td>
		      <td class="unit"></td>
		      <td class="unit"></td>
		      <td class="unit"></td>
		  </tr>
	<?php	  $items = $order->items;
count($items);
$n = 1;

foreach( $items as $item ) {

if( $item->order_per_day>0){
	?>
	

		  <tr class="item-row">
		      <td class="number" align="center" width="40px"></td>
		      <td class="item-name">--- <?php echo $item->product->display_name; ?><div style="font-weight:bold">( <?php echo $item->order_per_day; ?> <?php echo $item->product->unit->display_name; ?>)</div></td>
		      <td class="unit"> </td>
		      <td class="unit"> </td>
		      <td class="unit"> <?php //echo $item->price; ?></td>
		      <td class="unit"></td>
		  </tr>
<?php } }?>		  
	
		  
		
		  
		  <tr>
		      <td colspan="3" rowspan="3" class="remark"><div style="float:left; width:400px; padding-left:30px;">
              <fieldset>
<legend> หมายเหตุ </legend>xxxxx
              </fieldset>
             </div>
	        </td>
		      <td colspan="2" class="total-line">รวมราคาขาย(Subtotal)<br />ภาษีมูลค่าเพิ่ม (VAT7%)</td>
		      <td class="total-value"><div id="subtotal">0000.00</div><div id="subtotal">0000.00</div></td>
		  </tr>
		 
		  <tr>
		      <td colspan="2" class="total-line">ส่วนลด <br />Discount</td>

		      <td class="total-value"> 0000.00</td>
		  </tr>
		  <tr>
		      <td colspan="2" class="total-line balance">จำนวนเงินรวม (Total)</td>
		      <td class="total-value balance"><div class="due">0000.00</div></td>
		  </tr>
  </table>
		

 <div id="sign1">ได้รับสินค้าไว้ถูกต้องเรียบร้อยแล้ว<br /><br /><br /><hr />(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)<br />ผู้มีอำนาจรับของ</div>
 <div id="sign2">บริษัท แมค แมคไลฟ์ จำกัด<br /><br /><br /><hr />(
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)<br />ผู้มีอำนาจลงนาม</div>
</div>

</div>
	<?php 

/* 
 * URL maps to/mml/order/PrintInvoice?orderId=91 
 */






?>