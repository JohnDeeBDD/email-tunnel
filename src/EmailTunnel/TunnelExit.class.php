<?php

namespace EmailTunnel;

class TunnelExit{
    
    public function openTunnelExit(){
        //die("exit open");    
        \add_action ('rest_api_init', [$this, 'doRegisterRoutes']);
    }
    
    public function doRegisterRoutes(){
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
			"tunnel-exit-ui-data",
			array(
				'methods' => ['POST', 'GET'],
				'callback' => function () {	
					$userID = get_current_user_id();
					$TunnelExit = new TunnelExit;
    				$result = $TunnelExit->getExitDataForFrontened($userID);
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
    }
    
    public function doSendMail(){
  
            $to = $_REQUEST['to'];
            $subject = $_REQUEST['subject'];
            $message = $_REQUEST['message'];
            $headers = "";
            \wp_mail($to, $subject, $message, $headers);
            return "email sent";
    }
    
    
    
    public function getExitDataForFrontened($userID){
    		$AppPasswords = \WP_Application_Passwords::get_user_application_passwords($userID);
    		$result = [];
    		foreach($AppPasswords as $item){

    			$name = $item['name'];
    			if (substr($name, 0, 13) == "email-tunnel:"){
    				//echo ($item['name'] . "<br />");
    				$name = $str1 = substr($item['name'], 13);
    				array_push($result, $name);
    			}
    		}
    		return $result;
    }

}

//?to=jiminac@aol.com&subject=subjecto&message=someMessage