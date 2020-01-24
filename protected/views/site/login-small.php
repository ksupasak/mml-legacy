<?php if( Yii::app()->user->getId() ) :?>
	Hello, 

		<?php echo Yii::app()->user->getName(); ?> 
	
	| <a href="<?php echo $this->createUrl('/site/changePassword'); ?>">Change Password</a>
	| <a href="<?php echo $this->createUrl('/site/logout'); ?>">Logout</a>

	<p>
		Role: (<em><?php echo Yii::app()->session['user.type']; ?></em>) <br />
		Time: <?php echo date('d/m/y H:i'); ?>
	</p>
<?php endif; ?>
