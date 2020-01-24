<div style="padding:4em; margin: 1em auto; ">
<div style="margin: 0em auto; width: 700px;">
<h1>Privacy and Legal Statements</h1>
<div style=" padding:20px;width:660px; height: 20em; overflow:auto; border: solid 1px #666;" >
<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'disclaimer-form',
	'enableAjaxValidation'=>true,
)); ?>



<h2>PRIVACY</h2>

<p>
Respecting your privacy is important to us. Customer information that you provide will remain confidential at all times. We do not sell, rent or disclose any information about our customers to other companies. Periodically, we may send you information about our products and services. If, however, you prefer not to receive such offers or information, just send us an email.
</p>

<h2>OWNERSHIP OF CONTENT</h2>

<p>
Reproduction of this Web site, in whole or in part, is prohibited by law.
</p>
<p>
All content included on this site, such as text, logos, graphics & images is the property of Max MaxLife Co., Ltd. or its content suppliers and protected by Thai and international copyright laws. The compilation of all content on this site is the exclusive property of Max MaxLife Co., Ltd. and protected by Thai and international copyright laws. All software used on this site is the property of Max MaxLife Co., Ltd. or its software suppliers and protected by Thai and international copyright laws.
</p>

<h2>YOUR ACCOUNT</h2>

<p>
If you use this site, you are responsible for maintaining the confidentiality of your account and password and for restricting access to your computer, and you agree to accept responsibility for all activities that occur under your account or password. You must be at least 18 years of age to use this site. Max MaxLife Co., Ltd. and its affiliates reserve the right to refuse service, terminate accounts, remove or edit content, or cancel orders in their sole discretion.
</p>
<p>
Max MaxLife Co., Ltd. and its affiliates attempt to be as accurate as possible.
However, Max MaxLife Co., Ltd. does not warrant that product description or other content of this site is accurate, complete, reliable, current or free of errors.
</p>
<p>
Unauthorized use of this Web site, including but not limited to unauthorized entry to our system, misuse of passwords or information is prohibited.
</p>

<h2>DISCLAIMER OF WARRANTIES AND LIMITATION OF LIABILITY</h2>
<p>
THIS SITE IS PROVIDED BY MAX MAXLIFE CO., LTD. ON AN &ldquo;AS IS&rdquo; AND &ldquo;AS AVAILABLE&rdquo; BASIS. MAX MAXLIFE CO., LTD. MAKES NO REPRESENTATIONS OR WARRANTIES OF ANY KIND, EXPRESS OR IMPLIED, AS TO THE OPERATION OF THIS SITE OR THE INFORMATION, CONTENT, MATERIALS, ORPRODUCTS INCLUDED ON THIS SITE. YOU EXPRESSLY AGREE THAT YOUR USE OF THIS SITE IS AT YOUR SOLE RISK.
</p>
<p>
MAX MAXLIFE CO., LTD. WILL NOT BE LIABLE FOR ANY DAMAGES OF ANY KIND ARISING FROM THE USE OF THIS SITE, INCLUDING BUT NOT LIMITED TO DIRECT, INDIRECT, INCIDENTIAL, PUNITIVE, AND CONSEQUENTIAL DAMAGES.
</p>

</div>
<br />
<p style="text-align:center">
	<?php echo CHtml::submitButton('Accept', array('name'=>'disclaimer_accepted','class'=>'button')); ?>
</p>
<?php $this->endWidget(); ?>
</div>
</div>
