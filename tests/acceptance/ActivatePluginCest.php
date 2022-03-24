<?php

class ActivatePluginCest
{
    public function activateThePlugin(\AcceptanceTester $I){
        $I->wantTo('Activate the plugin');

        $I->wantTo('Login to the dev site');
        $I->loginAsAdmin();
        $I->see("Howdy, Codeception");

        $I->wantTo("deactivate the plugin");
        //shell_exec("wp plugin deactivate email-tunnel");

        //shell_exec("wp option delete email_tunnel_entrance_creds");
        //shell_exec("wp option delete email_tunnel_site_status");


        $I->wantTo('Activate the plugin');
        $I->amOnPage("/wp-admin/plugins.php");
        $I->click("#activate-email-tunnel");
        $I->amOnPage("/wp-admin/tools.php?page=email-tunnel");
        $I->see("Email Tunnel");

        $I->wantTo('Enter mock entrance connection data');
        $I->expect("There should not be any data here, since I just activated the plugin!");
        $I->see("tunnel is closed.");
        $I->click("#email-tunnel-status-radio-entrance");
        $I->see("Exit Site URL");
        $testSiteURLs = $this->getSiteUrls();
        $I->reconfigureThisVariable(['url' => $testSiteURLs[1] ]);
        $I->loginAsAdmin();
        $I->see("Howdy, Codeception");
        $I->reconfigureThisVariable(['url' => $testSiteURLs[0] ]);
        $I->loginAsAdmin();
        $I->see("Howdy, Codeception");
    }

    public function setTunnelExitOnSite2(\AcceptanceTester $I)
    {

        $I->wantTo("Get the code for the exit");
        global $testSiteURLs;
        $I->reconfigureThisVariable(['url' => $testSiteURLs[1]]);
        $I->loginAsAdmin();
        $I->see("General Chicken Cloud Dev Server 2");
        $I->amOnPage("/wp-admin/profile.php?wp_http_referer=%2Fwp-admin%2Fusers.php");
        $I->fillField("#new_application_password_name", ("email-tunnel:" . $testSiteURLs[1]));
        $I->click("#do_new_application_password");
        //sleep(2);
        $I->waitForElementVisible('input[id=new-application-password-value]', 3);
        $code = $I->grabValueFrom('input[id=new-application-password-value]');
        $code = str_replace(' ', '', $code);

        $I->reconfigureThisVariable(['url' => $testSiteURLs[0]]);
        $I->amOnUrl($testSiteURLs[0]);
        $I->loginAsAdmin();
        $I->see("General Chicken Cloud Dev Server 1");

        $I->amOnPage("/wp-admin/tools.php?page=email-tunnel");
        $I->see("Email Tunnel");
        $I->click("#email-tunnel-status-radio-entrance");
        $I->waitForElementVisible(['id' => "you-are-not-connected-row"], 3);
        $I->see("You are not connected.");

        $I->fillField("email-tunnel-exit-url-input", ($testSiteURLs[1]));
        $I->fillField("email-tunnel-exit-code-input", $code);
        $I->fillField("email-tunnel-exit-username-input", "Codeception");

        $I->click(['id' => 'email-tunnel-connect-entrance-item-submit-button']);
    }

    public function sendEmail(\AcceptanceTester $I){
        global $testSiteURLs;
        $I->reconfigureThisVariable(['url' => $testSiteURLs[0]]);
        $I->amOnUrl($testSiteURLs[0]);
        $I->loginAsAdmin();
        $I->see("General Chicken Cloud Dev Server");
        $I->amOnPage("/wp-admin/tools.php?page=wp-test-email");
        $I->waitForElementVisible(['id' => "submit"], 3);
        $I->click("#submit");
        $I->waitForJS("return document.querySelector('.notice-success') != null", 5);

    }

    public function zCleanup(\AcceptanceTester $I){
        global $testSiteURLs;
        $I->amOnUrl($testSiteURLs[0]);
        $I->loginAsAdmin();
        $I->amOnPage("/wp-admin/tools.php?page=email-tunnel");
        $I->waitForElementVisible(['class' => "email-tunnel-entrance-collapse-button"], 3);
        $I->click("Collapse");

        $I->waitForJS("return document.querySelector('#email-tunnel-exit-not-connected-message') != null", 5);


        $I->amOnUrl($testSiteURLs[1]);
        $I->loginAsAdmin();
        $I->amOnPage("/wp-admin/profile.php?wp_http_referer=%2Fwp-admin%2Fusers.php");
        $I->click("Revoke");
        $I->acceptPopup();
        $I->waitForJS("return document.querySelector('.notice-success') != null", 5);
        $I->see("Application password revoked.");

        $I->amOnPage("/wp-admin/admin.php?page=email-log");
        $I->see("mail@email.com");
        $I->moveMouseOver( '.sent_date' );
        $I->click("Delete");

    }

}