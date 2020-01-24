<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="language" content="en" />

	<!-- blueprint CSS framework -->
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/screen.css" media="screen, projection" />
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/print.css" media="print" />
	<!--[if lt IE 8]>
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/ie.css" media="screen, projection" />
	<![endif]-->


	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/form.css" />
<?php	  // YUI3 ?>
	<script>
	var YUI_ONLINE_CONF = {},
    YUI_OFFLINE_CONF = {
        base: "<?php echo Yii::app()->request->baseUrl; ?>/yui3/build/",
        combine:0,
        groups: {
            gallery: {
                base:'<?php echo Yii::app()->request->baseUrl; ?>/yui3-gallery/build/',
                patterns:  { 'gallery-': {} }
            },
            yui2: {
                base: '<?php echo Yii::app()->request->baseUrl; ?>/2in3/dist/2.8.1/build/',
                patterns:  {
                    'yui2-': {
                        configFn: function(me) {
                            if(/-skin|reset|fonts|grids|base/.test(me.name)) {
                                me.type = 'css';
                                me.path = me.path.replace(/\.js/, '.css');
                                me.path = me.path.replace(/\/yui2-skin/, '/assets/skins/sam/yui2-skin');
                            }
                        }
                    }
                }
            }
        }
     },
     ONLINE = (navigator.online) ? true : false;
     CURRENT_CONF = (ONLINE) ? YUI_ONLINE_CONF : YUI_OFFLINE_CONF;
	YUI_config =  YUI_OFFLINE_CONF;
	</script>
	<script src="<?php echo Yii::app()->request->baseUrl; ?>/yui3/build/yui/yui-min.js" charset="utf-8"></script>

<?php /* Grid 960 */ ?>
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/960_12_col.css" />	

<?php /* jQuery & jQuery UI*/
	Yii::app()->clientScript->registerCoreScript('jquery');
	Yii::app()->clientScript->registerCssFile(Yii::app()->request->baseUrl.'/jquery-ui-1.8.16/css/pepper-grinder/jquery-ui-1.8.16.custom.css');
	Yii::app()->clientScript->registerScriptFile(Yii::app()->request->baseUrl.'/jquery-ui-1.8.16/js/jquery-ui-1.8.16.custom.min.js');
?>

	<title><?php echo CHtml::encode($this->pageTitle); ?></title>
<style type="text/css">
.qq {
	color: #DF0000;
}
.qt {
	color: #000;
}
.soldout{
	
	color:red;
	background:#eee;
}
</style>
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/main.css" />
</head>

<body class="yui-skin-sam yui3-skin-sam container_12" id="page">

	<div id="header" class="grid_12">
		<div style="display:inline-block">
		<?php
		 if(isset(Yii::app()->session['user.id'])):
		 $customer = Customer::getFromUser(Yii::app()->session['user.id']); 
		 endif
		 ?>
		<?php if(!isset(Yii::app()->user->role)||(Yii::app()->user->role!='CLINICIAN'&&Yii::app()->user->role!='PHARMACIST')||$customer->logo_url==""){?>
		<img src="<?php echo Yii::app()->request->baseUrl; ?>/images/logo.png" alt="<?php echo CHtml::encode(Yii::app()->name); ?>" />
		<?} else {?>
		<img src="<?php echo $customer->logo_url; ?>" height="40" alt="<?php echo CHtml::encode(Yii::app()->name);?>" >
		<?php } ?>	
		</div>
		<!-- header -->
		<div id="header-user" style="width:300px">
			<?php $this->renderPartial('//site/login-small'); ?>
		</div>
	</div>
	<div id="mainmenu" class="grid_12">
		<?php 
			$this->renderPartial('//layouts/_globalNav', array('userType'=>Yii::app()->acl->role()));
		?>
	</div><!-- mainmenu -->
	<div class="grid_12">
	<?php $this->widget('zii.widgets.CBreadcrumbs', array(
		//'links'=>$this->breadcrumbs,
	)); ?><!-- breadcrumbs -->
	</div>

	<div class="content grid_12">
		<?php echo $content; ?>
	</div>

	<div id="footer" class="grid_11" style="width:900px; color:#666; text-align:center;">
		<p ><b>Copyright&copy;<?php echo date('Y'); ?> by <span class="qt">Max<span class="qq">Max</span>Life</span>.
		All Rights Reserved.</b>
				
<br  />
<p>
Email :<a href="mailto:service@maxmaxlife.com">info@maxmaxlife.com</a> <br />
 </p>       
</p>
		<!--<span style="float:left"><?php echo date('d/m/y',time())?></span> -->
		
	</div><!-- footer -->

</body>
</html>