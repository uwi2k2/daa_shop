<?php

function listArtikel()
{
	  // eine HTML Tabelle mit allen Artikel erstellen 
	  $all = Artikel::getAll();

     $out = "";

	  // mit einer schleife über alle Artikel iterieren 
	  foreach( $all as $one )
	  {
	     $out .= "<a href='index.php?action=editArtikel&id=".  $one->getId()   ."' >";
	     $out .= $one->getId()  ." - ";
	     $out .= $one->name ." - ";
	     $out .= $one->preis ." <br> ";
	     $out .= "</a>";
	  }  

	  ausgabeHTML( $out );
}




function editArtikel()
{
   $art = new Artikel(  $_GET['id']  );
  
   //#1 - das html des VIEW in eine Variable laden
   $html = file_get_contents( "view/edit_artikel.html" );

   //#2 - dei Platzhalter duch php Variablen(Werte) ersetzen
   $html = str_replace( "###ID###"           , $art->getId()      , $html );
   $html = str_replace( "###NAME###"         , $art->name         , $html );
   $html = str_replace( "###PREIS###"        , $art->preis        , $html );
   $html = str_replace( "###BESCHREIBUNG###" , $art->beschreibung , $html );

   //#3 - das html mit den richtigen Inhalten ausgeben 
   ausgabeHTML( $html );   
}





function saveArtikel()
{
	  $art 					=  new Artikel( $_POST['id'] );

	  $art->name         =  $_POST['name'];
	  $art->preis        =  $_POST['preis'];
	  $art->beschreibung =  $_POST['beschreibung'];

	  $art->save();

	  // weiterleiten auf die index.php
	  header( "Location:index.php?action=listArtikel" );
}




?>