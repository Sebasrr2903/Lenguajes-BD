<?php

include_once __DIR__ . '\..\Model\RecetasModel.php';
function RecetaLista()
{
    $stmt = ListarRecetas();
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        echo '<tr>';
        echo '<td>' . $row["idreceta"] . '</td>';
        echo '<td>' . $row["nompaciente"] . '</td>';
        echo '<td>' . $row["apellidopaciente"] . '</td>';
        echo '<td>' . $row["descdiagnostico"] . '</td>';
        echo '<td>' . $row["nommedicamento"] . '</td>';
        echo '<td>' . $row["cantidad"] . '</td>';
        echo '<td><a type="button" href="recetaEditar.php?q=' . $row['idreceta'] . '" class="btn btn-outline-secondary" style="background-color:blue;">Editar</a>';
        echo '<td><a type="button" href="recetaEliminar.php?id=' . $row['idreceta'] . '"class="btn btn-outline-danger" style="background-color:red;" >Eliminar</a>';
        echo '</tr>';
    }
}


if (isset($_POST["agregarReceta"])) {
    $IdDiagnostico=$_POST["IdDiagno"];
    $IdMedicamento= $_POST["IdMedica"];
    $Cantidad= $_POST["Cant"];
    AgregarRecetaModel($IdDiagnostico, $IdMedicamento, $Cantidad);
    header("Location: recetas.php");
}


if (isset($_POST["editarReceta"])) {
    $ID = $_POST["ID"];
    $IdDiagnostico=$_POST["IdDiagno"];
    $IdMedicamento= $_POST["IdMedica"];
    $Cantidad= $_POST["Cant"];


    EditarRecetaModel($ID,$IdDiagnostico, $IdMedicamento, $Cantidad);
    header("Location: recetas.php");
}

?>