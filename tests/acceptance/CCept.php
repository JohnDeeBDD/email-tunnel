<?php
$I = new AcceptanceTester($scenario);
$I->wantTo('reconfigure the YML');

$fileContents = file_get_contents("/var/www/html/wp-content/plugins/fcfs-block/tests/acceptance.suite.yml");

$fin = replace_between(
    $fileContents,
    "http",
    "/'",
    "cuntCUNT",
);


echo ($fin);

//substr_count(string,substring,start,length)

/*
$commandToGetLocalIP = "dig +short myip.opendns.com @resolver1.opendns.com";
$IP = shell_exec($commandToGetLocalIP);
$IP = substr_replace($IP, "", -1);
$I->reconfigureThisVariable(['url' => "http://$IP/"]);

$I->loginAsAdmin();
*/

function replace_between($str, $needle_start, $needle_end, $replacement) {
    $pos = strpos($str, $needle_start);
    $start = $pos === false ? 0 : $pos + strlen($needle_start);

    $pos = strpos($str, $needle_end, $start);
    $end = $pos === false ? strlen($str) : $pos;

    return substr_replace($str, $replacement, $start, $end - $start);
}