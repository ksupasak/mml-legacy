<?php
/*
	* @var integer $id
	* @var integer $customer_id
	* @var string  $credit
	* @var string  $debit
	* @var string  $balance
	* @var string  $category
    * @property Customer $customer
	*/
class Payment extends Transaction {
	public static function model($className=__CLASS__) {
		return parent::model($className);
	}
	public function relations() {
		return array(
			'customer'=>array(self::BELONGS_TO,'Customer','customer_id')
		);
	}
	function filter($criteria=null) {
		$filter = parent::filter($criteria);
		$filter->criteria->compare('category', parent::PAYMENT, true);
		return $filter;
	}
	function init() {
		$this->category = self::PAYMENT;
	}
	public static function listAsJson() {
		$list = array();
		$orders = Order::model()->findAll(); //#
		foreach ($orders as $order) {
			$o = new stdClass;
			$o->updated = 'Fri 14 Aug 14:13';
			$o->status = $order->status->name;
			$o->order_uuid = sprintf('<a href="ViewOrder?orderId=%s">%s</a>',$order->id, $order->uuid);
			$clinician = $order->customer->getClinician();
			$o->clinician = sprintf('<a href="OrderByClinician?clinicianId=%s">%s</a>',$order->customer->id,$clinician->full_name);
			$total_amount = "1,000.00";  //#
			$o->total_amount = sprintf('$%s',$total_amount);
			$balance = "1,000.00";
			$o->balance = sprintf('<span>%s</span><input type="checkbox" />', $balance);
				$update = '<button class="yui-button">Update</button>';
				$printInvoice = sprintf('<a href=""><img alt="Print Invoice" src="%s" /></a>', Yii::app()->baseUrl.'/images/icon/print.gif' );
				$printReciept = sprintf('<a href=""><img alt="Print Reciept" src="%s" /></a>', Yii::app()->baseUrl.'/images/icon/print.gif' );
			$o->actions = '<div style="width:110px";>'.$update.$printReciept.$printInvoice.'</div>';
			$list[] = $o;
		}
		return json_encode($list);
	}
}
