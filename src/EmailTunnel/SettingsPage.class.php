<?php

namespace EmailTunnel;

class SettingsPage{
    
    public function render(){
        //strings:
        $EmailTunnel = __("Email Tunnel");
        $Entrance = __("Entrance");
        $Exit = __("Exit");
        $Status = __("Status");
        
        $status = \get_option('email_tunnel_status');
        
        $Connections = new Connections;
        $StatusHTML = $Connections->getSiteStatusHTML();
        $statusData = $Connections->getSiteStatus();
        //var_dump($statusData);die();
         

        
        $TunnelEntrance = new TunnelEntrance;
        $entranceSiteUrl = $TunnelEntrance->getSelectedEntrance();
        //var_dump($entranceSiteUrl);die();
        
        $output = <<<OUTPUT
<h1>
   $EmailTunnel
</h1>
<h2>
   Status
</h2>
$StatusHTML
<br />
<div>
   <input type="radio" id="email-tunnel-status-radio-closed" name="email-tunnel-status-radio" value="closed">
   <label for="closed">Closed</label>
</div>
<div>
   <input type="radio" id="email-tunnel-status-radio-entrance" name="email-tunnel-status-radio" value="entrance"> 
   <label for="entrance">Entrance</label>
</div>
<div>
   <input type="radio" id="email-tunnel-status-radio-exit" name="email-tunnel-status-radio" value="exit"> 
   <label for="exit">Exit</label>
</div>
<div id = "entrance-area-div" style = "display: none;"v>
   <h2>
      $Entrance
   </h2>
   Enter the URL of the tunnel exit
   <input type = "text" placeholder = "i.e. https://somesite.com" name = "email-tunnel-exit-url-input" id = "email-tunnel-exit-url-input" />
   Enter the code
   <input type = "text" placeholder = "get on other website" id = "email-tunnel-exit-code" name = "email-tunnel-exit-code" />
   <div id = "email-tunnel-connect-entrance-item-submit-button-div">
   <div id = "email-tunnel-entrance-button-spinner" class = "spinner is-active" style = "display:none;"></div>
        <input type = "button" value = "Connect" id = "email-tunnel-connect-entrance-item-submit-button" name = "email-tunnel-connect-entrance-item-submit-button" />
   </div><!-- end: #email-tunnel-connect-entrance-item-submit-button-div -->
   <div id = "email-tunnel-entrance-connect-button-error" style = "color:red;display:none;">
        An error has occured.
   </div><!-- end: #email-tunnel-entrance-connect-button-error -->
   
   
   <div id = "email-tunnel-entrance-data-div">ETED</div>
</div>
<!-- #entrance-area-div -->
<div id = "exit-area-div" style = "display: none;">
   <h2>
      $Exit
   </h2>
   Allow the following site to send email from {thissite}
   <input type = "text" name = "xxxemail-tunnel-entrance-url" id = "xxxxemail-tunnel-entrance-url" placeholder = "i.e. https://somesite.com" />
   <input type = "button" value = "Generate Code" />
</div>
<!-- #exit-area-div -->
<div id = "closed-area-div" style = "display: none;">
   <h2>
      The tunnel is closed.
   </h2>
</div>
<!-- #closed-area-div -->

OUTPUT;
        echo $output;
    }

}