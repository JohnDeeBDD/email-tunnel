<?php

namespace EmailTunnel;

class TunnelExit{
    
    public function openTunnelExit(){
        //die("exit open");
        \add_action ('rest_api_init', [$this, 'doOpenExitAPI']);
    }

    public function doOpenExitAPI(){
        register_rest_route(
            "email-tunnel/v1",
            "tunnel-exit",
            array(
                'methods' => ['POST', 'GET'],
                'callback' => function () {
                    return new \WP_REST_Response(
                        [
                            'status' => 200,
                            'response' => "OK",
                            'body_response' => ($this->doSendMail()),
                        ]
                    );
                },
                'permission_callback' => function () {
                    //return true;
                    if (current_user_can("install_plugins")) {
                        return true;
                    }else {
                        return false;
                    }
                },
                'validate_callback' => function () {
                    return true;
                }
            )
        );
    }
    
    public function doRegisterRoutes(){
		register_rest_route(
			"email-tunnel/v1",
			"tunnel-exit-ui-data",
			array(
				'methods' => ['POST', 'GET'],
				'callback' => function () {	
					$userID = get_current_user_id();
					$TunnelExit = new TunnelExit;
    				$result = $TunnelExit->getExitDataForFrontend($userID);
    				//return "my balls";
    				return $result;
				},
				'permission_callback' => function () {
					return true;
					//return (current_user_can('edit_post', $_REQUEST['post-id']));
				},
				'validate_callback' => function () {
					return true;
				}
			)
		);

		register_rest_route(
            "email-tunnel/v1",
            "add-new-entrance",
            array(
                'methods' => ['POST', 'GET'],
                'callback' => function () {
                    return $this->handleAddNewEntranceApiRequest();
                },
                'permission_callback' => function () {
                    return true;
                    //return (current_user_can('edit_post', $_REQUEST['post-id']));
                },
                'validate_callback' => function () {
                    return true;
                }
            )
        );
    }

    public function handleAddNewEntranceApiRequest(){
        $userId = get_current_user_id();
        $name = "email-tunnel:" . $_REQUEST['url'];
        $uuid = $this->getApplicationPasswordUUIDByName($name, $userId);
        //return $uuid;
        if($uuid){
            $this->removeExitCred($_REQUEST['url'], $userId);
        }
        return TunnelExit::createNewExitCred($_REQUEST['url'], $userId);
    }
    
    public function doSendMail(){
  
            $to = $_REQUEST['to'];
            $subject = $_REQUEST['subject'];
            $message = $_REQUEST['message'];
            $headers = "";
            \wp_mail($to, $subject, $message, $headers);
            return "email sent";
    }

    public function removeExitCred($uRL, $userID){
        $uRL = "email-tunnel:" . $uRL;
        $uUID = $this->getApplicationPasswordUUIDByName($uRL, $userID);
        if($uUID){
            return (\WP_Application_Passwords::delete_application_password( $userID, $uUID ));
        }else{
            return false;
        }
    }

    public function getExitDataForFrontend($userID){
    		$AppPasswords = \WP_Application_Passwords::get_user_application_passwords($userID);
    		$result = [];
    		//var_dump($AppPasswords);die("line 73");
    		foreach($AppPasswords as $item){

    			$name = $item['name'];
    			if (substr($name, 0, 13) == "email-tunnel:"){
    				$name = $str1 = substr($item['name'], 13);
    				$newItem = ['name' => $name, 'createdOn' => "04/04/2022", 'emails' => 555, 'status' => 'hello'];
    				array_push($result, $newItem);
    			}
    		}
    		return $result;
    }

    public function getApplicationPasswordUUIDByName($name, $userID){
        $passwords = \WP_Application_Passwords::get_user_application_passwords( $userID );
        foreach ( $passwords as $password ) {
            if ( strtolower( $password['name'] ) === strtolower( $name ) ) {
                return $password['uuid'];
            }
        }
        return false;
    }

    public static function createNewExitCred($remoteSiteUrl, $userId){
        $app_pass = \WP_Application_Passwords::create_new_application_password( $userId, array( 'name' => ("email-tunnel:" . $remoteSiteUrl) ) );
        return $app_pass;
    }

}