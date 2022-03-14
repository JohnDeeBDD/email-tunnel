<?php

namespace EmailTunnel;

class TunnelEntrance{

    public function removeEntranceCred($uRL){
        $creds = get_option('email_tunnel_entrance_creds');
        if(!(is_array($creds))){
            $creds = [];
            return true;
        }
        $newCreds = [];
        foreach($creds as $cred){
            if(!($cred['url'] === $uRL)){
               array_push($newCreds, $cred);
            }
        }
        update_option('email_tunnel_entrance_creds', $newCreds);
        return $newCreds;
    }
    
    public function interceptOutgoingEmail($to, $subject, $message, $headers){
        $selectedEntrance = \EmailTunnel\TunnelEntrance::getSelectedEntrance();

        $fields = [
            'to'      => $to,
            'subject' => $subject,
            'message' => $message,
            'headers' => $headers
        ];
        $fields_string = http_build_query($fields);

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, ($selectedEntrance['url'] . "/wp-json/email-tunnel/v1/tunnel-exit/"));
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $fields_string);
        curl_setopt($ch, CURLOPT_HEADER, 1);
        curl_setopt($ch, CURLOPT_USERPWD, ($selectedEntrance['remote_user_name'] . ":" .  $selectedEntrance['code']));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $result = curl_exec($ch);
    }

    public function setEntranceCredentials($url, $code, $remoteUserName, $status = "not connected"){
        $creds = get_option('email_tunnel_entrance_creds');
        if(!(is_array($creds))){
            $creds = [];
        }
        $siteItem = ['url' => $url, 'code' => $code, 'remote_user_name' => $remoteUserName, 'status' => $status];
        array_push($creds, $siteItem);
        update_option('email_tunnel_entrance_creds', $creds);
        
    }
    
    public static function getSelectedEntrance(){
        $creds = get_option('email_tunnel_entrance_creds');
        if(!(is_array($creds))){
            return false;
        }
        foreach($creds as $siteItem){
            if($siteItem['status'] == "connected"){
                return ($siteItem);
            }
        }
        return false;
    }
    
    public function getFilteredEntranceCredsForFrontEndUITableData(){
        $unfiltedCreds = $this->getEntranceCredentials();
        //we should remove the "code". The front end user doesn't need to see it.
        $creds = [];
        //var_dump($unfiltedCreds);die();
        foreach($unfiltedCreds as $credItem){
            $item = 
                [
                    'url'       => $credItem['url'],
                    'created' => "04/05/2022",
                    'emails'    =>  666,
                    'status'    => $credItem['status'],
                    'revoke'    => $credItem['url']
                ];
            array_push($creds, $item);
        }
        return $creds;
    }
    
    public function getEntranceCredentials(){
        $creds = get_option('email_tunnel_entrance_creds', true);
        if(!(is_array($creds))){
            $creds = [];
        }
        //var_dump($creds);die(" line 106");
        return $creds;
    }

    public function setSelectedEntrance($url){
        $creds = get_option('email_tunnel_entrance_creds');
        if(!(is_array($creds))){
            return false;
        }
        
        //remove connected status from all creds:
        $newCreds = [];
        foreach($creds as $siteItem){
            $newSiteItem = $siteItem;
            $newSiteItem['status'] = "not connected";
            array_push($newCreds, $newSiteItem);
        }
        
        //reset internal loops:
        $creds = $newCreds;
        $newCreds = [];
        
        //returns "false" if nothing is found in the data. that is an error.    
        $found = false;
        foreach($creds as $siteItem){
            if($siteItem['url'] == $url){
                $found = true;
                $siteItem['status'] = "connected";
                array_push($newCreds, $siteItem);
            }else{
                array_push($newCreds, $siteItem);
            }
        }
        update_option('email_tunnel_entrance_creds', $newCreds);
        return $found;
    }

    public function register_API_Routes(){
        //die("line 132");
		register_rest_route(
			"email-tunnel/v1",
			"get-entrence-creds",
			array(
				'methods' => ['POST', 'GET'],
				'callback' => function () {
				    //return [];
				    $response = ($this->getFilteredEntranceCredsForFrontEndUITableData());
					return $response;
				},
				'permission_callback' => function () {
				    
				    //Remove this line to active nonce system:
				    //return TRUE;
					
					if (!(current_user_can("install_plugins"))) {
						return FALSE;
					}
					return TRUE;
				},
				'validate_callback' => function () {
                    return TRUE;
				}
			)
		);
		//die("x");
		register_rest_route(
			"email-tunnel/v1",
			"add-new-exit",
			array(
				'methods' => ['POST', 'GET'],
				'callback' => function () {
				    $url = $_REQUEST['addExitUrl'];
				    $code = $_REQUEST['addExitCode'];
				    $remoteUsername = $_REQUEST['addUsername'];
				    if($this->doRegisterNewConnection($url, $code, $remoteUsername)){
                        $response = ($this->getFilteredEntranceCredsForFrontEndUITableData());
                        return $response;
                    }else{
                        http_response_code(401);
                        echo("A connection error occured.");
                        exit;
                    }

				},
				'permission_callback' => function () {
					if (!(current_user_can("install_plugins"))) {
						return FALSE;
					}
					return TRUE;
				},
				'validate_callback' => function () {
				    return true;
				    $isValid = $this->validateEntranceCredentials($_REQUEST);
				    if($isValid === true){
				        return true;
				    }else{
				        http_response_code(406);
				        echo($isValid);
				        exit;
				    }
                }
            )
		);
			
    }

    private function validateEntranceCredentials($args){
        if(!(isset($args['addExitUrl'])) && (isset($args['code']))){
            return "missing arguments";
        }
        $args['addExitUrl'] = esc_url_raw($args['addExitUrl']);
        $args['addExitUrl'] = sanitize_text_field($args['addExitUrl']); 
        if (!(filter_var($args['addExitUrl'], FILTER_VALIDATE_URL))) {
            http_response_code(406);
            //var_dump($args['addExitUrl']);die("!!!!!!");
            return ("URL is not good");
        }
        $prefix = substr($args['addExitUrl'], 0, 8);

        //if (!($prefix == "https://")){
        //    return ("Must be HTTPS");
        //}
        return true;
    }

    public function doCheckCredsViaCurl($url, $code, $remoteUsername){
        //from https://make.wordpress.org/core/2020/11/05/application-passwords-integration-guide/
        $url = $url . "/wp-json/wp/v2/users?context=edit";
        $ch = curl_init();
        curl_setopt($ch,CURLOPT_URL, $url);
        curl_setopt( $ch, CURLOPT_CUSTOMREQUEST, 'GET' );
        curl_setopt($ch, CURLOPT_HEADER, 1);
        curl_setopt($ch, CURLOPT_USERPWD, $remoteUsername . ":" . $code);
        curl_setopt($ch,CURLOPT_RETURNTRANSFER, true);
        $result = curl_exec($ch);


        if((str_contains($result, "HTTP/1.1 200 OK")) && (str_contains($result, $remoteUsername))){
            return true;
         }else{
            echo ($result);
            exit;
        }
    }

    public function doRegisterNewConnection($url, $code, $remoteUsername){
        if($this->doCheckCredsViaCurl($url, $code, $remoteUsername)){
            $this->setEntranceCredentials($url, $code, $remoteUsername);
            $this->setSelectedEntrance($url);
            return true;
        }
        return false;
    }
} 
