<?php
use \Codeception\Util\Locator;
$I = new AcceptanceTester($scenario);
$I->wantTo('click the list');

$I->loginAsAdmin();

$I->amOnPage('/test-post-one/');
$I->see("Content of test post 1.");

$I->dontSeeElement(Locator::contains('#fcfs-clicklist-ol-li-1', 'Codeception'));
$I->click(".fcfs-clicker-button");
$I->seeElement(Locator::contains('#fcfs-clicklist-ol-li-1', 'Codeception'));

$I->loginAs("Subscriberman", "password");
$I->amOnPage('/test-post-one/');
$I->dontSeeElement(Locator::contains('#fcfs-clicklist-ol-li-2', 'Subscriberman'));
$I->click(".fcfs-clicker-button");
$I->seeElement(Locator::contains('#fcfs-clicklist-ol-li-2', 'Subscriberman'));
