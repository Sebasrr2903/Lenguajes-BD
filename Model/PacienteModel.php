<?php 

function ListarPaciente()
{
  require_once('ConnBD.php');
  $conex = new Conexion();
  $getConection = $conex->Conectar();
  $stmt = $getConection->prepare("SELECT * FROM VistaPacientes");
  $stmt->execute();
  return $stmt;
}

function AgregarPacienteModel($nombrePaciente, $apellidoPaciente, $cedulaPaciente, $telefonoPaciente, $correoPaciente)
{
    require_once('ConnBD.php');
    $conex = new Conexion();

    $getConection = $conex->Conectar();
    $nombrePaciente = utf8_decode($nombrePaciente);
    $apellidoPaciente = utf8_decode($apellidoPaciente);
    $sentencia = $getConection->prepare("BEGIN PACKPACIENTES.AgregarPaciente(:Nombre, :Apellido, :Cedula, :Telefono, :Correo); END;");
    $sentencia->bindParam(':Nombre',$nombrePaciente);
    $sentencia->bindParam(':Apellido',$apellidoPaciente);
    $sentencia->bindParam(':Cedula',$cedulaPaciente);
    $sentencia->bindParam(':Telefono',$telefonoPaciente);
    $sentencia->bindParam(':Correo',$correoPaciente);
    $sentencia->execute();

    return $sentencia;
}

function EditarPacienteModel($idPaciente, $nombrePaciente, $apellidoPaciente,$cedulaPaciente, $telefonoPaciente,$correoPaciente)
{
    require_once('ConnBD.php');
    $conex = new Conexion();


    $getConection = $conex->Conectar();
    $nombrePaciente = utf8_decode($nombrePaciente);
    $apellidoPaciente = utf8_decode($apellidoPaciente);
    $sentencia = $getConection->prepare("BEGIN PACKPACIENTES.EditarPaciente(:ID, :Nombre, :Apellido, :Cedula, :Telefono, :Correo ); END;");
    $sentencia->bindParam(':ID', $idPaciente);
    $sentencia->bindParam(':Nombre',$nombrePaciente);
    $sentencia->bindParam(':Apellido',$apellidoPaciente);
    $sentencia->bindParam(':Cedula',$cedulaPaciente);
    $sentencia->bindParam(':Telefono',$telefonoPaciente);
    $sentencia->bindParam(':Correo',$correoPaciente);
    $sentencia->execute();

    return $sentencia;
}


function EliminarPacienteModel($Id)
{
    require_once('ConnBD.php');
    $conex = new Conexion();

    $getConection = $conex->Conectar();
    $sentencia = $getConection->prepare("BEGIN PACKPACIENTES.EliminarPaciente(:ID); END;");
    $sentencia->bindParam(':ID', $Id);

    $sentencia->execute();

    return $sentencia;
}

?>