<?php
$I = new AcceptanceTester($scenario);
$I->wantTo('test an API');

$commandToGetLocalIP = "dig +short myip.opendns.com @resolver1.opendns.com";
$IP = shell_exec($commandToGetLocalIP);
$IP = substr_replace($IP, "", -1);
$I->reconfigureThisVariable(['url' => "http://$IP/"]);

$I->loginAsAdmin();
$I->amOnPage('/test-post-one/');
$I->see("Content of test post 1.");
$JS="FCFS.doAJAX('/wp-json/fcfs/v1/settings/', {'_wpnonce': wpApiSettings.nonce, 'status':'open', 'post-id':1555, 'max-users':123})";
$I->executeJS($JS);
$I->waitForJS("return jQuery.active == 0;", 10);
$result = $I->executeJS("return FCFS.AJAXreturnedData;");

var_dump($result);
