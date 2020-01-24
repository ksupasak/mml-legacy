<?php

/**
 * This is the model class for table "customers".
 *
 * Customer Id corresponds to a User Id. One user is the owner of a customer.
 *
 * The followings are the available columns in table 'customers':
 * @property integer $id
 * @property integer $hospital_id
 * @property string $account_name
 * @property string $billing_address
 * @property integer $clinician_id
 * @property string $logo_url
 * @properly string $discount
 * @var string $balance
 * An owner of customer is clinician user account
 * The followings are the available model relations:
 * @property User $clinician
 * @property Hospital $hospital
 * @property Order[] $orders
 * @property UserCustomer[] $userCustomers
 * @property Invoice[] $invoices
 */
class Customer extends CActiveRecord
{
	public $hospital_name;

	/**
	 * Returns the static model of the specified AR class.
	 * @return Customer the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return '{{customers}}';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('hospital_id', 'required'),
			array('id, clinician_id, hospital_id', 'numerical', 'integerOnly'=>true),
			array('account_name', 'length', 'max'=>500),
			array('id, hospital_id, account_name, billing_address ,logo_url, cutoff_date,cutoff_date_2,payment_date,payment_date_2,discount,default_marketing_code', 'safe'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		return array(
			'hospital' => array(self::BELONGS_TO, 'Hospital', 'hospital_id'),
			'orders' => array(self::HAS_MANY, 'Order', 'customer_id'),
			'userCustomers' => array(self::HAS_MANY, 'UserCustomer', 'customer_id'),
			'patients' => array(self::HAS_MANY, 'Patient', 'customer_id'),
			'invoices' => array(self::HAS_MANY, 'Invoice', 'customer_id'),
			'payments' => array(self::HAS_MANY, 'Payment', 'customer_id'),
			'transactions' => array(self::HAS_MANY, 'Transaction', 'customer_id'),
            'clinician' => array(self::BELONGS_TO, 'Clinician', 'clinician_id')
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'hospital_id' => 'Hospital',
			'account_name' => 'Account Name',
			'billing_address' => 'Billing Address',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('hospital_id',$this->hospital_id);
		$criteria->compare('account_name',$this->account_name,true);
		$criteria->compare('billing_address',$this->billing_address,true);

		return new CActiveDataProvider(get_class($this), array(
			'criteria'=>$criteria,
		));
	}
	public function billable() {
		$criteria=new CDbCriteria;
		return new CActiveDataProvider(get_class($this), array(
			'criteria'=>$criteria,
		));
	}



	public static function getFromUser($user_id) {
		
		
		$customer = null;
		
		if (Yii::app()->session['user.type'] == 'CLINICIAN') {
		$clinician = Clinician::model()->find('user_id=:user_id',array(':user_id'=>$user_id));
		if(isset($clinician)):
		$hospital =  $clinician->hospital;
		if(isset($hospital)):
		$customer = Customer::model()->find('hospital_id=:h_id',array(':h_id'=>$hospital->id));
		endif;
		endif;
		}elseif(Yii::app()->session['user.type'] == 'CLINICIAN_STAFF' || Yii::app()->session['user.type'] == 'PHARMACIST'){
			$user = User::model()->find('id=:id',array(':id'=>Yii::app()->session['user.id']));
			$customer = $user->customer;
		}
		
		return $customer;
	}
	
	
	public function getClinician() { // The clinician is owner of Customer account
		$user_id= UserCustomer::model()->find('customer_id=:cust_id AND role=:role', 
					array(':cust_id'=>$this->id,':role'=>'OWNER'))->user_id;
		return User::model()->findByPk($user_id);
	}
	public static function getFromClinician($clinician) {
		$customer_id = UserCustomer::model()->find('user_id=:user_id AND role=:role', 
					array(':user_id'=>$clinician->id,':role'=>'OWNER'))->customer_id;
		return User::model()->findByPk($customer_id);
	}
	public function getRecentOrders(){
	}
	// replace countCompletedOrders. user $dataProvider->totalItemCount
	public function countCompletedOrders() {
		//return $this->id;
		//return $this->getCompletedOrders()->getItemCount();
	}
	public function getCompletedOrders() {
		$criteria = new CDbCriteria();
		$criteria->addCondition('customer_id',$this->id,true);
		$criteria->addCondition('status_id',Status::COMPLETE,true);
		return new CActiveDataProvider('Order',array(
			'criteria'=>$criteria
		));
	}
	public function viewBillsLink() {
		return CHtml::link('Manage', Yii::app()->createUrl('accounting/CustomerBilling/customer/'.$this->id.'/'));
	}
	public function viewLink() {
		$view =  CHtml::link('info', Yii::app()->createUrl('customer/view', array('id'=>$this->id)));
		return "{$this->account_name}";
	}
	public function clinicianLink() {
		$clinician = $this->getClinician();
		$view =  CHtml::link('info', Yii::app()->createUrl('clinician/view', array('id'=>$clinician->id)));
		return "{$clinician->full_name} ";		
	}
	public static function dropDownOptions() {
		$customers = self::model()->findAll('id < 100'); // Id more than 100 is Station class
		$list = array(''=>'');
		foreach ($customers as $customer) {
			$list[ $customer->id ] = $customer->hospital->name;
		}
		return $list;
	}
	
	function sumInvoiceDue(){
		
		$invoices = Invoice::model()->findAll('customer_id=:customer_id and category=:category and paid!=1',array('customer_id'=>$this->id,':category'=>Transaction::INVOICE));
		$total = 0;
		foreach($invoices as $i)
		{
		 	$total+=$i->credit;	
		}
		
		return $total;
	}
	
	function sumNextDue(){
		
		
		$dataProvider=new CActiveDataProvider('Invoice', array(
		    'criteria'=>array(
				'condition'=>'customer_id=:customer_id and category=:category and paid!=1 and due_date <= :now',
				'params'=>array('customer_id'=>$this->id,':category'=>Transaction::INVOICE,':now'=>date('Y-m-d'))
		    )
		));
		$invoices  = $dataProvider->getData();
	
			$total = 0;
			foreach($invoices as $i)
			{
			 	$total+=$i->credit;	
			}

			return $this->sumInvoiceDue()-$total;
	
	}
	
	function sumOverDue(){
		
		
		$dataProvider=new CActiveDataProvider('Invoice', array(
		    'criteria'=>array(
				'condition'=>'customer_id=:customer_id and category=:category and paid!=1 and due_date <= :now',
				'params'=>array('customer_id'=>$this->id,':category'=>Transaction::INVOICE,':now'=>date('Y-m-d'))
		    )
		));
		$invoices  = $dataProvider->getData();
	
			$total = 0;
			foreach($invoices as $i)
			{
			 	$total+=$i->credit;	
			}

			return $total;
	}
	
	function getTemplateOrders(){
		
		$criteria = new CDbCriteria;
		$criteria->compare('customer_id',$this->id);
		$criteria->compare('status_id',Status::DRAFT);
		
		$template = Patient::model()->find('customer_id=:cid and name=:name', array(':cid'=>$this->id,':name'=>'Template'));
		//var_dump($template);
		$id=0;
		if(isset($template)){
		$id = $template->id;
		}
		$criteria->compare('patient_id',$id);
		
		$res =  new CActiveDataProvider('Order',array(
			'criteria'=>$criteria,
			'sort'=>array(
					'defaultOrder'=>'request_received DESC',
			),
			'pagination'=>array(
					'pageSize'=>5
			),
		));
		
		// $res = Order::model()->findAllBySql('select * from orders as o, patients as p where o.customer_id=:customer_id and p.name=:template and o.patient_id = p.id',array('customer_id'=>$this->id,':template'=>'Template'));
		// 
		return $res;
	}
    	function recentOrders(){
		
		$criteria = new CDbCriteria;
		$criteria->compare('customer_id',$this->id);
		
		$res =  new CActiveDataProvider('Order',array(
			'criteria'=>$criteria,
			'sort'=>array(
					'defaultOrder'=>'request_received DESC',
			),
			'pagination'=>array(
					'pageSize'=>100
			),
		));
		
		// $res = Order::model()->findAllBySql('select * from orders as o, patients as p where o.customer_id=:customer_id and p.name=:template and o.patient_id = p.id',array('customer_id'=>$this->id,':template'=>'Template'));
		// 
		return $res;
	}
    	function recentPatients(){
		
		$criteria = new CDbCriteria;
		$criteria->compare('customer_id',$this->id);

		$res =  new CActiveDataProvider('Patient',array(
			'criteria'=>$criteria,
			'sort'=>array(
					'defaultOrder'=>'id DESC',
			),
			'pagination'=>array(
					'pageSize'=>100
			),
		));
		return $res;
	}
}