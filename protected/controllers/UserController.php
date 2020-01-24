<?php
/**
 * UserController
 **/
class UserController extends Controller {
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
	function actionBrowseUsers() {

	}
	function actionManageUsers() {
		$model =new User('search');
		if(isset($_GET['User']))
			$model->attributes =$_GET['User'];
		$params =array(
			'model'=>$model,
		);
		if(!isset($_GET['ajax'])) $this->render('index', $params);
		else  $this->renderPartial('index', $params);
	}
	function actionAddUser() {
		$model=new User('create');
		if(isset($_POST['User']))
		{
			$model->attributes=$_POST['User'];
			if($model->validate()) {
				if($model->save())
					$this->redirect(array('//user/view','id'=>$model->id));
			}
		}
		$this->render('//user/create',array(
			'model'=>$model,
		));
	}
	public function actionUpdate($id)
	{
		$model=$this->loadModel($id);

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['User']))
		{
			$model->attributes=$_POST['User'];
			$model->pin->attributes=$_POST['UserPin'];
			if($model->save())
				if ($model->pin) {
					if($model->pin->save()){
						$this->redirect(array('view','id'=>$model->id));
					}
				}
		}

		$this->render('update',array(
			'model'=>$model,
		));
	}
	public function actionView($id)
	{
		$this->render('view',array(
			'model'=>$this->loadModel($id),
		));
	}
	public function actionDelete($id)
	{
		if(Yii::app()->request->isPostRequest)
		{
			// we only allow deletion via POST request
			$user = $this->loadModel($id); 
			$user->inactive = 1; // set inactive
			$user->save();

			// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
			if(!isset($_GET['ajax']))
				$this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('admin'));
		}
		else
			throw new CHttpException(400,'Invalid request. Please do not repeat this request again.');
	}	
	public function loadModel($id)
	{
		$model=User::model()->findByPk((int)$id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param CModel the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='user-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
}