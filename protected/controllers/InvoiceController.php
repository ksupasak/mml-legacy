<?php
class InvoiceController extends Controller {
	public $layout = 'dataManager';
	function actionIndex() {
		$this->render('index',array('dataProvider'=>Clinician::model()->filter()));
	}
	function actionCreate() {
		$user = User::model();
		$customer = Customer::model();
		$params = array('user'=>$user, 'customer'=>$customer);
		$this->render('create',$params);
	}
}