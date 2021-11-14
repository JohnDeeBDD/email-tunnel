<?php

namespace FCFS;

class Action_Click{

	public function doClick(){
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

	public function listenForClick(){
		if (isset($_POST['fcfs-do-click-nonce'])){
			if(!(\wp_verify_nonce($_POST['fcfs-do-click-nonce'], "fcfs-click"))){
				die("SOMETHING IS VERY WRONG. This shouldn't be happening.");
			}
			$this->doClick();
		}
	}

}
