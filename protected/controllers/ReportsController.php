<?php

class ReportsController extends Controller
{
	
	public function filters()
	{
		return array(
			'accessControl', // perform access control for CRUD operations
		);
	}
	public function accessRules()
	{
		return array(

			 array('deny',
	                'actions'=>array('create', 'edit','index'),
	                'users'=>array('?'),
	            ),
			array('allow', // allow authenticated user to perform 'create' and 'update' actions
				'actions'=>array('create','update','ajaxForm'),
				'users'=>array('@'),
			),
		);
	}
	public $layout='main';
	/**
	 * Declares class-based actions.
	 */
	public function actionIndex(){
		// $orders = Order::model()->findAll();
		// //echo count($orders); exit;
		// $order = $orders[30];
		// echo $order->uuid;
		// echo $order->id; echo "|";
		// $newOrder = $order->copy();
		// echo $newOrder->id;
		// echo get_class($newOrder);
	$this->render('index',array());		
	}
	
	
	public function actionOrderSummary(){
		// $orders = Order::model()->findAll();
		// //echo count($orders); exit;
		// $order = $orders[30];
		// echo $order->uuid;
		// echo $order->id; echo "|";
		// $newOrder = $order->copy();
		// echo $newOrder->id;
		// echo get_class($newOrder);
	$this->render('order_summary',array());		
	}
	
	public function actionOrderData(){
		// $orders = Order::model()->count('',array('select'=>'request_received, count(*)','group'=>'Day(request_received)'));
		
		if($_GET['type']=='amount'){
		
		$orders = Yii::app()->db->createCommand()
		    ->select('DATE_FORMAT(request_received,"%d-%m") as date, sum(amount_total) as c')
		    ->from('orders')
		    ->where('request_received >= :date',array(':date'=>date("Y-m-d", mktime()-30*24*3600)))
			->order('request_received')
			->group('DATE_FORMAT(request_received,"%d-%m")')
		    ->queryAll();
		$title = 'Total amount for last 30 days ';
		
    	}elseif($_GET['type']=='count'){
		
		$orders = Yii::app()->db->createCommand()
		    ->select('Day(request_received) as day,Month(request_received) as month, count(*) as c')
		    ->from('orders')
		    ->where('request_received >= :date',array(':date'=>date("Y-m-d", mktime()-30*24*3600)))
			->order('request_received')
			->group('Day(request_received)')
		    ->queryAll();
		$title = '# order for last 30 days ';
		
		}

		$this->renderPartial('_order_data',array('orders'=>$orders,'title'=>$title));
		
	}
	
	
	public function actionCustomerSummary(){
		$this->render('customer_summary',array('customers'=>$customers));		
	}
	
	public function actionCustomerData(){
		
		
		if(true){
		
		$list = array();
		$range = array();
		$range_check = array();
		$customer=Yii::app()->db->createCommand()->select('id, account_name, hospital_id')->from('customers')->where('id=:id',array(':id'=>$_GET['customer_id']))->queryAll();
		$customer = $customer[0];
		// var_dump($customer);
		$clinicians=Yii::app()->db->createCommand()->select('c.id, c.full_name, username')->from('clinicians as c, users as u')->where('hospital_id=:hospital_id and c.user_id = u.id',array(':hospital_id'=>$customer['hospital_id']))->queryAll();
		// var_dump($clinicians);
		
		
		$range = Yii::app()->db->createCommand()
		    ->select('DATE_FORMAT(request_received,"%m-%y") as date, sum(amount_total) as amount')
		    ->from('orders')
		    ->where('request_received >= :date',array(':date'=>date("Y-m-d", mktime()-12*30*24*3600)))
			->order('request_received')
			->group('DATE_FORMAT(request_received,"%m-%y")')
		    ->queryAll();
		
		foreach ($clinicians as $c){

		$orders = Yii::app()->db->createCommand()
		    ->select('DATE_FORMAT(request_received,"%m-%y") as date, sum(amount_total) as amount')
		    ->from('orders')
		    ->where('clinician_id=:clinician_id and request_received >= :date',array(':clinician_id'=>$c['id'],':date'=>date("Y-m-d", mktime()-12*30*24*3600)))
			->order('request_received')
			->group('DATE_FORMAT(request_received,"%m-%y")')
		    ->queryAll();
		$map = array();
		foreach($orders as $o){
			$map[$o['date']]=$o;
		}
		array_push($list,$map);
		}
	
		
		
		// var_dump($list);
		$title = 'Total amount for last 30 days ';
		
    	}

		$this->renderPartial('_clinician_data',array('customer'=>$customer,'clinicians'=>$clinicians,'list'=>$list,'title'=>$title,'range'=>$range));
		
	}
	
	
	public function actionClinicianSummary(){
		    
		
		
		    $customers = Yii::app()->db->createCommand()->select('id, account_name')->from('customers')->queryAll();
		    
		    if(isset($_POST['customer_id'])){    
		
		    
			$list = array();
			$range = array();
			$range_check = array();
			$customer=Yii::app()->db->createCommand()->select('id, account_name, hospital_id')->from('customers')->where('id=:id',array(':id'=>$_POST['customer_id']))->queryAll();
			$customer = $customer[0];
			// var_dump($customer);
			
			
			$clinicians=Yii::app()->db->createCommand()->select('c.id, c.full_name, username')->from('clinicians as c, users as u')->where('hospital_id=:hospital_id and c.user_id = u.id',array(':hospital_id'=>$customer['hospital_id']))->queryAll();
			// var_dump($clinicians);
			
			

			$range = Yii::app()->db->createCommand()
			    ->select('DATE_FORMAT(request_received,"%m-%y") as date, sum(amount_total) as amount')
			    ->from('orders')
			    ->where('status_id=6 and request_received >= :date and customer_id=:cid',array(':cid'=>$customer['id'],':date'=>date("Y-m-d", mktime()-12*30*24*3600)))
				->order('request_received')
				->group('DATE_FORMAT(request_received,"%m-%y")')
			    ->queryAll();

			foreach ($clinicians as $c){

			$orders = Yii::app()->db->createCommand()
			    ->select('DATE_FORMAT(request_received,"%m-%y") as date, sum(amount_total) as amount')
			    ->from('orders')
			    ->where('status_id=6 and clinician_id=:clinician_id and request_received >= :date',array(':clinician_id'=>$c['id'],':date'=>date("Y-m-d", mktime()-12*30*24*3600)))
				->order('request_received')
				->group('DATE_FORMAT(request_received,"%m-%y")')
			    ->queryAll();
			$map = array();
			foreach($orders as $o){
				$map[$o['date']]=$o;
			}
			array_push($list,$map);
			}


			
			}else{
				$list = array();
				$range = array();
				$clinicians=array();
			}
			
     
		
		$this->render('clinician_summary',array('customers'=>$customers,'clinicians'=>$clinicians,'list'=>$list,'range'=>$range));		
	
	
	
	}
	
	public function actionClinicianData(){
		
		
		if(true){
		
		$list = array();
		$range = array();
		$range_check = array();
		$customer=Yii::app()->db->createCommand()->select('id, account_name, hospital_id')->from('customers')->where('id=:id',array(':id'=>$_GET['customer_id']))->queryAll();
		$customer = $customer[0];
		// var_dump($customer);
		$clinicians=Yii::app()->db->createCommand()->select('c.id, c.full_name, username')->from('clinicians as c, users as u')->where('hospital_id=:hospital_id and c.user_id = u.id',array(':hospital_id'=>$customer['hospital_id']))->queryAll();
		// var_dump($clinicians);
		
		
		$range = Yii::app()->db->createCommand()
		    ->select('DATE_FORMAT(request_received,"%m-%y") as date, sum(amount_total) as amount')
		    ->from('orders')
		    ->where('status_id=6 and request_received >= :date and customer_id=:cid',array(':cid'=>$customer['id'],':date'=>date("Y-m-d", mktime()-12*30*24*3600)))
			->order('request_received')
			->group('DATE_FORMAT(request_received,"%m-%y")')
		    ->queryAll();
		
		foreach ($clinicians as $c){

		$orders = Yii::app()->db->createCommand()
		    ->select('DATE_FORMAT(request_received,"%m-%y") as date, sum(amount_total) as amount')
		    ->from('orders')
		    ->where('status_id=6 and clinician_id=:clinician_id and request_received >= :date',array(':clinician_id'=>$c['id'],':date'=>date("Y-m-d", mktime()-12*30*24*3600)))
			->order('request_received')
			->group('DATE_FORMAT(request_received,"%m-%y")')
		    ->queryAll();
		$map = array();
		foreach($orders as $o){
			$map[$o['date']]=$o;
		}
		array_push($list,$map);
		}
	
		
		
		// var_dump($list);
		$title = 'Total amount for last 30 days ';
		
    	}

		$this->renderPartial('_clinician_data',array('customer'=>$customer,'clinicians'=>$clinicians,'list'=>$list,'title'=>$title,'range'=>$range));
		
	}

	//=================================================================
	//=================================================================
	//=================================================================
	//=================================================================
	//=================================================================
	
	public function actionInventorySummary(){
		
		
		
		$sort = 'total';
		
		//	$products= Product::getStandardList();
			$products=Product::model()->findAll(' inactive !=:inactive', array(':inactive'=>1));
			// =Yii::app()->db->createCommand()->select('p.id, p.display_name as name, p.stock_balance , p.price_base ')->from('products as p')->where('inactive=0',array())->group('p.id')->order($sort.' desc')->queryAll();

			$list = array();
			
			
			
			function cmp($a, $b)
			{
				$sort='total';
				if(isset($_GET['sort']))$sort=$_GET['sort'];
				switch ($sort) {
				case 'display_name':
					$a = $a->display_name;
					$b = $b->display_name;
					  break;
				case 'amount':
					$a = $a->amount;
					$b = $b->amount;
					  break;
				case 'total':
					$a = $a->amount * $a->price_base;
					$b = $b->amount* $b->price_base;
					  break;
				case 'price_base':
						$a = $a->price_base;
						$b = $b->price_base;
				     break;
				}
				
				if ($a == $b) {
			        return 0;
			    }
				if(isset($_GET['asc'])){
			    	return ($a < $b) ? -1 : 1;
				}else{
					return ($a < $b) ? 1 : -1;
				}
				
			}

			
			foreach ($products as $p) { 
				
				if(isset($_GET['date'])){
					$amount = $p->getInventoryAt($_GET['date']);
		
				}else{
					$amount = $p->getCurrentInventory();
				}
			
		
				
				$total  = $amount*$p->price_base;
				$p->amount = $amount;
				array_push($list,$p);
			}
			
           usort($list, "cmp");



		//=================================================================


			$list2 = array();

			$products=Yii::app()->db->createCommand()->select('p.id, p.display_name, sum(pi.out) as amount')->where('inactive=0')->from('products as p,product_inventory as pi')->where('p.id=pi.product_id and pi.updated>=:date and pi.out>0',array(':date'=>date("Y-m-d", mktime()-12*30*24*3600)))->group('p.id')->order('sum(pi.out) desc')->queryAll();

			$range =Yii::app()->db->createCommand()
			    ->select('DATE_FORMAT(updated,"%m-%y") as date')
			    ->from('product_inventory as p')
			    ->where(' updated >= :date',array(':date'=>date("Y-m-d", mktime()-12*30*24*3600)))
				->order('updated')
				->group('DATE_FORMAT(updated,"%m-%y")')
			    ->queryAll();

			// var_dump($range);
			// var_dump("\n");
			foreach ($products as $p){

			$inventory = Yii::app()->db->createCommand()
			    ->select('DATE_FORMAT(updated,"%m-%y") as date, sum(p.in) as check_in, sum(p.out) as check_out')
			    ->from('product_inventory as p')
			    ->where('product_id=:product_id and updated >= :date',array(':product_id'=>$p['id'],':date'=>date("Y-m-d", mktime()-12*30*24*3600)))
				->order('updated')
				->group('DATE_FORMAT(updated,"%m-%y")')
			    ->queryAll();
			$map = array();

			foreach($inventory as $i){
				$map[$i['date']]=$i;
			}
			$list2[$p['id']] = $map;
			// array_push($list2,$map);
			}

			$rn = array();
			
			foreach($range as $r){
				array_push($rn,$r['date']);
			}
			$range = $rn;
//=================================================================

			

			// var_dump($products);
			$this->render('inventory_summary',array('products'=>$list,'usage'=>$list2,'range'=>$range));
		
	}
	
	
	public function actionProductSummary(){
		
		$customers  = array();
		$this->render('product_summary',array('customers'=>$customers));
		
				
	}
	
	public function actionProductData(){
		
		
		if($_GET['type']=='current'){

		
		$list = array();
		
		$products=Yii::app()->db->createCommand()->select('p.id, p.display_name, p.stock_balance, sum(pi.out) as amount , p.price_base')->where('inactive=0')->from('products as p,product_inventory as pi')->where('p.id=pi.product_id and pi.updated>=:date and pi.out>0',array(':date'=>date("Y-m-d", mktime()-3*30*24*3600)))->group('p.id')->order('stock_balance desc')->queryAll();
	
		
		// var_dump($products);
		$title = 'Stock Balance';
		$this->renderPartial('_product_data',array('products'=>$products,'title'=>$title));
		
		
    	}else{
	
		
		$list = array();
		
		$products=Yii::app()->db->createCommand()->select('p.id, p.display_name, sum(pi.out) as amount')->where('inactive=0')->from('products as p,product_inventory as pi')->where('p.id=pi.product_id and pi.updated>=:date and pi.out>0',array(':date'=>date("Y-m-d", mktime()-3*30*24*3600)))->group('p.id')->order('sum(pi.out) desc')->queryAll();
		
		$range =Yii::app()->db->createCommand()
		    ->select('DATE_FORMAT(updated,"%m-%y") as date')
		    ->from('product_inventory as p')
		    ->where(' updated >= :date',array(':date'=>date("Y-m-d", mktime()-3*30*24*3600)))
			->order('updated')
			->group('DATE_FORMAT(updated,"%m-%y")')
		    ->queryAll();
		
		// var_dump($range);
		// var_dump("\n");
		foreach ($products as $p){
        $inventory = NULL;
        if($_GET['type']=='high-freq'){
				$inventory = Yii::app()->db->createCommand()
				
			    ->select('DATE_FORMAT(updated,"%m-%y") as date, count(*) as check_out')
			    ->from('product_inventory as p')
			    ->where('product_id=:product_id and updated >= :date and p.out > 0 ',array(':product_id'=>$p['id'],':date'=>date("Y-m-d", mktime()-3*30*24*3600)))
				->order('updated')
				->group('DATE_FORMAT(updated,"%m-%y")')
			    ->queryAll();
		
		}else{
				$inventory = Yii::app()->db->createCommand()
			    ->select('DATE_FORMAT(updated,"%m-%y") as date, sum(p.in) as check_in, sum(p.out) as check_out')
			    ->from('product_inventory as p')
			    ->where('product_id=:product_id and updated >= :date',array(':product_id'=>$p['id'],':date'=>date("Y-m-d", mktime()-3*30*24*3600)))
				->order('updated')
				->group('DATE_FORMAT(updated,"%m-%y")')
			    ->queryAll();
	
		}
	     
		$map = array();
		
		foreach($inventory as $i){
			$map[$i['date']]=$i;
		}
		$list[$p['id']] = $map;
		// array_push($list,$map);
		}
	
		if($_GET['type']=='low'||$_GET['type']=='low-freq'){
			$np = array();
			foreach($products as $p){
				if($p['amount']<100){
					array_push($np, $p);
				}
			}
			$products = $np;
			$title='Product Usage for Last 3 months Less than 100 gram(s)';
			
		}else{
				$np = array();
				foreach($products as $p){
					if($p['amount']>=100){
						array_push($np, $p);
					}
				}
			$products = $np;
			$title='Product Usage for Last 3 months Greater than 100 gram(s)';
		}
		
		 // var_dump($list);
		$this->renderPartial('_product_data',array('products'=>$products,'list'=>$list,'title'=>$title,'range'=>$range));
		
		}

		
	}
	//=================================================================
	//=================================================================
	//=================================================================
	//=================================================================
	
	public function actionPatientSummary(){
		$customers = Yii::app()->db->createCommand()->select('id, account_name')->from('customers')->queryAll();
		
		$clinicians = array();
		
		if($_POST){
		
			$customer=Yii::app()->db->createCommand()->select('id, account_name, hospital_id')->from('customers')->where('id=:id',array(':id'=>$_POST['customer_id']))->queryAll();
	   		$customer = $customer[0];
			$clinicians=Yii::app()->db->createCommand()->select('c.id, c.full_name, username')->from('clinicians as c, users as u')->where('hospital_id=:hospital_id and c.user_id = u.id',array(':hospital_id'=>$customer['hospital_id']))->queryAll();
		    if(isset($_POST['clinician_id'])){
			
				$clinician=Yii::app()->db->createCommand()->select('c.id, c.full_name, username')->from('clinicians as c, users as u')->where('c.id = :clinician_id and hospital_id=:hospital_id and c.user_id = u.id',array(':clinician_id'=>$_POST['clinician_id'],':hospital_id'=>$customer['hospital_id']))->queryAll();
				if(isset($clinician[0])){
		   			$clinician = $clinician[0];
				}	
			}
			
		}
		
		if(!isset($customer)){
			$customer = NULL;
		}
		
		if(!isset($clinician)){
			$clinician = NULL;
		}
		
		$this->render('patient_summary',array('customers'=>$customers,'customer'=>$customer,'clinicians'=>$clinicians,'clinician'=>$clinician));		
	
	
	}
	
	public function actionPatientData(){
		
		
		if(true){
		
		$list = array();
		$range = array();
		$range_check = array();
		$customer=Yii::app()->db->createCommand()->select('id, account_name, hospital_id')->from('customers')->where('id=:id',array(':id'=>$_GET['customer_id']))->queryAll();
		$customer = $customer[0];
		// var_dump($customer);
		$clinicians=Yii::app()->db->createCommand()->select('c.id, c.full_name, username')->from('clinicians as c, users as u')->where('hospital_id=:hospital_id and c.user_id = u.id',array(':hospital_id'=>$customer['hospital_id']))->queryAll();
		// var_dump($clinicians);
		
		
		$range = Yii::app()->db->createCommand()
		    ->select('DATE_FORMAT(request_received,"%m-%y") as date, sum(amount_total) as amount')
		    ->from('orders')
		    ->where('status_id=6 and request_received >= :date and customer_id=:cid',array(':cid'=>$customer['id'],':date'=>date("Y-m-d", mktime()-12*30*24*3600)))
			->order('request_received')
			->group('DATE_FORMAT(request_received,"%m-%y")')
		    ->queryAll();
		
		foreach ($clinicians as $c){

		$orders = Yii::app()->db->createCommand()
		    ->select('DATE_FORMAT(request_received,"%m-%y") as date, sum(amount_total) as amount')
		    ->from('orders')
		    ->where('status_id=6 and clinician_id=:clinician_id and request_received >= :date',array(':clinician_id'=>$c['id'],':date'=>date("Y-m-d", mktime()-12*30*24*3600)))
			->order('request_received')
			->group('DATE_FORMAT(request_received,"%m-%y")')
		    ->queryAll();
		$map = array();
		foreach($orders as $o){
			$map[$o['date']]=$o;
		}
		array_push($list,$map);
		}
	
		
		
		// var_dump($list);
		$title = 'Total amount for last 30 days ';
		
    	}

		$this->renderPartial('_clinician_data',array('customer'=>$customer,'clinicians'=>$clinicians,'list'=>$list,'title'=>$title,'range'=>$range));
		
	}

	//=================================================================
	//=================================================================
	//=================================================================
	//=================================================================
	
	public function actionClinicianProductSummary(){
		$customers = Yii::app()->db->createCommand()->select('id, account_name')->from('customers')->queryAll();
		
		$clinicians = array();
		
		if($_POST){
		
			$customer=Yii::app()->db->createCommand()->select('id, account_name, hospital_id')->from('customers')->where('id=:id',array(':id'=>$_POST['customer_id']))->queryAll();
	   		$customer = $customer[0];
			$clinicians=Yii::app()->db->createCommand()->select('c.id, c.full_name, username')->from('clinicians as c, users as u')->where('hospital_id=:hospital_id and c.user_id = u.id',array(':hospital_id'=>$customer['hospital_id']))->queryAll();
		    if(isset($_POST['clinician_id'])){
			
				$clinician=Yii::app()->db->createCommand()->select('c.id, c.full_name, username')->from('clinicians as c, users as u')->where('c.id = :clinician_id and hospital_id=:hospital_id and c.user_id = u.id',array(':clinician_id'=>$_POST['clinician_id'],':hospital_id'=>$customer['hospital_id']))->queryAll();
				if(isset($clinician[0])){
		   			$clinician = $clinician[0];
				}	
			}
			
		}
		
		if(!isset($customer)){
			$customer = NULL;
		}
		
		if(!isset($clinician)){
			$clinician = NULL;
		}
		
		$this->render('clinician_product_summary',array('customers'=>$customers,'customer'=>$customer,'clinicians'=>$clinicians,'clinician'=>$clinician));		
	
	
	}
	
	public function actionClinicianProductData(){
		
		
		if(false){
		
		$list = array();
		$range = array();
		$range_check = array();
		$customer=Yii::app()->db->createCommand()->select('id, account_name, hospital_id')->from('customers')->where('id=:id',array(':id'=>$_GET['customer_id']))->queryAll();
		$customer = $customer[0];
		// var_dump($customer);
		$clinicians=Yii::app()->db->createCommand()->select('c.id, c.full_name, username')->from('clinicians as c, users as u')->where('hospital_id=:hospital_id and c.user_id = u.id',array(':hospital_id'=>$customer['hospital_id']))->queryAll();
		// var_dump($clinicians);
		
		
		$range = Yii::app()->db->createCommand()
		    ->select('DATE_FORMAT(request_received,"%m-%y") as date, sum(amount_total) as amount')
		    ->from('orders')
		    ->where('status_id=6 and request_received >= :date and customer_id=:cid',array(':cid'=>$customer['id'],':date'=>date("Y-m-d", mktime()-12*30*24*3600)))
			->order('request_received')
			->group('DATE_FORMAT(request_received,"%m-%y")')
		    ->queryAll();
		
		foreach ($clinicians as $c){

		$orders = Yii::app()->db->createCommand()
		    ->select('DATE_FORMAT(request_received,"%m-%y") as date, sum(amount_total) as amount')
		    ->from('orders')
		    ->where('status_id=6 and clinician_id=:clinician_id and request_received >= :date',array(':clinician_id'=>$c['id'],':date'=>date("Y-m-d", mktime()-12*30*24*3600)))
			->order('request_received')
			->group('DATE_FORMAT(request_received,"%m-%y")')
		    ->queryAll();
		$map = array();
		foreach($orders as $o){
			$map[$o['date']]=$o;
		}
		array_push($list,$map);
		}
	
		
		
		// var_dump($list);
		$title = 'Total amount for last 30 days ';
		
    	}

		$this->renderPartial('_clinician_product_data',array('customer'=>$customer,'clinicians'=>$clinicians,'list'=>$list,'title'=>$title,'range'=>$range));
		
	}

}