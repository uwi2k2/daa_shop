<?php  
  
  require("model/user.php");
  require("model/artikel.php");


  // eine HTML Tabelle mit allen Usern erstellen 
  $all_user = User::getAll();

  // mit einer schleife über alle User iterieren 
  foreach( $all_user as $one_user )
  {
     echo $one_user->getId()  ." | ";
     echo $one_user->username ." | ";
     echo $one_user->password ."<br>";
  }

?>