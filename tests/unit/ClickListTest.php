<?php

use Codeception\TestCase\WPTestCase;
use FCFS\Action_MakeFCFS;
use FCFS\Action_Click;
use FCFS\ClickList;

class ClickListTest extends WPTestCase {

	/**
	 * @test
	 * ClickList->doGetSettings() test
	 */
	public function doGetSettingsTest(){
		//Given there is a post with no meta data.
		$data   = [
			'post_title'   => "Test Title",
			'post_content' => "lorum ipsum"
		];
		$postID = wp_insert_post( $data );
		$ClickList = new ClickList();
		//When doGetSettings($postID) is called
		$settings = $ClickList->doGetSettings($postID);
		 //Then this function should return information even though there is no data
		$this->assertEquals("closed", $settings['status']);
		$this->assertEquals("-1", $settings['max-users']);
		$this->assertEquals("The List", $settings['list-text']);
		$this->assertEquals("Click to get on the list", $settings['button-text']);
		$this->assertEquals("CLOSED", $settings['closed-text']);



		//Given the post has a previous setting of "open"
		update_post_meta($postID, 'fcfs', "open");
		//When doGetSettings($postID) is called
		$settings = $ClickList->doGetSettings($postID);
		//Then "open" should be returned
		$this->assertEquals("open", $settings['status']);

		//Given the post has a previous setting of "closed"
		update_post_meta($postID, 'fcfs', "closed");
		//When doGetSettings($postID) is called
		$settings = $ClickList->doGetSettings($postID);
		//Then "closed" should be returned
		$this->assertEquals("closed", $settings['status']);


	}
	/**
	 * @test
	 * ClickList->doSetSettings() test
	 */
	public function doSetSettingsTest(){
		$data   = [
			'post_title'   => "Test Title",
			'post_content' => "lorum ipsum"
		];
		$postID = wp_insert_post( $data );
		$status = "open";
		$maxUsers = 5;

		$args = [
			'post-id' => $postID,
			'status'	=> $status,
			'max-users'	=> $maxUsers,
		];
		$ClickList = new ClickList();
		$ClickList->doSetSettings($args);

		$DBstatus = get_post_meta( $postID, 'fcfs', true);
		$DBmaxUsers = get_post_meta( $postID, 'fcfs-max-users', true);

		$this->assertEquals($status, $DBstatus);
		$this->assertEquals($maxUsers, $DBmaxUsers);
	}

	/**
	 * @test
	 * classes should be instantiable
	 */
	public function classesShouldBeInstantiable() {
		$UserClickList = new ClickList();
		$Action_MakeFCFS = new Action_MakeFCFS();
		$Action_VisitFCFS_Page = new Action_Click();
	}

	/**
	 * @test
	 * UserClickList->returnArrayOfUserIDs() test
	 */
	public function func_returnArrayOfUserIDsTest() {
		//Given there is a mock post and a bunch of previous clicks
		$postID  = $this->createMockPost();
		$userIDs = $this->createMockClickListInDB( $postID );

		//When the method returnArrayOfUserIDs is called
		$ClickList = new ClickList();
		$result = $ClickList->returnArrayOfUserIDs( $postID );

		//Then it should return the list of IDs
 		$this->assertEquals( $userIDs, $result );
	}

	/**
	 * @test
	 * returnArrayOfUserNames()
	 */
	public function func_returnArrayOfUserNamesTest() {
		//Given there is a mock post and a bunch of previous clicks
		$postID  = $this->createMockPost();
		$userIDs = $this->createMockClickListInDB( $postID );

		//When the method returnArrayOfUserNames is called
		$ClickList = new ClickList();

		//Then it should return the list of IDs
		$expected = [ "Jim", "Tom", "Sam", "Jill", "Dave" ];
		$given    = $ClickList->returnArrayOfUserNames( $postID );

		$this->assertEquals( $expected, $given );
	}

	/**
	 * @test
	 * edge case: no users
	 */
	public function edgeCase_NoUsersTest() {
		//Given there is a mock post with no clicks
		$postID  = $this->createMockPost();
		$Action = new Action_MakeFCFS();
		$Action->postID = $postID;
		$Action->doMakeFCFS();

		//When the method returnArrayOfUserNames is called
		$ClickList = new ClickList();

		$expected = [];
		$given    = $ClickList->returnArrayOfUserNames( $postID );
		$this->assertEquals( $expected, $given );
	}


	private function createMockPost() {
		//This function mocks a FCFS post. However, there are no clicks yet.
		$data   = [
			'post_title'   => "Test Title",
			'post_content' => "lorum ipsum"
		];
		$postID = wp_insert_post( $data );
		$Action = new Action_MakeFCFS;
		$Action->doMakeFCFS( $postID );

		return ( $postID );
	}

	private function createMockClickListInDB( $postID ) {
		$Action = new Action_Click();
		//Given there are 5 users in the site:
		$userID1 = $this->factory->user->create( array(
			'user_email' => 'email1@email1.com',
			'user_login' => 'Jim',
			'role'       => 'administrator'
		) );
		//Who have each clicked the FCFS page:
		$time = 100;
		$Action->doAction( $userID1, $postID, $time );

		$userID2 = $this->factory->user->create( array(
			'user_email' => 'email2@email1.com',
			'user_login' => 'Tom',
			'role'       => 'administrator'
		) );
		$time    = 222;
		$Action->doAction( $userID2, $postID, $time );

		$userID3 = $this->factory->user->create( array(
			'user_email' => 'email3@email1.com',
			'user_login' => 'Sam',
			'role'       => 'administrator'
		) );
		$time    = 333;
		$Action->doAction( $userID3, $postID, $time );

		$userID4 = $this->factory->user->create( array(
			'user_email' => 'email4@email1.com',
			'user_login' => 'Jill',
			'role'       => 'administrator'
		) );
		$time    = 444;
		$Action->doAction( $userID4, $postID, $time );

		$userID5 = $this->factory->user->create( array(
			'user_email' => 'email5@email1.com',
			'user_login' => 'Dave',
			'role'       => 'administrator'
		) );
		$time    = 555;
		$Action->doAction( $userID5, $postID, $time );

		update_post_meta( $postID, "max-users", 10 );
		$userIDs = [ $userID1, $userID2, $userID3, $userID4, $userID5 ];

		return $userIDs;
	}
}
