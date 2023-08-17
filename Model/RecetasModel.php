<?php 

function ListarRecetas()
{
  require_once('ConnBD.php');
  $conex = new Conexion();
  $getConection = $conex->Conectar();
  $stmt = $getConection->prepare("SELECT * FROM VistaRecetas");
  $stmt->execute();
  return $stmt;
}

function AgregarRecetaModel($IdDiagnostico, $IdMedicamento, $Cantidad)
{
    require_once('ConnBD.php');
    $conex = new Conexion();
    try {
        $getConection = $conex->Conectar();
        $sentencia = $getConection->prepare("BEGIN AgregarRecetas(:IDDiagnostico, :IDMedicamento, :Cant); END;");
        $sentencia->bindParam(':IDDiagnostico', $IdDiagnostico); 
        $sentencia->bindParam(':IDMedicamento', $IdMedicamento); 
        $sentencia->bindParam(':Cant', $Cantidad);
        $sentencia->execute();
        return $sentencia;
    } catch (PDOException $e) {
        echo "Error al agregar Receta: " . $e->getMessage();
        return false;
    }
}


function EditarRecetaModel($ID,$IdDiagnostico, $IdMedicamento, $Cantidad){
    require_once('ConnBD.php');
    $conex = new Conexion();

    $getConection = $conex->Conectar();
    $sentencia = $getConection->prepare("BEGIN EditarReceta(:ID,: IDDiag ,:IDMed ,:Cant); END;");
    $sentencia->bindParam(':ID', $ID);
    $sentencia->bindParam(':IDDiag',$IdDiagnostico);
    $sentencia->bindParam(':IDMed',$ $IdMedicamento);
    $sentencia->bindParam(':Cant',$Cantidad);
    $sentencia->execute();
    return $sentencia;
}
