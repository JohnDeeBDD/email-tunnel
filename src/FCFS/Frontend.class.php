<?php

namespace FCFS;

class Frontend{
	//This function is called if the user is looking at a singular post with a server callback to an FCFS post
	//As opposed to when one of these posts is viewed in a "blogroll". In a blogroll, this plugin doesn't do anything
	public function doIfSingular($atts){
		if (isset($atts['status'])) {
			$Clicklist = new ClickList();
			$Clicklist->doSetSettings($atts);
		}
		wp_enqueue_script(
			'wp-fcfs',
			plugins_url('wp-fcfs.js', __FILE__),
			['wp-api', 'jquery']
		);
	}

	public function returnListHTML($postID){
		$List = new ClickList();
		$names = $List->returnArrayOfUserNames($postID);
		$output = "";
		if($names == []){
			$output = $output . "No users yet";
			return;
		}
		$output = $output . "<ol id = 'fcfs-clicklist-ol-postid-$postID' class = 'fcfs-clicklist-ol'>The List:";
		foreach($names as $name){
			$output = $output . "<li>" . $name . "</li>";
		}
		$output = $output . "</ol>";
		return $output;
	}

	public function returnCallToActionButtonHTML($postID){
		$ClickToGetOnTheList = __("Click to get on the list", "fcfs");
		$nonce = wp_create_nonce( "fcfs-do-click-nonce");
		$output = "
<div id = 'fcfs-clicker-button-div-$postID' class = 'fcfs-clicker-button-div'>
	<form method = 'post'>
		<input type = 'hidden' id = 'fcfs-post-id' value = '$postID' />
		<input type = 'submit' id = 'fcfs-clicker-button-$postID' class = 'fcfs-clicker-button' value = '$ClickToGetOnTheList'/>
		<input type = 'hidden' id = 'fcfs-do-click-nonce' name = 'fcfs-do-click-nonce' value = '$nonce' />
	</form>
</div><!-- end: fcfs-clicker-button-div-$postID -->
";
		if(current_user_can('edit_post', $postID)){
			$output = $output . ($this->returnAdminAreaHTML());
		}
		return $output;
	}

	public function returnAdminAreaHTML(){
		$output = <<<OUTPUT
<div id = 'fcfs-admin-settings-div'>
	<h2>Admin Area</h2>
</div><!-- end #fcfs-admin-settings-div -->
OUTPUT;
	return $output;
	}

    public function returnUI($atts = ""){
		global $post;
		$postID = $post->ID;
		$Action = new Action_Click();
		$Action->listenForClick();
		if (\is_singular()) {
			//Here we emit JS and allow for the "click" action
			$atts['post-id'] = $postID;
			$this->doIfSingular($atts);
		}
		$output = $this->returnListHTML($postID);
		$output = $output . $this->returnCallToActionButtonHTML($postID);
        return $output;
    }
}
