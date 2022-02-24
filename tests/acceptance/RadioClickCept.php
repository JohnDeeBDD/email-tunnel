<?php
$I = new AcceptanceTester($scenario);

$I->wantTo('See that radio button works');

$I->loginAsAdmin();

$I->amOnPage("/wp-admin/options-general.php?page=email-tunnel");
              
$I->see("Email Tunnel");

//$I->click("radio button Entrance");
//$I->see("Entrance stuff");