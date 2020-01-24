<?php

class CustomerController extends Controller
{
	public $layout='//layouts/dataManager';

	// public function filterAccessControl($filterChain)
	// {
	// 	if(Yii::app()->session['user.type'] != 'CLINICIAN'){
	// 		$filterChain->run();
	// 	}
	// }

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
	public function actionView($id)
	{
		$criteria = new CDbCriteria;
		$criteria->compare('customer_id',$id);
		// $criteria->limit = '20';
		$patients = new CActiveDataProvider('Patient', array( 
				'criteria'=> $criteria
			));
		$criteria = new CDbCriteria;
		// $criteria->limit = '30';
		$criteria->compare('customer_id',$id);
		// $criteria->join='LEFT JOIN patients ON patients.id=patient_id';
        // $criteria->condition='Client.businessId='. Yii::app()->userInfo->business;
        
		$criteria->order = 'request_received,patient_id DESC'; //TODO: filter inactive, cancel etc...
		$orders = new CActiveDataProvider('Order', array(
				'criteria'=>$criteria,
				'pagination'=>array('pageSize'=>100000)
				
			));
		
		$this->render('view',array(
				'model'=>$this->loadModel($id),
				'customerPatients'=>$patients,
				'recentOrders'=>$orders,
			));
	}
	public function actionCreate()
	{
		$model=new Customer;
		if(isset($_POST['Customer']))
		{
			$model->attributes=$_POST['Customer'];
			if($model->save())
				$this->redirect(array('view','id'=>$model->id));
		}

		$this->render('create',array(
			'customer'=>$model,
		));
	}
	public function actionUpdate($id)
	{
		$customer=$this->loadModel($id);

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['Customer']))
		{
			$customer->attributes=$_POST['Customer'];
			if($customer->save())
				$this->redirect(array('view','id'=>$customer->id));
		}

		$this->render('update',array(
			'customer'=>$customer,
		));
	}
	public function actionDelete($id)
	{
		if(Yii::app()->request->isPostRequest)
		{
			// we only allow deletion via POST request
			$this->loadModel($id)->delete();

			// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
			if(!isset($_GET['ajax']))
				$this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('admin'));
		}
		else
			throw new CHttpException(400,'Invalid request. Please do not repeat this request again.');
	}
	public function actionIndex()
	{
		$dataProvider=new CActiveDataProvider('Customer');
		$this->render('index',array(
			'dataProvider'=>$dataProvider,
		));
	}
	public function actionAdmin()
	{
		$model=new Customer('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['Customer']))
			$model->attributes=$_GET['Customer'];

		$this->render('admin',array(
			'model'=>$model,
		));
	}
	public function loadModel($id)
	{
		$model=Customer::model()->findByPk((int)$id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='customer-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
	function actionManageCustomers() {
		$model =new Patient('search');
		if(isset($_GET['Patient']))
			$model->attributes =$_GET['Patient'];
		$params =array(
			'model'=>$model,
		);
		if(!isset($_GET['ajax'])) $this->render('//patient/managePatients', $params);
		else  $this->renderPartial('//patient/managePatients', $params);
	}
	public function actionAutocomplete() {
       if(Yii::app()->request->isAjaxRequest && isset($_GET['q'])) {
		$returnVal = '';
		$res =array();
		if (isset($_GET['q'])) {
			/* Search both account ID and account name */
			$qtxt ="SELECT CONCAT('[',id,'] ', account_name) as name, id FROM {{customers}} WHERE account_name LIKE :account_name OR id LIKE :account_name LIMIT 10";
			$command =Yii::app()->db->createCommand($qtxt);
			$command->bindValue(":account_name", '%'.$_GET['q'].'%', PDO::PARAM_STR);
			$rows=$command->queryAll(); // query and return all rows of result
			foreach ($rows as $row) {
				$returnVal .= $row['name'] .'|'.$row['id']."\n";
			}
			echo $returnVal; Yii::app()->end();
		}
	   }
	}
	public function actionUploadLogo($customer) {
		$basePath = Yii::app()->basePath.'/../images/customers/';
		$baseUrl = Yii::app()->baseUrl.'/images/customers/';
		if($_POST) {
			$logo = CUploadedFile::getInstanceByName('image');
			$name = $customer.'_'.$logo->name;
			$customer = $this->loadModel($customer);
			$logo->saveAs($basePath.$name);
			$customer->logo_url = $baseUrl.$name;
			if (!$customer->save()) {
				throw new Exception('Upload logo error. Try again.');
			}
			$this->redirect($this->createUrl('customer/view', array('id'=>$customer->id)));
		}
		$this->render('uploadLogo');
	}
}
