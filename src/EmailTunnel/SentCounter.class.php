<?php

namespace EmailTunnel;

class SentCounter{

    public static function increment($uRL, $type = "exit"){
        $data = get_option("email-tunnel-counts");
        $notFound = true;
        if(is_array($data)){

            foreach($data as $item){
                if( ( $item['uRL'] == $uRL) && ($item['type'] == $type)){
                    $item['count'] = $item['count'] + 1;
                    $notFound = false;
                }
            }

        }else{
            $data = [];
        }
        if($notFound){
            $item = ['uRL' => $uRL, 'type' => $type, 'count' => 1];
            array_push($data,$item);
        }
        return update_option("email-tunnel-counts", $data);
    }
    
    public static function get($uRL, $type = "exit"){
        $data = get_option("email-tunnel-counts");
        if(is_array($data)){
            foreach($data as $item){
                if( ( $item['uRL'] == $uRL) && ($item['type'] == $type)){
                    return $item['count'];
                }
            }
        }
        return false;
    }

    //public static function reset($uRL, $type = "exit"){}

    //public function delete($uRL, $type = "exit"){}
    
}