<?php

function listUsertype()
{
	  $all = UserType::getAll();

	  $out = "";

	  foreach( $all as $one )
	  {
	     $out .= "<a href='index.php?action=editUsertype&id=". $one->getId() ."' >";
	     $out .= $one->getId()  ." - ";
	     $out .= $one->name ."  ";
	     $out .= "</a> <br>";
	  }  

	  ausgabeHTML( $out );
}



function editUsertype()
{
   $elm = new UserType(  $_GET['id']  );

   //#1 - das html des VIEW in eine Variable laden
   $html = file_get_contents( "view/edit_usertype.html" );

   //#2 - dei Platzhalter duch php Variablen(Werte) ersetzen
   $html = str_replace( "###ID###"           , $elm->getId()      , $html );
   $html = str_replace( "###NAME###"         , $elm->name         , $html );

   //#3 - das html mit den richtigen Inhalten ausgeben 
   ausgabeHTML( $html ); 
}


function saveUserType()
{
	  $elm 		   =  new UserType( $_POST['id'] );
	  $elm->name   =  $_POST['name'];

	  $elm->save();

	  // weiterleiten auf die index.php
	  header( "Location:index.php?action=listUsertype" );
}




?>