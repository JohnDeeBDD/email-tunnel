<?php

class ValidationsCest
{
    private function userEntersValidData(\AcceptanceTester $I)
    {
        $I->loginAsAdmin();
        $I->amOnPage("/wp-admin/tools.php?page=email-tunnel");
        $I->see("Email Tunnel");
        $I->click("#email-tunnel-status-radio-entrance");
        $I->see("Exit Site URL");
        $validSiteUrlWithSSL = "https://validsite.com";
        $I->fillField("email-tunnel-exit-url-input", $validSiteUrlWithSSL);
        $I->fillField("email-tunnel-exit-code-input", "ABCxyz123");
        $I->click("Connect");
        $I->amOnPage("/wp-admin/index.php");
        $I->amOnPage("/wp-admin/tools.php?page=email-tunnel");
        sleep(1); //the elements are "faded in"
        $I->see($validSiteUrlWithSSL);
    }

    private function userEntersInValidData(\AcceptanceTester $I)
    {
        $I->loginAsAdmin();
        $I->amOnPage("/wp-admin/tools.php?page=email-tunnel");
        $I->see("Email Tunnel");
        $I->click("#email-tunnel-status-radio-entrance");
        $I->see("Exit Site URL");
        $siteWithNoSSL = "http://nosslsite.com";
        $siteWithSSL = "https://nosslsite.com";

        $I->fillField("email-tunnel-exit-url-input", $siteWithNoSSL);
        $I->fillField("email-tunnel-exit-code-input", "ABCxyz123");
        $I->click("Connect");
        sleep(2);
        $I->see("You must have SSL enabled on both sites in the free version of this plugin.");
        $I->fillField("email-tunnel-exit-url-input", $siteWithSSL);
        $I->fillField("email-tunnel-exit-code-input", "ABCxyz123");
        $I->click("Connect");
        sleep(2);
        $I->dontSee("You must have SSL enabled on both sites in the free version of this plugin.");
    }
}