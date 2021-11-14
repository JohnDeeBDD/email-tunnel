<?php

namespace FCFS;

class ClickList
{

	public function returnFrontendHTMLforOL(){

	}
	public function returnArrayOfUserNames($postID){
		$userNames = array();
		$IDs = $this->returnArrayOfUserIDs($postID);
		if (count($IDs) == 0) {
			return [];
		}
		foreach ($IDs as $id) {
			$id = intval($id);
			if (is_numeric($id) && (!($id == 0))) {
				$user_info = \get_userdata($id);
					//var_dump($id);die("ClickList 23");
				array_push($userNames, $user_info->user_login);
			}
		}
		return $userNames;
	}

	public function returnArrayOfUserIDs($postID)
	{
		//find metadata that looks like "fcfs-xxx" where xxx is a username
		$data = get_post_meta($postID);
		$userIDs = array();
		foreach ($data as $key => $val) {
			//Looking for a "dash in the 5th position. i.e. "fcfs-123" where 123 is the userID
			$dash = strpos($key, "-");
			if ($dash) {
				//add each user id to the array
				$substring = substr($key, $dash + 1);
				if (is_numeric($substring) && (!($substring == 0))) {
					array_push($userIDs, $substring);
				}
			}
		}
		return $userIDs;
	}

	public function doSetSettings($args)
	{
		//Data should be authed and validated by this point:
		update_post_meta($args['post-id'], 'fcfs', $args['status']);
		update_post_meta($args['post-id'], 'fcfs-max-users', $args['max-users']);
	}

	public function doClickClickList($userID, $postID)
	{
	}

	public function registerRoute_settings()
	{
		//die("registerRoute_settings");
		//This route enables a user to control the settings of a particular FCFS post
		register_rest_route(
			"fcfs/v1",
			"settings",
			array(
				'methods' => ['POST', 'GET'],
				'callback' => function () {
					$this->doSetSettings($_REQUEST);
					return new \WP_REST_Response(
						[
							'status' => 200,
							'response' => "OK",
							'body_response' => "FCFS status updated"
						]
					);
				},
				'permission_callback' => function () {
					return (current_user_can('edit_post', $_REQUEST['post-id']));
				},
				'validate_callback' => function () {
					if (isset($_REQUEST['post-id']) && (is_numeric($_REQUEST['post-id']))) {
						return TRUE;
					} else {
						return FALSE;
					}
				}
			)
		);
	}

	public function registerRoute_return_array_of_users_who_have_clicked()
	{
		register_rest_route(
			"fcfs",
			"return-array-of-users-who-have-clicked",
			array(
				'methods' => ['GET'],
				'callback' => function () {
					return;
				},
				'permission_callback' => function () {
					//This is an open API
					return TRUE;
				},
				'validate_callback' => function () {
					if (isset($_REQUEST['post-id']) && (is_numeric($_REQUEST['post-id']))) {
						return TRUE;
					} else {
						return FALSE;
					}
				}
			)
		);
	}

	public function validateNonce($nonce)
	{
		if (!wp_verify_nonce($nonce, "fcfs-click")) {
			die("SOMETHING IS WRONG.");
		}
	}

	public function listenForClickSubmission()
	{
		//die("listenForClickSubmission");
		if (isset($_POST['fcfs-nonce'])) {
			$this->validateNonce($_POST['fcfs-nonce']);
			global $post;
			$postID = $post->ID;
			$Action = new Action_Click();
			$Action->doClick($postID);
		}
	}

	public function registerRoute_do_click_clicklist()
	{
		//This route allows a user to "click" the list
		register_rest_route(
			"fcfs",
			"do-click-clicklist",
			array(
				'methods' => ['POST', 'GET'],
				'callback' => function () {
					return;
				},
				'permission_callback' => function () {
					$capability = $this->capability;
					if (!(current_user_can($capability))) {
						return FALSE;
					}
					return TRUE;
				},
				'validate_callback' => function () {
					if (isset($_REQUEST['post-id']) && (is_numeric($_REQUEST['post-id']))) {
						return TRUE;
					} else {
						return FALSE;
					}
				}
			)
		);
	}

	public function doRegisterRoutes()
	{
		//die("registerRoute_settings - 152");
		$this->registerRoute_settings();
		//$this->listenForClickSubmission();
		//$this->registerRoute_return_array_of_users_who_have_clicked();
		//$this->registerRoute_do_click_clicklist();
	}
}
