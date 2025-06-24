<?php  
  
  require("model/user.php");
  require("model/artikel.php");


  $art_new               = new Artikel( 5 );
  $art_new->name         = "zzzzzz";
  $art_new->beschreibung = "wwwwwwww";
  $art_new->preis        = 999.999;
  $art_new->update();
  
  $art_new->del();


  // "::" << statische Funktion ansprechen 
  $all = Artikel::getAll();

  print_r( $all );

?>