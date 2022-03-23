<?php

$version = readline('Version: ');
$endUser = "8752a6de9d14ce6a8ae7fc309f6a5901";



shell_exec("sudo rm -R /var/www/html/wp-content/plugins/email-tunnel/email-tunnel");
shell_exec("sudo mkdir /var/www/html/wp-content/plugins/email-tunnel/email-tunnel");

copy("/var/www/html/wp-content/plugins/email-tunnel/email-tunnel.php", "/var/www/html/wp-content/plugins/email-tunnel/email-tunnel/email-tunnel.php");
shell_exec("cp -r /var/www/html/wp-content/plugins/email-tunnel/src /var/www/html/wp-content/plugins/email-tunnel/email-tunnel/src");
shell_exec("sudo zip -r email-tunnel-$version.zip email-tunnel");