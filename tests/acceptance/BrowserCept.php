<?php
$I = new AcceptanceTester($scenario);
$I->wantTo('See that the browser can launch');


$I->loginAsAdmin();
$I->see("Howdy, Codeception");
//$I->pauseInTerminal();
//pause();
$I->amOnUrl("https://google.com");


