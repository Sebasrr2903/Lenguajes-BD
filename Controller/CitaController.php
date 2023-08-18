<?php

include_once __DIR__ . '\..\Model\CitasModel.php';
function CitaLista()
{
    $stmt = ListarCitas();
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        echo '<tr>';
        echo '<td>' . $row["idcita"] . '</td>';
        echo '<td>' . utf8_encode($row["nompaciente"]) . '</td>';
        echo '<td>' . utf8_encode($row["apellidopaciente"]) . '</td>';
        echo '<td>' . $row["estadocita"] . '</td>';
        echo '<td>' . $row["fechacita"] . '</td>';
        echo '<td><a type="button" href="citasEditar.php?q=' . $row['idcita'] . '" class="btn btn-outline-secondary" style="background-color:blue;">Editar</a>';
        echo '<td><a type="button" href="citasEliminar.php?id=' . $row['idcita'] . '"class="btn btn-outline-danger" style="background-color:red;" >Eliminar</a>';
        echo '</tr>';
    }
}


if (isset($_POST["agregarCita"])) {
    $IdServicio=$_POST["IdServi"];
    $IdPaciente= $_POST["IdPacien"];
    $IdEmpleado= $_POST["IdEmpl"];
    $Estado= $_POST["Estado"];
    $Fecha= $_POST["Fecha"];
    AgregarCitaModel($IdPaciente, $IdEmpleado, $IdServicio,  $Fecha, $Estado);
    header("Location: citas.php");
}


if (isset($_POST["editarCita"])) {
    $ID = $_POST["ID"];
    $IdServicio=$_POST["IdServi"];
    $IdPaciente= $_POST["IdPacien"];
    $IdEmpleado= $_POST["IdEmpl"];
    $Estado= $_POST["Estado"];
    $Fecha= $_POST["Fecha"];


    EditarCitaModel($ID, $IdPaciente, $IdEmpleado, $IdServicio, $Fecha, $Estado );
    header("Location: citas.php");
}

?>