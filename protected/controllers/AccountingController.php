<?php

class AccountingController extends Controller {
	
	
	public function filters()
    {
        return array(
            'accessControl',
        );
    }
	public function accessRules()
    {
        return array(
            array('deny',
                'actions'=>array('create', 'edit','ManageOrders','SelectCustomer'),
                'users'=>array('?'),
            )
        );
    }
	public $customer_id;
	function actionManagePayments() {
		//$filter = array();
		//$payments = Payment::from($filter);
		$this->render('managePayments');
	}
	function actionManageCustomers() {
		$customer = Customer::model();
		$params = array('customer'=>$customer->billable());
		$this->render('customers', $params);
	}
	function actionManageBillings() {
		$orders = Order::model()->filter();
		$customers = Customer::model();
		$completedOrders = $orders->criteria->addCondition('status_id',Status::COMPLETE, true);
		$params = array('orders'=>$completedOrders, 'customers'=>$customers);
		$this->render('manage', $params);
	}
	function actionCustomerBilling($customer) {
		$this->customer_id = $customer;
		$customer = Customer::model()->findByPk($customer);
		$criteria = new CDbCriteria();
		$criteria->compare('customer_id',$customer->id,true);
		$order_criteria = new CDbCriteria;
		$order_criteria->compare('customer_id',$customer->id);
		$order_criteria->compare('status_id',Status::COMPLETE);
		$order_criteria->addCondition('invoice_id IS NULL');
		$orders= new CActiveDataProvider('Order', array(
				'criteria'=>$order_criteria
			));
		$invoice = new Invoice;	
			
		$invoice_criteria = new CDbCriteria;
		$invoice_criteria->compare('customer_id',$customer->id);
		$invoice_criteria->compare('category', Transaction::INVOICE);
		$invoices= new CActiveDataProvider('Invoice', array(
				'criteria'=>$invoice_criteria
		));
		$payment_criteria = new CDbCriteria;
		$payment_criteria->compare('customer_id',$customer->id);
		$payment_criteria->compare('category', Transaction::PAYMENT);
		$payments= new CActiveDataProvider('Payment', array(
				'criteria'=>$payment_criteria
		));
		$transaction_criteria = new CDbCriteria;
		$transaction_criteria->compare('customer_id',$customer->id);
		$transaction_criteria->order = 'created DESC';
		$transactions = new CActiveDataProvider('Transaction', array(
				'criteria'=>$transaction_criteria
		));
		$params = array(
					'customer'	=> $customer,
					'orders'	=> $orders,
					'invoices'	=> $invoices,
					'payments'	=> Payment::model()->filter($criteria),
					'transactions' => $transactions
		);
		$this->render('billing', $params);		
		
	}
	function actionCreateInvoice($customer) {
		$this->customer_id = $customer;
		$customer = Customer::model()->findByPk($customer);
		if ($_POST) {
			$invoice = new Invoice();
			$invoice->attributes = $_POST['Invoice'];
			$invoice->customer_id = $this->customer_id;
			$invoice->save(); //TODO: refine this.
			$orders = $_POST['Orders']; // <input name="Orders[]" />
			foreach ($orders as $order_id => $order_uuid) {
				$invoice->addOrder($order_id);
			}
			// var_dump($invoice);
			$invoice->balance($invoice->total_amount, Transaction::INVOICE);
			$this->redirect($this->createUrl('accounting/CustomerBilling/?customer='.$this->customer_id.'#Invoices'));
		} else {
			echo "errror creating invoice!";
		}
	}
	function actionInvoiceDetail($invoice) {
		$invoice = Invoice::model()->findByPk($invoice);
		$params = array('invoice'=>$invoice);
		$this->render('invoice',$params);
	}
	
	function actionCancelInvoice($invoice) {
		$invoice = Invoice::model()->findByPk($invoice);
		$customer = $invoice->customer;
		foreach($invoice->orders as $i){
			$order = $i->order;
			$order->invoice_id=null;
			$order->save();
			$i->delete();
		}
		$invoice->delete();
		$this->redirect($this->createUrl('accounting/CustomerBilling/?customer='.$customer->id.'#Invoices'));
	}
	
	function actionMakePayment($customer) {
		$payment = new Payment;
		$payment->customer_id = $_POST['customer_id'];
		$payment->save();
		$payment->remarks = $_POST['remarks'];
		$payment->balance($_POST['amount'],Transaction::PAYMENT);
		if(isset($_POST['paid_transaction'])){
			foreach($_POST['paid_transaction'] as $i){
				$o = Invoice::model()->findByPk($i);
				$o->paid = true;
				$o->save();
			}
			
		}
		
		

		if ($payment->save() ) {
			$this->redirect($this->createUrl('accounting/CustomerBilling', array('customer'=>$_POST['customer_id'])));
		} else {
			
			echo "payment error. try again.";
		}
	}
	
	

}