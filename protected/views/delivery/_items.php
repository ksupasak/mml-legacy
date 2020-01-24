<table id="items">
	
		
		  


	  <tr>
	      <th>ลำดับที่<br />&nbsp;</th>
	      <th>รายละเอียด<br />&nbsp;</th>
	      <th>จำนวนชุด<br />&nbsp;</th>
	      <th>จำนวนกล่อง<br />(ใบ)</th>
	      <th>ราคาต่อชุด<br />(บาท)</th>
	      <th>จำนวนเงิน<br />(บาท)</th>
	  </tr>

<?php $n=1; 
	  $sum_subtotal = 0;
	  $sum_vat = 0;
	  $sum_discount = 0;
	  $sum_finaltotal = 0;
?>
<?php	foreach ($invoice->orders as $order): 
		$sum_subtotal += $order->order->getSubTotalAmount();
		$sum_vat	  += $order->order->getVATAmount();
		$sum_discount += $order->order->getDiscountAmount();
		$sum_finaltotal += $order->order->getFinalTotalAmount();
?> 

<?php  
$aa = $order->order->days; 
if ($aa % 30 ==0) {
$text = "1 เดือน";
$set = $aa/30;
} else {
$set =1;
$text = $order->order->days." วัน"; 
}
?> 
	  <tr class="item-row">
	      <td class="number" align="center" width="40px"><?php echo $n++; ?></td>
	      <td class="item-name">Customized supplement ชุด <?php echo $text; ?> (#<?php echo $order->order->uuid; ?>)<br /> <?php echo $order->order->patient->name; ?> </td>
	      <td class="unit"><?php  echo $set; ?> </td>
	      <td class="unit"><?php  echo $set; ?></td>
	      <td class="unitr"><?php echo number_format($order->order->getSubTotalAmount(),2); ?></td>
	      <td class="unitr"><?php echo number_format($order->order->getSubTotalAmount(),2); ?></td>
	  </tr>
	<?php endforeach; ?>		  




				  <tr>
				      <td colspan="3" rowspan="3" class="remark"><div style="float:left; width:400px; padding-left:30px;">
<fieldset>
<legend> หมายเหตุ </legend>
<?php if($t==0||$t==1):?>		
1. ถ้าสินค้าที่ได้รับไม่เป็นที่เรียบร้อย กรุณาส่งคืนภายใน 3 วัน นับจากวันที่ได้รับสินค้า มิฉะนั้นจะถือว่าขายขาด
<?php elseif($t==2): ?>
1. ใบกำกับภาษี / ใบกำกับสินค้าเลขที่ ...................................... <br/>
ลงวันที่ ..........................................................	
<?php elseif($t==3): ?>
1. ใบเสร็จรับเงินนี้จะสมบูรณ์ต่อเมื่อบริษัทฯ ได้รับเงินตามเช็คหรือเงินโอนเรียบร้อยแล้ว <br/>
2. กรุณาสั่งจ่ายเช็คขีดคร่อมหรือโอนเงินในนาม 
บริษัท แมค แมคไลฟ์ จำกัด เท่านั้น
<?php endif;?>
</fieldset>
		             </div>
			        </td>
				      <td colspan="2" class="total-line">รวมราคาขาย(Subtotal)<br />ภาษีมูลค่าเพิ่ม (VAT7%)</td>
				      <td class="total-value"><div id="unitr"><?php echo number_format($sum_subtotal,2); ?></div><div id="unitr"><?php echo number_format($sum_vat,2); ?></div></td>
				  </tr>

				  <tr>
				      <td colspan="2" class="total-line">ส่วนลด <br />Discount</td>

				      <td class="total-value"><div id="unitr"><?php echo number_format($sum_discount,2); ?></div></td>
				  </tr>
				  <tr>
				      <td colspan="2" class="total-line balance">จำนวนเงินรวม (Total)</td>
				      <td class="total-value balance"><div id="unitr"><div class="due"><?php echo number_format($sum_finaltotal,2); ?></div></div></td>
				  </tr>
				
			</table>
