<?php
class Conexion{
    public function Conectar(){
    define('HOST', '127.0.0.1');
    define('PORT', 1521);
    define('NAME', 'orcl');
    define('USER', 'canti');
    define('PASS', 'HonDa8512118560745');

    $bd_settings = " (DESCRIPTION =
     (ADDRESS = 
     (PROTOCOL = TCP)
     (HOST = " . HOST . ")
     (PORT = " . PORT . ")
     )
     (CONNECT_DATA =
     (SERVER = DEDICATED)
    (SERVICE_NAME = " . NAME . ")
  )
)
";
try{
  $bd = new PDO('oci:dbname='.$bd_settings, USER, PASS);
  $bd->setAttribute(PDO::ATTR_CASE, PDO::CASE_LOWER);
  $bd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo'CONEXION EXITOSA';
  return $bd;

} catch(Exception $e){
echo "ERROR DE CONEXION: ".$e->getMessage();
}

  }
}

?>
