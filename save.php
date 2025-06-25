<?php

  require( "model/user.php" );


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

?>