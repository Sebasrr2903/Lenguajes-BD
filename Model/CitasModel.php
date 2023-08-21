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

function AgregarCitaModel( $IdPaciente, $IdEmpleado, $IdServicio, $Fecha, $Estado)
{
    require_once('ConnBD.php');
    $conex = new Conexion();
  try{
    $getConection = $conex->Conectar();
    $sentencia = $getConection->prepare("BEGIN PACKCITAS.AgregarCita(:IDPaciente, :IDEmpleado, :IDServicio, :Fecha, :Estado); END;");
    $sentencia->bindParam(':IDPaciente',$IdPaciente);
    $sentencia->bindParam(':IDEmpleado', $IdEmpleado);
    $sentencia->bindParam(':IDServicio',$IdServicio);
    $sentencia->bindParam(':Fecha',$Fecha);
    $sentencia->bindParam(':Estado',$Estado);
    $sentencia->execute();
    return $sentencia;
  }catch(PDOException $e){
    echo "Error al agregar cita" . $e->getMessage();
    return false;
  }

}

function EditarCitaModel($ID, $IdPaciente, $IdEmpleado,$IdServicio,$Fecha,$Estado)
{
    require_once('ConnBD.php');
    $conex = new Conexion();

    $getConection = $conex->Conectar();
    $sentencia = $getConection->prepare("BEGIN PACKCITAS.EditarCita(:ID,:IDPa ,:IDEm ,:IDSer ,:Fecha,:Estado); END;");
    $sentencia->bindParam(':ID', $ID);
    $sentencia->bindParam(':IDPa',$IdPaciente);
    $sentencia->bindParam(':IDEm',$IdEmpleado);
    $sentencia->bindParam(':IDSer',$IdServicio);
    $sentencia->bindParam(':Fecha',$Fecha);
    $sentencia->bindParam(':Estado',$Estado, PDO::PARAM_STR);
    $sentencia->execute();
    return $sentencia;
}


function EliminarCitaModel($Id)
{
    require_once('ConnBD.php');
    $conex = new Conexion();

    $getConection = $conex->Conectar();
    $sentencia = $getConection->prepare("BEGIN EliminarCita(:ID); END;");
    $sentencia->bindParam(':ID', $Id);
    
    $sentencia->execute();

    return $sentencia;
}