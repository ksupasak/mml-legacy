<?php
Yii::import('application.vendors.barcode.*');


class BarcodeController extends Controller
{
	//public $layout='//layouts/dataManager';

	// /**
	//  * @return array action filters
	//  */
	// public function filters()
	// {
	// 	return array(
	// 		'accessControl', // perform access control for CRUD operations
	// 	);
	// }


	/**
	 * Displays a particular model.
	 * @param integer $id the ID of the model to be displayed
	 */
	public function actionGen()
	{
		
		 define ('__TRACE_ENABLED__', false);
		 define ('__DEBUG_ENABLED__', false);

		 require("barcode.php");		   
		 require("i25object.php");
		 require("c39object.php");
		 require("c128aobject.php");
		 require("c128bobject.php");
		 require("c128cobject.php");

		/* Default value */
		if (!isset($output))  $output   = "png"; 
		if (!isset($barcode)) $barcode  = $_GET['barcode'];
		if (!isset($type))    $type     = "C128A";
		if (!isset($width))   $width    = "450";
		if (!isset($height))  $height   = '100';
		if (!isset($xres))    $xres     = "2";
		if (!isset($font))    $font     = "4";
		if (!isset($border))  $border	= "on";
		if (!isset($drawtext))  $drawtext		= "on";
		if (!isset($stretchtext))  $stretchtext	= "on";
		if (!isset($negative))	$negative 		= "on";
		/*********************************/ 
		/* $barcode  = $_GET['barcode'];
		 echo $barcode;
		 $barcode = '1232';
		 var_dump($barcode);
		 exit;*/
		if (isset($barcode) && strlen($barcode)>0) {    
		  $style  = BCS_ALIGN_LEFT;					       
		  $style |= ($output  == "png" ) ? BCS_IMAGE_PNG  : 0; 
		  $style |= ($output  == "jpeg") ? BCS_IMAGE_JPEG : 0; 
		  $style |= ($border  == "on"  ) ?  0	  : 0; 
		  $style |= ($drawtext== "on"  ) ?  BCS_DRAW_TEXT : 0; 
		  $style |= ($stretchtext== "on" ) ? 0  : BCS_STRETCH_TEXT; 
		  $style |= ($negative== "on"  ) ? 0  : 0; 

		  switch ($type)
		  {
		    case "I25":
					  $obj = new I25Object($width, $height, $style, $barcode);
					  break;
		    case "C39":
					  $obj = new C39Object($width, $height, $style, $barcode);
					  break;
		    case "C128A":
					  $obj = new C128AObject($width, $height, $style, $barcode);
					  break;
		    case "C128B":
					  $obj = new C128BObject($width, $height, $style, $barcode);
					  break;
		    case "C128C":
		                          $obj = new C128CObject($width, $height, $style, $barcode);
					  break;
			default:
					$obj = false;
		  }
		}

		  if ($obj) {
		      $obj->SetFont($font);   
		      $obj->DrawObject($xres);
		  	  $obj->FlushObject();
		  	  $obj->DestroyObject();
		  	  unset($obj);  /* clean */
		  }
	}


}
