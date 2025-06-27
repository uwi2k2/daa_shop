<?php

function listUser()
{
	  // eine HTML Tabelle mit allen Usern erstellen 
	  $all_user = User::getAll();


	  // mit einer schleife über alle User iterieren 
	  foreach( $all_user as $one_user )
	  {
	     echo "<a href='index.php?action=editUser&id=".  $one_user->getId()   ."' >";
	     echo $one_user->getId()  ." - ";
	     echo $one_user->username ." <br> ";
	     echo "</a>";
	  }  
}


function API_listUser()
{
	  // eine HTML Tabelle mit allen Usern erstellen 
	  $all_user = User::getAll();

	  echo json_encode( $all_user );	 
}



function editUser()
{
   $user = new User(  $_GET['id']  );
   
   //#1 - das html des View in eine Variable laden
   $html = file_get_contents( "view/edit_user.html" );

   //#2 - dei Platzhalter duch php Variablen(Werte) ersetzen
   $html = str_replace( "###USERID###"   , $user->getId()  , $html );
   $html = str_replace( "###USERNAME###" , $user->username , $html );
   $html = str_replace( "###PASSWORD###" , $user->password , $html );

   //#3 - das html mit den richtigen Inhalten ausgeben 
   echo $html;
}


function saveUser()
{
	  $user = new User(  $_POST['id']  );

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

	  // weiterleiten auf die index.php
	  header( "Location:index.php" );
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