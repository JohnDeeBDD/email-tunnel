<?php

namespace EmailTunnel;

class SettingsPage{
    
    public function render(){

        //Internationalization and localization strings:
        $i18nAnErrorHasOccured = __("An unknown error has occured.");
        $i18nClosed = __("Closed");
        $i18nConnect = __("Connect");
        $i18nConnectionCode = __("Connection Code");
        $i18nCreatedOnCreated = __("Created On");
        $i18nEmails = __("Emails");
        $i18nEmailTunnel = __("Email Tunnel");
        $i18nEntrance = __("Entrance");
        $i18nEntranceSiteURL = __("Entrance Site URL");
        $i18nExit = __("Exit");
        $i18nExitSiteURL = __("Exit Site URL");
        $i18nGenerateCode = __("Generate Code");
        $i18nGetEmailTunnelPro = __("Get Email-Tunnel-Pro for unencrypted HTTP feature");
        $i18nGetEmailTunnelPro4Localhost = __("Get Email-Tunnel-Pro for localhost feature");
        $i18nSomeSite = __("i.e. https://somesite.com");
        $i18nLocalStatus = __("Local Status");
        $i18nName = __("Name");
        $i18nRevoke = __("Revoke");
        $i18nnbspSomeSite = __("&nbsp;&nbsp;https://somesite.com");
        $i18nObtainOnOtherWebsite = __("obtain on other website");
        $i18nTheTunnelIsClosed = __("tunnel is closed.");
        $i18nYouAreNotConnected = __("You are not connected.");
        $i18nYouMustHaveSSL = __("You must have SSL enabled on both sites in the free version of this plugin. The URL should look like:");

        $output = <<<OUTPUT
<style>
    .email-tunnel-error-row{color:red;}
    .email-tunnel-error-row{display:none;}
    .entrance-area-row{display:none;}
    #email-tunnel-entrance-button-spinner{float: left !important;}
    #closed-row{display: none;}
    #you-are-not-connected-row{display: none;}
    #email-tunnel-connection-table{display: none;}
    .entrance-site-url-row{display: none;}
    .spinner{display:none;}
    
</style>
<div class="wrap">
<h1>
   $i18nEmailTunnel
</h1>
<table class="form-table" role="presentation">
    <tr>
        <th scope="row">$i18nLocalStatus</th>
        <td id="front-static-pages">
            <fieldset>
                <legend class="screen-reader-text">
                    <span>$i18nLocalStatus</span>
                </legend>
                <div>
                    <input type="radio" id="email-tunnel-status-radio-closed" name="email-tunnel-status-radio" value="closed">
                    <label for="closed">$i18nClosed</label>
                </div>
                <div>
                    <input type="radio" id="email-tunnel-status-radio-entrance" name="email-tunnel-status-radio" value="entrance"> 
                    <label for="entrance">$i18nEntrance</label>
                </div>
                <div>
                    <input type="radio" id="email-tunnel-status-radio-exit" name="email-tunnel-status-radio" value="exit"> 
                    <label for="exit">$i18nExit</label>
                </div>
            </fieldset> 
            </td>
    </tr>
    <tr id = "closed-row">
        <th></th>
        <td>
            <h2>
                $i18nTheTunnelIsClosed
            </h2>
        </td>
    </tr>
    <tr class = "entrance-area-row">
        <th scope="row">
            $i18nExitSiteURL
        </th>
        <td>
            <input type = "text" placeholder = "$i18nSomeSite" name = "email-tunnel-exit-url-input" id = "email-tunnel-exit-url-input" />
        </td>
    </tr>
    <tr class = "entrance-area-row">
        <th>
            $i18nConnectionCode
        </th>
        <td>
            <input type = "text" placeholder = "$i18nObtainOnOtherWebsite" id = "email-tunnel-exit-code-input" name = "email-tunnel-exit-code-input" />
        </td>
        
    <tr class = "entrance-area-row">
        <th></th>
        <td>
            <input type = "button" class = "button delete" value = "$i18nConnect" id = "email-tunnel-connect-entrance-item-submit-button" name = "email-tunnel-connect-entrance-item-submit-button" />
        </td>
    </tr>
    </tr>
    <tr id = "email-tunnel-entrance-connect-button-error" class = "email-tunnel-error-row">
        <th></th>
        <td>
            $i18nAnErrorHasOccured
        </td>
    </tr>
    <tr id = "email-tunnel-error-must-be-ssl" class = "email-tunnel-error-row">
        <th></th>
        <td>
            $i18nYouMustHaveSSL<br/>
            $i18nnbspSomeSite<br />
            <br />
            <a href = "" target = "blank">$i18nGetEmailTunnelPro</a>
        </td>
    </tr>
    <tr class = "email-tunnel-error-row">
        <th></th>
        <td>
            <a href = "" target = "blank">$i18nGetEmailTunnelPro4Localhost</a>
        </td>
    </tr>

    <tr class = "spinner">
        <th></th>
        <td>
            <div id = "email-tunnel-entrance-button-spinner" class = "spinner is-active"></div>
        </td>
    </tr>

    <tr class = "entrance-site-url-row">
        <th>$i18nEntranceSiteURL</th>
        <td>
            <input type = "text" name = "email-tunnel-entrance-url" id = "email-tunnel-entrance-url" placeholder = "$i18nSomeSite" />
            <input type = "button" value = "$i18nGenerateCode" class = "button delete"/>
        </td>
    </tr>
    <tr class = "entrance-site-url-row">
        <th>$i18nConnectionCode</th>
        <td>
123443245 DO NOT CLOSE THIS TAB UNTIL YOU CONNECT. You cannot retrieve this code later on.
        </td>
    </tr>
    <tr id = "you-are-not-connected-row">
        <th></th>
        <td>
            <div id = "email-tunnel-exit-not-connected-message">
                $i18nYouAreNotConnected
            </div><!#-- end: #email-tunnel-exit-not-connected-message -->
        </td>
    </tr>
<tr>
    <th></th><td></td>
</tr>
</table>


<div id = "email-tunnel-entrance-data-div"></div>
<!--  
<table id = "email-tunnel-connection-table" class="wp-list-table widefat fixed striped table-view-list application-passwords-user">
-->
<table id = "email-tunnel-connection-table" class="wp-list-table widefat fixed striped table-view-list">
	<thead>
	<tr>
		<th scope="col" id='name' class='manage-column column-name column-primary'>$i18nName</th>
		<th scope="col" id='last_used' class='manage-column'>$i18nCreatedOnCreated</th>
		<th scope="col" id='last_ip' class='manage-column'>$i18nEmails</th>
		<th scope="col" id='created' class='manage-column'>&nbsp</th>
		<th scope="col" id='revoke' class='manage-column'>$i18nRevoke</th>
	</tr>
	</thead>
	<tbody id="the-list"></tbody>
	<tfoot>
	<tr>
		<th scope="col"  class='manage-column'>$i18nName</th>
		<th scope="col"  class='manage-column'>$i18nCreatedOnCreated</th>
		<th scope="col"  class='manage-column'>$i18nEmails</th>
		<th scope="col"  class='manage-column'>&nbsp</th>
		<th scope="col"  class='manage-column'>$i18nRevoke</th>
	</tr>
	</tfoot>
</table>
</div><!-- end: wrap -->
OUTPUT;
        echo $output;
    }

}