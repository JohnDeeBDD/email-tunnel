<?php
$I = new AcceptanceTester($scenario);
$I->wantTo('test an API');

$I->loginAsAdmin();
$I->amOnPage('/test-post-one/');
$I->see("Content of test post 1.");
$JS="FCFS.doAJAX('/wp-json/fcfs/v1/settings/', {'_wpnonce': wpApiSettings.nonce, 'status':'open', 'post-id':1555, 'max-users':123})";
$I->executeJS($JS);
$I->waitForJS("return jQuery.active == 0;", 10);
$result = $I->executeJS("return FCFS.AJAXreturnedData;");

var_dump($result);
