<?php

include_once __DIR__ . '/../Model/ConnBD.php';

include_once __DIR__ . '\..\Model\ContactoModel.php';

$conex = new Conexion(); 
$getConection= $conex-> Conectar(); 
 

try{
    EliminarContactosModel();

    echo"Se elimino con exito";
    header('Location: '.'contactos.php');
}catch(PDOException $e){
    echo"No se elimino el dato por el error:" .$e->getMessage();
}

?>