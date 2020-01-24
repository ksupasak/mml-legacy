<?php
	/**
	 *   Display global navigation menu according to user type.
			GUEST
			ADMIN
			MANAGER
	 */
?>
<?php if($userType=='GUEST') :?>
	<?php $this->widget('zii.widgets.CMenu',array(
		'items'=>array(
			array('label'=>'Home', 'url'=>array('/index.php'),'active'=>$this->id=='site'?true:false),
			array('label'=>'Contact', 'url'=>array('site/contact')),
		),
		'activeCssClass'=>'active',
	)); ?>
<?php elseif($userType=='ADMIN') :?>
	<?php $this->widget('zii.widgets.CMenu',array(
		'items'=>array(
			array('label'=>'Home', 'url'=>array('/index.php'),'active'=>$this->id=='site'?true:false),
			array('label'=>'Products', 'url'=>array('product/ManageProducts'), 'visible'=>!Yii::app()->user->isGuest),
			array('label'=>'Orders', 'url'=>array('order/ManageOrders'), 'visible'=>!Yii::app()->user->isGuest),
			array('label'=>'Accounting', 'url'=>array('accounting/ManageBillings'), 'visible'=>!Yii::app()->user->isGuest),
			array('label'=>'Report', 'url'=>array('reports/index'), 'visible'=>!Yii::app()->user->isGuest),
			
			array('label'=>'Contact', 'url'=>array('site/contact')),
		),
		'activeCssClass'=>'active',
	)); ?>
<?php elseif($userType=='MANAGER') :?>
	<?php $this->widget('zii.widgets.CMenu',array(
		'items'=>array(
			array('label'=>'Home', 'url'=>array('/index.php'),'active'=>$this->id=='site'?true:false),
			array('label'=>'Products', 'url'=>array('product/ManageProducts')),
			array('label'=>'Orders', 'url'=>array('order/ManageOrders')),
			array('label'=>'Manufactures', 'url'=>array('manufacture/ManageOrders')),
			array('label'=>'Contact', 'url'=>array('site/contact')),
		),
		'activeCssClass'=>'active',
	)); ?>
<?php elseif($userType=='CLINICIAN') :?>
	<?php $this->widget('zii.widgets.CMenu',array(
		'items'=>array(
			array('label'=>'Home', 'url'=>array('/index.php'),'active'=>$this->id=='site'?true:false),
			array('label'=>'My Orders', 'url'=>array('order/ManageOrders'), 'visible'=>!Yii::app()->user->isGuest),
			array('label'=>'My Patients', 'url'=>array('patient/Index'), 'visible'=>!Yii::app()->user->isGuest),
			array('label'=>'Contact', 'url'=>array('site/contact')),
		),
		'activeCssClass'=>'active',
	)); ?>
<?php elseif($userType=='CLINICIAN_STAFF') :?>
	<?php $this->widget('zii.widgets.CMenu',array(
		'items'=>array(
			array('label'=>'Home', 'url'=>array('/index.php'),'active'=>$this->id=='site'?true:false),
			// array('label'=>'Orders', 'url'=>array('order/ManageOrders'), 'visible'=>!Yii::app()->user->isGuest),
			array('label'=>'Clinicians', 'url'=>array('clinician/Index'), 'visible'=>!Yii::app()->user->isGuest),
			array('label'=>'Patients', 'url'=>array('patient/Index'), 'visible'=>!Yii::app()->user->isGuest),
			array('label'=>'Contact', 'url'=>array('site/contact')),
		),
		'activeCssClass'=>'active',
	)); ?>
<?php elseif($userType=='SALE') :?>
	<?php $this->widget('zii.widgets.CMenu',array(
		'items'=>array(
			array('label'=>'Home', 'url'=>array('/index.php'),'active'=>$this->id=='site'?true:false),
			array('label'=>'My Orders', 'url'=>array('order/ManageOrders'), 'visible'=>!Yii::app()->user->isGuest),
			array('label'=>'My Patients', 'url'=>array('patient/ManagePatients'), 'visible'=>!Yii::app()->user->isGuest),
			array('label'=>'My Clinicians', 'url'=>array('clinician/list'), 'visible'=>!Yii::app()->user->isGuest),
			array('label'=>'Contact', 'url'=>array('site/contact')),
		),
		'activeCssClass'=>'active',
	)); ?>
<?php elseif($userType=='MANUFACTURE') :?>
	<?php $this->widget('zii.widgets.CMenu',array(
		'items'=>array(
			array('label'=>'Home', 'url'=>array('/index.php'),'active'=>$this->id=='site'?true:false),
			array('label'=>'Manufacture', 'url'=>array('manufacture/ManageOrders'), 'visible'=>!Yii::app()->user->isGuest),
			array('label'=>'Contact', 'url'=>array('site/contact')),
		),
		'activeCssClass'=>'active',
	)); ?>
<?php elseif($userType=='OPERATOR') :?>
	<?php $this->widget('zii.widgets.CMenu',array(
		'items'=>array(
			array('label'=>'Home', 'url'=>array('/index.php'),'active'=>$this->id=='site'?true:false),
			array('label'=>'Order', 'url'=>array('order/ManageOrders'), 'visible'=>!Yii::app()->user->isGuest),
			array('label'=>'Manufacture', 'url'=>array('manufacture/ManageOrders'), 'visible'=>!Yii::app()->user->isGuest),
			array('label'=>'Delivery', 'url'=>array('delivery/ManageDelivery'), 'visible'=>!Yii::app()->user->isGuest),
			array('label'=>'Account', 'url'=>array('delivery/ManageBillings'), 'visible'=>!Yii::app()->user->isGuest),	
			array('label'=>'Contact', 'url'=>array('site/contact')),
		),
		'activeCssClass'=>'active',
	)); ?>
<?php elseif($userType=='PRODUCT_MANAGER') :?>
	<?php $this->widget('zii.widgets.CMenu',array(
		'items'=>array(
			array('label'=>'Home', 'url'=>array('/index.php'),'active'=>$this->id=='site'?true:false),
			array('label'=>'Products', 'url'=>array('product/ManageProducts')),
			array('label'=>'Contact', 'url'=>array('site/contact')),
		),
		'activeCssClass'=>'active',
	)); ?>
<?php endif; ?>