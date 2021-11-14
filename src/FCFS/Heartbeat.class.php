<?php

namespace FCFS;

class Heartbeat {

	/**
	 * Receive Heartbeat data and respond.
	 *
	 * Processes data received via a Heartbeat request, and returns additional data to pass back to the front end.
	 *
	 * @param array $response Heartbeat response data to pass back to front end.
	 * @param array $data Data received from the front end (unslashed).
	 *
	 * @return array
	 */
	public function myplugin_receive_heartbeat( array $response, array $data ) {
		// If we didn't receive our data, don't send any back.
		if ( empty( $data['myplugin_customfield'] ) ) {
			return $response;
		}

		// Calculate our data and pass it back. For this example, we'll hash it.
		$received_data = $data['myplugin_customfield'];

		$response['myplugin_customfield_hashed'] = sha1( $received_data );

		return $response;
	}

	public function returnJS(){
		$output = <<<OUTPUT
<script>
console.log("Heartbeat");
jQuery( document ).on( 'heartbeat-send', function ( event, data ) {
    // Add additional data to Heartbeat data.
    data.myplugin_customfield = 'some_data';
});
jQuery( document ).on( 'heartbeat-tick', function ( event, data ) {
    // Check for our data, and use it.
    if ( ! data.myplugin_customfield_hashed ) {
        return;
    }
 
    alert( 'The hash is ' + data.myplugin_customfield_hashed );
    console.log("wtf");
});
</script>
OUTPUT;
		return $output;
	}
}


