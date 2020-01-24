<?php

class BatchNumber extends CActiveRecord {
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
	public function tableName()
	{
		return 'order_batch';
	}
	public function rules()
	{
		return array(
		array('name, contact_person, tel_1, fax, province', 'length', 'max'=>500),
		array('name, contact_person, tel_1, fax, province', 'required'),
		// The following rule is used by search().
		// Please remove those attributes that should not be searched.
		array('id, name, contact_person, tel_1, fax, province', 'safe', 'on'=>'search'),
		);
	}
	public function relations()
	{
		return array(
				'customers' => array(self::HAS_MANY, 'Customer', 'hospital_id'),
				'orders' => array(self::HAS_MANY, 'Order', 'hospital_id'),
		);
	}
	public function attributeLabels()
	{
		return array(
				'id' => 'ID',
				'name' => 'Name',
				'contact_person' => 'Contact Person',
				'tel_1' => 'Tel 1',
				'fax' => 'Fax',
				'province' => 'Province',
		);
	}
	public function newBatch($orders) {
		return '';
	}
}