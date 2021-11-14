<?php

namespace FCFS;

use Codeception\Module\Cli;
use PHPUnit\Framework\TestCase;

class Action_ClickTest extends TestCase{

	public function testDoClick(){
		//Given there is a post:
		$data = ['post_title'    => "test"];
		$postID = wp_insert_post( $data );

		//And the post is open:
		$ClickList = new ClickList();
		$args = [
			'post-id'	=> 	$postID,
			'status'	=> 	'open',
			'max-users'	=>	5
		];
		$ClickList->doSetSettings($args);

		$Action = new Action_Click();
		$Action->doClick();
	}
}
