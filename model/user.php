<?php

require_once( "model/db.php" );

class User
{
	// welche Variablen braucht ein User ?
    private  $id;
	public   $username;
	public   $password;


	function __construct( $id )
	{	
        if( $id < 1 ) // wenn leerer user >> mache nichts 
        {
        	return;
        }

		// user über ID aus DB lesen und in PHP Variablen schreiben
		$db  = new DB();
		$res = $db->query( "SELECT * FROM user WHERE id = ". $id );
		$row = $db->nextRow( $res );
		
		// db werte in php kopieren 
		$this->id       = $id;
		$this->username = $row['username'];
		$this->password = $row['password'];		
	}

	function create()
	{
		$db  = new DB();

		$sql = " INSERT INTO user  ( username                 , password                   )  
		                     VALUES 
		                           ( '". $this->username ."'  ,   '". $this->password ."'  ) ";

		$res = $db->query( $sql );				
	}

}


?>