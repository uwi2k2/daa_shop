<?php


function ausgabeHTML( $inhalt )
{
	$html = file_get_contents("view/index.html");

	$html = str_replace( "###CONTENT###" , $inhalt, $html );

	// ausgabe und beenden von PHP
    die( $html );
}




?>