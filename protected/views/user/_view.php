
    	<tr>
        	<td><b><?php echo $data->id; ?></b></td>
			<td>
            	Username:<strong><?php echo $data->username; ?></strong>  
                Role: <strong><?php echo $data->type; ?></strong> <br />
            	Display Name: <strong><?php echo $data->display_name; ?></strong> <br />
                Full Name: <strong><?php echo $data->full_name; ?></strong>
           </td>
		</tr>
        <tr>
        	<td></td><td><?php echo $data->email; ?></td>
        </tr>
		<?php	
			/* ADMIN can delete */
			if ((Yii::app()->session['user.type']) == 'ADMIN'):   ?>
        <tr><td></td>
        	<td>
				 	<?php
					 echo CHtml::link('Update', $this->createUrl('Update', array('id'=>$data->id)));  ?>
             </td><td>       
                     <form method="POST" action="delete/id/<?php $data->id ?>">
                     	<input type="hidden" name="id" value="<?php $data->id ?>" />
                        <input type="submit" value="Delete" />
                     </form>
            </td>
        </tr>
        
        <?php endif; ?>
