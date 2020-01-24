<?php

class OrderItem extends CActiveRecord {
	/**
	 * The followings are the available columns in table 'order_items':
	 * @var integer $id
	 * @var integer $order_id
	 * @var integer $product_id
	 * @var string $order_per_day
	 * @var string $consume_time       // ConsumeTime::fromString($data)
	 * @var string $price
	 * @var string $unit_price
	 * @var string $quantity
	 * @var string $weight
	 * @var string $remarks
	 * @var integer $unit_id
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
	public function tableName()
	{
		return '{{order_items}}';
	}
	public function beforeSave() {
		$this->calculatePrice();
		return parent::beforeSave();
	}
	public function rules()
	{
		return array(
			array('consume_time', 'normalizeConsumeTime'),
			array('order_per_day, consume_time, order_id, product_id', 'required'),
            array('order_id', 'required'),
            array('order_id, product_id, unit_id', 'numerical', 'integerOnly'=>true),
            array('order_per_day, consume_time', 'length', 'max'=>45),
            array('price', 'length', 'max'=>10),
            array('id, order_id, product_id, order_per_day, consume_time, price, unit_id', 'safe', 'on'=>'search'),
		);
	}
	public function relations() {
		return array(
			'order' => array(self::BELONGS_TO, 'Order', 'order_id'),
			'product' => array(self::BELONGS_TO, 'Product', 'product_id'),
			'unit' => array(self::BELONGS_TO, 'Unit', 'unit_id')
		);
	}
	public function attributeLabels()
	{
		return array(
			'order_id'		=> 'Order',
			'weight'		=> 'Weight',
			'quantity'		=> 'Quantity',
			'id' 			=> 'Id',
			'order_per_day' => 'Order Per Day',
			'consume_time' 	=> 'Consume Time',
		);
	}
	public function normalizeConsumeTime() {
		if (is_array($this->consume_time))
			$this->consume_time = json_encode($this->consume_time);
		return $this->consume_time;
	}
	public function calculatePrice($order=null) {
		if ($order) {
			$days = $order->days;
		} else {
			$days = $this->order->days;
		}
		$this->price =  $this->product->getPrice($this->order_per_day, $this->order);
		return $this->price;
	}
    public function search()
    {
    	$criteria=new CDbCriteria;
        $criteria->compare('id',$this->id);
        $criteria->compare('order_id',$this->order_id);
        $criteria->compare('product_id',$this->product_id);
        $criteria->compare('order_per_day',$this->order_per_day,true);
        $criteria->compare('consume_time',$this->consume_time,true);
        $criteria->compare('price',$this->price,true);
        $criteria->compare('quantity',$this->quantity,true);
        $criteria->compare('weight',$this->weight,true);
        $criteria->compare('unit_id',$this->unit_id);
        return new CActiveDataProvider(get_class($this), array(
            'criteria'=>$criteria,
        ));
    }
}