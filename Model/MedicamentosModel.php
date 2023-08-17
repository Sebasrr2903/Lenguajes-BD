<?php 

function ListarMedicamento()
{
  require_once('ConnBD.php');
  $conex = new Conexion();
  $getConection = $conex->Conectar();
  $stmt = $getConection->prepare("SELECT * FROM Medicamentos");
  $stmt->execute();
  return $stmt;
}

function AgregarMedicamentoModel($Nombre, $Descripcion,$Costo)
{
    require_once('ConnBD.php');
    $conex = new Conexion();
    
    try {
        $getConection = $conex->Conectar();
        $sentencia = $getConection->prepare("BEGIN AgregarMedicamento(:Nombre, :Costo, :Descripcion); END;");
        $sentencia->bindParam(':Nombre', $Nombre); 
        $sentencia->bindParam(':Descripcion', $Descripcion);
        $sentencia->bindParam(':Costo', $Costo); 
        return $sentencia;
    } catch (PDOException $e) {
        echo "Error al agregar Medicamento" . $e->getMessage();
        return false;
    }
}



function EditarMedicamentoModel($ID, $Nombre, $Descripcion,$Costo)
{
    require_once('ConnBD.php');
    $conex = new Conexion();

    try {
        $getConection = $conex->Conectar();
        $sentencia = $getConection->prepare("BEGIN EditarMedicamento(:ID,:Nombre,:Descripcion,:Costo); END;");
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
