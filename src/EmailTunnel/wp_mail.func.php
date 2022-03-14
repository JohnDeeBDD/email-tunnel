<?php

//die("mail");
function wp_mail( $to, $subject, $message, $headers = '' ) {
    //die("wp_mail");



    $Entrance = new EmailTunnel\TunnelEntrance;
    $Entrance->interceptOutgoingEmail($to, $subject, $message, $headers);
    
    return TRUE;
}