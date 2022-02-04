<?php
use \Codeception\Util\Locator;
$I = new AcceptanceTester($scenario);
$I->wantTo('fix: post isnt "opened" by default');

$I->loginAsAdmin();

//Going to this link launches the Gutenberg editor:
$I->amOnPage('/wp-admin/post-new.php');

//Create post title:
$I->fillField('.wp-block-post-title', 'Test Post One');

//Add FCFS Clicklist:
$I->click("(.//*[normalize-space(text()) and normalize-space(.)='Publish'])[1]/following::*[name()='svg'][3]");
$I->click("#components-search-control-0");
$I->pressKey("#components-search-control-0", "F");
$I->pressKey("#components-search-control-0", "C");
$I->click("FCFS Block");

//Publish:
$I->click(".editor-post-publish-button__button");
$I->click(".editor-post-publish-panel__header-publish-button");
//publishing takes a sec!
sleep(1);
$I->amOnPage("/test-post-one");
$I->see("Editor Area");

//The clicklist should be closed at this point:
$openClosedRadioValue = $I->executeJS("return (jQuery('input[name=fcfs-open-closed-radio]:checked', '#fcfs-editor-settings-form').val());");
$I->assertEquals("closed", $openClosedRadioValue);

sleep(1);
$I->wantTo('change the status from closed to open');

//click the open radio and submit:
$I->click("#fcfs-open-closed-radio-open");
$I->click("#fcfs-editor-setttings-submit");

$I->expect('the open value to be visably selected');
$openClosedRadioValue = $I->executeJS("return (jQuery('input[name=fcfs-open-closed-radio]:checked', '#fcfs-editor-settings-form').val());");
$I->assertEquals("open", $openClosedRadioValue);

$I->wantTo('fill in the other settings data and see is visably');
$I->fillField("#fcfs-max-users", "5");
$I->fillField("#fcfs-list-text-input", "this is some list text");
$I->fillField("#fcfs-button-text-input", "this is some button text");
$I->fillField("#fcfs-closed-text-input", "this is some closed text");
$I->click("#fcfs-editor-setttings-submit");

$maxUsers = $I->executeJS("return (jQuery('input[name=fcfs-max-users]', '#fcfs-editor-settings-form').val());");
$I->assertEquals("5", $maxUsers);


/*
$I->dontSeeElement(Locator::contains('#fcfs-clicklist-ol-li-1', 'Codeception'));
$I->click(".fcfs-clicker-button");
$I->seeElement(Locator::contains('#fcfs-clicklist-ol-li-1', 'Codeception'));


$I->loginAs("Subscriberman", "password");
$I->amOnPage('/test-post-one/');
$I->dontSeeElement(Locator::contains('#fcfs-clicklist-ol-li-2', 'Subscriberman'));
$I->click(".fcfs-clicker-button");
$I->seeElement(Locator::contains('#fcfs-clicklist-ol-li-2', 'Subscriberman'));
*/