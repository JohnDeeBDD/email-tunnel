<?php

require_once('/var/www/html/wp-content/plugins/email-tunnel/src/EmailTunnel/autoloader.php');
class SentCounterTest extends \Codeception\TestCase\WPTestCase
{

    /**
     * @test
     * getTest()
     * it should return the current count
     */
    public function getTest(){
        //Given there is an existent count
        $this->createMockData();
        
        //When get() is called
        $count = \EmailTunnel\SentCounter::get("https://somesite.com");
        
        //Then the correct count should be returned
        $this->assertEquals(123, $count);
    }
    
    /**
     * @test
     * edge case: the count is zero and just starting
     * getTest()
     */
    public function getEdgeCaseNoCountTest(){
        //Given there is no count yet
        
        //When get() is called
        $count = \EmailTunnel\SentCounter::get("https://somesite.com");
        
        //Then the correct count should be returned
        $this->assertEquals(0, $count);
    }
    
    
    private function createMockData(){
    $data = 
        [
            ["uRL" => "https://somesite.com", "count" => 123],
            ["uRL" => "https://some-other-site.com", "count" => 456],
        ];    
        update_option("email-tunnel-counts", $data);
    }
    
}