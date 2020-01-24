<?php

/**
 * This is the model class for table "hospitals".
 *
 * The followings are the available columns in table 'hospitals':
 * @property integer $id
 * @property string $name
 * @property string $contact_person
 * @property string $tel_1
 * @property string $fax
 * @property string $province
 *
 * The followings are the available model relations:
 * @property Customers[] $customers
 * @property Order[] $orders
 * @property Clinician $clinicians
 */
class Hospital extends CActiveRecord
{
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
	public function tableName()
	{
		return 'hospitals';
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
			'clinicians' => array(self::HAS_MANY, 'Clinician', 'hospital_id'),
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
	public function search()
	{
		$criteria=new CDbCriteria;
		$criteria->compare('id',$this->id);
		$criteria->compare('name',$this->name,true);
		$criteria->compare('contact_person',$this->contact_person,true);
		$criteria->compare('tel_1',$this->tel_1,true);
		$criteria->compare('fax',$this->fax,true);
		$criteria->compare('province',$this->province,true);
		return new CActiveDataProvider(get_class($this), array(
			'criteria'=>$criteria,
		));
	}
	public function viewLink() {
		$view =  CHtml::link('info', Yii::app()->createUrl('hospital/view', array('id'=>$this->id)));
		return "{$this->name}";
	}
}