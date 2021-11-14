/*global jQuery/*
/*global FCFS*/
jQuery(document).ready(function () {
    console.log("FCFS settings-page.js");
});

FCFS.doAJAX_FetchAdminScreenData = function (postID) {
    var URL = "/wp-json/fcfs/v1/settings-page/";
    jQuery.ajax({
        url: URL,
        data: {
            '_wpnonce': wpApiSettings.nonce,
        },
        method: "POST",
        success: function (data) {
            FCFS.populateTable(data);
        },
        error: function (errorThrown) {
            console.log(errorThrown);
        }
    });
}

FCFS.doUpdateData = function (data){}





/*

$data = {
postID, postTitle, status, clicks, clicksMax, published, expires
}



basic usage:
We need to display a table that displays "FCFS posts" [first come, first served] in a table form. Since this form appears inside the WordPress admin area,
it should be styled "the WordPress way". The basic look should resemble the posts edit.php page found on any WordPress site at "/wp-admin/edit.php".

This contest is ONLY for the design of the table. You do not have to program it. However, you must describe the functionality in your design. You can do this
any way you want [submit a drawing, written description, actual code etc.]

information that needs to be displayed in columns
Title   Clicks                  Date
        displayed as (x/y)      Displayed in two lines: Published:  {datetime}
                                                        Expires:    {datetime}


limit number of users - include check box to enable feature, include text box to input number, include SOME KIND OF MECHANISM to submit
click list goes live on - include check box to enable feature, include date picker, include SOME KIND OF MECHANISM to submit
click list expires on - include check box to enable feature, include date picker, include SOME KIND OF MECHANISM to submit
do action("action") - include text box to input "action name". Include text: these parameters will be sent to the action as an array [fcfs-post-id, user-id, click-postition]
components:
 */
