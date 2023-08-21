<?php

function ListarMedicamento()
{
    require_once('ConnBD.php');
    $conex = new Conexion();
    $getConection = $conex->Conectar();
    $stmt = $getConection->prepare("SELECT * FROM VistaMedicamentos");
    $stmt->execute();
    return $stmt;
}

function AgregarMedicamentoModel($Nombre, $Descripcion, $Costo)
{
    require_once('ConnBD.php');
    $conex = new Conexion();


        $getConection = $conex->Conectar();
        $Nombre = utf8_decode($Nombre);
        $Descripcion = utf8_decode($Descripcion);

        $sentencia = $getConection->prepare("BEGIN PACKMEDICAMENTOS.AgregarMedicamento(:Nombre, :Descripcion, :Costo); END;");
        $sentencia->bindParam(':Nombre', $Nombre);
        $sentencia->bindParam(':Descripcion', $Descripcion);
        $sentencia->bindParam(':Costo', $Costo);
        $sentencia->execute();


        return $sentencia;
}



function EditarMedicamentoModel($ID, $Nombre, $Descripcion, $Costo)
{
    require_once('ConnBD.php');
    $conex = new Conexion();

    try {
        $getConection = $conex->Conectar();
        $Nombre = utf8_decode($Nombre);
        $Descripcion = utf8_decode($Descripcion);

        $sentencia = $getConection->prepare("BEGIN PACKMEDICAMENTOS.EditarMedicamento(:ID,:Nombre,:Descripcion,:Costo); END;");
        $sentencia->bindParam(':ID', $ID);
        $sentencia->bindParam(':Nombre', $Nombre);
        $sentencia->bindParam(':Descripcion', $Descripcion);
        $sentencia->bindParam(':Costo', $Costo);
        $sentencia->execute();
        return $sentencia;
    } catch (PDOException $e) {
        echo "Error al editar el Medicamento" . $e->getMessage();
        return false;
    }
}


function EliminarMedicamentoModel($Id)
{
    require_once('ConnBD.php');
    $conex = new Conexion();

    $getConection = $conex->Conectar();
    $sentencia = $getConection->prepare("BEGIN PACKMEDICAMENTOS.EliminarMedicamento(:ID); END;");
    $sentencia->bindParam(':ID', $Id);

    $sentencia->execute();

    return $sentencia;
}