<?php

class OrderController extends Controller
{
	public $_admin;
	public $_clinician;
	public $order = array();
	public $items;
	
	public function filters()
    {
        return array(
            'accessControl',
        );
    }
	public function accessRules()
    {
        return array(
            array('deny',
                'actions'=>array('create', 'edit','ManageOrders','SelectCustomer','UpdateOrder'),
                'users'=>array('?'),
            )
        );
    }
	
	
	
	public function init() {
		if (Yii::app()->session['user.type'] == 'CLINICIAN') {
			$this->_clinician = true;
			$this->order['clinician_name'] = Yii::app()->session['user.full_name'];
			$this->order['clinician_id'] = Yii::app()->session['user.id'];
			$this->order['customer_id'] = Customer::getFromUser(Yii::app()->session['user.id'])->id;
        } elseif (Yii::app()->session['user.type'] == 'ADMIN') {
			$this->_admin = true;
        }
	}
	function actionManageOrders() {
		$order =new Order('manage');
		if(isset($_GET['Order']))
			$order->attributes =$_GET['Order'];
        if($this->_clinician) { }
		$orders = Order::getMyOrdersJson($order->filter());
		$params =array(
			'order'=>$order,
			'orders'=>$orders
		);
        if($this->_clinician) { 
            $this->render('manage_clinician', $params);
        } elseif(!isset($_GET['ajax'])) $this->render('manage', $params);
		else  $this->renderPartial('manage', $params);
	}

	function actionSelectCustomer() {
        
/* Overide this step for clinician */
	if (Yii::app()->session['user.type'] == 'CLINICIAN') {
		$this->_clinician = true;
		
		$clinician = Clinician::model()->find('user_id=:user_id',array(':user_id'=>Yii::app()->session['user.id']));
	    $customer = Customer::getFromUser(Yii::app()->session['user.id']);
	   
		$params = array('customer_id'=>$customer->id,'clinician_id'=>$clinician->id);
		
		$this->redirect($this->createUrl('order/SelectPatient',$params));
		
	}else{
        /* Normal Step */

		if ($_POST) {
			//$order->attributes = $_POST['Order'];
			if (true) {
				$params = array('customer_id'=>$_POST['Order']['customer_id']);
				$this->redirect($this->createUrl('order/SelectClinician',$params));
				return;
			}
		}
		
		$order = new Order;
		$params = array('order'=>$order);
		$this->render('selectCustomer',$params);
		
		}
	}
	
	function actionSelectClinician() {


			if ($_POST) {
				//$order->attributes = $_POST['Order'];
				if (true) {
					$params = array('customer_id'=>$_POST['Order']['customer_id'],'clinician_id'=>$_POST['Order']['clinician_id']);
					$this->redirect($this->createUrl('order/SelectPatient',$params));
					return;
				}
			}

			$order = new Order;
			$order->customer_id =$_GET['customer_id'];
			$params = array('order'=>$order);
			$this->render('selectClinician',$params);
		}	
	
	
	
	
	function actionSelectPatient() {
		
		$msg='';
	  
		if ($_POST) {
			$customerForm = new OrderCustomerForm;
			$customerForm->attributes = $_POST['Order'];
			$customerForm->doAddPatient();
	
			if (isset($customerForm->patient_name)&&$customerForm->patient_name!='') {
				$orderParams = $customerForm->attributes;
				$this->redirect($this->createUrl('order/SelectOrder',$orderParams));
			}else{
				$msg='<br/><span style="color:red">*Please enter patient\'s name and HN</span><br/>';
			}
		}
		$order = new Order;
		$order->customer_id =$_GET['customer_id'];
		$order->clinician_id =$_GET['clinician_id'];
		
		$params = array('order'=>$order,'msg'=>$msg);
		$this->render('selectPatient',$params);
	}
	
	function actionSelectOrder() {
		
	  	
		$customerForm = new OrderCustomerForm;
		$customerForm->attributes = $_GET;
		
		if ($_POST) {
			$customerForm = new OrderCustomerForm;
			$customerForm->attributes = $_POST['Order'];
			$customerForm->doAddPatient();
	
			if (true) {
				$orderParams = $customerForm->attributes;
				$this->redirect($this->createUrl('order/NewOrder',$orderParams));
			}
		}
		$order = new Order;
		$order->customer_id =$_GET['customer_id'];
		$order->patient_id =$_GET['patient_id'];
		$order->clinician_id=$_GET['clinician_id'];
		$params = array('order'=>$order);
		$this->render('selectOrder',$params);
	}	
	
	
	
	function actionNewOrder() {   // Expecting to have customer and patient at this stage
		$order = new Order();
		if ($_GET) {
			if (!isset($_GET['customer_id'])) 
				$this->redirect($this->createUrl('order/SelectCustomer'));
				$order->attributes = $_GET;
				if(isset($_GET['template_id'])&&$_GET['template_id']!=''){
					$template_order = Order::model()->findByPk($_GET['template_id']);
					$order->copyItems($template_order);	
				}else{
					// $order->hasAutoFillItems();
				}
		}
		
		$order->days = 30; //Default 30 day. TODO: have this configurable from System Config screen.
		// if ($this->_clinician) { //pre-enter info for clinician user
		// 	$order->customer_id = $this->order['customer_id'];
		// 	$order->clinician = Customer::model()->findByPk($customer_id);
		// }
		if(isset($_POST['Order'])) {
			$order->attributes =$_POST['Order'];
			$order->request_received = date("Y-m-d H:i:s");
			if($order->validate()){ //Ready for save
				$order->status_id = Status::DRAFT;
				$old_status= Status::DRAFT;
				if( $order->save() ) {
					$order->normalize();
					$order = $this->saveOrderItems($order); // Registered all current OrderItems
					$order->save();
					$this->redirect( $this->createUrl('order/ConfirmQuotation', array('orderId'=>$order->id,'status'=>$old_status))); //Redirect after
					
					// $this->redirect( $this->createUrl('order/UpdateOrder', array('orderId'=>$order->id)));
					
				} else {
					echo "cant save"; var_dump ( $order->getErrors() );
				}
			}
		}
		$this->data['order'] = $order;
		$this->render('new', array(	'order'=>$order));
	}
	function actionViewOrder() {
		$order_id = Yii::app()->request->getQuery('orderId');
		if ( $order_id ) {
			$order = new Order();
		}
		if(isset($_POST['Order']))
			$order->attributes =$_POST['Order'];
		$params =array(
			'order'=>$order,
			'order_id'=>$order_id
		);
		if(!isset($_GET['ajax'])) $this->render('view', $params);
		else  $this->renderPartial('view', $params);
	}
	function actionUpdateOrder() {
		$orderId = Yii::app()->request->getQuery('orderId');
		if (!$orderId) throw new CHttpException(400, 'No Order ID');
		$order = Order::model()->findByPk($orderId);
		$old_status = $order->status_id;
		$this->items = $order->getLineItems(); 
		$orderLine = new OrderLine(); // Product sheet, product id as primary key
		if(isset($_POST['Order']) && isset($_POST['Product'])){
			$order->attributes = $_POST['Order'];
			if ($order->validate()){
				$order = $this->saveOrderItems($order);
				if ($order->validate()) {
					$order->calculateTotal();
					
					$this->redirect( $this->createUrl('order/UpdateOrder', array('orderId'=>$order->id))); //Redirect after
					
					
				}	else{

					}
					
					
					
			}
			
		}
			// $this->redirect( $this->createUrl('order/ConfirmQuotation', array('orderId'=>$order->id,'status'=>$old_status))); //Redirect after
			
		if(isset($_GET['force_status'])){
			// sdfsdf
			$order->status_id = intval($_GET['force_status']);
			$order->save();
		}
		
		$params = array('order'=>$order, 'orderId'=>$orderId);
		$this->data['order'] = $order;
		$this->render('update', $params);
	}
	/* Admin Auto Update*/
	function actionQuery() {
		$order =	Order::model();
		$params =	array(
			'order'=>$order
		);
		if(!isset($_GET['ajax'])) $this->render('query', $params);
		else  $this->renderPartial('query', $params);
	}

	private function saveOrderItems($order){
		if(isset($_POST['Product'])) {
			$existProduct = array();
			if (count($order->items)) {
				//Exists product
				foreach ($order->items as $item) {	// Do update using info from _POST
					if(in_array($item->product_id, array_keys($_POST['Product']))){
						$existProduct[] = $item->product_id;
						$item->order_per_day = $_POST['Product'][$item->product_id]['OrderPerDay'];
						$item->remarks = $_POST['Product'][$item->product_id]['Remarks'];
						
						if($item->order_per_day>0){
							if(isset($_POST['Product'][$item->product_id]['ConsumeTime'])){
							$item->consume_time = ConsumeTime::encode($_POST['Product'][$item->product_id]['ConsumeTime']);
							}
							$item->save();
						}else{
							$item->delete();
						}
					} 
				}
			}
			//New products
			foreach ($_POST['Product'] as $product_id => $select) {
				if(!in_array($product_id, $existProduct)){
					// Only add if OrderPerDay > 0
					if ( $select['OrderPerDay'] <= 0 ) {
						continue;
					}
					$i = new OrderItem();
					$i->attributes = array(	
									'order_id' => $order->id ,
									'product_id' => $product_id,
									'order_per_day' => $select['OrderPerDay'],
									'consume_time'=> ConsumeTime::encode($select['ConsumeTime'])
					);
					$i->save();
				}
			}
			$order->calculateTotal();
		}
        return $order; //Return Order instance no matter what.
	}
		/* receive AJAX update items */
	function actionUpdateItems(){
		$id = Yii::app()->request->getQuery('orderId');
		if (!$id) { echo json_encode("Need order ID"); Yii::app()->end(); }
		$items = Order::model()->findByPk($id)->items;
		// Client posts  
		//  (item_id,order_id,product_id) pairs 
		//  or (NEW,order_id,product_id)
	}
	function actionGetItems(){
		$id = Yii::app()->request->getQuery('orderId');
		if (!$id) { echo json_encode("Need order ID"); Yii::app()->end(); }
		$items = Order::model()->findByPk($id)->items;
		$list = array();
		foreach ($items as $i){
			$item = new stdClass;
			$item->id = $i->id;
			$item->product_id = $i->product_id;
			$item->name = $i->product->display_name;
			$item->quantity = $i->quantity; //get various..
			$list[] = $item;
		  }
		echo json_encode($list);
	}
	function actionApproveOrder() {
		$id = Yii::app()->request->getQuery('orderId');
		$order = Order::model()->findByPk($id);
		if ($id && $order) {
			echo "approve order ";
			// var_dump($order->approve());
			echo "<h1>TODO:</h1>";
			echo sprintf('<a href="%s">%s</a>',$this->createUrl('order/ManageOrders'),'Back');
			$this->render('approve');
		}
		else { throw new Exception('requires valid order ID'); }
	}
	function actionCancelOrder() {
		$id = Yii::app()->request->getQuery('orderId');
		$order = Order::model()->findByPk($id);
		if ($id && $order) {
			echo "<h1>TODO:</h1><p> put confirmation dialog before this.</p> (order/CancelOrder ; Order beforeDelete, afterDelete)";
			// var_dump($order->delete());
			var_dump($order->getErrors());
			print $id . ' is deleted'; 
			echo sprintf('<a href="%s">%s</a>',$this->createUrl('order/ManageOrders'),'Back');
			$this->render('cancel');
		}
		else { throw new Exception('requires valid order ID'); }
	}
	
	function actionConfirmQuotation($orderId){
		$this->layout='print2';
		$order = Order::model()->findByPk($orderId);
		$params = array('order'=>$order);
		$this->render('quotation_confirmation',$params);		
	}
	function actionPrintEmailQuotation($orderId){
		$this->layout='print2';
		$order = Order::model()->findByPk($orderId);
		$params = array('order'=>$order);
		$this->render('quotation_email',$params);		
	}
	function actionPrintQuotation($orderId){
		$this->layout='print2';
		$order = Order::model()->findByPk($orderId);
		$params = array('order'=>$order);
		$this->render('quotation',$params);		
	}
	function actionDownloadQuotation($orderId){
		$this->layout='print';
		$order = Order::model()->findByPk($orderId);
		$params = array('order'=>$order);
		$this->renderPartial('download_quotation',$params);		
	}
	function actionPrintInvoice($orderId){
		$this->layout='print';
		$order = Order::model()->findByPk($orderId);
		$params = array('order'=>$order);
		$this->render('invoice',$params);
	}
	function actionPrintReceipt($orderId){
		$this->layout='print';
		$order = Order::model()->findByPk($orderId);
		$params = array('order'=>$order);
		$this->render('receipt',$params);	
	}
	function actionTracking() {
		// var_dump($_POST['barcode']);
		isset($_POST['barcode']) ? $barcode = $_POST['barcode'] :  $barcode = $_GET['barcode'];
		if ( strlen($barcode) < 6 ){
			$id = (int) $barcode;
			$order = Order::model()->findByPk($id);
		} else {
			$order = Order::model()->find('uuid=:uuid', array(':uuid'=>$barcode));
		}
		
		if(!isset($order)){
			$patient = Patient::model()->find('hn=:hn', array(':hn'=>$barcode));
			
		}
		
		$params= array('orderId'=>$order->id);
		$this->redirect($this->createUrl('order/UpdateOrder',$params));
	
	}
}
