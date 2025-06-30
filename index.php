<?php  
  
  session_start();

  // das Password mit SALT `hashen` 
  const SALT  = "ljgf542ök345gl2h62ökh452hj436";


  // die einzige Stelle für IMPORTS !! 
  require("model/user.php");  // User - Model 
  require("control/user_control.php"); // User - Controller

  require("model/artikel.php");  // Artikel - Model 
  require("control/artikel_control.php"); // Artikel - Controller
  

  // wenn kein User eingeloggt ist
  // und nicht das Login Formular gezeigt werden soll 
  // weiterleitung auf login Formular 
  if( isset( $_SESSION['user_id'] ) == false  && 
      $_GET['action'] != "login"              && 
      $_GET['action'] != "checkLogin"   )
  {
      header( "Location:index.php?action=login" );
      die();
  }


  // naviagtion einbinden
  if(  isset( $_GET['action'] )  == true  )
  {
    // wenn "API" NICHT in der ACTION vorkommt  
    // dann NAV laden und anzeigen  
     if( substr_count( $_GET['action'] , "API" ) < 1 )
     {
        $nav_html = file_get_contents( "view/nav.html" );
        echo $nav_html;    
     }
  }
  else
  {
      $nav_html = file_get_contents( "view/nav.html" );
      echo $nav_html;       
  }



  // --- Routing ---
  // wenn die Action NICHT gegeben ist .. dann .. DEFAULT 
  if(  isset( $_GET['action'] )  == false  )
  {
     listUser();
  }

  // Wir 'verstecken' in der action den Namen der 
  // Funktion die aufgreufen werden soll 
  // index.php?action=listUser
  else
  {
      $name_der_function = $_GET['action'];

      call_user_func( $name_der_function );
  }







?>