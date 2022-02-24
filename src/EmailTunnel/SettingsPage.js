/*global jQuery*/
/*global wpApiSettings*/
/*global EmailTunnelStatusData*/
/*global EmailTunnelEntranceData*/
/*global EmailTunnelExitData*/
jQuery( document ).ready(function() {
    // EmailTunnelStatusData.status will be emmited from the server
    switch (EmailTunnelStatusData.status) {
        case 'Not Connected':
            EmailTunnel.doRenderVisualAppearenceOfMainDivs("closed");
            jQuery("input[name=email-tunnel-status-radio][value=closed]").prop('checked', true);
        break;
        
        case 'entrance':
            EmailTunnel.doRenderVisualAppearenceOfMainDivs("entrance");
            EmailTunnel.ajaxAndRenderEntranceDataDiv();
            jQuery("input[name=email-tunnel-status-radio][value=entrance]").prop('checked', true);
        break;
        
        case 'exit':
            EmailTunnel.doRenderVisualAppearenceOfMainDivs("exit");
            jQuery("input[name=email-tunnel-status-radio][value=exit]").prop('checked', true);
        break;
            
        default:
        console.log('AN ERROR HAS OCCURED! EmailTunnel.enableStatusRadio');
        console.log(EmailTunnelStatusData.status);
    }
    EmailTunnel.setupMainDivClickListeners();
    jQuery("#email-tunnel-connect-entrance-item-submit-button").click(function(){
        EmailTunnel.doUserHasClickedEntranceConnectButton();    
    });
});

const EmailTunnel = {};

EmailTunnel.doUserHasClickedEntranceConnectButton = function(){
    EmailTunnel.doRenderConnectButtonIntoWorkingState();
    EmailTunnel.doAjaxEntranceConnectionButtonPressed();
}

//This function changes the Connect button to a visual "in process" state
//this indicates to the user that something is happening in the background
EmailTunnel.doRenderConnectButtonIntoWorkingState = function(){
    jQuery("#email-tunnel-connect-entrance-item-submit-button").hide();
    jQuery("#email-tunnel-entrance-button-spinner").show();
}

EmailTunnel.doRenderConnectButtonBackToReadyState = function(){
    jQuery("#email-tunnel-connect-entrance-item-submit-button").show();
    jQuery("#email-tunnel-entrance-button-spinner").hide();
}

EmailTunnel.doAjaxEntranceConnectionButtonPressed = function(){
    EmailTunnelStatusData._wpnonce = wpApiSettings.nonce;
    EmailTunnelStatusData.addExitUrl = jQuery("input[type=text][name=email-tunnel-exit-url-input]").val();
    EmailTunnelStatusData.addExitCode = jQuery("input[type=text][name=email-tunnel-exit-code]").val();
	jQuery.ajax({
		url: "/wp-json/email-tunnel/v1/add-new-exit/",
		data: EmailTunnelStatusData,
		method: 'POST',
		success: function (data) {
		    console.log("success doAjaxEntranceConnectionButtonPressed");
		    console.log(data);
            EmailTunnel.doRenderConnectButtonBackToReadyState();
            EmailTunnel.renderEntranceDivWithData(data);
		},
		error: function (errorThrown) {
		    console.log("ERROR doAjaxEntranceConnectionButtonPressed");
		    console.log(errorThrown);
			console.log( errorThrown.responseText);
			jQuery("#email-tunnel-entrance-connect-button-error").show();
		}
	});
}


EmailTunnel.setupMainDivClickListeners = function(){
    jQuery("#email-tunnel-status-radio-closed").click(function(){
        //console.log( "closed click!" );
        EmailTunnel.doRenderVisualAppearenceOfMainDivs("closed");
        EmailTunnelStatusData.status = "Not Connected";
        EmailTunnel.doSetTunnelStatusAJAX(EmailTunnelStatusData);
    });
    jQuery("#email-tunnel-status-radio-entrance").click(function(){
        //console.log( "entrance click!" );
        EmailTunnel.doRenderVisualAppearenceOfMainDivs("entrance");
        EmailTunnelStatusData.status = "entrance";
        EmailTunnel.doSetTunnelStatusAJAX(EmailTunnelStatusData);
        EmailTunnel.ajaxAndRenderEntranceDataDiv();
    });
    jQuery("#email-tunnel-status-radio-exit").click(function(){
        //console.log( "exit click!" );
        EmailTunnel.doRenderVisualAppearenceOfMainDivs("exit");
        EmailTunnelStatusData.status = "exit";
        EmailTunnel.doSetTunnelStatusAJAX(EmailTunnelStatusData);
    });
}

EmailTunnel.doRenderVisualAppearenceOfMainDivs = function(divToShow){
    switch (divToShow) {
        case 'closed':
            //console.log("doRenderVisualAppearenceOfMainDivs case 'closed'");
            jQuery("#entrance-area-div").css("display", "none");
            jQuery("#exit-area-div").css("display", "none");
        break;

        case 'exit':
            //console.log("doRenderVisualAppearenceOfMainDivs case 'exit'");
            jQuery("#entrance-area-div").hide();
            jQuery("#exit-area-div").fadeIn();
        break;
        
        case 'entrance':
            //console.log("doRenderVisualAppearenceOfMainDivs case 'entrance'");
            jQuery("#exit-area-div").hide();
            jQuery("#entrance-area-div").fadeIn();
            //EmailTunnel.ajaxAndRenderEntranceDataDiv();
        break;
    
        default:
        console.log('AN UNKNOWN ERROR HAS OCCURED. doRenderVisualAppearenceOfMainDivs()');
    }    
}

EmailTunnel.doSetTunnelStatusAJAX = function (EmailTunnelStatusData){
	//console.log("doSetTunnelStatusAJAX(EmailTunnelStatusData)");
	EmailTunnelStatusData._wpnonce = wpApiSettings.nonce;
	//console.log(EmailTunnelStatusData);
	jQuery.ajax({
		url: "/wp-json/email-tunnel/v1/set-site-status/",
		data: EmailTunnelStatusData,
		method: 'POST',
		success: function (data) {
			//console.log( "success: doSetTunnelStatusAJAX()");
			//console.log("server response:");
			//console.log(data);
		},
		error: function (errorThrown) {
		    console.log("Error: " + "EmailTunnel.doSetTunnelStatusAJAX()");
			console.log( errorThrown );
		}
	});

}


EmailTunnel.ajaxAndRenderEntranceDataDiv = function(){
    //console.log("ajaxAndRenderEntranceDataDiv()");
    //debugger;
	jQuery.ajax({
		url: "/wp-json/email-tunnel/v1/get-entrence-creds",
		data: {'_wpnonce': wpApiSettings.nonce},
		method: 'POST',
		success: function (data) {
			//console.log( "success: ajaxAndRenderEntranceDataDiv()");
			//console.log("server response:");
			//console.log(data);
			if (data.length === 0) { 
			    //console.log("Array is empty!");
			    EmailTunnel.renderEntranceDivWhenEmpty();
			 }else{
			    EmailTunnel.renderEntranceDivWithData(data);
			}
		},
		error: function (errorThrown) {
		    console.log("Error: " + "EmailTunnel.ajaxAndRenderEntranceDataDiv()");
			console.log( errorThrown );
		}
	});
    


}

EmailTunnel.renderEntranceDivWhenEmpty = function(){
    //console.log("renderEntranceDivWhenEmpty()");
    jQuery("#email-tunnel-entrance-data-div").html("You are not connected.");
}
EmailTunnel.renderEntranceDivWithData = function(data) {
    //console.log("renderEntranceDivWithData() data:");
    //console.log(data);
    //Convert the server response into an array so that craeteEntraceTable can use it:
    var tableArray = [];
    var itemToPush = [];
    data.forEach(function(item) {
        itemToPush = [item.url, item.status];
        tableArray.push(itemToPush);
    });
    //console.log(tableArray);
    //createTable([["row 1, cell 1", "row 1, cell 2"], ["row 2, cell 1", "row 2, cell 2"]]);
    //EmailTunnel.createEntranceTable(tableArray);
    var table = document.createElement('table');
    var tableBody = document.createElement('tbody');
    tableArray.forEach(function(rowData) {
        var row = document.createElement('tr');
        rowData.forEach(function(cellData) {
            var cell = document.createElement('td');
            cell.appendChild(document.createTextNode(cellData));
            row.appendChild(cell);
        });
        tableBody.appendChild(row);
    });
    table.appendChild(tableBody);
    document.getElementById("email-tunnel-entrance-data-div").innerHTML = "";
    document.getElementById("email-tunnel-entrance-data-div").appendChild(table);
}

/*
EmailTunnel.ajaxPostEntanceItemToServerWhenConnectButtonIsClicked = function(entranceItem){
    debugger;
    jQuery("#email-tunnel-connect-entrance-item-submit-button").click(function(){
           EmailTunnel.doAjaxPostEntanceItemToServerWhenConnectButtonIsClicked();
           EmailTunnel.doUIforAjaxPostEntanceItemToServerWhenConnectButtonIsClicked();
    });     
}
*/
