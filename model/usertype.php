<?php

require_once( "model/db.php" );

class UserType
{
    private  $id;
	public   $name;
	private  $deleted;


	function __construct( $id )
	{	
        if( $id < 1 ) 
        {
        	return;
        }
		
		$db  = DB::getInstanz();
		$sql = "SELECT * FROM usertype  WHERE deleted = 0 AND id = :id ";
		$dat = [ 'id' => $id ];
		$res = $db->query( $sql ,  $dat );
		$row = $db->nextRow( $res );
		
		if( $row ) 
		{
			// db werte in php kopieren 
			$this->id       	 = $id;
			$this->name 		 = $row['name'];		
			$this->deleted       = $row['deleted'];	
		}	
	}


	public function getId()  // Getter 
	{
		return $this->id;
	}
	

	function create()
	{
		$db  = DB::getInstanz();

		$sql = " INSERT INTO usertype  
		                   (    name    ,  deleted  )  
		             VALUES 
		                   (   :name    ,   0     	) ";

		$data = [
					':name'  => $this->name          
				];

		$res = $db->query( $sql , $data );				
	}


	function update()
	{
		$db  = DB::getInstanz();

		$sql = "UPDATE usertype SET   name 	          = :name    ,
								      deleted		  = :deleted    
							   WHERE
								      id 			  = :id
								 ";	

		$data = [
					':name' 		 => $this->name    , 
					':deleted' 		 => $this->deleted , 
					':id' 			 => $this->id  
				];

        $db->query( $sql , $data );
	} 


	function del()
	{
		$this->deleted = 1;
		$this->update();
	}


	function save()
	{
	  if(  $this->id > 0 )
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
		$db  = DB::getInstanz();
		$sql = "SELECT * FROM usertype WHERE deleted = 0 ";
		$dat = [];
        $res = $db->query( $sql , $dat );

        $rueckgabe = array(); // leeres array für rückgabe machen

        // solange es eine weitere Zeile gibt .... 
        while(    $row = $db->nextRow( $res )    )  
        {
        	//  []  << heißt: neues Elment hinten ans Array dranhängen
        	$rueckgabe[] = new UserType(  $row['id']  );
        }

        return $rueckgabe;
	}

}


?>