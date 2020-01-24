<?php $this->beginContent('/layouts/main'); ?>
<style>
.hmanage {
width:700px;
float:right;

}
.hmanage fieldset {
 -moz-box-shadow: 2px 2px 2px #ccc;
  -webkit-box-shadow: 2px 2px 2px #ccc;
  box-shadow: 2px 2px 2px #ccc;
	  background:#EFEFEF;
  padding-left:10px;
  height:40px;
  border:1px solid #ccc;
  }
.hmanage legend{
font-weight:bold;
color:#000000;
  }  

</style>

<div class="container">
	<?php /* Do not display for clinician */
		    if (User::authorize('manage')):?>      	
	<div class="hmanage" >
		<div class="menu">
			<?php 
				if ( isset($this->menu) ) {
					$this->widget('zii.widgets.CMenu',
							array('items'=>$this->menu));
				}
			?>
		</div>
  
	<fieldset><legend>Manage Data</legend>
		<a href="<?php echo $this->createUrl('/customer/'); ?>">Customer</a> |
		<a href="<?php echo $this->createUrl('/clinician/'); ?>">Clinician</a> |
		<a href="<?php echo $this->createUrl('/hospital/'); ?>"> Hospital</a> |
		<a href="<?php echo $this->createUrl('/patient/'); ?>"> Patient</a> |
		<a href="<?php echo $this->createUrl('/category/'); ?>"> Category</a> |
		<a href="<?php echo $this->createUrl('/unit/'); ?>"> Unit</a> |
		<a href="<?php echo $this->createUrl('/status/'); ?>"> Status</a>
	</fieldset>
		</div><!-- sidebar -->
      
		<?php endif;?>


	

		<div id="content">
			<?php echo $content; ?>
		</div><!-- content -->
	</div>

<?php $this->endContent(); ?>