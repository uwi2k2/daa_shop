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

   // für alle Kategorien eine HTML Option erstellen
   $all = Kategorie::getAll();

   $html_opt = "";

   foreach(  $all as $one  )
   {
   	if( $one->getId() == $elm->eltern_kat_id )
   	{
   		$html_opt .= "<option value=". $one->getId() ." selected >". $one->name ."</option>";
		}
		else
		{
   		$html_opt .= "<option value=". $one->getId() ." >". $one->name ."</option>";
   	}
   }

   $html = str_replace( "###HTML_OPT###" , $html_opt , $html );

   //#3 - das html mit den richtigen Inhalten ausgeben 
   ausgabeHTML( $html ); 
}




function saveKategorie()
{
	  $elm 					 =  new Kategorie( $_POST['id'] );

	  $elm->name          =  $_POST['name'];
	  $elm->beschreibung  =  $_POST['beschreibung'];
	  $elm->eltern_kat_id =  $_POST['eltern_kat_id'];

	  $elm->save();

	  // weiterleiten auf die index.php
	  header( "Location:index.php?action=listKategorie" );
}




?>