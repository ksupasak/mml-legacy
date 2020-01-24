<?php
class ProductController extends Controller {
	public $add = false;
	public $update = false;
		public function filters()
		{
			return array(
				'accessControl', // perform access control for CRUD operations
			);
		}

		public function accessRules()
		{
			return array(
				array('allow', 'users'=>array('*'),
				'expression'=>'User::authorize("manage")',
				),
				array('deny',  // deny all users
					'users'=>array('*'),
				), 
			);
		}
	
	function actionManageProducts() {
		$model =new Product('search');
		if(isset($_GET['Product']))
			$model->attributes =$_GET['Product'];
		$params =array(
			'model'=>$model,
		);
		if(!isset($_GET['ajax'])) {$this->render('manage', $params);}
		else  $this->renderPartial('manage', $params);
	}
	function actionAddProduct() { 
		$this->add = true;
		$model =new Product('create'); 
		$model->price_base = 1;
		$model->price_var = 0;
		$model->price_formula = '$PRICE * $QUANTITY;'; //default formula
		$model->volume_base = 1;
		$model->volume_var = 0;
		$model->volume_formula = '$VOLUME * $QUANTITY;'; //default formula		
		if(isset($_POST['Product'])){
			$model->attributes =$_POST['Product'];
			if ( $model->validate() ) {
				if($model->save() && $model->setInitialInventory())	
					Logging::user(Yii::app()->user->id, 'PRODUCT_UPDATE', date('Y-m-d H:i:s'), 'product id '.$model->id.' created by user '.Yii::app()->user->id);
					$this->redirect(array('ViewProduct', 'id' => $model->id)); //Send to View Product.
			}
		}
		$params =array( 'model'=>$model );
		if(!isset($_GET['ajax'])) {$this->render('add', $params);}
		else  $this->renderPartial('add', $params);
	}
	function actionUpdateProduct(){
		$this->update = true;
		$id = Yii::app()->request->getQuery('id');
		if ($id) { $model = Product::model()->findByPk($id); }
		else { echo "No ID given"; exit; } 
		if(isset($_POST['Product'])){
			$model->attributes =$_POST['Product'];
			if ( $model->validate() ) {
				$model->save(); 
				Logging::user(Yii::app()->user->id, 'PRODUCT_UPDATE', date('Y-m-d H:i:s'), 'product id '.$model->id.' updated by user '.Yii::app()->user->id);
				$this->redirect(array('ManageProducts')); 
			}
		}
		$params =array( 'model'=>$model );
		if(!isset($_GET['ajax'])) {$this->render('update', $params);}
		else  $this->renderPartial('update', $params);
	}

	function actionViewProduct() {
		$id = Yii::app()->request->getQuery('id');
		if ($id) { $product = Product::model()->findByPk($id); }
		if ($id && $product) {
				$this->render('view', array('product'=>$product));
		} else {
			echo "No ID Given. send back to ManageProduct with warning";
		}
	}

	function actionDeleteProduct() {
		$id = Yii::app()->request->getQuery('id');
		if ($id) { 
		
		// Product::model()->findByPk($id)->delete(); 
			$stmt = "UPDATE products SET inactive = 1 WHERE id = $id";
			$command=Yii::app()->db->createCommand($stmt);
			$command->execute();
			Logging::user(Yii::app()->user->id, 'PRODUCT_UPDATE', date('Y-m-d H:i:s'), 'product id '.$id.' deleted by user '.Yii::app()->user->id);
		}
		$this->render('delete');
	}
	function actionGetProductList() {
		/* TODO: Prepare this to support product cagalog accordion ajax pull */
		$list = Product::listAsJson();
		header('Content-Type: application/json');
		ob_get_clean();
		echo '{"query":'.$list.'}';
		Yii::app()->end();
	}
	function actionCatalog() {
		$products = Product::getStandardList();
		$params = array('products'=>$products);
		$this->render('catalog',$params);
	}
	function actionUpdateStock($product) {
		$inventory = new Inventory;
        $inventory->product_id = $product;
		$product = Product::model()->findByPk($product);
		if( $_POST ){
			$inventory->attributes = $_POST['Inventory'];
			$inventory->product_id = $product->id;
			$inventory->updated = date('Y-m-d H:i:s');
			if ($inventory->validate()) {
				if ($inventory->record()) {
					$this->redirect('UpdateStock/product/'.$product->id);
				}
			}
		}
		$params = array('product'=>$product, 'inventory'=>$inventory);
		$this->render('stock', $params);
	}
    /*
     *  Manage inventory count of every product in one page.
     */
    function actionInventory() {
        if ($_POST) {
            $remarks = $_POST['remarks'];
            foreach ($_POST['Product'] as $product_id => $count ){
                $product = Product::model()->findByPk($product_id);
                echo '<br />'. $product->getCurrentInventory() . " :: " . $count;
                if ($product->getCurrentInventory() != $count) {
                echo "updating";
                    $inv = new Inventory;
                    $inv->product_id = $product_id;
                    $inv->count = $count;
                    $inv->remarks = $remarks;
                    $inv->updated = date('Y-m-d H:i:s');

                    $res = $inv->record(); //use this special method
                    if (!$res) throw new Exception("Cannot update inventory for product {$product_id}");
                }
            }
            $this->redirect($this->createUrl('product/Inventory'));
        }
		$model =new Product('search');
		if(isset($_GET['Product']))
			$model->attributes =$_GET['Product'];
		$params =array(
			'model'=>$model,
		);
		if(!isset($_GET['ajax'])) {$this->render('inventory', $params);}
		else  $this->renderPartial('inventory', $params);    
    }
	function actionPriceFormulaTest() {
		// var_dump($_POST['formula']);
		echo Product::calculatePrice($_POST['price'],$_POST['formula'],$_POST['quantity']);
	}
	function actionVolumeFormulaTest() {
		echo Product::calculateVolume($_POST['volume'],$_POST['formula'],$_POST['quantity']);
	}
}