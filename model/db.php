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


      // Verbindung aufbauen 
      $this->con = mysqli_connect(   $this->host    , 
                                     $this->db_user , 
                                     $this->db_pass ,
                                     $this->db_name , 
                                     $this->port     );
      echo "<h3> Neue Verbindung .............</h3> \n ";
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