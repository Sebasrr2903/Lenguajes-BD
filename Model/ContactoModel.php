<?php 

function ListarContactos()
{
  require_once('ConnBD.php');
  $conex = new Conexion();
  $getConection = $conex->Conectar();
  $stmt = $getConection->prepare("SELECT * FROM VistaContacto");
  $stmt->execute();
  return $stmt;
}

function AgregarContactoModel( $Nombre, $Apellido, $Telefono, $Mensaje)
{
    require_once('ConnBD.php');
    $conex = new Conexion();
  try{
    $getConection = $conex->Conectar();
    $sentencia = $getConection->prepare("BEGIN AgregarContacto(:Nombre, :Apellido, :Telefono, :Mensaje); END;");
    $sentencia->bindParam(':Nombre',$Nombre);
    $sentencia->bindParam(':Apellido', $Apellido);
    $sentencia->bindParam(':Telefono',$Telefono);
    $sentencia->bindParam(':Mensaje',$Mensaje);
    $sentencia->execute();
    return $sentencia;
  }catch(PDOException $e){
    echo "Error al agregar contacto" . $e->getMessage();
    return false;
  }

}

