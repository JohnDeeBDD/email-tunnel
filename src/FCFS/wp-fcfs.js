jQuery(document).ready(function (){
	console.log("wp-fcfs.js loaded!");
	const data = {'post-id':1555, 'status':'open', 'max-users':888, '_wpnonce': wpApiSettings.nonce};
	FCFS.doAJAX(FCFS.API_Setting_URL, data);
	console.log(FCFS.postID);
});

var FCFS = {};

FCFS.postID = jQuery('#fcfs-post-id').val();
FCFS.API_Setting_URL = "/wp-json/fcfs/v1/settings/";

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
