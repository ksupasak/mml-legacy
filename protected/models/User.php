<?php

class User extends CActiveRecord {
	/**
	 * The followings are the available columns in table 'users':
	 * @var integer $id
	 * @var string $username
	 * @var string $password
	 * @var string $salt
	 * @var string $email
	 * @var string $profile
	 * @var string $display_name
	 * @var string $type
	 * @property integer $customer_id
	 * @property Customer $customer
	
	 $ @property UserPIN $pin
	 $ @property Clinician $clinicain
	 */
	public $new_password; // update / new user form change password here.

	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	public function tableName()
	{
		return '{{users}}';
	}

	public function rules()
	{
		return array(
			array('username, password, email, type', 'required'),
			array('username, password, email', 'length', 'max'=>128),
			array('username, password, display_name, full_name, email, type,customer_id', 'safe'),
			array('username', 'unique', 'on'=>'create')
		);
	}
	public function relations() {
		return array(
			'customer' 	=> array(self::BELONGS_TO, 'Customer', 'customer_id'),
			'clinician'=>array(self::HAS_ONE,'Clinician','user_id'),
			'pin' => array(self::HAS_ONE, 'UserPin', 'user_id'),
		);
}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'Id',
			'username' => 'Username',
			'password' => 'Password',
			'salt' => 'Salt',
			'email' => 'Email',
			'profile' => 'Profile',
		);
	}

	public function validatePassword($password)
	{
		return $this->hashPassword($password,$this->salt)===$this->password;
	}
	public function hashPassword($password,$salt)
	{
		return md5($salt.$password);
	}
	protected function generateSalt()
	{
		return uniqid('',true);
	}
	public function newPassword($new_password) {
		$this->salt = $this->generateSalt();
		$this->password = $this->hashPassword( $new_password, $this->salt );
		$this->save();
	}
	protected function beforeSave() {
		// hash current password and reset salt
		if(isset($this->password)&&strlen($this->password)<20){
			$this->password = $this->hashPassword($this->password,$this->salt);
		}
		return parent::beforeSave();
	}

	/**
	 * For Gridview demo
	 */
	public function search() {
		$criteria=new CDbCriteria;
		$criteria->addCondition('inactive != 1');
		$criteria->compare('username',$this->username,true);
		$criteria->compare('email',$this->email,true);
		return new CActiveDataProvider(get_class($this), array(
			'criteria'=>$criteria,
			'sort'=>array(
				'defaultOrder'=>'type ASC',
			),
			'pagination'=>array(
				'pageSize'=>5
			),
		));
	}

	/* Ref: Dev_Note.odt #System Users */
	private static $types = array(
				'ADMIN'=> 			array('Admin', 		'//site/home'),
				'MANAGER'=> 		array('Manager',	'//site/home'),
				'PRODUCT_MANAGER'=> array('Product Manager','//user/home/product_manager'),
				'SALE'=> 			array('Sale',		'//user/home/sale'),
				'ACCOUNTING'=> 			array('Accounting',		'//user/home/accounting'),
				'CLINICIAN'=>		array('Clinician',	'//user/home/clinician'),
				'CLINICIAN_STAFF'=>	array('Clinician Staff', '//user/home/clinician_staff'),
				'PHARMACIST'=>		array('Pharmacist', '//user/home/pharmacist'),
				'MANUFACTURE'=>		array('Manufacture',	'//user/home/manufacture'),
				'OPERATOR'=>		array('Operator',	'//user/home/operator'),
			);
	public static function listTypes(){
		$types = array();
		foreach ( self::$types as $t => $userType ) {
			$types[$t] = $userType[0];
		}
		return $types;
	}
	
		public static function listUsers(){
		$types = array();
		foreach (  User::model()->findAll() as $u ) {
			$types[$u->id] = $u->username;
		}
		return $types;
	}
	public function homeView() {
		return self::$types[$this->type][1];
	}
	public function isType($type){
		if ($this->type == $type) {
			return true;
		} else {
			return false;
		}
	}
	public function hasPIN() {
		$user_pin = UserPin::model()->find('user_id=:id',array(':id'=>$this->id));
		if ($user_pin)
		return true;
		return false;
	}
	public function setPIN($pin) {
		$user_pin = UserPin::model()->find('user_id=:id',array(':id'=>$this->id));
		if ($user_pin) {
			$user_pin->pin = $pin;
			$user_pin->save();
		} else {
			$user_pin = new UserPin;
			$user_pin->pin = $pin;
			$user_pin->save();
		}
		return $user_pin;
	}
	public static function getByPIN($pin) {
		$pin = UserPin::model()->find('pin=:pin',array(':pin'=>$pin));
		if ($pin){
			return $pin->user;
		}
		return false;
	}
	public static function authorize($action){
		$role =  Yii::app()->session['user.type'];
		if(!isset($role))return false;
		if($action=='manage'&&$role!='CLINICIAN'&&$role!='CLINICIAN_STAFF'&&$role!='PHARMACIST' ){
			return true;
		}
		if($action=='admin'&&$role=='ADMIN' ){
			return true;
		}
		return false;
	}

}