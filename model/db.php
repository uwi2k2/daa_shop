<?php


class DB
{
  // Instanz Variablen 
  private $host    = null;
  private $port    = null;
  private $db_user = null; 
  private $db_pass = null; 
  private $db_name = null;
  
  private $con     = null;

  // SINGLETON  
  // speicher "DIE EINE" DB Instanz 
  static public $instance = null;
    
  function __construct()
  {
      $this->host    = $_ENV['DB_HOST'];
      $this->port    = $_ENV['DB_PORT'];
      $this->db_user = $_ENV['DB_USER']; 
      $this->db_pass = $_ENV['DB_PASS']; 
      $this->db_name = $_ENV['DB_NAME'];


      // DB Verbindung über 'PDO' Klasse aus PHP
      $connect_string = "mysql:host=". $this->host .";dbname=". $this->db_name .";charset=utf8mb4";
      
      // Verbindung aufbauen 
      $this->con = new PDO( $connect_string ,  $this->db_user  ,  $this->db_pass );
  }


  function query( $sql_txt , $werte_array )
  {
     $result = $this->con->prepare( $sql_txt );

     $result->execute( $werte_array  );  
     
     return $result;
  }


  function nextRow( $result )
  {
     $row = $result->fetch( PDO::FETCH_ASSOC );

     return $row;
  }




  public static function getInstanz()
  {
    // wenn es schon eine Instanz gibt >> diese verwenden (zurückgeben)
    if( DB::$instance != null )
     {       
        return DB::$instance;
     }
        
    // die ERSTE Instanz die je von der DB Klasse gemacht wird speichern.
    DB::$instance = new DB();

    return DB::$instance;
  }
  




  
  


  

}


?>