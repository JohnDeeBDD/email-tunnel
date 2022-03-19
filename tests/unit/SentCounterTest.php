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
        $count = \EmailTunnel\SentCounter::get("https://somesite.com", "exit");
        
        //Then the correct count should be returned
        $this->assertEquals(123, $count);

        $count = \EmailTunnel\SentCounter::get("https://some-other-site.com", "entrance");

        //Then the correct count should be returned
        $this->assertEquals(456, $count);

        $count = \EmailTunnel\SentCounter::get("https://some-other-site.com", "exit");

        //Then the correct count should be returned
        $this->assertEquals(0, $count);
    }
    
    /**
     * @test
     * edge case: the count is zero and just starting
     * getTest()
     */
    public function getEdgeCaseNoCountTest(){
        //Given there is no count yet
        
        //When get() is called
        $count = \EmailTunnel\SentCounter::get("https://somesite.com", "exit");
        
        //Then the correct count should be returned
        $this->assertEquals(0, $count);
    }

    /**
     * @test
     * incrementTest()
     */
    public function incrementTest(){
        $count = \EmailTunnel\SentCounter::get("https://somesite.com", "exit");
        $this->assertEquals(0, $count);

        \EmailTunnel\SentCounter::increment("https://somesite.com", "exit");

        $count = \EmailTunnel\SentCounter::get("https://somesite.com", "exit");
        $this->assertEquals(1, $count);
        /*
        \EmailTunnel\SentCounter::increment("https://somesite.com", "exit");
        $count = \EmailTunnel\SentCounter::get("https://somesite.com", "exit");
        $this->assertEquals(2, $count);
    */
        }
    
    private function createMockData(){
    $data = 
        [
            ["uRL" => "https://somesite.com", "count" => 123, "type" => "exit"],
            ["uRL" => "https://some-other-site.com", "count" => 456, "type" => "entrance"],
        ];    
        update_option("email-tunnel-counts", $data);
    }
    
}