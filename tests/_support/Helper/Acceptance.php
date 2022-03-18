<?php
namespace Helper;

global $testSiteURLs;
$testSiteURLs =
    [
        'http://3.19.31.232',
        'http://18.117.155.89'
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
