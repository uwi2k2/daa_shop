<?php  
  
  // die einzige Stelle für IMPORTS !! 
  require("model/user.php");  // User - Model 
  require("control/user_control.php"); // User - Controller

  require("model/artikel.php");  // Artikel - Model 
  require("control/artikel_control.php"); // Artikel - Controller
  

  // naviagtion einbinden
  $nav_html = file_get_contents( "view/nav.html" );
  
  echo $nav_html;


  // --- Routing ---
  // wenn die Action NICHT gegeben ist .. dann .. DEFAULT 
  if(  isset( $_GET['action'] )  == false  )
  {
     listUser();
  }

  // ------- USER ACTIONS -------

  // index.php?action=list_user
  else if(  $_GET['action'] == "list_user"  )
  {
      listUser();
  }

  // index.php?action=edit_user
  else if(  $_GET['action'] == "edit_user"  )
  {
      editUser();
  } 

  // index.php?action=save_user
  else if(  $_GET['action'] == "save_user"  )
  {
      saveUser();
  }



  // ------- ARTIKEL ACTIONS -------

  // index.php?action=list_artikel
  else if(  $_GET['action'] == "list_artikel"  )
  {
      listArtikel();
  }

  // index.php?action=edit_artikel
  else if(  $_GET['action'] == "edit_artikel"  )
  {
      editArtikel();
  } 

  // index.php?action=save_artikel
  else if(  $_GET['action'] == "save_artikel"  )
  {
      saveArtikel();
  }        


?>