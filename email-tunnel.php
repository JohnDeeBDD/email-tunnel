<?php
/**
 * Plugin Name: Email Tunnel
 * Plugin URI: 
 * Description: 
 * Donate Link: 
 * Author: 
 * Version: 0.1
 * Author URI: 
 * Text Domain: email-tunnel
 */
//hello asia

//die("tunnel");
global $devSite2;
$devSite2 = "http://18.219.237.210";

require_once (plugin_dir_path(__FILE__). 'src/EmailTunnel/autoloader.php');

//update_option( 'email_tunnel_exit_url_base', 'MUST BE LOCALLY SET');
update_option( 'email_tunnel', "entrance" );

$tunnelStatus = get_option('email_tunnel', true);
if($tunnelStatus == "entrance"){
 if ( !function_exists('wp_mail')){
   require_once (plugin_dir_path(__FILE__). 'src/EmailTunnel/wp_mail.func.php');
  }
}

if($tunnelStatus == "exit"){
 $Exit = new EmailTunnel\TunnelExit;
 $Exit->openTunnelExit();
}



add_action('admin_menu', 'register_my_custom_submenu_page');
 
function register_my_custom_submenu_page() {
    add_submenu_page(
        'options-general.php',
        'Email Tunnel',
        'Email Tunnel',
        'manage_options',
        'email-tunnel',
        'renderEmailTunnelSettingsPage' );
}
 
function renderEmailTunnelSettingsPage() {
    $SettingsPage = new EmailTunnel\SettingsPage;
    $SettingsPage->render();
}

add_action('admin_enqueue_scripts', 'enableAdminJS');

function enableAdminJS(){
    global $pagenow;
    if(isset($_GET['page'])){
        if (($pagenow == 'options-general.php') && ($_GET['page'] == "email-tunnel")) {
            wp_register_script(
                'email-tunnel-js',
                plugin_dir_url(__FILE__) . '/src/EmailTunnel/SettingsPage.js', // here is the JS file
                ['jquery', 'wp-api'],
                '1.0',
                true
            );
        $Connections = new \EmailTunnel\Connections;
        $status = $Connections->getSiteStatus();
        wp_localize_script( 'email-tunnel-js', 'EmailTunnelStatusData', $status );    
        wp_enqueue_script('email-tunnel-js');
        }
    }
}



//add_action('init', [new \EmailTunnel\TunnelEntrance, 'setEntranceCredentials']);

add_action ('rest_api_init', [new \EmailTunnel\Connections, 'register_API_Routes']);
add_action ('rest_api_init', [new \EmailTunnel\TunnelEntrance, 'register_API_Routes']);

$dummyData =
            [ 
            ];
            
//REMOVE THIS IN PROD:
add_filter( 'wp_is_application_passwords_available', '__return_true' );
//update_option('email_tunnel_entrance_creds', $dummyData);


//add_action("init", "jimbo");
function jimbo(){
    //die("xx");
    $app_password = \WP_Application_Passwords::create_new_application_password(1, ["name" => "email-tunnel:https://google.com"]); 
    
    echo($app_password[0]);die();
    //\WP_Application_Passwords::set_user_application_passwords(1, [$app_password]);
    
}