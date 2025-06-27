<?php  
  
  // die einzige Stelle für IMPORTS !! 
  require("model/user.php");  // User - Model 
  require("control/user_control.php"); // User - Controller

  require("model/artikel.php");  // Artikel - Model 
  require("control/artikel_control.php"); // Artikel - Controller
  

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
  else
  {
      $name_der_function = $_GET['action'];

      call_user_func( $name_der_function );
  }







?>