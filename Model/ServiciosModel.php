<?php

function ListarServicio()
{
    require_once('ConnBD.php');
    $conex = new Conexion();
    $getConection = $conex->Conectar();
    $stmt = $getConection->prepare("SELECT * FROM SERVICIOS");
    $stmt->execute();
    return $stmt;
}

function AgregarServicioModel($IDServicio, $Nombre, $Descripcion)
{
    require_once('ConnBD.php');
    $conex = new Conexion();

    try {
        $getConection = $conex->Conectar();
        $Nombre = utf8_decode($Nombre);
        $Descripcion = utf8_decode($Descripcion);

        $sentencia = $getConection->prepare("BEGIN PACKSERVICIOS.AgregarServicio(:IDServicio, :Nombre, :Descripcion); END;");
        $sentencia->bindParam(':IDServicio', $IDServicio); // Cambio de variable aquí
        $sentencia->bindParam(':Nombre', $Nombre); // Cambio de variable aquí
        $sentencia->bindParam(':Descripcion', $Descripcion); // Cambio de variable aquí
        $sentencia->execute();
        return $sentencia;
    } catch (PDOException $e) {
        echo "Error al agregar Servicio" . $e->getMessage();
        return false;
    }
}



function EditarServicioModel($ID, $Nombre, $Descripcion)
{
    require_once('ConnBD.php');
    $conex = new Conexion();

    try {
        $getConection = $conex->Conectar();
        $Nombre = utf8_decode($Nombre);
        $Descripcion = utf8_decode($Descripcion);
        $sentencia = $getConection->prepare("BEGIN PACKSERVICIOS.EditarServicio(:ID,:Nombre,:Descripcion); END;");
        $sentencia->bindParam(':ID', $ID);
        $sentencia->bindParam(':Nombre', $Nombre);
        $sentencia->bindParam(':Descripcion', $Descripcion);
        $sentencia->execute();
        return $sentencia;
    } catch (PDOException $e) {
        echo "Error al editar el servicio" . $e->getMessage();
        return false;
    }
}