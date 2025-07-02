<?php

function loadENV()
{
		$lines = file( "conf.env" );

		foreach ( $lines as $one_line ) 
		{
			$one_line = trim( $one_line );

			if( $one_line == "" )
		    	continue; 
		        
		    if( substr( $one_line , 0 , 1 ) == "#" )
		    	continue; 

		    $teile = explode( "=" , $one_line );
		  
			$_ENV[ $teile[0] ] = $teile[1];
		} 
}



?>