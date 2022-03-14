<?php

namespace EmailTunnel;

class SentCounter{

    public function increment($uRL){}
    
    public static function get($uRL){
        $data = get_option("email-tunnel-counts");
        if(is_array($data)){
            foreach($data as $item){
                if($item['uRL'] == $uRL){
                    return $item['count'];
                }
            }
        }
        return false;
    }
    
    public function cleanup(){}
    
    public function deleteTunnel($uRL){}
    
}