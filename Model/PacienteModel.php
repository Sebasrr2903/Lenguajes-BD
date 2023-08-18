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
    $sentencia = $getConection->prepare("BEGIN AgregarPaciente(:Nombre, :Apellido, :Cedula, :Telefono, :Correo); END;");
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
    $sentencia = $getConection->prepare("BEGIN EditarPaciente(:ID, :Nombre, :Apellido, :Cedula, :Telefono, :Correo ); END;");
    $sentencia->bindParam(':ID', $idPaciente);
    $sentencia->bindParam(':Nombre',$nombrePaciente);
    $sentencia->bindParam(':Apellido',$apellidoPaciente);
    $sentencia->bindParam(':Cedula',$cedulaPaciente);
    $sentencia->bindParam(':Telefono',$telefonoPaciente);
    $sentencia->bindParam(':Correo',$correoPaciente);
    $sentencia->execute();

    return $sentencia;
}

?>