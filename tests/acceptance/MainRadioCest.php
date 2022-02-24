<?php

class MainRadioCest
{
    public function _before(\AcceptanceTester $I)
    {
    }

    public function _after(\AcceptanceTester $I)
    {
    }

    
    public function userSetsEntranceMode(\AcceptanceTester $I){
        $I->loginAsAdmin();
        $I->amOnPage("/wp-admin/options-general.php?page=email-tunnel");
        $I->see("Email Tunnel");
        $I->click("#email-tunnel-status-radio-entrance");
        $I->see("Enter the URL of the tunnel exit");
    }
    
    public function userSetsExitMode(\AcceptanceTester $I){
        $I->loginAsAdmin();
        $I->amOnPage("/wp-admin/options-general.php?page=email-tunnel");
        $I->see("Email Tunnel");
        $I->click("#email-tunnel-status-radio-exit");
        $I->see("Allow the following site to send email from");
    }
    
    public function userSetsClosedMode(\AcceptanceTester $I){
        $I->loginAsAdmin();
        $I->amOnPage("/wp-admin/options-general.php?page=email-tunnel");
        $I->see("Email Tunnel");
        $I->click("#email-tunnel-status-radio-exit");
        $I->see("The tunnel is closed.");
    }
    
    
}