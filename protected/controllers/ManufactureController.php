<?php

class ManufactureController extends Controller {
	public function filters()
	{
		return array(
			'accessControl', // perform access control for CRUD operations
		);
	}





	public function accessRules()
	{
			return array(
				array('allow', 'users'=>array('*'),
				'expression'=>'User::authorize("manage")',
				),
				array('deny',  // deny all users
					'users'=>array('*'),
				), 
			);
	}
	function actionUpdateAlerts() {
		$orders = Order::model()->alerts();
		$params = array('orders'=>$orders);
		$this->render('alerts', $params);
	}
	function actionManageOrders() {
		$model = Order::model();
		$orders = Order::getManufacturingOrdersJson();
		$newOrders = $model->filter();
		$criteria = new CDbCriteria();
		$criteria->compare('status_id', Status::PROCESSING);
		$criteria->addCondition('station_id IS NULL');
		$newOrders->criteria = $criteria;
		
		$currentOrders = $model->filter();
		$criteria = new CDbCriteria;
		$criteria->compare('status_id',Status::PROCESSING);
		$criteria->addCondition('station_id > 100');
		$currentOrders->criteria = $criteria;
		
		$completeOrders = $model->filter();
		$criteria = new CDbCriteria;
		$criteria->compare('status_id',Status::COMPLETE);
		$criteria->addCondition('station_id > 100');
		$completeOrders->criteria = $criteria;
		
		$params= array('newOrders'=>$newOrders,'currentOrders'=>$currentOrders,'completeOrders'=>$completeOrders);
		$this->render('manage',$params);
	}
	function actionViewOrder($orderId) {
		$order_id = Yii::app()->request->getQuery('orderId');
		$order = Order::model()->findByPk($order_id);
		$params =array(
			'order'=>$order
		);
		if(!isset($_GET['ajax'])) $this->render('view', $params);
		else  $this->renderPartial('view', $params);
	}
	function actionPrintManufactureSheet($id) {
		
		$order = Order::model()->findByPk($_GET['id']);
		$this->layout='blank';
		$this->render('printOrder',array('order'=>$order));
	}
	function actionShowLabelInfo($id) {
		
		$order = Order::model()->findByPk($_GET['id']);
		$this->layout='blank';
		$this->render('showLabelInfo',array('order'=>$order));
	}
	
	
	function actionUpdateOrder() {
		$model = ManufactureOrder::model();
		$params= array('model'=>$model);
		$this->render('updateOrder', $params);		
	}
	function actionTracking() {
		isset($_POST['barcode']) ? $barcode = $_POST['barcode'] :  $barcode = $_GET['barcode'];

		if ( strlen($barcode) < 6 ){
			$id = (int) $barcode;
			$order = Order::model()->findByPk($id);
		} else {
			$order = Order::model()->find('uuid=:uuid', array(':uuid'=>$barcode));
		}
		$params= array(
					   'previous' => OrderStation::model()->lastUpdatesFor($order),
					   'barcode'=>$barcode,
					   'order'=>$order);
		$this->render('tracking', $params);
	}
	function actionUpdateStation() {
		//TODO: Refactor
		if ( isset($_POST) && isset($_POST['Station']) ){ //
			if ( isset($_POST['confirmed']) ) {
				$station = new OrderTracking;
				$action = $station->acceptAjaxSubmit();
				if ($action == 'save') {
					header('Content-type: text/plain');
					echo '{"status":"saved"}';
					Yii::app()->end();
				}
			}
			$station = new Station;
			$station->attributes=$_POST;
			header('Content-type: text/plain');
			echo $station->validatePIN();
		} else {
			var_dump($_POST);
			echo "no post";
		}
		Yii::app()->end();
	}
	
	function actionPrintLabel() {
		
			$order = Order::model()->findByPk($_GET['id']);
			$this->layout='blank';
		if(isset($_GET['type'])){
			$this->render('printLabelVT',array('order'=>$order,'lang'=>$_GET['lang']));
			
		}else{
			
			if(isset($_GET['lang'])){	
				$this->render('printLabelEn',array('order'=>$order));
			}else{
				$this->render('printLabel',array('order'=>$order));
			}
		}	
		
	}
	function actionPrintDetailCalculation() {
		
			$order = Order::model()->findByPk($_GET['id']);
			$this->layout='blank';
			$this->render('printDetailCalculation',array('order'=>$order));

		
	}
	function actionPrintBarcode() {}
	function actionUpdateStock() {
		$model = Inventory::model();
		if (isset($_POST['Inventory'])){
			$model->attributes = $_POST['Inventory'];
			if ( $model->validate() ) {
				$model->save();
			}
		}
		$params= array('inventory'=>$model);
		$this->render('updateStock', $params);
	}

}