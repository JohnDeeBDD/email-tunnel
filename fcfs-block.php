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

namespace FCFS;

require_once (plugin_dir_path(__FILE__). 'src/FCFS/autoloader.php');

\add_action( 'init', function(){register_block_type( __DIR__, array('render_callback' => [new Frontend, 'returnUI']) );} );
\add_shortcode('FCFS', [new Frontend, 'returnUI']);

$Clicklist = new ClickList;
\add_action ('rest_api_init', [$Clicklist, 'doRegisterRoutes']);
\add_action ('wp', [$Clicklist, 'listenForClickSubmission']);
