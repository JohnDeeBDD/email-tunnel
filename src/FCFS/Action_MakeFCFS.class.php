<?php

namespace FCFS;

class Action_MakeFCFS{

	public $postID;

    public function doMakeFCFS($postID = null){
    	if(!(isset($this->postID))){
	        $this->postID = $postID;
	    }
        \update_post_meta( ($this->postID), "fcfs", "open" );
	    return TRUE;
    }

}