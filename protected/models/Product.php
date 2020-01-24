<?php	
/**
  * Product Model
  * 1. AddProduct flow
  * When everything is correct, this model then inserts
  * data into Product and Inventory domain models.
  */
  
class Product extends CActiveRecord {
	/**
	 * The followings are the available columns in table 'products':
	 * @var integer $id
	 * @var string $code
	 * @var string $display_name
	 * @var string $recommended_dosage
	 * @var string $price_per_dosage
	 * @var integer $category_id
	 * @var integer $unit_id
	 * @var string $default_consume_time
	 * @var string $note
	 * @var string $description
	 * @var string $inactive
	 * @var string $values 			
	 * @var string $price_base 
	 * @var string $price_formula
	 * @var string $price_var
	 * @var string $volume_base 
	 * @var string $volume_formula
	 * @var string $volume_var
	 * @var string $percent_active
	 * @var string $minimum
	 * @var string $expired_at
	 *
	 * @property Inventory $inventory
	 * @property Category  $category
	 */
	public $initial_inventory; // When create, update Inventory model accordingly.
	public $initial_inventory_remarks;
	
	public $price_test_calc;
	public $volume_test_calc;
	
	public $amount;

	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
	public function tableName()
	{
		return '{{products}}';
	}
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('note,label, category_id, unit_id, percent_active, code, recommended_dosage, description,default_consume_time, price_formula, price_base, volume_formula, volume_base, minimum, expired_at, excluded,soldout, product_name, manufacture, appearance, assay, pharmacology, safety', 'safe'),
			array('display_name, category_id, recommended_dosage, default_consume_time, price_formula, price_base', 'required'),
			array('initial_inventory', 'required', 'on'=>'create'),
		);
	}
	public function relations() {
		return array(
			'category' => array(self::BELONGS_TO, 'Category', 'category_id'),
			'unit' => array(self::BELONGS_TO, 'Unit', 'unit_id'),
			'inventory' => array(self::HAS_MANY, 'Inventory', 'product_id'),
		);
	}
	public function attributeLabels()
	{
		return array(
			'display_name'=>'Product Name (ชื่อยา)',
			'category_id'=>'Category (ประเภท)',
			'unit_id'=>'Display Unit',
			'id' => 'Id',
			'category_id' => 'Category',
			'recommended_dosage' => 'Recommended Dosage',
			'default_consume_time' => 'Default Consume Time',
			'initial_inventory' => 'Initial Inventory (g)',
			'initial_inventory_remarks' => 'Remarks',
		);
	}
	protected function beforeSave() {
		$this->normalizeConsumeTime();
		return parent::beforeSave();
	}
	protected function afterFind() {
		if (is_array($this->default_consume_time)){
			$this->default_consume_time = json_encode($this->default_consume_time);
		} else {
			$this->default_consume_time = json_decode($this->default_consume_time);
		}
		return parent::afterFind();
	}
	public function resetPrice($price) {
		$this->price_per_dosage = $price;
	}
	public function normalizeConsumeTime() {
		if (is_array($this->default_consume_time))
			$this->default_consume_time = json_encode($this->default_consume_time);
		return $this->default_consume_time;
	}
	public function setInitialInventory() {
		$inv = new Inventory('initial');
		$inv->attributes = array(
				'product_id'=> $this->id,
				'unit_id'=> $this->unit_id,
				'count'=> $this->initial_inventory,
				'remarks'=> 'First created',
				'updated'=> date('Y-m-d h:i:s')
			);
		if ($inv->validate()) {
			$inv->save(); return true;
		} else {
		//print_r($inv->getErrors()); exit;
		return false; 
 
 		}
	}
	public function search() {
		$criteria=new CDbCriteria;
		$criteria->compare('display_name',$this->display_name,true);
		return new CActiveDataProvider(get_class($this), array(
			'criteria'=>$criteria,
			'sort'=>array(
				'defaultOrder'=>'display_name ASC',
			),
			'pagination'=>array(
				'pageSize'=>5
			),
		));
	}
	// Links for Management Actions
	public function detailLink() {
		$href = Yii::app()->baseUrl . '/product/ViewProduct/id/'.$this->id;
		$imgHref = Yii::app()->baseUrl . '/images/icon/list.gif';
		$img = sprintf('<img src="%s" alt="View Detail" />', $imgHref);
		$tmpl = '<a class="action_btn" href="%s">%s</a>';
		return sprintf($tmpl,$href,$img);
	}
	public function updateLink() {
		$href = Yii::app()->baseUrl . '/product/UpdateProduct/id/'.$this->id;
		$imgHref = Yii::app()->baseUrl . '/images/icon/edit_action.gif';
		$img = sprintf('<img src="%s" alt="Update Detail" />', $imgHref);
		$tmpl = '<a class="action_btn" href="%s" title="Hello world" >%s</a>';
		return sprintf($tmpl,$href,$img);
	}
	public function deleteLink() {
		$href = Yii::app()->baseUrl . '/product/DeleteProduct/id/'.$this->id;
		$imgHref = Yii::app()->baseUrl . '/images/icon/action4.gif';
		$img = sprintf('<img src="%s" alt="Delete Product" />', $imgHref);
		$tmpl = '<a class="action_btn" href="%s">%s</a>';
		return sprintf($tmpl,$href,$img);
	}
	public function getActionLinks() {
		return sprintf('<span>%s %s %s</span>',$this->detailLink(),$this->updateLink(),$this->deleteLink());
	}
 
   

    /**
     * Return current inventory. Optional flag to display as formatted string.
     */
	public function getCurrentInventory($format=false) {
		
        $sql = 'SELECT count FROM product_inventory WHERE product_id = :id ORDER BY updated ASC LIMIT 1;';
        $criteria = new CDbCriteria;
        $criteria->compare('product_id', $this->id, false);
        $criteria->order = 'updated DESC';
        $criteria->limit = 1;
        $inv = Inventory::model()->find($criteria);
        if (!$inv) {
            $inv = new Inventory; //TODO: maybe fix displaying logic for Updated:.
            $count = 0;
        } else {
            $count = $inv->count; // Inventory unit is always in gram
        }
        if (!$format) {
            return $count;
        } else {
            $tmpl = '%s %s (Updated: %s)';
            return sprintf($tmpl, number_format($count,2), $this->unit->display_name, $inv->updated);
        }

	}
	
	/**
     * Return current inventory. Optional flag to display as formatted string.
     */
	public function getInventoryAt($date) {
       	 $sql = 'SELECT count FROM product_inventory WHERE product_id = :id ORDER BY updated ASC LIMIT 1;';
	        $criteria = new CDbCriteria;
	        $criteria->compare('product_id', $this->id, false);
	        // $criteria->compare('updated', $date, false,'<');
			$criteria->addCondition('updated < "'.$date.'" ');
		        $criteria->order = 'updated DESC';
	        $criteria->limit = 1;
	        $inv = Inventory::model()->find($criteria);
	        if (!$inv) {
	            $inv = new Inventory; //TODO: maybe fix displaying logic for Updated:.
	            $count = 0;
	        } else {
	            $count = $inv->count; // Inventory unit is always in gram
	        }
	        if (!$format) {
	            return $count;
	        } else {
	            $tmpl = '%s %s (Updated: %s)';
	            return sprintf($tmpl, number_format($count,2), $this->unit->display_name, $inv->updated);
	        }
	
	}
	
	/**
     * Return current inventory. Optional flag to display as formatted string.
     */
	public function getUsage($from,$to) {
       	 $sql = 'SELECT count FROM product_inventory WHERE product_id = :id ORDER BY updated ASC LIMIT 1;';
	        $criteria = new CDbCriteria;
	        $criteria->compare('product_id', $this->id, false);
	        // $criteria->compare('updated', $date, false,'<');
			$criteria->addCondition('updated <= "'.$to.'" ');
			$criteria->addCondition('updated >= "'.$from.'" ');
		    $criteria->select= '*, sum(t.out) as amount';
			// $criteria->limit = 1;
	        $inv = Inventory::model()->find($criteria);
	        if (!$inv) {
	            $inv = new Inventory; //TODO: maybe fix displaying logic for Updated:.
	            $count = 0;
	        } else {
	            $count = $inv->amount; // Inventory unit is always in gram
	        }
	        if (!$format) {
	            return $count;
	        } else {
	            $tmpl = '%s %s (Updated: %s)';
	            return sprintf($tmpl, number_format($count,2), $this->unit->display_name, $inv->updated);
	        }
	
	}
	public function listAll() {
		return new CArrayDataProvider($this->findAll(), array(
			'id'=>'id',
			'pagination'=>array(
				'pageSize'=>5,
			),
		));
	}
	public function getPrice($quantity,$order) {
		$quantity = $quantity / $this->percent_active;// * $order->days; perday
		
		if($this->isDispensed()){
			$quantity += $quantity/30;
		}
		
		return self::calculatePrice( $this->price_base, $this->price_formula, $quantity );		
	}
	public static function calculatePrice($price, $formula, $quantity) {
		// $formula = '$RESULT= '.$formula;
	
		$price = '$PRICE='.$price.';';
		$quantity = '$QUANTITY='.$quantity.';';
		$stmt = $price . $quantity . $formula ;
		try{
			$calc = eval($stmt); 
			if (!isset($calc)) {
				throw new Exception("NO RESULT: $stmt");
			}
		} catch (Exception $e) {
			// print_r($e);
			return 0;
		}
		return $calc;
	}
	public function getVolume($quantity) {
		
		return $quantity/$this->volume_base;
		
		// return self::calculateVolume( $this->volume_base, $this->volume_formula, $quantity);
	}
	public static function calculateVolume($volume, $formula, $quantity) {
		$formula = '$RESULT= '.$formula;
		$volume = '$VOLUME='.$volume.';';
		$quantity = '$QUANTITY='.$quantity.';';
		$stmt = $volume . $quantity . $formula ;
		$calc = eval($stmt);
		return $RESULT;
	}

	public static function inCategory($category) {
		$products=Product::model()->findAll('category_id=:category_id AND inactive !=:inactive', 
					array(':category_id'=>$category->id, ':inactive'=>1));
		return $products;
	}

	private static function getProductJson($product) {
					$product->display_name; //#
					$o = new stdClass;
					$o->display_name = $product->display_name;
					$o->code = $product->code;
					$o->unit = $product->unit->display_name;
					$o->id = $product->id;
					$o->grouping = "item";
					$o->actions = $product->getActionLinks();
					$o->current_inventory = $product->getCurrentInventory();
					$o->recommended_dosage = $product->recommended_dosage . ' ('.$product->unit->display_name.')';	
					$o->default_consume_time = ConsumeTime::toString($product->default_consume_time);
		return $o;
	}
	
	public static function getStandardList() {
	/* TODO: Rewrite. First get all product, then sort by category sel_rank*/
		$list = array();
		$roots = Category::model()->findAll('parent_id=:id',array(':id'=>0));
		foreach ($roots as $r) {
			$r->name; // #
			$o = new stdClass;
			$o->display_name = $r->name;
			$o->grouping = "top";
			$list[] = $o;
			$products = Product::inCategory($r);
				foreach ($products as $product) {
					$list[] = self::getProductJson($product);
				}
			$children = $r->children;
			foreach ($children as $category) {
				$category->name; // #
				$o = new stdClass;
				$o->display_name = $category->name;
				$o->grouping = "category";
				$list[] = $o;
				$products = Product::inCategory($category);
				foreach ($products as $product) {
					$list[] = self::getProductJson($product);
				}
			}
		}
		return $list;
	}

	public static function listAsJson() {
		return json_encode(self::getStandardList());
	}
	
	public function isDispensed(){
		return $this->category->name=='Dispensed';
	}
}