<?php

require_once( "model/db.php" );

class Artikel
{
	// welche Variablen braucht ein Artikel ?
    private  $id;
	public   $name;
	public   $beschreibung;
	public   $preis;
	public   $kat_id;
	private  $deleted;


	function __construct( $id )
	{	
        if( $id < 1 ) // wenn leerer artikel >> mache nichts 
        {
        	return;
        }

		// user über ID aus DB lesen und in PHP Variablen schreiben
		$db   = DB::getInstanz();
		$sql  = "SELECT * FROM artikel  WHERE deleted = 0 AND  id =  :id ";
		$data = [ ':id' => $id ];									 
		$res  = $db->query( $sql , $data );
		$row  = $db->nextRow( $res );
		
		if( $row ) 
		{
			// db werte in php kopieren 
			$this->id       	= $id;
			$this->name 		= $row['name'];
			$this->beschreibung = $row['beschreibung'];	
			$this->preis        = $row['preis'];	
			$this->kat_id       = $row['kat_id'];	
			$this->deleted      = $row['deleted'];	
		}	
	}


	public function getId()  // Getter 
	{
		return $this->id;
	}
	

	function create()
	{
		$db  = DB::getInstanz();

		$sql = " INSERT INTO artikel  ( name         , 
									    beschreibung ,
									    preis        ,
									    kat_id      )  
		                     VALUES 
		                           ( :name           ,   
		                           	 :beschreibung   ,
		                           	 :preis      	 ,
		                           	 :kat_id           ) ";

        $data = [
        			':name' 		=> $this->name         , 
        			':beschreibung' => $this->beschreibung , 
        			':preis' 		=> $this->preis        , 
        			':kat_id' 		=> $this->kat_id         
        ];		                           

		$res = $db->query( $sql , $data );				
	}


	function update()
	{
		$db = DB::getInstanz();

		$sql = "UPDATE artikel SET  name 	      = :name          ,
								    beschreibung  = :beschreibung  , 
								    preis  		  = :preis         , 
								    deleted		  = :deleted       ,
								    kat_id		  = :kat_id       
							   WHERE
								    id 			  = :id
								 ";	

        $data = [
        			':name' 		=> $this->name         , 
        			':beschreibung' => $this->beschreibung , 
        			':preis' 		=> $this->preis        ,
        			':deleted' 		=> $this->deleted      ,
        			':id' 			=> $this->id  		   ,
        			':kat_id' 	    => $this->kat_id  		   
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
		$sql = "SELECT * FROM artikel WHERE deleted = 0 ";
		$data = [];
        $res = $db->query( $sql , $data );

        $rueckgabe = array(); // leeres array für rückgabe machen

        // solange es eine weitere Zeile gibt .... 
        while(    $row = $db->nextRow( $res )    )  
        {
        	//  []  << heißt: neues Elment hinten ans Array dranhängen
        	$rueckgabe[] = new Artikel(  $row['id']  );
        }

        return $rueckgabe;
	}

}


?>