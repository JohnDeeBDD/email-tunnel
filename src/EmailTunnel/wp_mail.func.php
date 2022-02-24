<?php

//die("mail");
function wp_mail( $to, $subject, $message, $headers = '' ) {
    
    $Entrance = new EmailTunnel\TunnelEntrance;
    $Entrance->interceptOutgoingEmail($to, $subject, $message, $headers);
    
    return TRUE;
}