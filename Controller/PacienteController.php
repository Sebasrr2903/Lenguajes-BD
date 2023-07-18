<?php

include_once __DIR__ . '\..\Model\PacienteModel.php';

function PacienteLista()
{
    $stmt = ListarPaciente();
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        echo '<tr>';
        echo '<td>' . $row["idpaciente"] . '</td>';
        echo '<td>' . $row["nompaciente"] . '</td>';
        echo '<td>' . $row["apellidopaciente"] . '</td>';
        echo '<td>' . $row["cedulapaciente"] . '</td>';
        echo '<td>' . $row["telefonopaciente"] . '</td>';
        echo '<td>' . $row["correopaciente"] . '</td>';
        echo '<td><a type="button" href="pacienteEditar.php?q=' . $row['idpaciente'] . '" class="btn btn-outline-secondary">Editar</a>';
        echo '<td><a type="button" href="pacienteEliminar.php?id=' . $row['idpaciente'] . '"class="btn btn-outline-danger">Eliminar</a>';
        echo '</tr>';
    }
}

if (isset($_POST["agregarPaciente"])) {
    $nombrePaciente = $_POST["Nombre"];
    $apellidoPaciente = $_POST["Apellido"];
    $cedulaPaciente = $_POST["Cedula"];
    $telefonoPaciente = $_POST["Telefono"];
    $correoPaciente = $_POST["Correo"];

    AgregarpacienteModel($nombrePaciente, $apellidoPaciente, $cedulaPaciente, $telefonoPaciente, $correoPaciente);
    header("Location: pacientes.php");
}

if (isset($_POST["editarPaciente"])) {
    $idPaciente = $_POST["ID"];
    $nombrePaciente = $_POST["Nombre"];
    $apellidoPaciente = $_POST["Apellido"];
    $cedulaPaciente = $_POST["Cedula"];
    $telefonoPaciente = $_POST["Telefono"];
    $correoPaciente = $_POST["Correo"];


    EditarpacienteModel($idPaciente, $nombrePaciente, $apellidoPaciente, $cedulaPaciente, $telefonoPaciente, $correoPaciente);
    header("Location: pacientes.php");
}

?>