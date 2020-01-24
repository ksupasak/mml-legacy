<?php
class ClinicianController extends Controller {
	public $layout = 'dataManager';
	

	public function accessRules()
    {
        return array(
            array('deny',
                'actions'=>array('create', 'edit','Index'),
                'users'=>array('?'),
            )
        );
    }

	
	// public function filterAccessControl($filterChain)
	// {
	// 	// if(Yii::app()->session['user.type'] != 'CLINICIAN'){
	// 		$filterChain->run();
	// 	// }
	// }

	public function filters()
	{
		
		return array(
			'accessControl', // perform access control for CRUD operations
		);
	}
	function actionIndex() {
		
		
		$this->render('index',array('dataProvider'=>Clinician::model()->filter()));
	}
	function actionCreate() {
		$clinician = Clinician::model();
		$customer = Customer::model();
	

		if(isset($_POST['Clinician']))
		{
			//var_dump($_POST['Clinician']);
			$clinician = new Clinician;
			$clinician->attributes=$_POST['Clinician'];
			if($clinician->save())
				$this->redirect(array('view','id'=>$clinician->id));
		}
		
		$params = array('clinician'=>$clinician, 'customer'=>$customer );
		$this->render('create',$params);
	}
	function actionPatients() {
		if (Yii::app()->session['user.type'] == 'CLINICIAN') {
			$clinician_id = Yii::app()->user->id;
		} elseif (Yii::app()->request->getQuery('clinicianId')) {
			$clinician_id = Yii::app()->request->getQuery('clinicianId');
		} else  {
			throw new CHttpException('No Clinician Information Given');
		}
		$customer = Customer::getFromUser($clinician_id);
		$params = array('clinician'=>$customer->getClinician(), 'patients' => $customer->patients);
		$this->render('patients', array($params));
	}
	function actionLookup() {
       if(Yii::app()->request->isAjaxRequest && isset($_GET['q']))
       {
			$name = $_GET['q']; 
			$limit = min($_GET['limit'], 50); 
			$returnVal = '';
			$sql = 'SELECT hospitals.name, users.full_name, customers.id FROM
			users LEFT JOIN user_customer 
			ON user_customer.user_id = users.id
			LEFT JOIN customers
			ON user_customer.customer_id = customers.id 
			LEFT JOIN hospitals
			ON customers.hospital_id = hospitals.id
			WHERE users.full_name LIKE "%'.$name.'%" OR hospitals.name LIKE "%'.$name.'%"';
			$command=Yii::app()->db->createCommand($sql);
			$rows=$command->queryAll(); // query and return all rows of result
			foreach ($rows as $row) {
				$returnVal .= trim($row['name']).'-'.$row['full_name'] .'|'.$row['id']."\n";
			}
			echo $returnVal; Yii::app()->end();
		}
    }
	
	function actionLookupPatient() {
       if(Yii::app()->request->isAjaxRequest && isset($_GET['q']))
       {
			$name = $_GET['q']; 
			$clinician_id = $_GET['clinician_id'];
			$limit = min($_GET['limit'], 50); 
			$returnVal = '';
			$sql = 'SELECT patients.name, patients.hn, patients.id FROM patients';
			//patients LEFT JOIN customers
			//ON patients.customer_id = customers.id
			$sql .= ' WHERE patients.clinician_id = '.$clinician_id.' AND patients.name LIKE "%'.$name.'%"';
			$command=Yii::app()->db->createCommand($sql);
			$rows=$command->queryAll(); // query and return all rows of result
			foreach ($rows as $row) {
				$returnVal .= $row['name'] .'|'.$row['hn'].'|'.$row['id']."\n";
			}
			echo $returnVal; Yii::app()->end();
		}
	}
	function actionLookupPatientHN() {
       if(Yii::app()->request->isAjaxRequest && isset($_GET['q']))
       {
			$name = $_GET['q']; 
			$clinician_id = $_GET['clinician_id'];
			$limit = min($_GET['limit'], 50); 
			$returnVal = '';
			$sql = 'SELECT patients.name, patients.hn, patients.id FROM patients';
			//patients LEFT JOIN customers
			//ON patients.customer_id = customers.id
			$sql .= ' WHERE patients.clinician_id = '.$clinician_id.' AND patients.hn LIKE "%'.$name.'%"';
			$command=Yii::app()->db->createCommand($sql);
			$rows=$command->queryAll(); // query and return all rows of result
			foreach ($rows as $row) {
				$returnVal .= $row['hn'] .'|'.$row['name'].'|'.$row['id']."\n";
			}
			echo $returnVal; Yii::app()->end();
		}
	}
		/**
	 * Displays a particular model.
	 * @param integer $id the ID of the model to be displayed
	 */
	public function actionView($id)
	{
		$this->render('view',array(
			'model'=>$this->loadModel($id),
		));
	}
		/**
	 * Updates a particular model.
	 * If update is successful, the browser will be redirected to the 'view' page.
	 * @param integer $id the ID of the model to be updated
	 */
	public function actionUpdate($id)
	{
		$model=$this->loadModel($id);

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['Clinician']))
		{
			$model->attributes=$_POST['Clinician'];
			if($model->save())
				$this->redirect(array('view','id'=>$model->id));
		}

		$this->render('update',array(
			'model'=>$model,
		));
	}
	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer the ID of the model to be loaded
	 */
	public function loadModel($id)
	{
		$model=Clinician::model()->findByPk((int)$id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}
	/**
	 * Deletes a particular model.
	 * If deletion is successful, the browser will be redirected to the 'admin' page.
	 * @param integer $id the ID of the model to be deleted
	 */
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
	

}