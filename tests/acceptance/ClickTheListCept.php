<?php
use \Codeception\Util\Locator;
$I = new AcceptanceTester($scenario);
$I->wantTo('click the list');

$I->loginAsAdmin();

//Going to this link launches the Gutenberg editor:
$I->amOnPage('/wp-admin/post-new.php');

//Create post title:
$I->fillField('#post-title-0', 'Test Post One');

//Add FCFS Clicklist:
$I->click("(.//*[normalize-space(text()) and normalize-space(.)='Publish'])[1]/following::*[name()='svg'][3]");
$I->click("#block-editor-inserter__search-0");
$I->pressKey("#block-editor-inserter__search-0", "F");
$I->pressKey("#block-editor-inserter__search-0", "C");
$I->click("FCFS Block");

//Publish:
$I->click("//div[@id='editor']/div/div/div/div/div[2]/button[2]");
$I->click("//div[@id='editor']/div/div/div[2]/div[4]/div[2]/div/div/div/div/button");
//publishing takes a sec!
sleep(1);

$I->amOnPage("/test-post-one");
$I->see("Editor Area");

$I->dontSeeElement(Locator::contains('#fcfs-clicklist-ol-li-1', 'Codeception'));
$I->click(".fcfs-clicker-button");
$I->seeElement(Locator::contains('#fcfs-clicklist-ol-li-1', 'Codeception'));

$I->loginAs("Subscriberman", "password");
$I->amOnPage('/test-post-one/');
$I->dontSeeElement(Locator::contains('#fcfs-clicklist-ol-li-2', 'Subscriberman'));
$I->click(".fcfs-clicker-button");
$I->seeElement(Locator::contains('#fcfs-clicklist-ol-li-2', 'Subscriberman'));


//Cleanup:
$I->amGoingTo("delete the post via the command line");
shell_exec("wp post delete $(wp post list --format=ids) --force");
$I->amOnPage("/test-post-one");
$I->see("Nothing here");