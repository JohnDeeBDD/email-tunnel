<?php

namespace EmailTunnel;

//this class provides a CRUD for the connections data

class Connections{
    
    public function getRemoteUrl(){}
    
    public function getRemoteCode(){}
    
    public function setSiteStatus($siteUrl, $siteTitle, $status, $code){
        $status = 
            [
                'siteUrl'   => $siteUrl,
                'siteTitle' => $siteTitle,
                'status'    => $status,
                'code'      => $code
            ];
        update_option('email_tunnel_site_status', $status);
    }
    
    public function getSiteStatus(){
        $status = get_option('email_tunnel_site_status');
        if(!$status){
            $status = 
            [
                'siteUrl'   => "",
                'siteTitle' => "",
                'status'    => "Not Connected",
                'code'      => ""
            ];  
        }
        
        return $status;
    }
    
    public function updateConnetion($siteUrl, $siteTitle, $status, $code){}
    
    public function removeConnection(){}
    
    public function getSiteStatusHTML(){
        $db = $this->getSiteStatus();
        $status = $db['status'];
        $siteUrl = $db['siteUrl'];
        $siteTitle = $db['siteTitle'];
        $output =
<<<OUTPUT
$status<br />
Emails from this site, will be sent from $siteTitle. <br />
URL: $siteUrl<br />

OUTPUT;
        
        return $output;
    }
    
    public function register_API_Routes(){
		register_rest_route(
			"email-tunnel/v1",
			"get-site-status",
			array(
				'methods' => ['POST', 'GET'],
				'callback' => function () {
				    $status = ($this->getSiteStatus());
					return $status;
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
		
		register_rest_route(
			"email-tunnel/v1",
			"set-site-status",
			array(
				'methods' => ['POST', 'GET'],
				'callback' => function () {
					
				    $this->setSiteStatus($_REQUEST['siteUrl'], $_REQUEST['siteTitle'], $_REQUEST['status'], $_REQUEST['code']);
				    $status = ($this->getSiteStatus());
					return $status;
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
				    if(!isset($_REQUEST['status'])){
				        return FASLE;
				    }
				    if(!isset($_REQUEST['siteUrl'])){
				        $_REQUEST[''] = "";    
				    }
				    if(!isset($_REQUEST['siteTitle'])){
				        $_REQUEST['siteTitle'] = "";    
				    }
				    if(!isset($_REQUEST['code'])){
				        $_REQUEST['code'] = "";    
				    }
                    return TRUE;
				}
			)
		);
	}
    
    

}

