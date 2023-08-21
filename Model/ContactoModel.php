<?php 

function ListarContactos()
{
  require_once('ConnBD.php');
  $conex = new Conexion();
  $getConection = $conex->Conectar();
  
  // Ejecutar el procedimiento almacenado para llenar la tabla temporal
  $stmt = $getConection->prepare("BEGIN SP_LISTAR_CONTACTOS; END;");
  $stmt->execute();
  
  // Ahora, simplemente selecciona los datos de la tabla temporal
  $stmt = $getConection->prepare("SELECT * FROM temp_contactos");
  $stmt->execute();
  
  return $stmt;
}

function AgregarContactoModel( $Nombre, $Apellido, $Telefono, $Mensaje)
{
    require_once('ConnBD.php');
    $conex = new Conexion();
  try{
    $getConection = $conex->Conectar();
    $Nombre = utf8_decode($Nombre);
    $Apellido = utf8_decode($Apellido);
    $Mensaje = utf8_decode($Mensaje);
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

