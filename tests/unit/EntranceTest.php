<?php

require_once('/var/www/html/wp-content/plugins/email-tunnel/src/EmailTunnel/autoloader.php');
class EntranceTest extends \Codeception\TestCase\WPTestCase{

	/**
	 * @test
	 * it should set the creds
	 */
	public function isShouldSetTheCreds(){
                $Entrance = new \EmailTunnel\TunnelEntrance();
                $url = "https://somesite.com";
                $code = "123456";
                $Entrance->setEntranceCredentials($url, $code);
                $option = get_option('email_tunnel_entrance_creds');
                $expectedReturn = 
                        [
                                ['url' => 'https://somesite.com', 'code' => '123456', 'status' => 'not connected' ] 
                        ];                
                $this->assertEquals($expectedReturn, $option);

                $url = "https://some-other-site.com";
                $code = "0987654";
                $Entrance->setEntranceCredentials($url, $code);                
                $option = get_option('email_tunnel_entrance_creds');
                $expectedReturn =
                        [ 
                                ['url' => 'https://somesite.com', 'code' => '123456', 'status' => 'not connected' ],
                                ['url' => 'https://some-other-site.com', 'code' => '0987654', 'status' => 'not connected' ] 
                        ];
                $this->assertEquals($expectedReturn, $option);
	}
	
	/**
	 * @test
	 * it should select a certain entrance
	 */
        public function itShouldSelectACertainEntrance(){
	        $Entrance = new \EmailTunnel\TunnelEntrance();
                $url = "https://somesite.com";
                $code = "123456";
                $Entrance->setEntranceCredentials($url, $code);
                $url = "https://some-other-site.com";
                $code = "0987654";
                $Entrance->setEntranceCredentials($url, $code);  
               
                $Entrance->setSelectedEntrance($url);
                
                $option = get_option('email_tunnel_entrance_creds');
                $expectedReturn =
                        [ 
                                ['url' => 'https://somesite.com', 'code' => '123456', 'status' => 'not connected' ],
                                ['url' => 'https://some-other-site.com', 'code' => '0987654', 'status' => 'connected' ] 
                        ];
                $this->assertEquals($expectedReturn, $option);
               
	 }
	 
	 /**
	  * @test
	  * it should return the connected site url
	  */
	 public function itShouldReturnTheConnectedSiteUrl(){
	        $Entrance = new \EmailTunnel\TunnelEntrance();
                $url = "https://somesite.com";
                $code = "123456";
                $Entrance->setEntranceCredentials($url, $code);
                $url = "https://some-other-site.com";
                $code = "0987654";
                $Entrance->setEntranceCredentials($url, $code);  
               
                $Entrance->setSelectedEntrance($url);
	        
	        $entranceUrl = $Entrance->getSelectedEntrance();
	        $this->assertEquals($url, $entranceUrl);
	  }
	  
	 /**
	  * @test
	  * it should return false if there is no connected site
	  */
	 public function itShouldReturnFalseIfThereIsNoConnectedSite(){
	        $Entrance = new \EmailTunnel\TunnelEntrance();
                $url = "https://somesite.com";
                $code = "123456";
                $Entrance->setEntranceCredentials($url, $code);
                $url = "https://some-other-site.com";
                $code = "0987654";
                $Entrance->setEntranceCredentials($url, $code);  
           	        
	        $entranceUrl = $Entrance->getSelectedEntrance();
	        $this->assertEquals(FALSE, $entranceUrl);
	  }
	  
        /**
         * @test
         * getEntranceCredsFrontEndUITableData test
         */
        public function getFilteredEntranceCredsForFrontEndUITableDataTest(){
                //filter the data for viewing. The "code" shouldn't emit.
                $data = $this->getMockDummyEntranceData();
                update_option('email_tunnel_entrance_creds', $data);
                
                //should be the same minus the "code" part
                $expectedReturn = 
                      [ 
                        ['url' => 'https://somesite.com', 'status' => 'not connected', 'created' => '04/05/2022', 'emails' => 666, 'revoke' => 'https://somesite.com' ],
                        ['url' => 'https://some-other-site.com', 'status' => 'connected', 'created' => '04/05/2022', 'emails' => 666, 'revoke' => 'https://some-other-site.com' ],
                        ['url' => 'https://some-third-site.com', 'status' => 'not connected', 'created' => '04/05/2022', 'emails' => 666, 'revoke' => 'https://some-third-site.com' ],
                      ];
                      
                $Entrance = new \EmailTunnel\TunnelEntrance();
                $actual = $Entrance->getFilteredEntranceCredsForFrontEndUITableData();
                
                $this->assertEquals($expectedReturn, $actual);
                
        }

    /**
     * @test
     * removeEntranceCred() test
     */
        public function removeEntranceCredTest(){
            //Given there are some entrances in the database:
            $data = $this->getMockDummyEntranceData();
            update_option('email_tunnel_entrance_creds', $data);

            //When a particular site is removed:
            $Entrance = new \EmailTunnel\TunnelEntrance();
            $siteToRemove = "https://some-other-site.com";
            $functionResult = $Entrance->removeEntranceCred($siteToRemove);

            //Then the site should no longer be in the result
            $expectedResult =
                [
                    ['url' => 'https://some-third-site.com', 'code' => '333', 'status' => 'not connected' ],
                    ['url' => 'https://somesite.com', 'code' => '111', 'status' => 'not connected' ],

                ];
            $this->assertEqualsCanonicalizing($expectedResult, $functionResult);

            //And the entry for the site should no longer be in the database:
            $optionFromDB = get_option('email_tunnel_entrance_creds');
            $this->assertEqualsCanonicalizing($expectedResult, $optionFromDB);
        }
        
        private function getMockDummyEntranceData(){
                $mockData =
                        [
                            ['url' => 'https://somesite.com', 'code' => '111', 'status' => 'not connected' ],
                            ['url' => 'https://some-other-site.com', 'code' => '222', 'status' => 'connected' ],
                            ['url' => 'https://some-third-site.com', 'code' => '333', 'status' => 'not connected' ],
                        ];
                return $mockData;
        }
}