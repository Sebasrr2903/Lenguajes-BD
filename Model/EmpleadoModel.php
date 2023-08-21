<?php

function ListarEmpleado()
{
  require_once('ConnBD.php');
  $conex = new Conexion();

  $getConection = $conex->Conectar();

  $stmt = $getConection->prepare("SELECT * FROM VistaEmpleados");
  $stmt->execute();

  return $stmt;
}

function AgregarEmpleadoModel($NombreEmp, $ApellidoEmp, $CedulaEmp, $PuestoEmp, $TelefonoEmp, $CorreoEmp)
{
    require_once('ConnBD.php');
    $conex = new Conexion();

    $getConection = $conex->Conectar();

    $NombreEmp = utf8_decode($NombreEmp);
    $ApellidoEmp = utf8_decode($ApellidoEmp);
    $PuestoEmp = utf8_decode($PuestoEmp);

    $nombreEmp = utf8_decode($NombreEmp);
    $sentencia = $getConection->prepare("BEGIN PACKEMPLEADOS.AgregarEmpleado(:Nombre, :Apellido, :Cedula, :Rol, :Telefono, :Correo); END;");
    $sentencia->bindParam(':Nombre',$NombreEmp);
    $sentencia->bindParam(':Apellido',$ApellidoEmp);
    $sentencia->bindParam(':Cedula',$CedulaEmp);
    $sentencia->bindParam(':Rol',$PuestoEmp);
    $sentencia->bindParam(':Telefono',$TelefonoEmp);
    $sentencia->bindParam(':Correo',$CorreoEmp);
    $sentencia->execute();

    return $sentencia;
}

function EditarEmpleadoModel($Id, $NombreEmp, $ApellidoEmp,$CedulaEmp, $PuestoEmp,$TelefonoEmp,$CorreoEmp)
{
    require_once('ConnBD.php');
    $conex = new Conexion();

    $getConection = $conex->Conectar();
    $NombreEmp = utf8_decode($NombreEmp);
    $ApellidoEmp = utf8_decode($ApellidoEmp);
    $PuestoEmp = utf8_decode($PuestoEmp);
    
    $sentencia = $getConection->prepare("BEGIN PACKEMPLEADOS.EditarEmpleado(:ID, :Nombre, :Apellido, :Cedula, :Rol, :Telefono, :Correo ); END;");
    $sentencia->bindParam(':ID', $Id);
    $sentencia->bindParam(':Nombre',$NombreEmp);
    $sentencia->bindParam(':Apellido',$ApellidoEmp);
    $sentencia->bindParam(':Cedula',$CedulaEmp);
    $sentencia->bindParam(':Rol',$PuestoEmp);
    $sentencia->bindParam(':Telefono',$TelefonoEmp);
    $sentencia->bindParam(':Correo',$CorreoEmp);
    $sentencia->execute();

    return $sentencia;
}

?>