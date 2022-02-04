<?php
namespace Helper;

class Acceptance extends \Codeception\Module{
    public function reconfigureThisVariable($array){
        $this->getModule('WPWebDriver')->_reconfigure($array);
        $this->getModule('WPWebDriver')->_restart();
    }

    public function _afterSuite(){
        //Cleanup:
        shell_exec("wp post delete $(wp post list --format=ids) --force");
    }
}
