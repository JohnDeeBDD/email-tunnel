<?php

use \Codeception\Util\Locator;

class BugsCest
{
    public function YouAreNotConnectedIsVisable(\AcceptanceTester $I)
    {
        /*
        Expected behavior:
        Given there is no entrance cred connection data
        And a row "You are not connected." appears
        When a valid cred is entered
        Then the row "You are not connected." is not visible

        Bug:
        Given there is no entrance cred connection data
        And a row "You are not connected." appears
        When a valid cred is entered
        Then the row "You are not connected." is visible
        */
        $I->loginAsAdmin();
        shell_exec("wp option delete email_tunnel_entrance_creds");
        shell_exec("wp option delete email_tunnel_site_status");
        $I->amOnPage("/wp-admin/tools.php?page=email-tunnel");
        $I->see("Email Tunnel");
        $I->click("#email-tunnel-status-radio-entrance");
        $I->waitForElementVisible(['id' => "you-are-not-connected-row"], 3);
        $I->see("You are not connected.");

        $I->fillField("email-tunnel-exit-url-input", "https://bug-youarenotconnectedisvisable.com");
        $I->fillField("email-tunnel-exit-code-input", "ABC123");
        $I->click(['id' => 'email-tunnel-connect-entrance-item-submit-button']);
        sleep(2);

        //passing test with bug:
        //$I->see("You are not connected.");

        //resolution of bug:
        $I->dontSee("You are not connected.");
    }
}
