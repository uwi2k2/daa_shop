<?php  
  
  require("model/user.php");

  // "::" << statische Funktion ansprechen 
  $all_user = User::getAll();

  print_r( $all_user );

?>