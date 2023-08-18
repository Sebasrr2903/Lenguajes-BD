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
    $sentencia = $getConection->prepare("BEGIN AgregarDiagnostico(:IdCita, :Diagnostico); END;");
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
    $sentencia = $getConection->prepare("BEGIN EditarDiagnostico(:ID, :IdCita, :Diagnostico); END;");
    $sentencia->bindParam(':ID', $Id);
    $sentencia->bindParam(':IdCita',$idCita);
    $sentencia->bindParam(':Diagnostico',$Diagnostico);
    $sentencia->execute();

    return $sentencia;
}

?>