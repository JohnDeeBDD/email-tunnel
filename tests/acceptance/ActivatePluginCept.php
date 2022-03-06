<?php

$I = new AcceptanceTester($scenario);
$I->wantTo('Activate the plugin');

$I->wantTo('Login to the dev site');
$I->loginAsAdmin();
$I->see("Howdy, Codeception");

$I->wantTo("deactivate the plugin");
shell_exec("wp plugin deactivate email-tunnel");

shell_exec("wp option delete email_tunnel_entrance_creds");
shell_exec("wp option delete email_tunnel_site_status");



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


//$I->see("You are not connected.");

$I->wantTo("Fill in the mock entrance data");
$mockSites =
    [
        "https://mock-site1.com",
        "https://mock-site2.net",
        "https://mock-site3.guru"
    ];

foreach($mockSites as $mockSite){
    $I->fillField("email-tunnel-exit-url-input", $mockSite);
    $I->fillField("email-tunnel-exit-code-input", "ABCxyz123");
    $I->click("Connect");
}
foreach($mockSites as $mockSite){
    $I->see($mockSite);
}
