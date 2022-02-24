<?php

class EntranceCest
{
    public function _before(\AcceptanceTester $I)
    {
    }

    public function _after(\AcceptanceTester $I)
    {
    }

    
    public function clickTheThreeOptionsAndRetainState(\AcceptanceTester $I){
        
        $dummyData =  
                        [ 
                                ['url' => 'https://somesite.com', 'code' => '1212345612', 'status' => 'not connected' ],
                                ['url' => 'https://some-other-site.com', 'code' => '11098765411', 'status' => 'not connected' ],
                                ['url' => 'https://some-other2-site.com', 'code' => '22098765422', 'status' => 'not connected' ],
                                ['url' => 'https://some-other3-site.com', 'code' => '33098765433', 'status' => 'not connected' ] 
                        ];
         
        //$json = json_encode($dummyData);               
        //echo($json);die();
        shell_exec('wp option update aaa --format=json < /var/www/html/wp-content/plugins/email-tunnel/tests/acceptance/mockEntranceData.json');
        $I->loginAsAdmin();
        $I->amOnPage("/wp-admin/options-general.php?page=email-tunnel");
        $I->see("Email Tunnel");
    }
    
    
}