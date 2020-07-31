<?php
/**
 * This is the model class for table "orders".
 *
 * The followings are the available columns in table 'orders':
 * @property integer $id
 * @property string $uuid
 * @property integer $lot_number
 * @property string $status_id
 * @property string $request_received
 * @property string $confirm_date
 * @property string $quote_price
 * @property integer $customer_id
 * @property integer $patient_id
 * @property integer $clinician_id
 * @property string $delivery_date
 * @var integer $days
 * @property string $amount;
 * @property string $amount_total
 * @property string $additional_charge
 * @property string $discount_factor
 * @property string $marketing_charge
 * @property string $monthly_price
 * @property string $daily_price
 * @property integer $packaging
 * @property string $total_weight
 * @property string $cap_per_day
 * @var string $remarks
 * The followings are the available model relations:
 * @property ManufacturingRequests[] $manufacturingRequests
 * @property OrderItem[] $items
 * @property OrderLog $orderLogs
 * @property Customer $customer
 * @property Patient $patient
 * @property Status $status
 */
class Order extends CActiveRecord
{
	public  $vat = 0.07;   //TODO: make configurable VAT
	public  $charge =0; //TODO: compute charge
	public	$patient_name;
	public	$patient_hn;
	public	$clinician_name;
	
	public  $caps_per_day;
	public	$caps_to_be_made;
	public	$cap_weight;
	public	$filler_needed;
	public $order_cost;

	public $updated;
	
    private $update_inventory_hook = false;
	private $autofill_template; //the order to use as autofill template
	/**
	 * Returns the static model of the specified AR class.
	 * @return Order the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
	public function tableName()
	{
		return 'orders';
	}
	protected function beforeSave() {
		$save_status = Yii::app()->request->getPost('save');
		$this->uuid();
			

			
		if ($save_status) {
			
				
			if(($this->status_id==Status::DRAFT or !isset($this->status_id) ) and $save_status==Status::REQUEST){
				// $this->confirm_date=date('Y-m-d');
				if(true) {
				$message = new YiiMailMessage();
				$message->setFrom('noreply@maxmaxlife.com');
				$message->setTo('service@maxmaxlife.com');
				$message->setSubject('[maxmaxlife] New order notification.');
				
	            $message->setBody("New Order : http://service.maxmaxlife.com/order/ManageOrders\n* This message was automatically generated from the system.");
		    if(false){
	            $numsent = Yii::app()->mail->send($message);
			}
	
			}
				
			}
			
				if($this->status_id==Status::PENDING and $save_status==Status::CONFIRMED) {
	                 //Set hook to be updated after save
					$this->update_inventory_hook = true;		
	
	            }
			
			if($this->status_id==Status::CONFIRMED and $save_status==Status::PROCESSING){
				
				
				$sql = 'SELECT max(orders.lot_number) as last FROM orders ';
				$command=Yii::app()->db->createCommand($sql);
				$rows=$command->queryAll(); // query and return all rows of result
				
				$this->lot_number =  $rows[0]['last']+1;
				
			}
            
			if($this->status_id==Status::PROCESSING and $save_status==Status::COMPLETE) {
                 //Set hook to be updated after save
            }
			$this->status_id = $save_status;
			
			
			
		} 
		return parent::beforeSave();
	}
	public function afterSave() {
		// Log updates to order_logs; TODO: clean log message and pattern
		//   order($orderId, $event, $time, $msg)
		Logging::order($this->id, 'UPDATED', date('Y-m-d H:i:s'), 'saved by '.Yii::app()->user->id);
        
        // Hook to update inventory
        if ($this->update_inventory_hook) {
            foreach ($this->items as $item) {
                $inv = new Inventory;
                $inv->product_id = $item->product->id;
                $result = $inv->recordUsed($item);
                if (!$result) throw new Exception("Error recording inventory used for order {$this->id}, item {$item->id}");
                // echo $result->id;
            }
            $this->update_inventory_hook = false; //reset hook
        }
        
		return parent::afterSave();
	}
	protected function afterFind()
	{
		if (isset($this->patient)){ 
			$this->patient_name = $this->patient->name;
			$this->patient_hn = $this->patient->hn;
		} 
		$this->clinician_name = $this->clinician->full_name;
		
		if(empty($this->marketing_code)&&isset($this->customer->default_marketing_code)){
		$this->marketing_code = $this->customer->default_marketing_code;
		}
		//if ($this->delivery_date)
		//	$this->delivery_date = DateTime::createFromFormat('Y-m-d',$this->delivery_date)->format('m/d/Y');
		return parent::afterFind();
	}
	public function patientInfo(){
		return $this->patient_name;
	}
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('customer_id, patient_id, days', 'numerical', 'integerOnly'=>true),
			array('status_id', 'length', 'max'=>45),
			array('customer_id, request_received, uuid, days', 'required', 'on'=>'create'),   //#
			array('days', 'numerical', 'min'=>1),
			array('id, delivery_date, days', 'required', 'on'=>'save'),
			array('clinician_id, patient_name, patient_hn, delivery_date, days,  packaging, additional_charge, marketing_charge, discount_factor, remarks, remarks2, instructions, confirm_date,marketing_code', 'safe'),
			array('id, status_id, request_received, quote_price, customer_id, patient_id, hospital_id, referrer', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'manufacturingRequests' => array(self::HAS_MANY, 'ManufacturingRequests', 'transaction_id'),
			'items' 	=> array(self::HAS_MANY, 'OrderItem', 'order_id'),
			'orderLogs' => array(self::HAS_ONE, 'OrderLog', 'transaction_id'),
			'customer' 	=> array(self::BELONGS_TO, 'Customer', 'customer_id'),
			'clinician' => array(self::BELONGS_TO, 'Clinician','clinician_id'),
			'patient' 	=> array(self::BELONGS_TO, 'Patient', 'patient_id'),
			'status'	=> array(self::BELONGS_TO, 'Status', 'status_id'),
		);
	}

	public function uuid() {
		$this->uuid = sprintf('%04s-%03d-%06d',date('ym'),$this->customer->id,$this->id);
	}
	public function lotid() {
		return  sprintf('%02s-%02s-%02s-%06d',date('y'),date('m'),date('d'),$this->lot_number);
	}
	
	
	function normalize() {
		$this->uuid();
		$this->save();
	}
	function recalculate() {
		$sum = 0.0;
		if (count($this->items)){
			$sum = 0.0;
			foreach ($this->items as $item) {
				$sum += $item->price;
			}
		}
		$this->quote_price = $sum;
		$this->update();
	}
	// Approve order
	// 1. change staatus to approved
	function approve() {
		$this->status_id = Status::APPROVED;
		Logging::order($this->id, 'APPROVED', date('Y-m-d H:i:s'), 'approved by '.Yii::app()->user->id);
		$this->save();
		return true;
	}
	// Delete order
	protected function beforeDelete() {
		foreach ( $this->items as $item ) {
			OrderItem::model()->deleteByPk($item->id);
		}
		return parent::beforeDelete();
	}
	protected function afterDelete() {
		Logging::order($this->id, 'DELETED', date('Y-m-d H:i:s'), 'deleted by '.Yii::app()->user->id);	
		return parent::afterDelete();
	}
	public function attributeLabels()
	{
		return array(
			'id' => 'Order ID',
			'customer_id' => 'Customer ID',
			'patient_id' => 'Patient ID',
			'delivery_date' => 'Delivery Date',
			'display_name'=>'Product Name (ชื่อยา)',
			'category_id'=>'Category (ประเภท)',
			'unit_id'=>'Unit',
			'clinician_name'=>'Clinician Name',
			'hospital_name'=>'Hospital',
			'patient_name'=>'Patient Name',
			'patient_hn'=>'HN',
			'days' => 'Days',
			'status_id' => 'Status',
			'request_received' => 'Order Time',
			'confirm_date' => 'Confirm Date',
			
			'quote_price' => 'Quote Price',
			'amount'=>'Order Amount',
			'additional_charge'=>'Additional Charge',
			'amount_total'=>'Order + VAT + Charges',
			'discount_factor'=>'Discount Factor (%)'
		);
	}
	public function search()
	{
		$criteria=new CDbCriteria;
		$criteria->compare('id',$this->id);
		$criteria->compare('status',$this->status,true);
		$criteria->compare('request_received',$this->request_received,true);
		$criteria->compare('quote_price',$this->quote_price,true);
		$criteria->compare('customer_id',$this->customer_id);
		$criteria->compare('patient_id',$this->patient_id);
		$criteria->compare('hospital_id',$this->hospital_id);
		$criteria->compare('referrer',$this->referrer,true);
		return new CActiveDataProvider(get_class($this), array(
			'criteria'=>$criteria,
		));
	}
	public function filter($criteria = null) {
		if (!$criteria)
			$criteria=new CDbCriteria;
        /* Filter order for clinician */
        if (Yii::app()->session['user.type'] == 'CLINICIAN') {
            $customer_id = Customer::getFromUser(Yii::app()->session['user.id'])->id;
		    $clinician_id = Clinician::model()->find('user_id=:user_id',array(':user_id'=>Yii::app()->session['user.id']))->id;
            $this->customer_id = $customer_id;
			$this->clinician_id = $clinician_id;
        }
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
		
		//order/testFilter?Order[status_id]=1&Filter[from]=2011-08-25&Filter[to]=2011-08-31
		//$criteria->addCondition('request_received > "2010-11-11"'); // This works!
		$criteria->compare('status_id',$this->status_id,true);
		$criteria->compare('customer_id',$this->customer_id, false); //only display orders for this particular cust_id
		$criteria->compare('clinician_id',$this->clinician_id, false); //only display orders for this particular cust_id
		$criteria->compare('patient_id',$this->patient_id);
		$criteria->order = 'request_received DESC';
		
		$orders = new CActiveDataProvider(get_class($this), array(
			'criteria'=>$criteria
		));
		return $orders;
	}
	function getHospital() {
		return $this->customer->hospital;
	}
	
	function getClinician() {
		return $this->clinician;
	}
	
	function lookup_temp() {
		$clinician = User::model()->find('full_name LIKE :name AND type=:type', 
				array(':name'=>$_POST[__CLASS__]['clinician_name'],
						':type'=>'CLINICIAN'));
		if ($clinician) {
			$this->customer_id = Customer::findFromClinician($clinician);
			return true;
		} else {
			return false;
		}
	}
	function calculateTotal() {
	
		$sum = 0;
		
		if(!isset($this->discount_factor)||$this->discount_factor==NULL)$this->discount_factor=0;
		
		$this->amount = $this->calculatetotalAmount($this->days,$this->discount_factor);
		// $this->amount = ($this->amount_total-$this->additional_charge)/1.07;
		$this->amount_total = 	ceil($this->amount * 1.07 +  ($this->additional_charge));
		$this->monthly_price = $this->amount_total / ( $this->days / 30 );
		$this->daily_price = $this->amount_total / $this->days;
		$this->save();
		
		return $sum;                // TODO: copy weight calculation logic here.
	}
	
	
	function calculateTotalAmount($days,$discount_factor) {
		$sum = 0.0;
		$delegation = array();
		
		if (count($this->items)){
			$sum = 0.0;
			foreach ($this->items as $item) {
				$value = $item->calculatePrice($this);
				// var_dump(''.$item->product->display_name.' : '.$item->order_per_day.' = '.$value.'<br/>');
				if($value>=0){
					$sum += $value; //make sure days is up-to-date by using current instance of Order
				}else{
					// register delegation
					if(!isset($delegation[$value%10])){
						$delegation[$value%10]=array();
					}
					$delegation[$value%10][]=$item->order_per_day;
					
				}
			}
			
			// var_dump($delegation);
			if(isset($delegation[0])){
			$v = 0;
			foreach ($delegation[0] as $i) {
			    $v+= intval($i);
			}
			if($v<=500){
			$v = 4.5;
			}
			else if($v<=1000){
			$v = 8;
			}
			else if($v<=1500){
			$v = 10;
			}
			else if($v<=2000){
			$v = 13;
			}
			else if($v<=2500){
			$v = 15;
			}
			else{
			$v = 3+ceil($v/500)*2.5;
			}
			$sum+=$v;
			
			}
			
		}
		
		
		$e130 = $sum;
		
		 // var_dump('sum = '.$sum);
		
		$e131 = 16.0;
		$d = 31;
		$e132 = floatval($discount_factor);
		if($this->packaging==0){
			$e131=0;
			$d = 30;
		}
		$monthly = 0;
		
		if($e132==1.0){
			$monthly = 0;
		}else{
			$monthly = ($d*(1-$e132)*($e130+$e131));
			if($monthly<1000&&$this->packaging!=0){
				$monthly=1000;
			}
		}
		
		if($this->marketing_charge=='y'){
			$monthly*=1.15;
		}
		
		
		$amount = $monthly*( $days / 30 );
		$amount_total = ceil($this->amount * 1.07 +  ($this->additional_charge));
		return $amount;                // TODO: copy weight calculation logic here.
	}
	
	
	public function copy() {
		// echo  "copying...";
		$transaction = Yii::app()->db->beginTransaction();
		try {
			$newOrder = new Order('copy');
			$newOrder->attributes = $this->attributes;
			// var_dump($this->attributes); echo "<hr />";
			// var_dump($newOrder->attributes);
			unset($newOrder->id);
			unset($newOrder->invoice_id);
			unset($newOrder->station_id);
			$newOrder->save();
			$newOrder->normalize();
			// echo "saved";
			var_dump($newOrder->getErrors());
			// echo $newOrder->id;
			$items = $this->items;
			foreach( $items as $item) {
				$i = new OrderItem;
				$i->attributes = $item->attributes;
				$i->order_id = $newOrder->id;
				$i->save();
			}
			$transaction->commit();
		} catch (Exception $e) {
			var_dump($e);
			$transaction->rollBack();
			return false;
		}
		return $newOrder;
	}
	function getSubTotalAmount() {
		if (!$this->id) { //If instace not yet create don't calculate price
			return 0.0;
		}
		if (!isset($this->amount)) {
			$this->calculateTotal();
		}
		return $this->amount; // this will already include additional charge
	}
	function getVATAmount() {
		return -1;
		// return $this->getSubTotalAmount() * $this->vat;
	}
	function getDiscountAmount() {
		return -1;
		// $pre_discount = $this->getSubTotalAmount() + $this->getVATAmount();
		// if ($this->discount_factor) {
		// 	return $pre_discount * ( $this->discount_factor );
		// }	else {
		// 	return $pre_discount;
		// } 
	}
	function getFinalTotalAmount() {
		return $this->amount_total;
		// return $this->getSubTotalAmount() + $this->getVATAmount() - $this->getDiscountAmount();
	}
	function printDiscountAmount() {
		if ($this->discount_factor){
			$percent = $this->discount_factor*100;
			return number_format($this->getDiscountAmount(),2) .'<br /> ( '.$percent.' %)';
		}
		return '-';
	}
	function lastUpdated() {
		$sql =  'SELECT updated, order_id, msg, category FROM order_logs ';
		$sql .= 'WHERE order_id = :id ';
		$sql .= 'ORDER BY updated DESC';
		$command=Yii::app()->db->createCommand($sql);
		$command->bindValue(":id",$this->id,PDO::PARAM_INT);
		$row = $command->queryRow();
		if ($row){ return $row['updated']; }
		return 'N/A';
	}
	/** 
	 * Check if there is previous order that can be use to auto-fill this order.
	 * If there is one, get and cache in autofill_template var.
	 **/
	public function hasAutoFillItems() {
		if (!$this->patient_id) {
			return false; //  only apply to order with patient.
		}
		if ($this->autofill_template) {
			return true; //already lookuped autofill
		}
		// $patient = Patient::model()->findByPk($this->patient_id);
		// 		if (!$patient)
		// 			return false;
		// 		$recent_orders = $patient->recentOrders();
		// 		if ($recent_orders->itemCount) {
		// 			$template_order = $recent_orders->data[0]; // adjust which recent order to use here.
		// 			
		// 			$this->copyItems($template_order);
		// 			// if (get_class($template_order) == 'Order')
		// 			// 		{
		// 			// 			$this->autofill_template = $template_order->getLineItems();	
		// 			// 			return true;
		// 			// 		} 
		// 		}
		return false; //default returns falses
	}
	

	public function copyItems($order){
		
		//$template_order = $recent_orders->data[0]; // adjust which recent order to use here.
		if (get_class($order) == 'Order')
		{
			 //days,  packaging, additional_charge, marketing_charge, discount_factor
			$this->days = $order->days;
			$this->packaging = $order->packaging;
			$this->additional_charge = $order->additional_charge;
			$this->marketing_charge = $order->marketing_charge;
			$this->discount_factor = $order->discount_factor;
			$this->remarks2 = $order->remarks2;
			$this->remarks = $order->remarks;
			$this->autofill_template = $order->getLineItems();	
			return;
		}
		
	}
	/**
	 * Get order items from previous order to auto-fill this one.
	 */
	public function getAutoFillItems() {
		if ($this->autofill_template) {
			return $this->autofill_template;
		} 
		throw new Exception("Error getting Order auto-fill. Call hasAutoFillItems() first?");
	}
	public function getLineItems() {
		if (isset($this->items)) {
			$items = array();
			foreach ($this->items as $item) {
				if($item->order_per_day>0 ){ //&& $item->product->soldout != 1
				$items[$item->product->id] = $item;
				}
			}
			return $items;
		} else {
			return false;
		}
	}

	/* for update alerts */
	function recentlyUpdated($limit=10) {
		$filter = $this->filter();
		$filter->criteria->distinct = true;
		$filter->criteria->alias = 'orders';
		$filter->criteria->join = 'INNER JOIN order_logs ON order_logs.order_id = orders.id';
		$filter->criteria->order = 'order_logs.updated DESC';
		$filter->criteria->limit = $limit;
		return $filter;
	}
	
	/* for update alerts */
	function statusUpdated($status_id, $today = false, $limit = 10) {
		
		$filter = $this->filter();
		
		$filter->criteria->distinct = true;
		$filter->criteria->compare('status_id',$status_id);
		$filter->criteria->alias = 'orders';
		// $filter->criteria->join = 'INNER JOIN order_logs ON order_logs.order_id = orders.id';
		$filter->criteria->join = 'INNER JOIN (select updated, order_id from order_logs group by order_id order by updated desc limit 1000) order_logs ON order_logs.order_id = orders.id';
		
		$filter->criteria->order = 'order_logs.updated DESC';
		//$filter->criteria->order = 'uuid'
		$filter->criteria->limit = $limit;
		return $filter;
	}
	
	
	static function getRecentlyUpdated($filter, $limit=10) {
		$filter->criteria->distinct = true;
		$filter->criteria->alias = 'orders';
		$filter->criteria->join = 'INNER JOIN order_logs ON order_logs.order_id = orders.id';
		$filter->criteria->order = 'order_logs.updated DESC';
		$filter->criteria->limit = $limit;
		return $filter;
	}
	static function getRecentlyUpdatedJson($filter) {
		$orders = self::getRecentlyUpdated($filter);
		$list = array();
		foreach ($orders as $order) {
			$o = new stdClass; 
			$o->updated = $order->lastUpdated(); 
			$o->order_id = $order->id;
			$o->order_uuid = $order->uuid; 
			$o->order_number = sprintf('<a href="UpdateOrder?orderId=%s">%s</a>',$order->id,$order->uuid);
			$o->order_status = sprintf('<a href="ManageOrders?filter={status_id:%s}">%s</a>',
											$order->status->id,$order->status->renderIcon());
			$hospital = $order->customer->hospital;
			$o->order_hospital = sprintf('<a href="ManageOrders?filter={hospital_id:%s}">%s</a>',
											$hospital->id,
											$hospital->name); 
			$clinician = $order->getClinician();
			$o->clinician_id = $clinician->id;
			$o->clinician_name = $clinician->full_name;
			$o->order_clinician =  sprintf('<a href="ManageOrders?filter={clinician_id:%s}">%s</a>',
											$clinician->id, $clinician->full_name);
			$list[] = $o;
		}
		return json_encode($list);
	}
	/* for manage orders */
	public static function getMyOrders($dataProvider=null) {
		
	
		if ($dataProvider) {
			return $dataProvider->getData();
		}
	
		$user = User::model()->findByPk(Yii::app()->user->id);

		if ($user->type == 'ADMIN' ) {
			return Order::model()->findAll('status_id != :na ORDER BY request_received DESC', array(':na'=>0));
		} elseif ($user->type == 'CLINICIAN') {
			$customer=Customer::model()->getFromUser(Yii::app()->user->id);
		    $clinician = Clinician::model()->find('user_id=:user_id',array(':user_id'=>Yii::app()->session['user.id']));

			return Order::model()->findAll('customer_id=:customer_id AND clinician_id=:clinician_id ORDER BY request_received DESC',array(':clinician_id'=>$clinician->id,':customer_id' => $customer->id) );
		} else {
			// echo "invalid user type! from: Order model";
		}
	}
	public static function getMyOrdersJson($dataProvider=null) {
		$list = array();
		$orders = Order::getMyOrders($dataProvider); 
		foreach ($orders as $order) {
			$o = new stdClass;
			$o->updated = $order->lastUpdated(); 
			$o->status = $order->status->renderIcon();
			$o->order_uuid = sprintf('<a href="UpdateOrder?orderId=%s">%s</a>',$order->id, $order->uuid);
			//$o->clinician_hospital = sprintf('<a href="OrderByClinician?clinicianId=%s">%s</a> <br />(<a href="">%s</a>)',$order->customer->id,$clinician->full_name, $order->hospital->name);
			$total_amount = $order->quote_price;
			$o->total_amount = number_format($total_amount,2);
			$balance = number_format($order->quote_price);
			$o->balance = sprintf('<span>%s</span><input type="checkbox" />', $balance);
				$aprove = '<a href="ApproveOrder?orderId='.$order->id.'" id="approve-'.$order->id.'" class="yui-button action-approve"><em>Aprove</em></a>';
				$cancel = '<a href="CancelOrder?orderId='.$order->id.'" id="cancel-'.$order->id.'" class="yui-button action-cancel"><em>Cancel</em></a>';
				$printInvoice = sprintf('<a href="PrintInvoice"><img alt="Print Invoice" src="%s" /></a>', Yii::app()->baseUrl.'/images/icon/print.gif' );
				$printReciept = sprintf('<a href="PrintReciept"><img alt="Print Reciept" src="%s" /></a>', Yii::app()->baseUrl.'/images/icon/print.gif' );
			$o->request_received = $order->request_received;
			$o->actions = $order->getActionLinks();
			$list[] = $o;
		}
		return json_encode($list);
	}
	public static function getClinicianRecentOrders(){
		return Order::model()->findAll();
	}
	// for manufacture/ManageOrder
	public static function getManufacturingOrders() {
		$orders = self::model()->findAll('status_id=:status_id',array(':status_id'=>Status::PROCESSING));
		return $orders;
	}
	public static function getManufacturingOrdersJson() {
		$list = array();
		$orders = self::getManufacturingOrders();
		foreach ($orders as $order) {
			$o = new stdClass;
			$o->updated = $order->lastUpdated(); 
			$o->status = $order->status->renderIcon();		
			$o->order_uuid = sprintf('<a href="ViewOrder?orderId=%s">%s</a>',$order->id, $order->uuid);
			$o->actions = $order->getManufactureActions();
			$list[] = $o;
		}
		return json_encode($list);
	}
	
	public function latestStatus() {
		return sprintf('%s %s',$this->status->iconImage(), $this->lastUpdated());
	}
	public function clinicianInfo() {	
		$clinician = $this->clinician->full_name;
		$hospital = $this->customer->hospital->name;
		return sprintf('%s <br /> (%s)',$clinician, $hospital);
	}
	// Links for Management Actions
	public function updateLink() {
		return CHtml::link($this->uuid, Yii::app()->createurl('order/UpdateOrder', array('orderId'=>$this->id)));
	}
	public function approveLink() {
		$href = Yii::app()->urlManager->createUrl('order/ApproveOrder', array('orderId'=>$this->id));
		$imgHref = Yii::app()->baseUrl . '/images/icon/approved.gif';
		$img = sprintf('<img src="%s" alt="approve" />', $imgHref);
		$tmpl = '<a class="action_btn" href="%s">%s</a>';
		return sprintf($tmpl,$href,$img);
	}
	public function cancelLink() {
		$href = Yii::app()->urlManager->createUrl('order/CancelOrder', array('orderId'=>$this->id));
		$imgHref = Yii::app()->baseUrl . '/images/icon/action4.gif';
		$img = sprintf('<img src="%s" alt="cancel" />', $imgHref);
		$tmpl = '<a class="action_btn" href="%s">%s</a>';
		return sprintf($tmpl,$href,$img);
	}
	public function printQuotationLink() {
		$href = Yii::app()->urlManager->createUrl('order/PrintQuotation', array('orderId'=>$this->id));
		$imgHref = Yii::app()->baseUrl . '/images/icon/white_ico.png';
		$img = sprintf('<img src="%s" alt="quotation" />', $imgHref);
		$tmpl = '<a class="action_btn" href="%s">%s</a>';
		return sprintf($tmpl,$href,$img);
	}
	public function printInvoiceLink() {
		$href = Yii::app()->urlManager->createUrl('order/PrintInvoice', array('orderId'=>$this->id));
		$imgHref = Yii::app()->baseUrl . '/images/icon/print.gif';
		$img = sprintf('<img src="%s" alt="invoice" />', $imgHref);
		$tmpl = '<a class="action_btn" href="%s">%s Invc</a>';
		return sprintf($tmpl,$href,$img);
	}
	public function printRecieptLink() {
		$href = Yii::app()->urlManager->createUrl('order/PrintReciept', array('orderId'=>$this->id));
		$imgHref = Yii::app()->baseUrl . '/images/icon/print.gif';
		$img = sprintf('<img src="%s" alt="reciept" />', $imgHref);
		$tmpl = '<a class="action_btn" href="%s">%s Rcpt</a>';
		return sprintf($tmpl,$href,$img);
	}
	public function getActionLinks() {
		$actions = array($this->approveLink(),$this->cancelLink(), $this->printQuotationLink() ,$this->printInvoiceLink(), $this->printRecieptLink());
		$html =  $actions[0] . ' ' .$actions[1] . '<br />';
		$html .= implode(' ',array_splice($actions,2));
		return '<div class="grid_2">'.$html.'</div>';
	}
	public function getManufactureActions() {
		return $this->printInvoiceLink();
	}
	public function displayStatus() {
		if (isset($this->status)) {
			return "<b>{$this->status->name}</b>";
		} else {
			return '-';
		}
	}
	public function displayRequestedDateTime() {
		if (isset($this->request_receieved)) {
			return $this->request_received;
		} else {	
			return $this->request_received;
		}
	}
	public function displayConfirmDateTime() {
		if (isset($this->confirm_date)) {
			return $this->confirm_date;
		} else {
			return $this->confirm_date;
		}
	}
	public function displayTrackingAction() {
		$form = '<form action="Tracking" method="post">
					<input type="submit" name="barcode" value="%s" />
				</form>';
		return sprintf($form,$this->uuid);
	}
	
	public function renderSelect() {
	
			$html = CHtml::radioButton('Order[template_id]',false,array('value'=>$this->id));
			return $html;
	
	}
	
	// ============================================================================================
	// ============================================================================================
	// ============================================================================================  Manufacture Order Sheet
	// ============================================================================================
	// ============================================================================================
	
	public function calculateManufactureItem($list, $days, $fill_v){
	$total = array(0,0,0,0,0,0);
	$vtotal = array(0,0,0,0,0,0);
	$cost = 0.0;
	foreach($list as $i):
	$p = $i->product;

		if($i->order_per_day>0){

			$per_day_ex = $i->order_per_day;

			// var_dump($i->consume_time);
			$times = ConsumeTime::fromJson($i->consume_time);
			// echo var_dump($times);

			if($times->has('morning_and_evening')){
				$sum = 2;
			}else{
				$sum = 0;
				if($times->hasNum(2))$sum+=1;
				if($times->hasNum(4))$sum+=1;
				if($times->hasNum(8))$sum+=1;
				if($times->hasNum(16))$sum+=1;	
			}

			$adj = 1.0;

			if($p->unit->display_name=='IU'){
				switch (trim($p->note)) {
				    case "vitamin_a":
				        $adj = 0.3;
				        break;
				    case "vitamin_d":
				        $adj = 0.025;
				        break;
				    case "vitamin_e":
			#	        $adj = 0.735*1000;
					$adj = 0.67*1000;
					    break;
					case "d_gamma":
			#	 	$adj = 1/0.15*1000;
					$adj = 0.9*1000;	
				}
			}

		
			$sub = floatval($per_day_ex)*$days/$p->percent_active/$p->unit->gram_conversion_factor*$adj;
			if($sum==0)$sum=1;
			$usub = 1.0/$sum;
			
			$cost +=  $sub * $p->price_base; 

			$v = $p->getVolume($sub); 

			$total[0]+=$sub; 
			$vtotal[0]+=$v;  
	
			if($times->hasNum(2)||$times->hasNum(1)){ 
					$total[1]+=$sub * $usub;
					$vtotal[1]+=$v *$usub;
			}
	
			if($times->hasNum(4)){ 
					$total[2]+=$sub * $usub;
					$vtotal[2]+=$v *$usub;
			}
	
			if($times->hasNum(8)||$times->hasNum(1)){ 
					$total[3]+=$sub * $usub;
					$vtotal[3]+=$v *$usub;
			}
	
			if($times->hasNum(16)){ 
					$total[4]+=$sub * $usub;
					$vtotal[4]+=$v *$usub;
			}
	
		}
		
	endforeach;
	
	//  Todo : per cap is filler scale 

    if($days == 0 )$days = 1; // Prevent divide by zero error
	
	$tdays = $days/30;
	if($tdays==0){
		$tdays = $days;
	}else{
		$tdays = 31*$tdays;
	}

	
	
	$per_cap = 0.418/$fill_v;

	// echo 'per_cap '.$vtotal[1];
	
	   // calculate full weight
	   
		// 0-4 total volumn for each time
	
	   // calculate volumn each time for a day
	   $vtotal[6] = $vtotal[1]*$per_cap/$tdays;
	   $vtotal[7] = $vtotal[2]*$per_cap/$tdays;
	   $vtotal[8] = $vtotal[3]*$per_cap/$tdays;
	   $vtotal[9] = $vtotal[4]*$per_cap/$tdays;
	   $vtotal[5] = $vtotal[6]+$vtotal[7]+$vtotal[8]+$vtotal[9];
	
	
	   // calculate full cap each day
	   $vtotal[11] = ceil($vtotal[6]);
	   $vtotal[12] = ceil($vtotal[7]);
	   $vtotal[13] = ceil($vtotal[8]);
	   $vtotal[14] = ceil($vtotal[9]);
	   $vtotal[10] = $vtotal[11]+$vtotal[12]+$vtotal[13]+$vtotal[14];
	
		// calculate filler 
	   $vtotal[16] = ($vtotal[11]-$vtotal[6])*$fill_v*$tdays;
	   $vtotal[17] = ($vtotal[12]-$vtotal[7])*$fill_v*$tdays;
	   $vtotal[18] = ($vtotal[13]-$vtotal[8])*$fill_v*$tdays;
	   $vtotal[19] = ($vtotal[14]-$vtotal[9])*$fill_v*$tdays;
	   $vtotal[15] = $vtotal[16]+$vtotal[17]+$vtotal[18]+$vtotal[19];
	
	     
	
		
	$result = array();
	$result['usage'] = $total;
	$result['volume'] = $vtotal;
	$result['cost'] = $cost;
	$consume = array();
	$consume[0] = $vtotal[10];
	$consume[1] = $vtotal[11];
	$consume[2] = $vtotal[12];
	$consume[3] = $vtotal[13];
	$consume[4] = $vtotal[14];
	$result['consume'] = $consume;
	
	
	return $result;
		
	}
	
	public function calculateManufacture(){
		
		   $result = array();
		
		   $days = $this->days; 
		
		   $items =  $this->items;
		  
		   $list = array();
		   $compund_list = array();
		   $exclude_list = array();
		   $dispend_list = array();
			//  product indexing 
			
		   foreach($items as $i ):
			 if($i->product->excluded){
				array_push($exclude_list,$i);
			}else{
				$list[$i->product->id]=$i;
			}
		   endforeach;

			
			// ============================================================================================
			// ============================================================================================
			// ============================================================================================  Calculate compound 
			// ============================================================================================
			// ============================================================================================

			// for each categories
			
		   $cs = Category::model()->find('name=:name',array(':name'=>'Compound'));
		   $categories = $cs->children;
		   
		   // weight total & volumne total
		   $total = array();
		   $vtotal = array();
		
		
		 // for each categories
		  foreach($categories as $c):
		     $products = Product::inCategory($c);
			// for each products in compound category
				foreach($products as $p):
				if(isset($list[$p->id])&&$list[$p->id]->order_per_day>0){
						$i = $list[$p->id];
						array_push($compund_list,$i);		
				}
				endforeach;
		   endforeach;
			// process volume cost and price
			
			$r = Order::calculateManufactureItem($compund_list, $days, 0.418);
			$r['name'] = 'Normal Compound';
			$result['compound'] = $r; 
			$result['compound']['sub_cost']=$r['cost'];
			

			// ============================================================================================
			// ============================================================================================
			// ============================================================================================  Calculate exclude compound 
			// ============================================================================================
			// ============================================================================================
		   
			$result['ex_compound'] = array(); 
			
			$sub_cost = 0;
		    foreach($exclude_list as $i):
		  		$tmp = array();
				array_push($tmp,$i);		
				$r = Order::calculateManufactureItem($tmp, $days, 0.418);
				$sub_cost += $r['cost'];
				
				$r['name'] = $i->product->display_name;
				if(!empty($i->product->label))$r['name'] = $i->product->label;
				
				array_push($result['ex_compound'],$r);	 			
		    endforeach;
			$result['ex_compound_cost']=$sub_cost;
		
			$hasdispensed = false;


			// ============================================================================================
			// ============================================================================================
			// ============================================================================================  Calculate dispend  
			// ============================================================================================
			// ============================================================================================
		
		   $result['dispensed'] = array(); 
			
		   $c = Category::model()->find('name=:name',array(':name'=>'Dispensed'));
		   $products = Product::inCategory($c);
		   $sub_cost = 0;
		   foreach($products as $p):
			if(isset($list[$p->id])){

				$cost = 0 ;
				$i = $list[$p->id];

				if($i->order_per_day>0){
				$hasdispensed =true;
				$total = array();


					$times = ConsumeTime::fromJson($i->consume_time);
					// echo var_dump($times);

					if($times->has('morning_and_evening')){
						$sum = 2;
					}else{
						$sum = 0;
						if($times->hasNum(2))$sum+=1;
						if($times->hasNum(4))$sum+=1;
						if($times->hasNum(8))$sum+=1;
						if($times->hasNum(16))$sum+=1;	
					}
					if($sum==0)$sum=1;
					
					$usub = 1.0/$sum;
				    $sub = $i->order_per_day *$usub ;
				    $cost = $p->price_base * $sub; 
				    $sub_cost += $cost;
				    $m0 = $m1 = $m2 = $m3 = 0;
					if($times->has('morning_and_evening')){
						$m0=$sub;
						$m2=$sub;
					}else{
			   			if($times->hasNum(2))$m0=$sub;
						if($times->hasNum(4))$m1=$sub;
						if($times->hasNum(8))$m2=$sub;
						if($times->hasNum(16))$m3=$sub;
					}
					
				   // calculate full cap each day
				   $total[1] = $m0;
				   $total[2] = $m1;
				   $total[3] = $m2;
				   $total[4] = $m3;
				   $total[0] = $total[1]+$total[2]+$total[3]+$total[4];
				
				$r = array();
				$r['name'] = $i->product->display_name;
				if(!empty($i->product->label))$r['name'] = $i->product->label;
				//  process unit name
				$s = explode('/',$i->product->unit->display_name);
				if(count($s)>1){
					$s = $s[1];
				}else{
					$s = $s[0];
				}
				$r['unit'] = $s;
				$r['usage'] = $total;
				$r['cost'] = $cost;
				
				$c = array();
				$c[0] = $total[0];
				$c[1] = $total[1];
				$c[2] = $total[2];
				$c[3] = $total[3];
				$c[4] = $total[4];
				$r['consume'] = $c;
				
				array_push($result['dispensed'],$r);	 
				
			}	
			}
		   endforeach;
		
			$result['dispensed_cost'] = $sub_cost;
			if(!isset($result['compound']['sub_cost']))$result['compound']['sub_cost']=0;
			if(!isset($result['dispensed']['sub_cost']))$result['dispensed']['sub_cost']=0;
			
			
			$result['total_cost'] = $result['compound']['sub_cost'] + $result['ex_compound_cost']+ $result['dispensed']['sub_cost'];
			$c= array(0,0,0,0,0,0);
			$uc = array(0,0,0,0,0,0);
			$fc = array(0,0,0,0,0,0);
			$tc = array(0,0,0,0,0,0);
			$sc = array(0,0,0,0,0,0);
			
			if($result['compound']['consume'][1]>0)$c[0] = ''.$result['compound']['consume'][1].' cap(s)';
			if($result['compound']['consume'][2]>0)$c[1] = ''.$result['compound']['consume'][2].' cap(s)';
			if($result['compound']['consume'][3]>0)$c[2] = ''.$result['compound']['consume'][3].' cap(s)';
			if($result['compound']['consume'][4]>0)$c[3] = ''.$result['compound']['consume'][4].' cap(s)';
			
			if($result['compound']['consume'][1]>0)$uc[0] = $result['compound']['consume'][1];
			if($result['compound']['consume'][2]>0)$uc[1] = $result['compound']['consume'][2];
			if($result['compound']['consume'][3]>0)$uc[2] = $result['compound']['consume'][3];
			if($result['compound']['consume'][4]>0)$uc[3] = $result['compound']['consume'][4];
			
			
			 foreach($result['ex_compound'] as $i):
					if($c[0]!='') $c[0].= ' + ';
					if($c[1]!='') $c[1].= ' + ';
					if($c[2]!='') $c[2].= ' + ';
					if($c[3]!='') $c[3].= ' + ';
			
					if($i['consume'][1]>0)$c[0] .= $i['name'].' '.$i['consume'][1].' cap(s)';
					if($i['consume'][2]>0)$c[1] .= $i['name'].' '.$i['consume'][2].' cap(s)';
					if($i['consume'][3]>0)$c[2] .= $i['name'].' '.$i['consume'][3].' cap(s)';
					if($i['consume'][4]>0)$c[3] .= $i['name'].' '.$i['consume'][4].' cap(s)';
					
					if($i['consume'][1]>0)$uc[0] += $i['consume'][1];
					if($i['consume'][2]>0)$uc[1] += $i['consume'][2];
					if($i['consume'][3]>0)$uc[2] += $i['consume'][3];
					if($i['consume'][4]>0)$uc[3] += $i['consume'][4];								
		
			 endforeach;
			
			 foreach($result['dispensed'] as $i):
				    
				for($k=0;$k<4;$k++){
				
					if($i['consume'][$k+1]>0):
						if($c[$k]!='') $c[$k].= ' + ';
						$c[$k] .= $i['name'].' '.$i['consume'][$k+1].' '.$i['unit'].'(s)';
						
						if($i['unit']=='capsule'):
							$uc[$k]+=$i['consume'][$k+1];
						endif;
						if($i['unit']=='softgel'):
							$fc[$k]+=$i['consume'][$k+1];
						endif;
						if($i['unit']=='tablet'):
							$tc[$k]+=$i['consume'][$k+1];
						endif;
						if($i['unit']=='sachet'):
							$sc[$k]+=$i['consume'][$k+1];
						endif;						
					endif; 
					
				}
				
									
			 endforeach;
			
				for($k=0;$k<4;$k++){
					$c[$k].= ' /';
					if($c[$k]!=''&&$uc[$k]>0) $c[$k].= ' Total '.$uc[$k].' cap(s)';
					if($fc[$k]>0) $c[$k].= ' + '.$fc[$k].' softgel(s)';
					if($tc[$k]>0) $c[$k].= ' + '.$tc[$k].' tablet(s)';
					if($sc[$k]>0) $c[$k].= ' + '.$sc[$k].' sachet(s)';
				}	
			
			
			
			$result['consume'] = $c;
			
		
		return $result;

	}
	
}
