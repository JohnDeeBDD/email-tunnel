jQuery(document).ready(function (){
	console.log("loaded wp-fcfs.js");
	//const data = {'post-id':1555, 'status':'open', 'max-users':888, '_wpnonce': wpApiSettings.nonce};
	
	console.log("postID = " + FCFS.postID);
	FCFS.AJAXgetClickList(FCFS.postID);
	
});

var FCFS = {};

FCFS.postID = jQuery('#fcfs-post-id').val();

FCFS.API_Setting_URL = "/wp-json/fcfs/v1/settings/";

FCFS.AJAXgetClickList = function(){}
FCFS.AJAXgetPostEditorSettings = function(){}
FCFS.AJAXsetPostEditorSettings = function(){}

FCFS.doAJAX = function (URL, data){
	console.log("doing ajax");
	jQuery.ajax({
		url: URL,
		data: data,
		method: 'POST',
		success: function (data) {
			console.log( "AJAXING" + URL);
			FCFS.AJAXreturnedData = data;
		},
		error: function (errorThrown) {
			console.log( errorThrown );
			FCFS.AJAXreturnedData = errorThrown;
		}
	});
}

FCFS.getPostSettings = function(postID){
		jQuery.ajax({
		url: "/wp-json/fcfs/v1/settings/?post-id=" + postID,
		method: 'GET',
		success: function (data) {
			console.log(data);
			FCFS.AJAXreturnedData = data;
			//return "zzz";
		},
		error: function (errorThrown) {
			console.log( errorThrown );
			FCFS.AJAXreturnedData = errorThrown;
		}
	}); 
}