<?php

class MainRadioCest{
    public function userSetsEntranceMode(\AcceptanceTester $I){
        $I->loginAsAdmin();
        $I->amOnPage("/wp-admin/tools.php?page=email-tunnel");
        $I->see("Email Tunnel");
        $I->click("#email-tunnel-status-radio-entrance");
        $I->see("Exit Site URL");
    }
    
    public function userSetsExitMode(\AcceptanceTester $I){
        $I->loginAsAdmin();
        $I->amOnPage("/wp-admin/tools.php?page=email-tunnel");
        $I->see("Email Tunnel");
        $I->click("#email-tunnel-status-radio-exit");
        $I->see("Entrance Site URL");
    }

    /*
    public function userSetsClosedMode(\AcceptanceTester $I){
        $I->loginAsAdmin();
        $I->amOnPage("/wp-admin/options-general.php?page=email-tunnel");
        $I->see("Email Tunnel");
        $I->click("#email-tunnel-status-radio-exit");
        $I->see("The tunnel is closed.");
    }
    */
}