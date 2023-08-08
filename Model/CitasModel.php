<?php 

function ListarCitas()
{
  require_once('ConnBD.php');
  $conex = new Conexion();
  $getConection = $conex->Conectar();
  $stmt = $getConection->prepare("SELECT * FROM VistaCitas");
  $stmt->execute();
  return $stmt;
}

function AgregarCitaModel( $IdPaciente, $IdEmpleado, $IdServicio, $Estado, $Fecha)
{
    require_once('ConnBD.php');
    $conex = new Conexion();

    $getConection = $conex->Conectar();
    $sentencia = $getConection->prepare("BEGIN AgregarCita(:IDPaciente, :IDEmpleado, :IDServicio, :Estado,:Fecha); END;");
    $sentencia->bindParam(':IDPaciente',$IdPaciente);
    $sentencia->bindParam(':IDEmpleado', $IdEmpleado);
    $sentencia->bindParam(':IDServicio',$IdServicio);
    $sentencia->bindParam(':Estado',$Estado);
    $sentencia->bindParam(':Fecha',$Fecha);
    $sentencia->execute();

    return $sentencia;
}

function EditarCitaModel($ID, $IdPaciente, $IdEmpleado,$IdServicio,$Fecha,$Estado)
{
    require_once('ConnBD.php');
    $conex = new Conexion();

    $getConection = $conex->Conectar();
    $sentencia = $getConection->prepare("BEGIN EditarCita(:ID,:IDPa ,:IDEm ,:IDSer ,:Fecha,:Estado); END;");
    $sentencia->bindParam(':ID', $ID);
    $sentencia->bindParam(':IDPa',$IdPaciente);
    $sentencia->bindParam(':IDEm',$IdEmpleado);
    $sentencia->bindParam(':IDSer',$IdServicio);
    $sentencia->bindParam(':Fecha',$Fecha);
    $sentencia->bindParam(':Estado',$Estado);
    $sentencia->execute();

    return $sentencia;
}
