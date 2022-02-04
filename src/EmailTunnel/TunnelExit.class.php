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
    }
    
    public function doSendMail(){
  
            $to = $_REQUEST['to'];
            $subject = $_REQUEST['subject'];
            $message = $_REQUEST['message'];
            $headers = "";
            \wp_mail($to, $subject, $message, $headers);
            return "email sent";
    }

}

//?to=jiminac@aol.com&subject=subjecto&message=someMessage