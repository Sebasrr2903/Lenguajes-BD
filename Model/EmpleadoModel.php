<?php

function ListarEmpleado()
{
  require_once('ConnBD.php');
  $conex = new Conexion();

  $getConection = $conex->Conectar();

  $stmt = $getConection->prepare("SELECT*FROM EMPLEADOS");
  $stmt->execute();

  return $stmt;
}

function AgregarEmpleadoModel($NombreEmp, $ApellidoEmp, $CedulaEmp, $PuestoEmp)
{
    require_once('ConnBD.php');
    $conex = new Conexion();

    $getConection = $conex->Conectar();
    $sentencia = $getConection->prepare("BEGIN AgregarEmpleado(:Nombre, :Apellido, :Cedula, :Rol); END;");
    $sentencia->bindParam(':Nombre',$NombreEmp);
    $sentencia->bindParam(':Apellido',$ApellidoEmp);
    $sentencia->bindParam(':Cedula',$CedulaEmp);
    $sentencia->bindParam(':Rol',$PuestoEmp);
    $sentencia->execute();

    return $sentencia;
}

function EditarEmpleadoModel($Id, $NombreEmp, $ApellidoEmp, $PuestoEmp)
{
    require_once('ConnBD.php');
    $conex = new Conexion();

    $getConection = $conex->Conectar();
    $sentencia = $getConection->prepare("BEGIN Editarempleado(:ID, ); END;");
    $sentencia->bindParam(':ID', $Id);
    $sentencia->bindParam(':', $NombreEmp);
    $sentencia->bindParam(':', $ApellidoEmp);
    $sentencia->bindParam(':', $TelefonoEmp);
    $sentencia->bindParam(':', $CedulaEmp);
    $sentencia->bindParam(':', $EmailEmp);
    $sentencia->bindParam(':', $PuestoEmp);
    $sentencia->bindParam(':', $SalarioEmp);
    $sentencia->execute();

    return $sentencia;
}

?>