<?php  
  
  require("model/user.php");

  $user = new User( 0 ); // einen LEEREN User anlegen 

  $user->username = "hans_wurst";
  $user->password = "98765432";



  print_r( $user );


?>