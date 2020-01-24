<?php
$this->pageTitle=Yii::app()->name . ' - Login';
$this->breadcrumbs=array(
	'Login',
);
?>
<style>
	#loginform {background:url(../images/1302246098z56dbn.jpg) right top no-repeat;
	}


</style>
<div id="loginform" style="width:40em; margin:0 auto;">
<h1 style="width:300px">Login</h1>

<div class="form">
<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'login-form',
	'enableAjaxValidation'=>true,
)); ?>

	
              <table width="95%" border="1" align="center" cellpadding="5" cellspacing="0">

                <tr class="text"> 

                  <td width="17%"><?php echo $form->labelEx($model,'username'); ?></td>

                  <td width="32%"><?php echo $form->textField($model,'username'); ?>
                  <?php echo $form->error($model,'username'); ?></td>

                  <td width="51%" rowspan="5" valign="top">

                  </td>

                </tr>

                <tr class="text"> 

                  <td><?php echo $form->labelEx($model,'password'); ?></td>

                  <td> <?php echo $form->passwordField($model,'password'); ?><?php echo $form->error($model,'password'); ?></td>

                </tr>

                <tr class="text"> 

                  <td>&nbsp;</td>

                  <td><div class="row submit" style="width:200px">
		<button class="button" id="submitbutton" type="submit">Login</button>
		<a href="PasswordRecovery">Forgot Password</a>



		</td>

                </tr>

                <tr class="text"> 

                  <td>&nbsp;</td>

                  <td>&nbsp;</td>

                </tr>

                <tr class="text"> 

                  <td>&nbsp;</td>

                  <td>
                  
	</div>
				<span class='hint'>
                  <font   color="#FF0000">*</font> Required Form Fields
                 </span>
</td>

                </tr>

            </form>
              </table>
	

	


	
<?php $this->endWidget(); ?>
</div><!-- form -->

</div>