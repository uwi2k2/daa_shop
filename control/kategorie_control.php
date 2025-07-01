<?php

function listKategorie()
{
	  // eine HTML Tabelle mit allen Kategorie erstellen 
	  $all = Kategorie::getAll();

	  // mit einer schleife über alle Kategorie iterieren 
	  foreach( $all as $one )
	  {
	     echo "<a href='index.php?action=editKategorie&id=". $one->getId() ."' >";
	     echo $one->getId()  ." - ";
	     echo $one->name ."  ";
	     echo "</a> <br>";
	  }  
}


function editKategorie()
{
   $elm = new Kategorie(  $_GET['id']  );
   ?>
	  <form action="index.php?action=saveKategorie"  method="POST" >	

		  	<input type="hidden"   name="id"     value="<?php echo $elm->getId(); ?>"  >
		  	<input type="text"     name="name"   value="<?php echo $elm->name; ?>"  >
		  	<br>
		  	<textarea name="beschreibung" ><?php echo $elm->beschreibung; ?></textarea>
	      <br>
		  	<input type="submit"   value="speichern" >

	  </form>    
   <?php
}


function saveKategorie()
{
	  $elm 					=  new Kategorie( $_POST['id'] );

	  $elm->name         =  $_POST['name'];
	  $elm->beschreibung =  $_POST['beschreibung'];

	  $elm->save();

	  // weiterleiten auf die index.php
	  header( "Location:index.php?action=listKategorie" );
}




?>