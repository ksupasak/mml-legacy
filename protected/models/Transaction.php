<?php
/**
 * This is the model class for table "transactions".
 *
 * This table is data store for Invoice, Payment, and Deduction models
 * The followings are the available columns in table 'hospitals':
 * @property integer $id
 * @property string $category       // self::INVOICE self::PAYMENT self::DEDUCTION
 * @property string $credit
 * @property string $debit
 * @property string $balance
 * @property string $remarks
 * @property string $created
 * @var integer $customer_it
 * The followings are the available model relations:
 * @property Customers[] $customers
 * @property Order[] $orders
 */
class Transaction extends CActiveRecord {
	/* Transaction types */
	const NO_TYPE = 0;
	const INVOICE = 1;
	const PAYMENT = 2;
	const DEDUCTION = 3;

	public static function model($className=__CLASS__) {
		return parent::model($className);
	}
	public function tableName() {
		return 'transactions';
	}
	protected function beforeSave() {
		$this->updated = date('Y-m-d H:i:s');
		if(!isset($this->created)){
		$this->created = date('Y-m-d H:i:s');
		}
		// $this->customer->balance = $this->customer->balance + $this->credit + $this->debit;
		// $this->customer->save(); // TODO: transaction processing
		return parent::beforeSave();
	}
	public function balance($amount,$action) {
		$transaction = $this->dbConnection->beginTransaction();
		try{
			$customer = Customer::model()->findByPk($this->customer_id);
			$old_balance = $customer->balance;
			if ($action == self::INVOICE) {
				if(!isset($old_balance)){
					$old_balance=0;
				}
				$this->balance = $old_balance - $amount;
				$this->credit = $amount;
				$this->debit = 0;
				$this->save();
			} elseif ($action == self::PAYMENT) {
				$this->balance = $old_balance + $amount;
				$this->credit = 0;
				$this->debit = $amount;
				$this->save();
			}
			$customer->balance = $this->balance;
			$customer->save();
			$transaction->commit();    // committing
        }
        catch (Exception $e){
            $transaction->rollBack();
			echo "roll back";
        }
	}
	public function filter($criteria) {		
		if (!$criteria)
			$criteria=new CDbCriteria;
		/* Date range */
		if ( isset($_GET['Filter']) ){
			if (isset($_GET['Filter']['from']) && $_GET['Filter']['from']   )
				$criteria->addCondition('request_received >= "'.$_GET['Filter']['from'].'"');
			if (isset($_GET['Filter']['to']) && $_GET['Filter']['to'] ) 	
				$criteria->addCondition('request_received <= "'.$_GET['Filter']['to'].'"'); 
			if (isset($_GET['Order']['status']) && $_GET['Order']['status']){
					$status_id = $_GET['Order']['status'];
					$criteria->addCondition('status_id = '.$status_id, 'OR');
			}
		}
		//$criteria->compare('referrer',$this->referrer,true);
		return new CActiveDataProvider(get_class($this), array(
			'criteria'=>$criteria
		));
	}
	public function renderPaidCheckBox() {
		if (isset($this->paid)) {
			if($this->paid)return 'Paid';
			$options = array();
			$options['value']= $this->id;
			if ($this->paid != 0) {
				$options['checked'] = $this->paid;
			}
			$html = CHtml::checkbox('paid_transaction[]', $this->paid, $options);
			return sprintf($html,$this->id);
		} else {
			return ' ';
		}
	}
}