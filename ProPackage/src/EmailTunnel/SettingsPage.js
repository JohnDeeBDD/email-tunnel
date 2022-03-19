/*global jQuery*/
/*global wpApiSettings*/
/*global EmailTunnelStatusData*/
/*global EmailTunnelEntranceData*/
/*global EmailTunnelExitData*/

jQuery( document ).ready(function() {
    const consolelog = 123;
    console.log(consolelog);
    console.log("email-tunnel settingsPage.js loaded.");
    console.log("status data emitted from PHP: ");
    console.log(EmailTunnelStatusData);

    switch (EmailTunnelStatusData.status) {
        case 'not connected':
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

    jQuery(".email-tunnel-text-input").focus(function(){
        EmailTunnel.renderVisualErrorsClear();
    });
});

const EmailTunnel = {};

EmailTunnel.doAjaxAndRenderEntranceDataDiv = function(){
    console.log("doAjaxAndRenderEntranceDataDiv()");
    //debugger;
    EmailTunnel.renderVisualErrorsClear();
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
                EmailTunnel.renderNotConnectedDiv();
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
            console.log( "1. success: doAjaxSetSiteStatus()");
            console.log("2. server response:");
            console.log(data);

            if (data.length === 0) {
                EmailTunnel.renderExitDivWhenEmpty();
            }else{
                EmailTunnel.renderExitDivWithData(data);
            }
        },
        error: function (errorThrown) {
            //This shouldn't be happening!
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
                EmailTunnel.renderNotConnectedDiv();
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
    jQuery("#email-tunnel-entrance-url").val("");
    jQuery.ajax({
        url: "/wp-json/email-tunnel/v1/collapse-tunnel/",
        data: EmailTunnelStatusData,
        method: 'POST',
        success: function (data) {
            console.log("success! doAjaxCollapseExit");
            console.log(data);
            if (data.length === 0) {
                console.log("1");
                EmailTunnel.renderExitDivWhenEmpty();
            }else{
                console.log("2");
                EmailTunnel.renderExitDivWithData(data);
            }
        },
        error: function (errorThrown) {
            console.log("ERROR doAjaxCollapseExit");
            console.log(errorThrown);
            console.log( errorThrown.responseText);
            jQuery("#received-connection-code-row").hide();
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

            //clear input boxes:
            jQuery("input[type=text][name=email-tunnel-exit-url-input]").val("");
            jQuery("input[type=text][name=email-tunnel-exit-code-input]").val("");
            jQuery("input[type=text][name=email-tunnel-exit-username-input]").val("");
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

EmailTunnel.doAjaxPostExitCredToServer = function(){
    EmailTunnelStatusData._wpnonce = wpApiSettings.nonce;
    EmailTunnelStatusData.url = jQuery("input[type=text][name=email-tunnel-entrance-url]").val();
    jQuery.ajax({
        url: "/wp-json/email-tunnel/v1/add-new-entrance/",
        data: EmailTunnelStatusData,
        method: 'POST',
        success: function (data) {
            console.log("success doAjaxPostExitCredToServer");
            console.log(data[0]);
            jQuery("#email-tunnel-entrance-url").val("");
            jQuery("input[type=text][name=email-tunnel-entrance-url]").val("");
            EmailTunnel.doAjaxAndRenderExitDataDiv();
            EmailTunnel.renderReceivedEntranceCode(data[0], EmailTunnelStatusData.url);
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
    console.log("doAjaxSetSiteStatus(EmailTunnelStatusData)");
    EmailTunnelStatusData._wpnonce = wpApiSettings.nonce;
    console.log("data being sent: ");
    console.log(EmailTunnelStatusData);
    jQuery.ajax({
        url: "/wp-json/email-tunnel/v1/set-site-status/",
        data: EmailTunnelStatusData,
        method: 'POST',
        success: function (data) {
            console.log( "success: doAjaxSetSiteStatus()");
            console.log("server response:");
            console.log(data);
        },
        error: function (errorThrown) {
            console.log("Error: " + "EmailTunnel.doAjaxSetSiteStatus()");
            console.log( errorThrown );
        }
    });

}

EmailTunnel.doClickEntranceConnectButton = function(){
    console.log("doClickEntranceConnectButton");
    EmailTunnel.renderVisualErrorsClear();
    EmailTunnel.renderEntranceConnectButton_WorkingState();
    if(EmailTunnel.validateEntranceCred()){
        EmailTunnel.doAjaxPostEntranceCredToServer();
    }else{
        EmailTunnel.renderEntranceConnectButton_ReadyState();
    }
}

EmailTunnel.doClickExitConnectButton = function(){
    console.log("doClickExitConnectButton");
    EmailTunnel.renderVisualErrorsClear();
    //EmailTunnel.renderEntranceConnectButton_WorkingState();
    if(EmailTunnel.validateExitCred()){
        EmailTunnel.doAjaxPostExitCredToServer();
 //   }else{
  //      EmailTunnel.renderEntranceConnectButton_ReadyState();
    }
}

EmailTunnel.validateEntranceCred = function(){
    console.log("validateEntranceCred()");
    //Development:
    if(!(EmailTunnel.isFrontEndValidationActive())){
        //we'll skip validation here in this case
        return true;
    }
    var isSubmissionValid = true;
    let exitUrl = jQuery("#email-tunnel-exit-url-input").val();
    let exitCode = jQuery("#email-tunnel-exit-code-input").val();
    let userName = jQuery("#email-tunnel-exit-username-input").val();

    if( exitUrl == ""){
        jQuery("#email-tunnel-exit-url-input").css("background-color", "#ffdddd");
        isSubmissionValid = false;
    }
    if( exitCode == ""){
        jQuery("#email-tunnel-exit-code-input").css("background-color", "#ffdddd");
        isSubmissionValid = false;
    }
    if( userName == ""){
        jQuery("#email-tunnel-exit-username-input").css("background-color", "#ffdddd");
        isSubmissionValid = false;
    }
    console.log("exitUrl = " + exitUrl);
    console.log("exitCode = " + exitCode);
    console.log("userName = " + userName);
    return isSubmissionValid;
}

EmailTunnel.validateExitCred = function(){
    console.log("validateExitCred()  <--returning TRUE!");
    return true;
}

EmailTunnel.isFrontEndValidationActive = function(){
    //return false;
     return true;
}

EmailTunnel.isValidHttpUrl = function(string){
    console.log("EmailTunnel.isValidHttpUrl()");
    return true;
    //TODO
}

EmailTunnel.renderClearTable = function(){
    var table = document.getElementById("email-tunnel-connection-table");
    var rowCount = table.rows.length;
    var i = 1;
    while (i < (rowCount - 1)) {
        //console.log("The number is " + i);
        table.deleteRow(1);
        i++;
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
    EmailTunnel.renderClearTable();
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

EmailTunnel.renderExitDivWithData = function(tableArray){
    console.log("renderExitDivWithData()");
    jQuery("#email-tunnel-connection-table").show();
    EmailTunnel.renderClearTable();
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
            jQuery("#received-connection-code-row").hide();
            EmailTunnel.renderVisualErrorsClear();
        }
        cell.appendChild(btn);
        row.appendChild(cell);

        tableBody.appendChild(row);
    });
    jQuery("#you-are-not-connected-row").hide();
    table.appendChild(tableBody);
}

EmailTunnel.renderExitDivWhenEmpty = function(){
    jQuery("#you-are-not-connected-row").show();
    jQuery("#email-tunnel-connection-table").hide();
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

EmailTunnel.renderNotConnectedDiv = function(){
    console.log("renderNotConnectedDiv()");
    jQuery("#you-are-not-connected-row").fadeIn();
    jQuery("#email-tunnel-connection-table").hide();
}

EmailTunnel.renderReceivedEntranceCode = function(code, uRL){
    console.log("doRenderReceivedEntranceCode");
    jQuery("#received-connection-code-row").show();
    jQuery("#exit-code-from-server").text(code);
    const linkText = uRL + "/wp-admin/tools.php?page=email-tunnel";
    jQuery("#exit-code-from-server-delivery-link").attr("href", linkText);
    jQuery("#exit-code-from-server-delivery-link").text(linkText);
}

EmailTunnel.renderVisualErrorsClear = function(){
    console.log("renderVisualErrorsClear()");
    jQuery("#email-tunnel-error-must-be-ssl").hide();
    jQuery("#email-tunnel-entrance-connect-button-error").hide();
    jQuery("#email-tunnel-exit-url-input").css("background-color", "#fff");
    jQuery("#email-tunnel-exit-code-input").css("background-color", "#fff");
    jQuery("#email-tunnel-exit-username-input").css("background-color", "#fff");
    jQuery("#received-connection-code-row").hide();
}

EmailTunnel.setupMainDivClickListeners = function(){
    jQuery("#email-tunnel-generate-exit-code-button").click(function(){
        console.log("#email-tunnel-generate-exit-code-button.click()");
        EmailTunnel.doClickExitConnectButton();
    });
    jQuery("#email-tunnel-status-radio-closed").click(function(){
        //console.log( "closed click!" );
        EmailTunnel.renderMainSectionsVisualAppearance("closed");
        EmailTunnelStatusData.status = "not connected";
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