/*global jQuery*/
/*global wpApiSettings*/
/*global EmailTunnelStatusData*/
/*global EmailTunnelEntranceData*/
/*global EmailTunnelExitData*/

jQuery( document ).ready(function() {
    console.log("email-tunnel settingsPage.js loaded.");
    console.log("EmailTunnelStatusData:");
    console.log(EmailTunnelStatusData);

    switch (EmailTunnelStatusData.status) {
        case 'Not Connected':
            EmailTunnel.renderMainSectionsVisualAppearance("closed");
            jQuery("input[name=email-tunnel-status-radio][value=closed]").prop('checked', true);
        break;
        
        case 'entrance':
            EmailTunnel.renderMainSectionsVisualAppearance("entrance");
            EmailTunnel.doAjaxAndRenderEntranceDataDiv();
            jQuery("input[name=email-tunnel-status-radio][value=entrance]").prop('checked', true);
        break;
        
        case 'exit':
            EmailTunnel.renderMainSectionsVisualAppearance("exit");
            jQuery("input[name=email-tunnel-status-radio][value=exit]").prop('checked', true);
        break;
            
        default:
        console.log('An error has occurred: EmailTunnelStatusData.status not set');
    }
    EmailTunnel.setupMainDivClickListeners();

    jQuery("#email-tunnel-connect-entrance-item-submit-button").click(function(){
        EmailTunnel.doClickEntranceConnectButton();
    });

});

//"EmailTunnel" is the namespace for our javascript stuff:
const EmailTunnel = {};

EmailTunnel.blankOutTable = function(){
    var table = document.getElementById("email-tunnel-connection-table");
    var rowCount = table.rows.length;
    var i = 1;
    while (i < (rowCount - 1)) {
        //console.log("The number is " + i);
        table.deleteRow(1);
        i++;
    }
}

EmailTunnel.clearVisualErrors = function(){
    console.log("clearVisualErrors()");
    jQuery("#email-tunnel-error-must-be-ssl").hide();
    jQuery("#email-tunnel-entrance-connect-button-error").hide();
    jQuery("#email-tunnel-exit-url-input").css("background-color", "#fff"); 
    jQuery("#email-tunnel-exit-code-input").css("background-color", "#fff"); 
    jQuery("#email-tunnel-exit-username-input").css("background-color", "#fff"); 
}

EmailTunnel.doAjaxAndRenderEntranceDataDiv = function(){
    console.log("doAjaxAndRenderEntranceDataDiv()");
    //debugger;
    EmailTunnel.clearVisualErrors();
    jQuery.ajax({
        url: "/wp-json/email-tunnel/v1/get-entrence-creds",
        data: {'_wpnonce': wpApiSettings.nonce},
        method: 'POST',
        success: function (data) {
            //console.log( "success: doAjaxAndRenderEntranceDataDiv()");
            //console.log("server response:");
            //console.log(data);
            jQuery("input[name=email-tunnel-exit-url-input]").val('');
            jQuery('input[name=email-tunnel-exit-code-input]').val('');
            if (data.length === 0) {
                EmailTunnel.renderEntranceDivWhenEmpty();
            }else{
                EmailTunnel.renderEntranceDivWithData(data);
            }
        },
        error: function (errorThrown) {
            console.log("Error: " + "EmailTunnel.doAjaxAndRenderEntranceDataDiv()");
            console.log( errorThrown );
        }
    });
}

EmailTunnel.doAjaxAndRenderExitDataDiv = function(){
    console.log("doAjaxAndRenderExitDataDiv()");
    EmailTunnelStatusData._wpnonce = wpApiSettings.nonce;
    jQuery.ajax({
        url: "/wp-json/email-tunnel/v1/tunnel-exit-ui-data",
        data: EmailTunnelStatusData,
        method: 'POST',
        success: function (data) {
            //console.log( "success: doAjaxSetSiteStatus()");
            //console.log("server response:");
            console.log(data);

            if (data.length === 0) {
                EmailTunnel.renderExitDivWhenEmpty();
            }else{
                EmailTunnel.renderExitDivWithData(data);
            }
        },
        error: function (errorThrown) {
            console.log("Error: " + "EmailTunnel.doAjaxSetSiteStatus()");
            console.log( errorThrown );
        }
    });
}

EmailTunnel.doAjaxCollapseEntrance = function(uRL){
    console.log("doAjaxCollapseEntrance");
    console.log(uRL);
    EmailTunnelStatusData._wpnonce = wpApiSettings.nonce;
    EmailTunnelStatusData.status = "entrance";
    EmailTunnelStatusData.siteUrl = uRL;
    jQuery.ajax({
        url: "/wp-json/email-tunnel/v1/collapse-tunnel/",
        data: EmailTunnelStatusData,
        method: 'POST',
        success: function (data) {
            console.log("success doAjaxCollapseEntrance");
            console.log(data);
            if (data.length === 0) {
                EmailTunnel.renderEntranceDivWhenEmpty();
            }else{
                EmailTunnel.renderEntranceDivWithData(data);
            }
        },
        error: function (errorThrown) {
            console.log("ERROR doAjaxCollapseEntrance");
            console.log(errorThrown);
            console.log( errorThrown.responseText);
        }
    });
}

EmailTunnel.doAjaxCollapseExit = function(uRL){
    console.log("doAjaxCollapseExit() url to collapse:");
    console.log(uRL);
    EmailTunnelStatusData._wpnonce = wpApiSettings.nonce;
    EmailTunnelStatusData.status = "exit";
    EmailTunnelStatusData.siteUrl = uRL;
    jQuery.ajax({
        url: "/wp-json/email-tunnel/v1/collapse-tunnel/",
        data: EmailTunnelStatusData,
        method: 'POST',
        success: function (data) {
            console.log("success doAjaxCollapseExit");
            console.log(data);
            if (data.length === 0) {
                EmailTunnel.renderExitDivWhenEmpty();
            }else{
                EmailTunnel.renderExitDivWithData(data);
            }
        },
        error: function (errorThrown) {
            console.log("ERROR doAjaxCollapseExit");
            console.log(errorThrown);
            console.log( errorThrown.responseText);
        }
    });
}

EmailTunnel.doAjaxPostEntranceCredToServer = function(){
    EmailTunnelStatusData._wpnonce = wpApiSettings.nonce;
    EmailTunnelStatusData.addExitUrl = jQuery("input[type=text][name=email-tunnel-exit-url-input]").val();
    EmailTunnelStatusData.addExitCode = jQuery("input[type=text][name=email-tunnel-exit-code-input]").val();
    EmailTunnelStatusData.addUsername = jQuery("input[type=text][name=email-tunnel-exit-username-input]").val();
	    jQuery.ajax({
	    	url: "/wp-json/email-tunnel/v1/add-new-exit/",
		    data: EmailTunnelStatusData,
		    method: 'POST',
		    success: function (data) {
    		    console.log("success doAjaxPostEntranceCredToServer");
	    	    console.log(data);
                EmailTunnel.renderEntranceDivWithData(data);
                EmailTunnel.renderEntranceConnectButton_ReadyState();
		    },
		    error: function (errorThrown) {
    		    console.log("ERROR doAjaxPostEntranceCredToServer");
	    	    console.log(errorThrown);
		    	console.log( errorThrown.responseText);
			    jQuery("#email-tunnel-entrance-connect-button-error").show();
                EmailTunnel.renderEntranceConnectButton_ReadyState();
		    }
	    });
}

EmailTunnel.doAjaxSetSiteStatus = function (EmailTunnelStatusData){
    //console.log("doAjaxSetSiteStatus(EmailTunnelStatusData)");
    EmailTunnelStatusData._wpnonce = wpApiSettings.nonce;
    //console.log(EmailTunnelStatusData);
    jQuery.ajax({
        url: "/wp-json/email-tunnel/v1/set-site-status/",
        data: EmailTunnelStatusData,
        method: 'POST',
        success: function (data) {
            //console.log( "success: doAjaxSetSiteStatus()");
            //console.log("server response:");
            //console.log(data);
        },
        error: function (errorThrown) {
            console.log("Error: " + "EmailTunnel.doAjaxSetSiteStatus()");
            console.log( errorThrown );
        }
    });

}

EmailTunnel.doClickEntranceConnectButton = function(){
    EmailTunnel.clearVisualErrors();
    EmailTunnel.renderEntranceConnectButton_WorkingState();
    if(EmailTunnel.validateEntranceCred()){
        EmailTunnel.doAjaxPostEntranceCredToServer();
     }else{
        EmailTunnel.renderEntranceConnectButton_ReadyState();
    }
}

EmailTunnel.validateEntranceCred = function(){
    var isSubmissionValid = true;
    console.log("validateEntranceCred()");
    //Development:
    if(!(EmailTunnel.isFrontEndValidationActive())){
        //we'll skip validation here in this case
        return true;
    }
    let exitUrl = jQuery("#email-tunnel-exit-url-input").val();
    let exitCode = jQuery("#email-tunnel-exit-code-input").val();
    let userName = jQuery("#email-tunnel-exit-username-input").val();
    
    if( exitUrl == ""){ jQuery("#email-tunnel-exit-url-input").css("background-color", "#ffdddd"); }
    if( exitCode == ""){ jQuery("#email-tunnel-exit-code-input").css("background-color", "#ffdddd"); }
    if( userName == ""){ jQuery("#email-tunnel-exit-username-input").css("background-color", "#ffdddd"); }
  
    
    //if empty
    

    //if ssl
    
    console.log(exitUrl);
    console.log(exitCode);
    console.log(userName);

    return isSubmissionValid;
}

EmailTunnel.isFrontEndValidationActive = function(){
    //return false;
     return true;
}

EmailTunnel.isValidHttpUrl = function(string){
    console.log("EmailTunnel.isValidHttpUrl()");
    return true;
    
        console.log("doing validateEntranceCred()");
    let url = jQuery("#email-tunnel-exit-url-input").val();
    let prefix = url.substr(0, 8);
    if (!( prefix == "https://")){
        console.log("isEntranceCredValid() => false");
        jQuery("#email-tunnel-error-must-be-ssl").show();
        return false;
    }
}

EmailTunnel.renderEntranceConnectButton_WorkingState = function(){
    //This function changes the Connect button to a visual "in process" state
//this indicates to the user that something is happening in the background
    jQuery("#email-tunnel-connect-entrance-item-submit-button").hide();
    jQuery("#email-tunnel-entrance-button-spinner").show();
}

EmailTunnel.renderEntranceConnectButton_ReadyState = function(){
    console.log("renderEntranceConnectButton_ReadyState()m  ");
    jQuery("#email-tunnel-connect-entrance-item-submit-button").show();
    jQuery("#email-tunnel-entrance-button-spinner").hide();
}

EmailTunnel.renderMainSectionsVisualAppearance = function(divToShow){
    switch (divToShow) {
        case 'closed':
            console.log("renderMainSectionsVisualAppearance case 'closed'");
            jQuery(".entrance-area-row").hide();
            jQuery("#email-tunnel-connection-table").hide();
            jQuery("#you-are-not-connected-row").hide();
            jQuery(".entrance-site-url-row").hide();
            jQuery("#closed-row").fadeIn();
        break;

        case 'entrance':
            console.log("renderMainSectionsVisualAppearance case 'entrance'");
            jQuery("#closed-row").hide();
            //jQuery("#email-tunnel-connection-table").hide();
            //jQuery("#you-are-not-connected-row").hide();
            jQuery(".entrance-site-url-row").hide();
            jQuery(".entrance-area-row").fadeIn();
            //EmailTunnel.doAjaxAndRenderEntranceDataDiv();
        break;

        case 'exit':
            console.log("renderMainSectionsVisualAppearance case 'exit'");
            jQuery("#closed-row").hide();
            jQuery("#email-tunnel-connection-table").hide();
            jQuery("#you-are-not-connected-row").hide();
            jQuery(".entrance-area-row").hide();
            jQuery(".entrance-site-url-row").fadeIn();
            EmailTunnel.exitCredData = [];
            EmailTunnel.doAjaxAndRenderExitDataDiv();
        break;
        

    
        default:
        console.log('AN UNKNOWN ERROR HAS OCCURED. renderMainSectionsVisualAppearance()');
    }
}

EmailTunnel.renderEntranceDivWhenEmpty = function(){
    //console.log("renderEntranceDivWhenEmpty()");
    jQuery("#you-are-not-connected-row").fadeIn();
    jQuery("#email-tunnel-connection-table").hide();
}

EmailTunnel.renderEntranceDivWithData = function(data) {
    console.log("renderEntranceDivWithData() data:");
    console.log(data);
    //Convert the server response into an array so that craeteEntraceTable can use it:
    jQuery("#email-tunnel-connection-table").fadeIn();
    var tableArray = [];
    var itemToPush = [];
    data.forEach(function(item) {
        itemToPush = [item.url, item.created, item.emails, item.status, item.revoke];
        tableArray.push(itemToPush);
    });
    EmailTunnel.blankOutTable();
    var table = document.getElementById("email-tunnel-connection-table");
    var tableBody = document.createElement('tbody');
    tableArray.forEach(function(rowData) {
        var row = document.createElement('tr');
        var count = 1;
        rowData.forEach(function(cellData) {
            //console.log(count);
            if (count == 5){
                //console.log("my balls");
                var cell = document.createElement('td');
                var btn = document.createElement("button");
                btn.type = "button";
                btn.name = "email-tunnel-entrance-collapse-button";
                btn.value = cellData;
                btn.innerHTML = "Collapse";
                btn.classList.add("button");
                btn.classList.add("email-tunnel-entrance-collapse-button");
                btn.classList.add("delete");
                cell.appendChild(btn);
                row.appendChild(cell);
                count = count +1;
            }else{
                var cell = document.createElement('td');
                cell.appendChild(document.createTextNode(cellData));

                row.appendChild(cell);
                count = count +1;
            }

        });

        tableBody.appendChild(row);
    });
    table.appendChild(tableBody);
    document.getElementById("email-tunnel-entrance-data-div").innerHTML = "";
    document.getElementById("email-tunnel-entrance-data-div").appendChild(table);

    jQuery("#you-are-not-connected-row").hide();

    jQuery(".email-tunnel-entrance-collapse-button").click(function(){
        EmailTunnel.doAjaxCollapseEntrance(jQuery(this).val());
    });
}

EmailTunnel.renderExitDivWhenEmpty = function(){}

EmailTunnel.renderExitDivWithData = function(tableArray){
    console.log("renderExitDivWithData()");
    jQuery("#email-tunnel-connection-table").show();
    EmailTunnel.blankOutTable();
    var table = document.getElementById("email-tunnel-connection-table");
    var tableBody = document.createElement('tbody');
    tableArray.forEach(function(rowData) {
        //console.log(rowData);
        //console.log(rowData.name);
        var row = document.createElement('tr');
        var cell = document.createElement('td');
        cell.appendChild(document.createTextNode(rowData.name));
        row.appendChild(cell);

        var cell = document.createElement('td');
        cell.appendChild(document.createTextNode(rowData.createdOn));
        row.appendChild(cell);

        var cell = document.createElement('td');
        cell.appendChild(document.createTextNode(rowData.emails));
        row.appendChild(cell);

        var cell = document.createElement('td');
        cell.appendChild(document.createTextNode(rowData.status));
        row.appendChild(cell);

        var cell = document.createElement('td');
        var btn = document.createElement("button");
        btn.type = "button";
        //btn.name = "email-tunnel-exit-collapse-button";
        btn.value = rowData.name;
        btn.innerHTML = "Collapse";
        btn.classList.add("button");
        btn.classList.add("email-tunnel-exit-collapse-button");
        btn.classList.add("delete");
        btn.onclick = function(event) {
            //console.log(btn.value);
            EmailTunnel.doAjaxCollapseExit(btn.value);
        }
        cell.appendChild(btn);
        row.appendChild(cell);

        tableBody.appendChild(row);
        /*
        var row = document.createElement('tr');
        var count = 1;
        rowData.forEach(function(cellData) {
            //console.log(count);
            if (count == 5){
                //console.log("my balls");
                var cell = document.createElement('td');
                var btn = document.createElement("button");
                btn.type = "button";
                btn.name = "email-tunnel-entrance-collapse-button";
                btn.value = cellData;
                btn.innerHTML = "Collapse";
                btn.classList.add("button");
                btn.classList.add("email-tunnel-entrance-collapse-button");
                btn.classList.add("delete");
                cell.appendChild(btn);
                row.appendChild(cell);
                count = count +1;
            }else{
                var cell = document.createElement('td');
                cell.appendChild(document.createTextNode(cellData));

                row.appendChild(cell);
                count = count +1;
            }

        });

        tableBody.appendChild(row);
        */
    });
    jQuery("#you-are-not-connected-row").hide();
    //console.log("line 446");



    //document.getElementById("email-tunnel-entrance-data-div").innerHTML = "";
    table.appendChild(tableBody);


}

EmailTunnel.setupMainDivClickListeners = function(){

    jQuery("#email-tunnel-status-radio-closed").click(function(){
        //console.log( "closed click!" );
        EmailTunnel.renderMainSectionsVisualAppearance("closed");
        EmailTunnelStatusData.status = "Not Connected";
        EmailTunnel.doAjaxSetSiteStatus(EmailTunnelStatusData);
    });
    jQuery("#email-tunnel-status-radio-entrance").click(function(){
        //console.log( "entrance click!" );
        EmailTunnel.renderMainSectionsVisualAppearance("entrance");
        EmailTunnelStatusData.status = "entrance";
        EmailTunnel.doAjaxSetSiteStatus(EmailTunnelStatusData);
        EmailTunnel.doAjaxAndRenderEntranceDataDiv();
    });
    jQuery("#email-tunnel-status-radio-exit").click(function(){
        //console.log( "exit click!" );
        EmailTunnel.renderMainSectionsVisualAppearance("exit");
        EmailTunnelStatusData.status = "exit";
        EmailTunnel.doAjaxSetSiteStatus(EmailTunnelStatusData);
    });
}