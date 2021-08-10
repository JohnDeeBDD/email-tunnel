<?php
/**
 * Plugin Name:       FCFS Block
 * Description:       Create a list of users who have clicked something or come to a page
 * Requires at least: 5.8
 * Requires PHP:      7.0
 * Version:           1
 * Author:            JohnDeeBDD
 * License:           GPL-2.0-or-later
 * License URI:       https://www.gnu.org/licenses/gpl-2.0.html
 * Text Domain:       fcfs-block
 *
 * @package           create-block
 */

//https://wordpress.stackexchange.com/questions/313451/gutenberg-blocks-processing-server-data-within-a-block

namespace FCFS;

//die("FCFS");

require_once (plugin_dir_path(__FILE__). 'src/FCFS/autoloader.php');

add_action( 'init', function(){register_block_type( __DIR__, array('render_callback' => [new Shortcode_FCFS, 'doReturnShortcode']) );} );

$SettingsPage = new Page_FCFS();
$SettingsPage->enable();

\add_action ('rest_api_init', [new API_ClickList, 'doRegisterRoutes']);
\add_action ('rest_api_init', [new API_SettingsPage, 'doRegisterRoutes']);
\add_shortcode('FCFS', [new Shortcode_FCFS, 'doReturnShortcode']);
\add_action( 'delete_post', [new Action_DeleteFCFS, 'doDeleteSomeKindOfPost']);
\add_filter( 'heartbeat_received', [new Heartbeat, 'myplugin_receive_heartbeat'], 10, 2 );

$Action = new Action_MakeFCFS();
$Action->enable();

//\add_action('wp', [new Action_VisitFCFS_Page, "listenForVisit"] );

//DEVELOPMENT::

if(isset($_GET['doit'])){
	//die("!!");
	add_action("init", 'FCFS\doIt');
}

function doIt(){
	//die("doit");
}