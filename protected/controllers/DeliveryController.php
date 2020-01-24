<?php

class DeliveryController extends Controller {
	public $customer_id;
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
	function actionDeliveryReport($delivery) {
		$invoice_id = Yii::app()->request->getQuery('delivery');
		//$filter = array();
		//$payments = Payment::from($filter);
		$invoice = Invoice::model()->findByPk($delivery);
		$params = array('invoice'=>$invoice);
		$this->layout='print';
		$this->render('report', $params);
		
	}


	function actionManageDelivery() {
		$model = Order::model();
		$orders = Order::getManufacturingOrdersJson();
		$deliveryOrders = $model->filter();
		$criteria = new CDbCriteria();
		$criteria->compare('status_id', Status::COMPLETE);
		$criteria->addCondition('invoice_id IS NULL');
		$deliveryOrders->criteria = $criteria;
		$params= array('deliveryOrders'=>$deliveryOrders );
		$this->render('manage',$params);
	}
}