<?php
/**
 * Plugin Name: Email Tunnel
 * Plugin URI: 
 * Description: 
 * Donate Link: 
 * Author: 
 * Version: 2.1
 * Author URI: 
 * Text Domain: email-tunnel
 */


//die("email-tunnel balls out ");

require_once (plugin_dir_path(__FILE__). 'src/EmailTunnel/autoloader.php');

$tunnelStatus = \EmailTunnel\Connections::getSiteStatus();
//var_dump($tunnelStatus);die();
if($tunnelStatus == "entrance"){
    $selectedEntrance = \EmailTunnel\TunnelEntrance::getSelectedEntrance();
    if($selectedEntrance){
        if ( !function_exists('wp_mail')){
            //die("line 23");
            require_once (plugin_dir_path(__FILE__). 'src/EmailTunnel/wp_mail.func.php');
        }
    }
}


if($tunnelStatus == "exit"){
 $Exit = new EmailTunnel\TunnelExit;
 $Exit->openTunnelExit();
}

add_action('admin_menu', 'register_my_custom_submenu_page');
 
function register_my_custom_submenu_page() {
    add_submenu_page(
        'tools.php',
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
        if (($pagenow == 'tools.php') && ($_GET['page'] == "email-tunnel")) {
            wp_register_script(
                'email-tunnel-js',
                plugin_dir_url(__FILE__) . '/src/EmailTunnel/SettingsPage.js', // here is the JS file
                ['jquery', 'wp-api'],
                '1.0',
                true
            );
            $emailTunnelStatusData = [];
            $emailTunnelStatusData['status'] = \EmailTunnel\Connections::getSiteStatus();
            wp_localize_script( 'email-tunnel-js', 'EmailTunnelStatusData', $emailTunnelStatusData );
            wp_enqueue_script('email-tunnel-js');
        }
    }
}
add_action ('rest_api_init', [new EmailTunnel\TunnelExit, 'doRegisterRoutes']);
add_action ('rest_api_init', '\EmailTunnel\Connections::register_API_Routes');
add_action ('rest_api_init', [new \EmailTunnel\TunnelEntrance, 'register_API_Routes']);

//REMOVE THIS IN PROD:
add_filter( 'wp_is_application_passwords_available', '__return_true' );


require_once (plugin_dir_path(__FILE__). 'src/plugin-update-checker-4.11/plugin-update-checker.php');
$myUpdateChecker = Puc_v4_Factory::buildUpdateChecker(
    'https://email-tunnel.com/wp-content/uploads/details.json',
    __FILE__, //Full path to the main plugin file or functions.php.
    'email-tunnel'
);


function activationHook() {
    \EmailTunnel\Connections::activatePlugin();
}
register_activation_hook( __FILE__, 'activationHook' );