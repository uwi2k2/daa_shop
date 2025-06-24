<?php


class DBLITE
{
  // Instanz Variablen 
  private $dateiname = "meine_db.sqlite";  
  private $con       = null;
  

  function __construct()
  {
	    // Datei öffnen  
	    $this->con = new SQLite3( $this->dateiname );
  }
  

  function query( $sql_txt )
  {
	    $result = $this->con->query( $sql_txt ); 

	    return $result;
  }
  

  function nextRow( $result )
  {
	    $row = $result->fetchArray( SQLITE3_ASSOC ); 

	    return $row;
  }
  

}


?>