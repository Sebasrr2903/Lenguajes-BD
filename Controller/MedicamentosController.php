<?php

include_once __DIR__ . '\..\Model\MedicamentosModel.php';
function MedicamentoLista()
{
    $stmt = ListarMedicamento();
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        echo '<tr>';
        echo '<td>' . $row["idmedicamento"] . '</td>';
        echo '<td>' . utf8_encode($row["nommedicamento"]) . '</td>';
        echo '<td>' . utf8_encode($row["descmedicamento"]) . '</td>';
        echo '<td>' . $row["costomedicamento"] . '</td>';
        echo '<td><a type="button" href="medicamentoEditar.php?q=' . $row['idmedicamento'] . '" class="btn btn-outline-secondary" style="background-color:blue;">Editar</a>';
        echo '<td><a type="button" href="MedicamentoEliminar.php?id=' . $row['idmedicamento'] . '"class="btn btn-outline-danger" style="background-color:red;" >Eliminar</a>';
        echo '</tr>';
    }
}


if (isset($_POST["agregarMedicamento"])) { 
    $Nombre = $_POST["Nombre"];
    $Descripcion = $_POST["Descri"];
    $Costo = $_POST["Costo"];
    
    AgregarMedicamentoModel($Nombre, $Descripcion,$Costo);

    header("Location: medicamentos.php");
}

if (isset($_POST["editarMedicamento"])) {
    $ID = $_POST["ID"];
    $Nombre = $_POST["Nombre"]; 
    $Descripcion = $_POST["Descri"];
    $Costo = $_POST["Costo"]; 
   

    EditarMedicamentoModel($ID, $Nombre, $Descripcion,$Costo); // Cambio de función aquí
   
    header("Location: medicamentos.php");
}

?>