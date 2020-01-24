<?php

/**
 * For selecting customer and patient when create new Order
 */
class OrderCustomerForm extends CFormModel
{
	public $clinician_name;
	public $clinician_id;
	public $customer_id;
	public $patient_id;
	public $patient_name;
	public $patient_hn;
	public $hospital_name;
	public $template_id;

	public function rules()
	{
		return array(
			array('patient_name, clinician_name', 'safe'),
			array('customer_id, clinician_id, patient_id, patient_hn, template_id', 'customerSelect'),
		);
	}

	/**
	 * Declares attribute labels.
	 */
	public function attributeLabels()
	{
		return array(
			'clinician_name'=>'Enter Clinician Name',
			'customer_id'=>'Customer',
			'patient_name'=>'Enter Patient Name'
		);
	}
	function customerSelect($attribute) {
		$customer = Customer::model()->findByPk($this->$attribute);
		if ($customer) {
			$clinician = $customer->getClinician();
			$this->clinician_name = $clinician->full_name;
			$this->clinician_id = $clinician->id;
			$this->hospital_name = $customer->hospital->name;
			return true;
		} else {
			$message = 'Please select customer.';
			$this->addError($attribute,$message);
			return false;
		}
	}

	public function doAddPatient() {
		$patient = Patient::model()->findByPk($this->patient_id);
		if($patient) {
			return false;
		}
		if ( strlen($this->patient_name) > 1) {
			$patient = new Patient();
			$patient->name = $this->patient_name;
			$patient->customer_id = $this->customer_id;
			$patient->clinician_id = $this->clinician_id;
			$patient->hn = $this->patient_hn;
			$patient->save();
			$this->patient_id = $patient->id;
			Yii::app()->user->setFlash('success',"New Patient Added!");
			return true;	
		} else {
			
			
			$this->patient_id = 0;

			
		}
	}
	
}