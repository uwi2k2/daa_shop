<?php

require_once( "model/db.php" );

class Kategorie
{
	// welche Variablen braucht ein Kategorie ?
    private  $id;
	public   $name;
	public   $beschreibung;
	public   $eltern_kat_id;
	private  $deleted;


	function __construct( $id )
	{	
        if( $id < 1 ) // wenn leerer Kategorie >> mache nichts 
        {
        	return;
        }

		// user über ID aus DB lesen und in PHP Variablen schreiben
		$db  = DB::getInstanz();
		$sql = "SELECT * FROM kategorie  WHERE deleted = 0 AND id = :id ";
		$dat = [ 'id' => $id ];
		$res = $db->query( $sql ,  $dat );
		$row = $db->nextRow( $res );
		
		if( $row ) 
		{
			// db werte in php kopieren 
			$this->id       	 = $id;
			$this->name 		 = $row['name'];
			$this->beschreibung  = $row['beschreibung'];		
			$this->eltern_kat_id = $row['eltern_kat_id'];		
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

		$sql = " INSERT INTO kategorie  
		                   (   name   ,   beschreibung  ,  eltern_kat_id  , deleted  )  
		             VALUES 
		                   (   :name  ,  :beschreibung  , :eltern_kat_id  , 0     	) ";

		$data = [
					':name' 		 => $this->name          , 
					':beschreibung'  => $this->beschreibung  , 
					':eltern_kat_id' => $this->eltern_kat_id  
				];

		$res = $db->query( $sql , $data );				
	}


	function update()
	{
		$db  = DB::getInstanz();

		$sql = "UPDATE kategorie SET  name 	          = :name           ,
								      beschreibung    = :beschreibung   ,  
								      eltern_kat_id   = :eltern_kat_id  ,  
								      deleted		  = :deleted    
							   WHERE
								      id 			  = :id
								 ";	

		$data = [
					':name' 		 => $this->name           , 
					':beschreibung'  => $this->beschreibung   , 
					':eltern_kat_id' => $this->eltern_kat_id  , 
					':deleted' 		 => $this->deleted 		  , 
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
		$sql = "SELECT * FROM kategorie WHERE deleted = 0 ";
		$dat = [];
        $res = $db->query( $sql , $dat );

        $rueckgabe = array(); // leeres array für rückgabe machen

        // solange es eine weitere Zeile gibt .... 
        while(    $row = $db->nextRow( $res )    )  
        {
        	//  []  << heißt: neues Elment hinten ans Array dranhängen
        	$rueckgabe[] = new Kategorie(  $row['id']  );
        }

        return $rueckgabe;
	}

}


?>