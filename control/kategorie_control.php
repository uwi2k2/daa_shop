<?php

function listKategorie()
{
	  // eine HTML Tabelle mit allen Kategorie erstellen 
	  $all = Kategorie::getAll();

	  $out = "";

	  // mit einer schleife über alle Kategorie iterieren 
	  foreach( $all as $one )
	  {
	     $out .= "<a href='index.php?action=editKategorie&id=". $one->getId() ."' >";
	     $out .= $one->getId()  ." - ";
	     $out .= $one->name ."  ";
	     $out .= "</a> <br>";
	  }  

	  ausgabeHTML( $out );
}



function editKategorie()
{
   $elm = new Kategorie(  $_GET['id']  );

   //#1 - das html des VIEW in eine Variable laden
   $html = file_get_contents( "view/edit_kategorie.html" );

   //#2 - dei Platzhalter duch php Variablen(Werte) ersetzen
   $html = str_replace( "###ID###"           , $elm->getId()      , $html );
   $html = str_replace( "###NAME###"         , $elm->name         , $html );
   $html = str_replace( "###BESCHREIBUNG###" , $elm->beschreibung , $html );

   //#3 - das html mit den richtigen Inhalten ausgeben 
   ausgabeHTML( $html ); 
}




function saveKategorie()
{
	  $elm 					=  new Kategorie( $_POST['id'] );

	  $elm->name         =  $_POST['name'];
	  $elm->beschreibung =  $_POST['beschreibung'];

	  $elm->save();

	  // weiterleiten auf die index.php
	  header( "Location:index.php?action=listKategorie" );
}




?>