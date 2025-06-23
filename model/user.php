<?php

require_once( "model/db.php" );

class User
{
	// welche Variablen braucht ein User ?
    private  $id;
	public   $username;
	public   $password;

	// welche Funktionen braucht ein User ? 
	function __construct( $id )
	{	
		// user über ID aus DB lesen und in PHP Variablen schreiben
		$db  = new DB();
		$res = $db->query( "SELECT * FROM user WHERE id = ". $id );
		$row = $db->nextRow( $res );
		
		// db werte in php kopieren 
		$this->id       = $id;
		$this->username = $row['username'];
		$this->password = $row['password'];		
	}
}


?>