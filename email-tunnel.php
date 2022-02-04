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

//die("tunnel");

require_once (plugin_dir_path(__FILE__). 'src/EmailTunnel/autoloader.php');

update_option( 'email_tunnel', "exit" );
//update_option( 'email_tunnel', "entrance" );

$tunnelStatus = get_option('email_tunnel', true);
if($tunnelStatus == "entrance"){
    require_once (plugin_dir_path(__FILE__). 'src/EmailTunnel/wp_mail.func.php');
}

if($tunnelStatus == "exit"){
    $Exit = new EmailTunnel\TunnelExit;
    $Exit->openTunnelExit();
}