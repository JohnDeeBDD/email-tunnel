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


//doClick



//This is a made up postID, it should NOT exist:
$postID = 123231123;
$JS="FCFS.getPostSettings($postID)";
$I->executeJS($JS);
$I->waitForJS("return jQuery.active == 0;", 10);
$result = $I->executeJS("return FCFS.AJAXreturnedData;");

$result = $result['body_response'];


$txt = var_export($result, true);

$I->assertEquals($txt, "FCFS Error, post does not exist");