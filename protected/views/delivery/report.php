      <center>
<img src="<?php echo Yii::app()->request->baseUrl; ?>/images/logobig.png"  /><br>
บริษัท แมค แมค ไลฟ์ จำกัด 126/2 ซอยสุขุมวิท 23 ถนนสุขุมวิท แขวงคลองเตยเหนือ เขตวัฒนา กทม 10110<br>
โทร: 02-664-3003, 08-1685-8555 แฟกซ์ฺ: 02-664-3003 เลขประจำตัวผู้เสียภาษี 3032786478
</center><br /> 
<hr />
<div id="identity"></div>
<div id="header"><center>
  <strong><h1>TAX INVOICE / INVOICE</h1> </strong>
        <strong>ต้นฉบับใบกำกับภาษี / ใบกำกับสินค้า</strong>
	  </center>
	  </div>
 <div id="setfont">     
	    <div id="adname1">
<table width="300px">
          <tr>
            <th>Detail :</td><td>Customized Supplements</td></tr>
          <tr>
            <th>No :</td><td> <?php echo $invoice->id; ?></td></tr>
              <th>Date: </td>
            <td><?php echo date('d/m/y',strtotime( $invoice->updated ));?></td></tr>
          <tr>
            <th>Terms of Payment :
            </td>
  <td>  30 วัน</td></tr>
          </table>
   </div>
 		<div id="adname2">
 		   <table width="300px" border="0">
          <tr>
            <th>Customer : </th><td><?php echo $invoice->customer->hospital->name; ?></td></tr>
          <tr>
            <th >Address :</th><td height="50px"> <?php echo $invoice->customer->billing_address; ?></td></tr>
              
          <tr><th>Tel :</td><td><?php echo $invoice->customer->hospital->tel_1; ?></td></tr>
          </table>
 		</div>

		<?echo $this->renderPartial('_items',array('invoice'=>$invoice,'t'=>0));?>

		

 <div id="sign1">ได้รับสินค้าไว้ถูกต้องเรียบร้อยแล้ว<br /><br /><br /><hr />(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)<br />ผู้มีอำนาจรับของ</div>
 <div id="sign2">บริษัท แมค แมคไลฟ์ จำกัด<br /><br /><br /><hr />(
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)<br />ผู้มีอำนาจลงนาม</div>
</div>

</div>
<!-- ---------------------------------------------------------------------------------------- -->
<DIV style="page-break-after:always"></DIV>
<!-- ---------------------------------------------------------------------------------------- -->
   <div id="page-wrap">
      <center>
	      <img src="<?php echo Yii::app()->request->baseUrl; ?>/images/logobig.png"  /><br>
          บริษัท แมค แมค ไลฟ์ จำกัด 126/2 ซอยสุขุมวิท 23 ถนนสุขุมวิท แขวงคลองเตยเหนือ เขตวัฒนา กทม 10110<br>
      โทร: 02-664-3003, 08-1685-8555 แฟกซ์ฺ: 02-664-3003 เลขประจำตัวผู้เสียภาษี 3032786478	    </center><br /> <hr />
<div id="identity"></div>

  <div id="header"><center>
	    <strong><h1>COPY TAX INVOICE / INVOICE</h1> </strong>
        <strong>สำเนาใบกำกับภาษี / ใบกำกับสินค้า</strong>
	  </center>
	  </div>
 <div id="setfont">     
	    <div id="adname1">
<table width="300px">
          <tr>
            <th>Detail :</td><td>Customized Supplements</td></tr>
          <tr>
            <th>No :</td><td> <?php echo $invoice->id; ?></td></tr>
              <th>Date: </td>
            <td><?php echo date('d/m/y',strtotime( $invoice->updated ));?></td></tr>
          <tr>
            <th>Terms of Payment :
            </td>
  <td>  30 วัน</td></tr>
          </table>
 		  </div>
 		<div id="adname2">
 		   <table width="300px" border="0">
          <tr>
            <th>Customer : </th><td><?php echo $invoice->customer->hospital->name; ?></td></tr>
          <tr>
            <th >Address :</th><td height="50px"> <?php echo $invoice->customer->billing_address; ?></td></tr>
              
          <tr><th>Tel :</td><td><?php echo $invoice->customer->hospital->tel_1; ?></td></tr>
          </table>
 		</div>
  
		<?echo $this->renderPartial('_items',array('invoice'=>$invoice,'t'=>1));?>

 <div id="sign1">ได้รับสินค้าไว้ถูกต้องเรียบร้อยแล้ว<br /><br /><br /><hr />(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)<br />ผู้มีอำนาจรับของ</div>
 <div id="sign2">บริษัท แมค แมคไลฟ์ จำกัด<br /><br /><br /><hr />(
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)<br />ผู้มีอำนาจลงนาม</div>
</div>

</div>

<!-- ---------------------------------------------------------------------------------------- -->
<DIV style="page-break-after:always"></DIV>
<!-- ---------------------------------------------------------------------------------------- -->
   
    <div id="page-wrap">
      <center>
	      <img src="<?php echo Yii::app()->request->baseUrl; ?>/images/logobig.png"  /><br>
          บริษัท แมค แมค ไลฟ์ จำกัด 126/2 ซอยสุขุมวิท 23 ถนนสุขุมวิท แขวงคลองเตยเหนือ เขตวัฒนา กทม 10110<br>
      โทร: 02-664-3003, 08-1685-8555 แฟกซ์ฺ: 02-664-3003 เลขประจำตัวผู้เสียภาษี 3032786478	    </center> <br /><hr />
<div id="identity"></div>

  <div id="header"><center>
	    <strong><h1>BILLING NOTE</h1> </strong>
        <strong>ใบวางบิล</strong>
	  </center>
	  </div>
 <div id="setfont">     
	    <div id="adname1">
<table width="300px">
          <tr>
            <th>Detail :</td><td>Customized Supplements</td></tr>
          <tr>
            <th>No :</td><td> <?php echo $invoice->id; ?></td></tr>
              <th>Date: </td>
            <td><?php echo date('d/m/y',strtotime( $invoice->updated ));?></td></tr>
          <tr>
            <th>Terms of Payment :
            </td>
  <td>  30 วัน</td></tr>
          </table>
 		  </div>
 		<div id="adname2">
 		   <table width="300px" border="0">
          <tr>
            <th>Customer : </th><td><?php echo $invoice->customer->hospital->name; ?></td></tr>
          <tr>
            <th >Address :</th><td height="50px"> <?php echo $invoice->customer->billing_address; ?></td></tr>
              
          <tr><th>Tel :</td><td><?php echo $invoice->customer->hospital->tel_1; ?></td></tr>
          </table>
 		</div>
  
		<?echo $this->renderPartial('_items',array('invoice'=>$invoice,'t'=>2));?>
		

 <div id="sign1">ได้รับสินค้าไว้ถูกต้องเรียบร้อยแล้ว<br /><br /><br /><hr />(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)<br />ผู้มีอำนาจรับของ</div>
 <div id="sign2">บริษัท แมค แมคไลฟ์ จำกัด<br /><br /><br /><hr />(
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)<br />ผู้มีอำนาจลงนาม</div>
</div>

</div>
<!-- ---------------------------------------------------------------------------------------- -->
<DIV style="page-break-after:always"></DIV>
<!-- ---------------------------------------------------------------------------------------- -->
   <div id="page-wrap">
      <center>
	      <img src="<?php echo Yii::app()->request->baseUrl; ?>/images/logobig.png"  /><br>
          บริษัท แมค แมค ไลฟ์ จำกัด 126/2 ซอยสุขุมวิท 23 ถนนสุขุมวิท แขวงคลองเตยเหนือ เขตวัฒนา กทม 10110<br>
      โทร: 02-664-3003, 08-1685-8555 แฟกซ์ฺ: 02-664-3003 เลขประจำตัวผู้เสียภาษี 3032786478	    </center><br /> <hr />
<div id="identity"></div>

  <div id="header"><center>
	    <strong><h1>RECEIPT</h1> </strong>
        <strong>ใบเสร็จรับเงิน</strong>
	  </center>
	  </div>
 <div id="setfont">     
	    <div id="adname1">
<table width="300px">
          <tr>
            <th>Detail :</td><td>Customized Supplements</td></tr>
          <tr>
            <th>No :</td><td> <?php echo $invoice->id; ?></td></tr>
              <th>Date: </td>
            <td><?php echo date('d/m/y',strtotime( $invoice->updated ));?></td></tr>
          <tr>
            <th>Terms of Payment :
            </td>
  <td>  30 วัน</td></tr>
          </table>
 		  </div>
 		<div id="adname2">
 		   <table width="300px" border="0">
          <tr>
            <th>Customer : </th><td><?php echo $invoice->customer->hospital->name; ?></td></tr>
          <tr>
            <th >Address :</th><td height="50px"> <?php echo $invoice->customer->billing_address; ?></td></tr>
              
          <tr><th>Tel :</td><td><?php echo $invoice->customer->hospital->tel_1; ?></td></tr>
          </table>
 		</div>
  
		<?echo $this->renderPartial('_items',array('invoice'=>$invoice,'t'=>3));?>

 <div id="sign1">ได้รับสินค้าไว้ถูกต้องเรียบร้อยแล้ว<br /><br /><br /><hr />(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)<br />ผู้มีอำนาจรับของ</div>
 <div id="sign2">บริษัท แมค แมคไลฟ์ จำกัด<br /><br /><br /><hr />(
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)<br />ผู้มีอำนาจลงนาม</div>
</div>

</div>

