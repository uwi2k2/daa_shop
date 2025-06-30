<?php

function listArtikel()
{
	  // eine HTML Tabelle mit allen Usern erstellen 
	  $all = Artikel::getAll();


	  // mit einer schleife über alle User iterieren 
	  foreach( $all as $one )
	  {
	     echo "<a href='index.php?action=editArtikel&id=".  $one->getId()   ."' >";
	     echo $one->getId()  ." - ";
	     echo $one->name ." - ";
	     echo $one->preis ." <br> ";
	     echo "</a>";
	  }  
}


function editArtikel()
{
   $art = new Artikel(  $_GET['id']  );
   ?>
	  <form action="index.php?action=saveArtikel"  method="POST" >	

		  	<input type="hidden"   name="id"     value="<?php echo $art->getId(); ?>"  >
		  	<input type="text"     name="name"   value="<?php echo $art->name; ?>"  >
		  	<br>
		  	<input type="text"     name="preis"  value="<?php echo $art->preis; ?>"  >
		  	<br>
		  	<textarea name="beschreibung" ><?php echo $art->beschreibung; ?></textarea>
	      <br>
		  	<input type="submit"   value="speichern" >

	  </form>    
   <?php
}


function saveArtikel()
{
	  $art 					=  new Artikel( $_POST['id'] );

	  $art->name         =  $_POST['name'];
	  $art->preis        =  $_POST['preis'];
	  $art->beschreibung =  $_POST['beschreibung'];

	  $art->save();

	  // weiterleiten auf die index.php
	  header( "Location:index.php?action=listArtikel" );
}




?>