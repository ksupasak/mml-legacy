<?php

class Patient extends CActiveRecord {
	/**
	 * The followings are the available columns in table 'users':
	 * @var integer 	$id
	 * @var string 		$name
	 * @var string 		$hn
	 * @var integer 	$customer_id
	 * @var integer 	$clinician_id
	 *
	 * @property Customer    	$customer
	 * @property Order[] $orders
	 */

	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}


	public function tableName()
	{
		return '{{patients}}';
	}
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'orders' => array(self::HAS_MANY, 'Order', 'patient_id'),
			'customer'=>array(self::BELONGS_TO,'Customer','customer_id')		
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
			array('name,hn,customer_id,clinician_id', 'safe'),
			array('customer_id', 'required'),
			array('patient_name, patient_hn', 'required', 'on'=>'create')
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'Id',
			'name' => 'Name',
			'hn' => 'HN',
			'customer_id' => 'Customer ID',
			'customer' => 'Customer Account',
		);
	}
	/**
	 * For Gridview 
	 */
	public function search() {
		$criteria=new CDbCriteria;
		$criteria->compare('name',$this->name,true);
		$criteria->compare('hn',$this->hn,true);
		return new CActiveDataProvider(get_class($this), array(
			'criteria'=>$criteria,
			'sort'=>array(
				'defaultOrder'=>'hn ASC',
			),
			'pagination'=>array(
				'pageSize'=>5
			),
		));
	}

	public static function getRecentOrders(){
		$customer_id = 0;
		$dataProvider=new CActiveDataProvider('Order', array(
			'criteria'=>array(
				'condition'=>'customer_id='.$customer_id,
				'order'=>'create_time DESC',
				'with'=>array('patient'),
			),
			'pagination'=>array(
				'pageSize'=>20,
			),
		));
		return $dataProvider->getData();
	}
	public function viewLink() {
		$view =  CHtml::link('info', Yii::app()->createUrl('patient/view', array('id'=>$this->id)));
		return "{$this->name}<br/>HN : {$this->hn} {$view} ";
	}
	public function viewLinkWithHN() {
		
		return CHtml::link("HN# {$this->hn}", Yii::app()->createUrl('patient/view', array('id'=>$this->id)));
	}
	public function customerLink() {
		if (!isset($this->customer) || !isset($this->customer->data)){
			return '-';
		}
		$text = CHtml::encode($data->customer->account_name.'( ACC# '.$data->customer->id.' )');
		return CHtml::link($text, Yii::app()->createUrl('customer/view', array('id'=>$data->customer->id)));
	}
	public function getCompleteOrders(){
		$results = Array();
		
		foreach($this->orders as $i){
			if($i->status_id==Status::COMPLETE){
			array_push($results, $i);
			}
		}	
		return $results;
	}
	
	public function getCompleteTemplateOrders(){
		
		
		$criteria = new CDbCriteria;
		$criteria->compare('patient_id',$this->id);
		$criteria->compare('status_id>',Status::COMPLETE);

		$res =  new CActiveDataProvider('Order',array(
			'criteria'=>$criteria,
			'sort'=>array(
					'defaultOrder'=>'request_received DESC',
			),
			'pagination'=>array(
					'pageSize'=>10
			),
		));
		
		return $res;
		
	}
	
	
	
	public function recentOrders() {
		$criteria = new CDbCriteria;
		$criteria->compare('patient_id',$this->id);
		return new CActiveDataProvider('Order',array(
			'criteria'=>$criteria,
			'sort'=>array(
					'defaultOrder'=>'request_received DESC',
			),
			'pagination'=>array(
					'pageSize'=>5
			),
		));
	}
}