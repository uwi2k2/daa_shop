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
		$db  = DB::getInstanz();

		$sql_txt   = "SELECT * FROM  user 
							   WHERE deleted = 0 AND
									 id = :id  ";
		$sql_werte = [ ':id' => $id ];

		$res = $db->query(  $sql_txt ,  $sql_werte );

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
		$db  = DB::getInstanz();

		$sql = " INSERT INTO user  ( username  , 
									 password   )  
		                     VALUES 
		                           ( :username  ,   
		                           	 :password  ) ";

		$data = [ ':username' => $this->username ,
				  ':password' => $this->password ];

		$res = $db->query( $sql , $data );				
	}


	function update()
	{
		$db = DB::getInstanz();

		$sql = "UPDATE user SET  username = :username  ,
								 password = :password  , 
								 deleted  = :deleted  
							WHERE
								 id 	  = :id ";

	    $data = [ 
		    	':username' => $this->username ,
		    	':password' => $this->password ,
		    	':deleted'  => $this->deleted ,
		    	':id' 		=> $this->id 
	    		];

        $db->query( $sql , $data  );
	} 


	function del()
	{
		$this->deleted = 1;
		$this->update();
	}


	function save()
	{
		if( $this->id > 0 )
		{
			$this->update();
		}
		else
		{
			$this->create();
		}
	}


	static function getAll()
	{
		$db   = DB::getInstanz();
		$sql  = "SELECT id FROM user WHERE deleted = 0 ";
		$data = [];
        $res  = $db->query( $sql , $data );

        $rueckgabe = array(); // leeres array für rückgabe machen

        // solange es eine weitere Zeile gibt .... 
        while(    $row = $db->nextRow( $res )    )  
        {
        	//  []  << heißt: neues Elment hinten ans Array dranhängen
        	$rueckgabe[] = new User(  $row['id']  );
        }

        return $rueckgabe;
	}


	
	static function checkUserData( $username , $password  )
	{
		$db  = DB::getInstanz();

		$sql = "SELECT id FROM  user 
						  WHERE deleted  = 0 AND 
						        username = :username  AND
						        password = :password    ";

        $data = [ ':username' => $username , 
        		  ':password' => $password ];						        

        $res = $db->query( $sql , $data );

        // wie viele Ergebniszeilen sind im Result ???
        if(  $res->rowCount() == 1 )
        {
        	// die ID des Users zurückgeben
        	 $row = $db->nextRow( $res ) ;

        	 return $row['id'];
        } 
        else
        {
        	return 0; // keinen User (oder mehrere) gefunden 
        }
	}

}


?>