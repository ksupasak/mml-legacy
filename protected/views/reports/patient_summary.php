<?php $this->renderPartial('_menus'); ?>
<div class="clear">
</div>
<h1>Patient Summary</h1>
<style type="text/css" media="screen">
	td{
		border:1px solid;
	}
</style>
<form action="patientSummary" method="post">
	 Select Customer :
	<select name="customer_id">
	 <?php foreach( $customers as $c){?>
	  <option label="<?php echo $c['account_name'];?>" <?php if(isset($_POST['customer_id'])&&$_POST['customer_id']==$c['id']){echo 'selected="selected"';}?> ><?php echo $c['id'];?></option>
	 <?php }?>
	</select>
	<br/>
	

	<?php 
	

		$from_date =  date('Y-m-d');
		$to_date =  date('Y-m-d');
		
		if(isset($_POST['from_date']))$from_date = $_POST['from_date'];
		if(isset($_POST['to_date']))$to_date = $_POST['to_date'];
		
		$month = array(1,2,3,4,5,6,7,8,9,10,11,12);
	?>
	<label for="">From Date : </label><input type="text" name="from_date" value="<?php echo $from_date; ?>" id="">
	<label for="">To Date : </label><input type="text" name="to_date" value="<?php echo $to_date; ?>" id="">
	<br/>
<?php if(isset($_POST['customer_id'])){?>		
	Select Clinician : 
	<select name="clinician_id">
	 <option label="All clinicians" <?php if(isset($_POST['clinician_id'])&&$_POST['clinician_id']==0){echo 'selected="selected"';}?> >0</option>
	 <?php foreach( $clinicians as $c){?>
	  <option label="<?php echo $c['full_name'];?>" <?php if(isset($_POST['clinician_id'])&&$_POST['clinician_id']==$c['id']){echo 'selected="selected"';}?> ><?php echo $c['id'];?></option>
	 <?php }?>
	</select>
<?php }?>	
<input type='submit' value='Submit'/>	
</form>


<?php if($_POST){?>
	<hr/>
	<?php 
	
	echo '<h2>'.$customer['account_name'].'</h2>';
	if($clinician){
		echo 'By '.$clinician['full_name'];
		
		$range = Yii::app()->db->createCommand()
	    ->select('p.name, p.hn, sum(amount_total) as total,count(amount_total) as count ')
	    ->from('orders as o , patients as p')
	    ->where('p.id=o.patient_id and o.status_id=6 and o.request_received >= :from_date and o.request_received <= :to_date and o.customer_id=:cid and o.clinician_id=:clinician_id' ,array(':clinician_id'=>$clinician['id'],':cid'=>$customer['id'],':from_date'=>$from_date,':to_date'=>$to_date))
		->group('o.patient_id')
		->order('p.hn')
	    ->queryAll();
		
		echo "<br/>";
	
	?>

	<table style="width:500px;" border="1"><tr><th>Patient</th><th>HN</th><th>Total Order</th><th>Total Amount</th></tr>
	<?php  foreach ($range as $r) { 
	
		echo "<tr><td>".$r['hn']."</td><td>".$r['name']."</td><td>".$r['count']."</td><td style='text-align:right'>".number_format($r['total'],2)."</td></tr>";
		
		
	}?>
	</table>
	<?php	
		
	}else{
		echo 'By All clinician';
		
		$range = Yii::app()->db->createCommand()
	    ->select('c.full_name, sum(amount_total) as total, count(amount_total) as count')
	    ->from('orders as o , clinicians as c')
	    ->where('c.id=o.clinician_id and o.status_id=6 and o.request_received >= :from_date and o.request_received <= :to_date and o.customer_id=:cid',array(':cid'=>$customer['id'],':from_date'=>$from_date,':to_date'=>$to_date))
		->group('o.clinician_id')
		->order('c.full_name')
	    ->queryAll();
		
		echo "<br/>";
	?>
	
	<table style="width:500px;" border="1"><tr><th>Clinician</th><th>Total Order</th><th>Total Amount</th></tr>
	<?php  foreach ($range as $r) { 
	
		echo "<tr><td>".$r['full_name']."</td><td>".$r['count']."</td><td style='text-align:right'>".number_format($r['total'],2)."</td></tr>";
		
		
	}?>
	</table>
	
	<?php
	}
	?>
	
	<br/>
<?php 

	// var_dump($_POST);
}?>