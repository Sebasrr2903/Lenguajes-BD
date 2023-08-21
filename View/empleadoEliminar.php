<?php

include_once __DIR__ . '/../Model/ConnBD.php';

include_once __DIR__ . '\..\Model\EmpleadoModel.php';

$conex = new Conexion(); 
$getConection= $conex-> Conectar(); 
 

$ci=$_GET['id']; 
echo $ci;

try{
    EliminarEmpleadoModel($ci);

    echo"Se elimino con exito";
    header('Location: '.'empleados.php');
}catch(PDOException $e){
    echo"No se elimino el dato por el error:" .$e->getMessage();
}

?>