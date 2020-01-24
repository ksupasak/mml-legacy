<?php 
/**
 * This is the model class for table "customers".
 *
 * Customer Id corresponds to a User Id. One user is the owner of a customer.
 *
 * The followings are the available columns in table 'customers':
 * @property integer $id
 * @property integer $user_id
 * @property integer $hospital_id
 * @property string $full_name
 * @property string $email_to
 * @property string $cc_to
 * @property string $bcc_to
 * @property User $user
 * @property Hospital $hospital
 */
class Clinician extends User {
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
	public function tableName()
	{
		return 'clinicians';
	}
	public function filter(){
		$criteria = new CDbCriteria;
		$customer = Customer::getFromUser(Yii::app()->session['user.id']);
	   
		if(isset($customer)){
				$criteria->condition = "hospital_id=:h_id";
				$criteria->params=array(':h_id'=>$customer->hospital_id);
		}
		
		return new CActiveDataProvider(get_class($this),array(
			'criteria'=>$criteria
		));
	}
	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		return array(
			'user' => array(self::BELONGS_TO, 'User', 'user_id'),
			'hospital'=>array(self::BELONGS_TO, 'Hospital','hospital_id')
		);
	}
	
	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('full_name, hospital_id', 'required'),
			array('id, full_name,cc_to,bcc_to,email_to, full_name_en , user_id, hospital_id', 'safe'),
		);
	}
	
	public static function dropDownOptions( $customer_id ) {

			
		$customer = Customer::model()->findByPk($customer_id);
		
		$clinicians = $customer->hospital->clinicians;
		
		$list = array();
		foreach ($clinicians as $clinician) {
			$list[ $clinician->id ] = $clinician->full_name;
		}
		return $list;
	}
	
	function recentOrders(){
		
		$criteria = new CDbCriteria;
		$criteria->compare('clinician_id',$this->id);
		
		$res =  new CActiveDataProvider('Order',array(
			'criteria'=>$criteria,
			'sort'=>array(
					'defaultOrder'=>'request_received DESC',
			),
			'pagination'=>array(
					'pageSize'=>20
			),
		));
		
		// $res = Order::model()->findAllBySql('select * from orders as o, patients as p where o.customer_id=:customer_id and p.name=:template and o.patient_id = p.id',array('customer_id'=>$this->id,':template'=>'Template'));
		// 
		return $res;
	}
    	function recentPatients(){
	
	
		$customer = Customer::model()->find('hospital_id=:h_id',array(':h_id'=>$this->hospital->id));
		
		$criteria = new CDbCriteria();
		$criteria->with = array('orders'=>array('select'=>array('clinician_id')));
		$criteria->together = true; // ADDED THIS
		
		$criteria->condition = "orders.clinician_id=:c_id";
		$criteria->params=array(':c_id'=>$this->id);
		// $criteria->compare("`orders`.`clinician_id`",$this->id);
		// $criteria->compare('orders.clinician_id',$this->id);

		// $criteria->compare('orders.customer_id',$customer->id);
		
        // var_dump($criteria->with);

	

		$res =  new CActiveDataProvider('Patient',array(
			'criteria'=>$criteria,
			'sort'=>array(
					'defaultOrder'=>'orders.id DESC',
			),
			'pagination'=>array(
					'pageSize'=>20
			),
		));
		
			foreach($res->getData() as $patient){

				if(!isset($patient->clinician_id)){
					$patient = Patient::model()->findByPk($patient->id);
					$patient->clinician_id = $this->id;
					$patient->save();
				}

			}
		
		return $res;
	}
	
}
?>