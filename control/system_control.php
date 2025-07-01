<?php


function ausgabeHTML( $inhalt )
{
	// naviagtion laden und anzeigen
	if( isset( $_SESSION['user_id'] ) == true )
	{
		$nav = file_get_contents( "view/nav.html" );
		echo $nav;
	}

	// ausgabe und beenden von PHP
    die( $inhalt );
}




?>