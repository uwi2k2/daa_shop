<?php

  require( "model/user.php" );

  $user1 = new User( 0 );

  // PHP Variablen  |    HTML Feldname
  $user1->username  =  $_POST['username'];
  $user1->password  =  $_POST['password'];

  $user1->create();  

  echo "user angelgt";

?>