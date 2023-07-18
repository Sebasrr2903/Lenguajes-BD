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
    $sentencia = $getConection->prepare("BEGIN AgregarEmpleado(:Nombre, :Apellido, :Cedula, :Rol, :Telefono, :Correo); END;");
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
    $sentencia = $getConection->prepare("BEGIN EditarEmpleado(:ID, :Nombre, :Apellido, :Cedula, :Rol, :Telefono, :Correo ); END;");
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