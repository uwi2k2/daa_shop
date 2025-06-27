<?php

require_once( "db.php" );

class User
{
	// welche Variablen braucht ein User ?
    private  $id;
    public   $api_id;
	public   $username;
	public   $password;
	private  $deleted;


	function __construct( $id )
	{	
        if( $id < 1 ) // wenn leerer user >> mache nichts 
        {
        	return;
        }

		// user über ID aus DB lesen und in PHP Variablen schreiben
		$db  = new DB();
		$res = $db->query( "SELECT * FROM user 
									 WHERE deleted = 0 AND
									       id = ". $id );
		$row = $db->nextRow( $res );
		
		if( $row ) //  ur wenn es eine Zeile gibt 
		{
			// db werte in php kopieren 
			$this->id       = $id;
			$this->api_id   = $id;
			$this->username = $row['username'];
			$this->password = $row['password'];	
		}	
	}


	public function getId()  // Getter 
	{
		return $this->id;
	}


	function create()
	{
		$db  = new DB();

		$sql = " INSERT INTO user  ( username  , 
									 password   )  
		                     VALUES 
		                           ( '". $this->username ."'  ,   
		                           	 '". $this->password ."'  ) ";

		$res = $db->query( $sql );				
	}


	function update()
	{
		$db = new DB();

		$sql = "UPDATE user SET  username = '". $this->username ."' ,
								 password = '". $this->password ."' , 
								 deleted  = '". $this->deleted  ."'  
							WHERE
								 id = ". $this->id ."
								 ";
        $db->query( $sql );
	} 


	function del()
	{
		$this->deleted = 1;
		$this->update();
	}


	static function getAll()
	{
		$db  = new DB();
		$sql = "SELECT id FROM user WHERE deleted = 0 ";
        $res = $db->query( $sql );

        $rueckgabe = array(); // leeres array für rückgabe machen

        // solange es eine weitere Zeile gibt .... 
        while(    $row = $db->nextRow( $res )    )  
        {
        	//  []  << heißt: neues Elment hinten ans Array dranhängen
        	$rueckgabe[] = new User(  $row['id']  );
        }

        return $rueckgabe;
	}

}


?>