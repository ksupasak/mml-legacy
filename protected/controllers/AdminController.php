<?php
/**
 *  System administration functions
 */
class AdminController extends Controller {
	public function accessRules()
	{
		return array(
			array('allow', // allow authenticated users to access all actions
				'users'=>array('@'),
			),
			array('deny',  // deny all users
				'users'=>array('*'),
			),
		);
	}
	function actionViewLogs() {
		$userLog= Logging::getUserLogs();
		$orderLog=Logging::getOrderLogs();
		$this->render('//site/viewLogs', array('userLog'=>$userLog,'orderLog'=>$orderLog));
	}
    /* ACL functions */
    private $sysRoles = array(
                    'Administrator',
                    'Manager',
                    'Doctor',
                    'Nurse'
    );
    private $sysAccessOpts = array(
            'viewAllPatients'   => '',
            'createOrder'       => '',
            'createPatient'     => ''
    );
    private $sysAccessList = array(
        'Manager' => array(),
        'Doctor' => array(),
        'Nurse' => array()
    );
     public function actionAclRun(){
        echo "Build ACL";
        $this->buildAccessList();
        $this->clearAccessList();
     }    
     public function actionAuthAssign($user_id, $role='Administrator') {
        $auth = SysACL::getAuth();
        switch ($_GET['do']) {
            case 'assign':
                try {
                    $auth->assign($role,$user_id);
                    SysEvent::log("assigned user ID $user_id to role $role",SysEvent::SECURITY);
                } catch (Exception $e) {
                    SysEvent::log("assigned user ID $user_id to role $role FAILED",SysEvent::SECURITY);
                }
                break;
            case 'revoke':
                try {
                    $auth->revoke($role,$user_id);
                    SysEvent::log("revoked user ID $user_id from role $role",SysEvent::SECURITY);
                } catch (Exception $e) {
                    SysEvent::log("revoked user ID $user_id from role $role FAILED",SysEvent::SECURITY);
                }
                break;   
        }
        $this->redirect($this->createUrl('/admin'));
    }
    public function clearAccessList() {
        $this->getAuth()->clearAll();
        //$auth->clearAuthAssignments();
    }
	public function buildAccessList()
	{
        $auth = $this->getAuth();
        $roles = $this->sysRoles();
        $opts = $this->sysAccessOpts();  // Create Operations
        foreach ($opts as $name => $desc) {
            $auth->createOperation($name,$desc);
        }
        $role = array();
        foreach ($roles as $r) {
            $r1 = $auth->createRole($r); // Create Roles
            $role[$r] = $r1;
        }
        $acl = $this->sysAccessList();
        // Assign Operation to Role according to AccessList
        foreach ($acl as $roleName => $opts) {
            foreach($opts as $opt) {
              $role[$roleName]->addChild($opt); 
              // Add Operation as child
            }
        }
        // Done populating ACL
	}
    /* ACL helper functions */
    public function getAuth() {
        $auth = Yii::app()->authManager;
        if (!$auth)
            throw new Exception('Error getting Auth Manager. Make sure it is enabled it in main/config.php');
        return $auth;
    }
    public function getAuthOperationOptions() {
        $options = array(
            'revoke' => 'revoke from',
            'assign' => 'assign to'
        );
        return $options;
    }
    public static function getAuthRoleOptions() {
        $roles = array_keys($this->getAuth()->getRoles());
        $options = array();
        foreach($roles as $role) {
            $options[$role] = $role;
        }
        return $options;
    }    
}