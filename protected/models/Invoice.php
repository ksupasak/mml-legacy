<?php
/**
 * @var integer $id
 * @var integer $customer_id
 * @var string  $credit
 * @var string  $debit
 * @var string  $balance
 * @var string  $category
 * @var string $delivery_date
 * @var string $due_date
 * @var integer $paid
 * @property Order[] $orders
 * @property Customer $customer
 */
class Invoice extends Transaction {
	public $total_amount = 0;
	public static function model($className=__CLASS__) {
		return parent::model($className);
	}
	function init() {
		$this->category = Transaction::INVOICE;
	}
	function relations() {
		return array(
			'orders' => array(self::HAS_MANY, 'InvoiceOrder', 'invoice_id'),
			'customer'=> array(self::BELONGS_TO,'Customer','customer_id')
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
			array('id, delivery_date, due_date, paid', 'safe'),
		);
	}
	
	public function filter($criteria = null) {
		$filter = parent::filter($criteria);
		$filter->criteria->compare('category', parent::INVOICE, true);
		return $filter;
	}
	function create() {
	}
	function edit() {}
	function addOrder($order_id) {
		$ivc = new InvoiceOrder();
		$order = Order::model()->findByPk($order_id);
		$order->invoice_id = $this->id;
		$order->save();
		$ivc->attributes = array(
				'invoice_id' => $this->id,
				'order_id'	=> $order_id
			);
		if ($ivc->validate()) {
			$this->total_amount += $order->getFinalTotalAmount();;
			$ivc->save();
			// $this->credit = $this->credit + $order->getFinalTotalAmount();
			// $this->debit = $this->debit + 0;
			// $this->credit=999;
			$this->save();
		}
		return true;
	}
	function setOrders($orders) {
		if (!is_array($orders) ) { throw new Exception('Excecting Arrary'); }
		foreach ($orders as $order => $v) {
		echo "Invoice id". $this->id." order Id".$v."<br />";
			$ivc = InvoiceOrders::model();
			$ivc->attributes = array( 
				'invoice_id' => $this->id,
				'order_id' => $v
			);
			$ivc->validate();
			$ivc->save();
		}
		$this->save();
		return count($orders);
	}
	function countOrders() {
		return count($this->orders); //TODO: Make efficient
	}
	function invoiceDetailLink() {
		return CHtml::link('View Invoice',Yii::app()->createUrl('accounting/InvoiceDetail?invoice='.$this->id));		
	}
	function deliveryReportLink() {
		return CHtml::link('Delivery Report',Yii::app()->createUrl('delivery/DeliveryReport?delivery='.$this->id));
	}
	

}