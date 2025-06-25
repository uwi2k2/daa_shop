<?php

  require("model/user.php");

  $user = new User(  $_GET['id']  );

  print_r( $user );


?>