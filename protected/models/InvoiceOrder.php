<?php
/**
 *   @var integer $id
 *   @var integer $invoice_id
 *   @var integer $order_id
 *   @property Order $order
 */

class InvoiceOrder extends CActiveRecord {
	public static function model($className=__CLASS__) {
		return parent::model($className);
	}
	public function tableName() {
		return 'invoice_orders';
	}
	public function rules() {
		return array(
			array('invoice_id, order_id','required')
		);
	}
	public function relations() {
		return array(
			'order'=>array(self::BELONGS_TO, 'Order', 'order_id')
		);
	}
	public function attributeLabels()
	{
		return array(
			'order_id'			=> 'Order',
			'invoice_id'		=> 'Invoice',
		);
	}
}