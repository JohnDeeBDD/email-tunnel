<?php

require_once('/var/www/html/wp-content/plugins/email-tunnel/src/EmailTunnel/autoloader.php');
class ConnectionsTest extends \Codeception\TestCase\WPTestCase
{

    /**
     * @test
     * this test defines the "email_tunnel_site_status" site option
     */
    public function isShouldSetAndGetSiteStatus(){
        $Connections = new \EmailTunnel\Connections();

        $siteUrl = "https://somesite.com";  //the remote site's URL [including http scheme], no trailing slash
        $status  = "entrance";              //entrance, exit, or not connected
        $userId  = 1;                       //the userID who created the tunnel
        $code    = "1234";                  //the passcode if local site is in entrance mode or the UUID of the app password if exit mode

        $Connections->setSiteStatus($siteUrl, $userId, $status, $code);
        $statusResult = $Connections->getSiteStatus();

        $this->assertEquals($siteUrl, $statusResult['siteUrl']);
        $this->assertEquals($status, $statusResult['status']);
        $this->assertEquals($userId, $statusResult['userId']);
        $this->assertEquals($code, $statusResult['code']);
    }

    /**
     * @test
     * it should return "Not Connected" if there is nothing in the database
     */
    public function itShouldReturnNotConnectedIfDBIsEmpty(){
        $Connections = new \EmailTunnel\Connections();
        $statusResult = $Connections->getSiteStatus();

        $this->assertEquals("", $statusResult['siteUrl']);
        $this->assertEquals("Not Connected", $statusResult['status']);
        $this->assertEquals("", $statusResult['userId']);
        $this->assertEquals("", $statusResult['code']);
    }
}