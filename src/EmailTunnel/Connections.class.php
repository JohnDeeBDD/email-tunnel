<?php

namespace EmailTunnel;

//this class provides a CRUD for the connections data

class Connections{

    public function setSiteStatus($siteUrl = "", $userId, $status = "Not Connected", $code = ""){
        
        /*
        if($status == "Not Connected"){
            $status =
                [
                    'siteUrl'   => '',
                    'userId'    => '',
                    'status'    => $status,
                    'code'      => ''
                ];
        }

        if($status == "entrance"){
            $Entrance = new TunnelEntrance();
            $siteUrl = $Entrance->getSelectedEntrance();
            if($siteUrl){
                $status =
                    [
                        'siteUrl'   => $siteUrl,
                        'userId'    => $userId,
                        'status'    => "entrance",
                        //'code'      => $code
                    ];
            }else{

            }
            $status =
                [
                    'siteUrl'   => $siteUrl,
                    'userId'    => $userId,
                    'status'    => $status,
                    'code'      => $code
                ];
        }
        */
        $status =
                [
                    'siteUrl'   => '',
                    'userId'    => '',
                    'status'    => "entrance",
                    'code'      => ''
                ];
        
        update_option('email_tunnel_site_status', $status);
    }
    
    public function getSiteStatus(){
        $status = get_option('email_tunnel_site_status');
        if(!$status){
            $status = 
            [
                'siteUrl'   => "",
                'userId'    => "",
                'status'    => "Not Connected",
                'code'      => ""
            ];  
        }
        
        
        $status =
                [
                    'siteUrl'   => '',
                    'userId'    => '',
                    'status'    => "entrance",
                    'code'      => ''
                ];
        
        return $status;
    }
    
    //public function updateConnetion($siteUrl, $siteTitle, $status, $code){}

    /*
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
    */
    
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
                        return FALSE;
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

        register_rest_route(
            "email-tunnel/v1",
            "collapse-tunnel",
            array(
                'methods' => ['POST', 'GET'],
                'callback' => function () {
                    if($_REQUEST['status'] == "entrance"){
                        $Entrance = new TunnelEntrance;
                        $resp = $Entrance->removeEntranceCred($_REQUEST['siteUrl']);
                        $resp = $Entrance->getFilteredEntranceCredsForFrontEndUITableData();
                        return $resp;
                    }
                    if($_REQUEST['status'] == "exit"){

                        $userID = get_current_user_id();
                        //return "SERVER RESPONSE ALPHA" . $userID . $_REQUEST['siteUrl'];
                        $Exit = new TunnelExit;
                        $res = $Exit->removeExitCred($_REQUEST['siteUrl'], $userID);
                        $res = $Exit->getExitDataForFrontend($userID);
                        return $res;
                    }
                    return "SOMETHING IS WRONG";
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
                        return FALSE;
                    }
                    if(!isset($_REQUEST['siteUrl'])){
                        return FALSE;
                    }
                    return TRUE;
                }
            )
        );
	}

}

