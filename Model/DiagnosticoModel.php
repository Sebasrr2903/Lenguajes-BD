<?php

function ListarDiagnostico()
{
  require_once('ConnBD.php');
  $conex = new Conexion();

  $getConection = $conex->Conectar();

  $stmt = $getConection->prepare("SELECT * FROM VistaDiagnosticos");
  $stmt->execute();

  return $stmt;
}

function AgregarDiagnosticoModel($idCita, $Diagnostico)
{
    require_once('ConnBD.php');
    $conex = new Conexion();

    $getConection = $conex->Conectar();
    $Diagnostico = utf8_decode($Diagnostico);
    
    $sentencia = $getConection->prepare("BEGIN PACKDIAGNOSTICOS.AgregarDiagnostico(:IdCita, :Diagnostico); END;");
    $sentencia->bindParam(':IdCita',$idCita);
    $sentencia->bindParam(':Diagnostico',$Diagnostico);
    $sentencia->execute();

    return $sentencia;
}

function EditarDiagnosticoModel($Id, $idCita, $Diagnostico)
{
    require_once('ConnBD.php');
    $conex = new Conexion();

    $getConection = $conex->Conectar();
    $Diagnostico = utf8_decode($Diagnostico);

    $sentencia = $getConection->prepare("BEGIN PACKDIAGNOSTICOS.EditarDiagnostico(:ID, :IdCita, :Diagnostico); END;");
    $sentencia->bindParam(':ID', $Id);
    $sentencia->bindParam(':IdCita',$idCita);
    $sentencia->bindParam(':Diagnostico',$Diagnostico);
    $sentencia->execute();

    return $sentencia;
}

function EliminarDiagnosticoModel($Id)
{
    require_once('ConnBD.php');
    $conex = new Conexion();

    $getConection = $conex->Conectar();
    $sentencia = $getConection->prepare("BEGIN PACKDIAGNOSTICOS.EliminarDiagnostico(:ID); END;");
    $sentencia->bindParam(':ID', $Id);
    
    $sentencia->execute();

    return $sentencia;
}



?>