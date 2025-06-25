<?php

  require("model/user.php");

  $user = new User(  $_GET['id']  );

?>

  <form action="save.php"  method="POST" >

    
  	<input type="hidden" name="id"  value="<?php echo $user->getId(); ?>"  >


  	<input type="text" name="username"  value="<?php echo $user->username; ?>"  >

  	<br>

  	<input type="password" name="password"  value="<?php echo $user->password; ?>"  >

  	<br>

  	<input type="submit"  value="speichern" >

  </form>
