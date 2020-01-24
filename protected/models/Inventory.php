<?php
  /**
   * @var integer $id
   * @var integer $product_id
   * @var integer $in
   * @var string  $out
   * @var string  $count
   * @var string  $updated
   * @var string  $remarks
   * @var string  $operator
   * @property Product $product
   **/
class Inventory extends CActiveRecord {
	
	
	public $amount;
		
		
		
	public static function model($className=__CLASS__) { 
		return parent::model($className);
	}
	public function tableName() {
		return '{{product_inventory}}';
	}
	public function relations() {
		return array(
			'product'=>array(self::BELONGS_TO, 'Product', 'product_id'),
			'operator'=>array(self::BELONGS_TO,'User','operator_id')
		);
	}
	public function rules() {
		return array(
			array('product_id, count, updated, remarks','required'),
		);
	}
    public function attributeLabels() {
        return array(
            'count'=>'Count (g)'
        );
    }
	public function filter() {
		$criteria = new CDbCriteria;
		$criteria->order = 'updated DESC';
		$criteria->limit = '10';
		$criteria->compare('product_id', $this->product_id, false);
		return new CActiveDataProvider(get_class($this), array(
				'criteria'=>$criteria
			));
	}
	public function record() { // Record left. Determine diff. Input is count.
		$transaction = Yii::app()->db->beginTransaction();
		try {
			$balance = $this->product->stock_balance;
			$product=$this->product;
			if ( $this->count > $balance ) {	// Inventory increase
				$in =  $this->count - $balance;
				$out = 0;
			} else {							// Inventory decrease
				$in = 0;
				$out = $this->count - $balance;
			}
			$this->in = $in;
			$this->out = $out;
			$product->stock_balance = $this->count;
			$product->save();
			$this->operator_id = Yii::app()->acl->userId();
			$this->save();
			$transaction->commit();
		} catch (Exception $e) {
			$transaction->rollback();
			echo "Transaction error. rollback.";
		}
		return true;
	}
    public function recordUsed($item) {
        // $item is an instance of OrderItem
 		$transaction = Yii::app()->db->beginTransaction();
		try {
			$balance = $this->product->stock_balance;
            if ($this->product->unit->gram_conversion_factor&&$this->product->category->name!='Dispensed') {
                $conversion_factor = $this->product->unit->gram_conversion_factor;
            } else {
                $conversion_factor = 1;
            }

			$adj=1;
			if($this->product->unit->display_name=='IU'){
				switch (trim($this->product->note)) {
				    case "vitamin_a":
				        $adj = 0.3;
				        break;
				    case "vitamin_d":
				        $adj = 0.025;
				        break;
				    case "vitamin_e":
				        $adj = 0.735*1000;
					    break;
					case "d_gamma":
					 	$adj = 1/0.15*1000;
				}
				// var_dump($p->display_name.$adj);
				
			}

						// 
						// var_dump($item->order_per_day);
						// 
						// var_dump($item->order->days);
						// 
						// var_dump($conversion_factor);

			$days = $item->order->days;
			if($this->product->isDispensed()){
				$days+= $days/30;
			}			
			
			
            $used = $item->order_per_day * $days / $conversion_factor/ $this->product->percent_active * $adj ;
			
			
			$this->in = 0;
			$this->out = $used;
            $this->count = $balance - $used;
			$this->product->stock_balance = $this->count;
			$this->product->save();
			$this->operator_id = Yii::app()->acl->userId();
            $this->remarks = "Used by Order ID: {$item->order->uuid}";
            $this->updated = date('Y-m-d H:i:s');
			$inv = $this->save();
			$transaction->commit();
		} catch (Exception $e) {
			$transaction->rollback();
			throw new Exception("Transaction error. rollback. Inventory for item {$item->id}");
            return false;
		}
		return $this;            
    }

	// return current inventory level of a product
	public function getByProduct($product) {
		$inv = Inventory::model()->find('product_id=:prod ORDER BY updated DESC', array(':prod'=>$product->id));
        if ($inv) {
            return $inv;
        } else {
            $inv = new Inventory;
            $inv->product_id = $product->id;
            return $inv;
        }
	}

	public function getUpdateListJson() {
/*		$products = new CActiveDataProvider('Product', array(
			'criteria'=> array(
				'alias'=>'products',
				'join'=>'LEFT JOIN {{product_inventory}} ON {{products}}.id = {{product_inventory}}.product_id'),
			'pagination'=> array('pageSize'=>30)
		));*/
		$categories = new CActiveDataProvider('Category', array(
			'criteria'=>
				array('with'=>array('products')),
			'pagination'=> 
				array('pageSize'=>30)
		));
		/*build multi-root tree here */
		$tree = array();
		$roots = array();
		$parents = array();
		foreach ($categories->data as $cat){
			$parents[$cat->id] = $cat->parent_id;
			$tree[] = array($cat,$cat->products);
			if ($cat->parent_id == 0) $roots[] = $cat;
			/* Build linear list */
			$list = array();
			foreach ($roots as $root) { //Traverse from roots
				$list[] = $root;
				foreach ($root->subCategories as $cat) {
					$list[] = $cat;
					foreach ($cat->products as $product) {
						$list[] = $product;
					}
				}
				foreach ($root->products as $product) {
					$list[] = $product; }
			}

			/* Build JSON */
			$json = array();
			foreach ($list as $item) {
				$o = new stdClass;
				if ( get_class($item) == 'Category' ) {
					$o->grouping = 'category';
					if ($item->parent_id == 0) {
						$o->name = sprintf('<h3>%s</h3>',$item->name);
					} else {
						$o->name = sprintf('<em style="padding:0 1em 0 0;">%s</em>',$item->name);
					}
				}
				if ( get_class($item) == 'Product' ) {
					$product = $item;
					$unit = $product->unit;
					$inv = $this->getByProduct($product);
						$inv ? 
							$o->current_inventory = sprintf('%s (%s)',$inv->count, $unit->display_name) 
							: $o->current_inventory = sprintf('- (%s)',$unit->display_name);
						$o->product_id = $product->id;
						$o->display_name = $product->display_name;
						$o->product_code = sprintf('<span style="padding-left:2em">%s</span>', $product->code);
						$o->product_name = $product->display_name;
						$inv ? $o->updated = $inv->updated : $o->updated = '-';
						$inv ? $o->remarks = $inv->remarks : $o->remarks = '-';
						$o->actions = sprintf('<input onclick="$(%s).dialog()" />','');
				}
				$json[] = $o;
			}
			return json_encode($json);
		}
	}
	
	function updateStockLink($product_id=null){
		return CHtml::link('Update Stock', Yii::app()->createUrl('product/UpdateStock', array('product'=>$product_id)));
	}
	function viewStockLink($product_id=null){
		return CHtml::link('View Stock', Yii::app()->createUrl('product/UpdateStock', array('product'=>$product_id)));
	}
    function updateTextField() {
        return CHtml::textField('Product['.$this->product->id.']',$this->count,array(
                    'id'=>'product_'.$this->product->id, 
                    'class'=>'update-field'
                    )) . 
               CHtml::hiddenField($this->product->id.'_original',$this->count,array(
                    'id'=>'product_'.$this->product->id.'_original')
                    );
    }
}