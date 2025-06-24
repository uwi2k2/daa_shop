<?php


class DB
{
  // Instanz Variablen 
  private $host    = "127.0.0.1";
  private $port    = 3306;
  private $db_user = "root"; 
  private $db_pass = ""; 
  private $db_name = "daa_shop";
  
  private $con     = null;
  
  function __construct()
  {
	  // Verbindung aufbauen 
	  $this->con = mysqli_connect(   $this->host    , 
              									   $this->db_user , 
              									   $this->db_pass ,
              									   $this->db_name , 
              									   $this->port     );
  }
  

  function query( $sql_txt )
  {
  	 $result = mysqli_query(  $this->con ,  $sql_txt  );  
  	 
  	 return $result;
  }
  
  
  function nextRow( $result )
  {
  	 $row = mysqli_fetch_assoc( $result );

  	 return $row;
  }
  

}


?>