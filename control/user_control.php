<?php

function listUser()
{
	  // eine HTML Tabelle mit allen Usern erstellen 
	  $all_user = User::getAll();

	  $out = "";

	  // mit einer schleife über alle User iterieren 
	  foreach( $all_user as $one_user )
	  {
	     $out .= "<a href='index.php?action=editUser&id=".  $one_user->getId()   ."' >";
	     $out .=  $one_user->getId()  ." - ";
	     $out .=  $one_user->username ." <br> ";
	     $out .=  "</a>";
	  } 

	  ausgabeHTML( $out ); 
}


function editUser()
{
   $user = new User(  $_GET['id']  );
   
   //#1 - das html des VIEW in eine Variable laden
   $html = file_get_contents( "view/edit_user.html" );

   //#2 - dei Platzhalter duch php Variablen(Werte) ersetzen
   $html = str_replace( "###USERID###"   , $user->getId()  , $html );
   $html = str_replace( "###USERNAME###" , $user->username , $html );
   $html = str_replace( "###PASSWORD###" , $user->password , $html );

   //#3 - das html mit den richtigen Inhalten ausgeben 
   ausgabeHTML( $html );
}


function saveUser()
{
	  $user = new User(  $_POST['id']  );

	  $user->username  =  $_POST['username'];

	  $hash_password   = md5(  SALT  .  $_POST['password'] );

	  $user->password  =  $hash_password;

	  $user->save(); // <<< das wollen wir haben !!! 

	  // weiterleiten auf die index.php
	  header( "Location:index.php" );
}


// zeigt das LogIn Formular an
function login()
{
	$html = file_get_contents( "view/login.html" );

	ausgabeHTML( $html );
}


// prüft ob LogIn Daten OK 
function checkLogin()
{
   // prüfen ob ein User mit dieser USERNAME / PASSWORD 
	// Kombination in DB zu finden ist

   // Das Passwort für den Vergleich mit der DB hashen 
   $hash_pass = md5( SALT . $_POST['password'] );

   $user_id = User::checkUserData( $_POST['username']  ,  $hash_pass  );

   if( $user_id > 0 )
   {
   	// in Sitzung User(id) speichern
      $_SESSION['user_id'] = $user_id;

      header("Location:index.php");      
   }
}


// user wieder ausloggen > session löschen 
function logout()
{
	unset(  $_SESSION['user_id'] );

	header("Location:index.php"); 
}



////// ab hier die API Funktionen /////////////


function API_listUser()
{
	  $all_user = User::getAll();

	  echo json_encode( $all_user );	 
}


function API_saveUser()
{
	  $user = new User(  $_POST['api_id']  );

	  $user->username  =  $_POST['username'];
	  $user->password  =  $_POST['password'];

	  if(  $_POST['id'] > 0 )
	  {
	    $user->update();
	  }
	  else
	  {
	    $user->create();
	  }	  

	  die( "ok" );
}




?>