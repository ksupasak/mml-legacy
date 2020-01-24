<?php

/**
 * This is the model class for table "categories".
 *
 * The followings are the available columns in table 'categories':
 * @property integer $id
 * @property integer $parent_id
 * @property string $name
 * @property integer $sel_rank
 *
 * @property Product[]    $products
 * @property Category[]   $subCategories
 * @property Category	  $parent
 * @property Category[]   $children
 */
class Category extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return Category the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return '{{categories}}';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		return array(
			array('id, parent_id', 'numerical', 'integerOnly'=>true),
			array('name', 'length', 'max'=>100),
			array('id, parent, name', 'safe', 'on'=>'search'),
			array('name, parent_id, sel_rank', 'required')
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
			'subCategories'=>array(self::HAS_MANY,'Category','parent_id'),
			'products'=>array(self::HAS_MANY, 'Product', 'category_id'),
			'children'=>array(self::HAS_MANY, 'Category', 'parent_id'),
			'parent'=>array(self::BELONGS_TO, 'Category', 'parent_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'parent_id' => 'Parent ID',
			'name' => 'Name',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('parent_id',$this->parent_id);
		$criteria->compare('name',$this->name,true);

		return new CActiveDataProvider(get_class($this), array(
			'criteria'=>$criteria,
		));
	}
	public function isRoot() {
		if ($this->parent_id==0 ) { 
			return true; 
		} else {
			return false;
		}
	}
	public function getRoot() { //Might not work! We'll see.
		$p = $this;
		while ($p) {
			if ($p->isRoot()) return $p;
			$p=$p->getParent();
		}
		return $p;
	}
	public function productCategoryOptions() {
		$options = array();
			$c = new CDbCriteria;
		$c->compare('name','Compound');
		$r1 = Category::model()->find($c);
		
		
		// $r1 = Category::model()->findByPk(1);
		$options[ $r1->id ] = $r1->name;
		foreach ($r1->children as $c){
			$options[ $c->id ] = "+--".$c->name;
		}
		$c = new CDbCriteria;
		$c->compare('name','Dispensed');
		$r2 = Category::model()->find($c);
		
		// $r2 = Category::model()->findByPk(2);
		$options[ $r2->id ] = $r2->name;
		foreach ($r2->children as $c){
			$options[ $c->id ] = "+--".$c->name;
		}
		return $options;
	}
	
	public function catelogOrder() {
		$criteria = new CDbCriteria;
		$criteria->order = 'sel_rank ASC';
		return $categories = $this->findAll($criteria);
	}
	public function getProducts(){
		$criteria = new CDbCriteria;
		$criteria->compare('category_id',$this->id,false);
		$criteria->compare('inactive',0,false);
		$criteria->order = 'code,display_name ASC';
		// $criteria->limit = 100; //TODO: one category can have at most 100 products
		$dataProvider = new CActiveDataProvider('Product',array('pagination'=>array('pageSize'=>500),
			'criteria'=>$criteria));
        $dataProvider->pagination->pageSize=500;
        return $dataProvider;
	}
	public function parentName(){
		if ($this->isRoot()) {
			return '-';
		} else {
			return $this->parent->name;
		}
	}
}
