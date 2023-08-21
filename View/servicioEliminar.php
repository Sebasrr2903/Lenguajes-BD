<?php

include_once __DIR__ . '/../Model/ConnBD.php';

$conex = new Conexion(); 
$getConection= $conex-> Conectar(); 
 

$ci=$_GET['id']; 
echo $ci;

try{
    $sql="delete from servicios where IdServicio=$ci" ;
    $stmtl= $getConection->prepare($sql);
    $stmtl->execute();
    echo"Se elimino con exito";
    header('Location: '.'servicios.php');
}catch(PDOException $e){
    echo"No se elimino el dato por el error:" .$e->getMessage();
}

?>