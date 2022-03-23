<?php
namespace Helper;

global $testSiteURLs;
$testSiteURLs =
    [
        'http://13.59.67.233',
        'http://3.16.168.124'
    ];

class Acceptance extends \Codeception\Module{
    public function reconfigureThisVariable($array){
        $this->getModule('WPWebDriver')->_reconfigure($array);
        $this->getModule('WPWebDriver')->_restart();
    }

    public function _afterSuite(){
        //Cleanup:
        //shell_exec("wp post delete $(wp post list --format=ids) --force");
    }

    public function _beforeSuite($settings = []){
    }

    public function pauseInTerminal(){
        echo "Press ENTER to continue: ";
        $handle = fopen ("php://stdin","r");
        $line = fgets($handle);
        fclose($handle);
        echo "\n";
    }
}
