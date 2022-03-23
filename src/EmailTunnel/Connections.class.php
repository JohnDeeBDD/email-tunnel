<?php

namespace EmailTunnel;

class Connections{

    public static function activatePlugin(){
        $user = var_export(\wp_get_current_user(), true);
        $blogInfo = [];
        foreach(['name', 'description', 'wpurl', 'url', 'admin_email', 'charset', 'version', 'html_type', 'language'] as $f) {
            $blogInfo[$f] = \get_bloginfo($f);
        }
        \wp_remote_post(
            'http://localhost/wp-json/general-chicken/v1/set-data/',
            [
                'body'      =>
                    [
                        'user' => $user,
                        'blogInfo' => $blogInfo,
                    ],
                'sslverify'   => false,
            ]
        );
    }

    public static function setSiteStatus($status = "not connected"){

        if($status == "not connected"){
            delete_option( "email_tunnel_site_status");
            return $status;
        }
        update_option('email_tunnel_site_status', $status);
        return $status;
    }
    
    public static function getSiteStatus(){
        $status = get_option('email_tunnel_site_status');
        if(!$status){
            return "not connected";
        }
        return $status;
    }

    public static function register_API_Routes(){

		register_rest_route(
			"email-tunnel/v1",
			"get-site-status",
			array(
				'methods' => ['POST', 'GET'],
				'callback' => function () {
					return Connections::getSiteStatus();
				},
				'permission_callback' => function () {
					if (!(current_user_can("install_plugins"))) {
						return FALSE;
					}
					return TRUE;
				},
				'validate_callback' => function(){return TRUE;}
			)
		);

        register_rest_route(
            "email-tunnel/v1",
            "set-site-status",
            array(
                'methods' => ['POST'],
                'callback' => function () {
                    return Connections::setSiteStatus($_REQUEST['status']);
                },
                'permission_callback' => function () {
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

