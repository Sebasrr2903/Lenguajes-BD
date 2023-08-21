<?php

function ListarFactura()
{
  require_once('ConnBD.php');
  $conex = new Conexion();

  $getConection = $conex->Conectar();

  $stmt = $getConection->prepare("SELECT * FROM VistaFacturas");
  $stmt->execute();

  return $stmt;
}

function AgregarFacturaModel($IdCita, $IdReceta, $CostoAdicional)
{
    require_once('ConnBD.php');
    $conex = new Conexion();

    $getConection = $conex->Conectar();
    $sentencia = $getConection->prepare("BEGIN PACKFACTURAS.AgregarFactura(:IDCita, :IDReceta, :CostoAd); END;");
    $sentencia->bindParam(':IDCita',$IdCita);
    $sentencia->bindParam(':IDReceta',$IdReceta);
    $sentencia->bindParam(':CostoAd',$CostoAdicional);
    $sentencia->execute();

    return $sentencia;
}

function EditarFacturaModel($Id, $IdCita, $IdReceta,$CostoAdicional, $Total)
{
    require_once('ConnBD.php');
    $conex = new Conexion();

    $getConection = $conex->Conectar();
    $sentencia = $getConection->prepare("BEGIN EditarFactura(:ID, :IdCita, :IdReceta, :CostoAdicional, :Total); END;");
    $sentencia->bindParam(':ID', $Id);
    $sentencia->bindParam(':IdCita',$IdCita);
    $sentencia->bindParam(':IdReceta',$IdReceta);
    $sentencia->bindParam(':CostoAdicional',$CostoAdicional);
    $sentencia->bindParam(':Total',$Total);
    $sentencia->execute();

    return $sentencia;
}

function EliminarFacturaModel($Id)
{
    require_once('ConnBD.php');
    $conex = new Conexion();

    $getConection = $conex->Conectar();
    $sentencia = $getConection->prepare("BEGIN PACKFACTURAS.EliminarFactura(:ID); END;");
    $sentencia->bindParam(':ID', $Id);

    $sentencia->execute();

    return $sentencia;
}

?>