<?php

namespace FCFS;

class Action_Click{

	public function doClick(){
		//die("I'm doing the click!");
		global $post;
		$postID = $post->ID;
		$meta = get_post_meta($postID, "fcfs", true);
		if ($meta == "open") {
			$userID = get_current_user_id();
			$key = "fcfs-" . $userID;
			$meta = get_post_meta($postID, $key);
			if ($meta == []) {
				$time = time();
				$this->doAction( $userID, $postID, $time );
				return true;
			}
		}
		return true;
	}

	public function doAction( $userID, $postID, $time ){
		$key = "fcfs-" . $userID;
		add_post_meta( $postID, $key, $time);
	}

	/* this action has moved to class Clicklist
	public function listenForClick(){
		if (isset($_POST['fcfs-do-click-nonce'])){
			if(!(\wp_verify_nonce($_POST['fcfs-do-click-nonce'], "fcfs-do-click-nonce"))){
				die("SOMETHING IS VERY WRONG. This shouldn't be happening. Action_Click line 32");
			}
			$this->doClick();
		}
	}
	*/

}
