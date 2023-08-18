<?php

include_once __DIR__ . '\..\Model\DiagnosticoModel.php';

function DiagnosticoLista()
{
  $stmt = ListarDiagnostico();
  while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    echo '<tr>';
    echo '<td>' . $row["iddiagnostico"] . '</td>';
    echo '<td>' . $row["idcita"] . '</td>';
    echo '<td>' . utf8_encode($row["nompaciente"]) . '</td>';
    echo '<td>' . utf8_encode($row["nomempleado"]) . '</td>';
    echo '<td>' . utf8_encode($row["rolempleado"]) . '</td>';
    echo '<td>' . utf8_encode($row["descdiagnostico"]) . '</td>';
    echo '<td><a type="button" href="diagnosticoEditar.php?q=' . $row['iddiagnostico'] . '" class="btn btn-outline-secondary" style="background-color:blue;">Editar</a>';
    echo '<td><a type="button" href="diagnosticosEliminar.php?id=' . $row['iddiagnostico'] . '"class="btn btn-outline-danger" style="background-color:red;" >Eliminar</a>';
    echo '</tr>';
  }
}

if (isset($_POST["agregarDiagnostico"])) {
  $idCita = $_POST["IdCita"];
  $Diagnostico = $_POST["descDiag"];



  AgregarDiagnosticoModel($idCita, $Diagnostico);
  header("Location: diagnosticos.php");
}




if (isset($_POST["editarDiagnostico"])) {
  $Id = $_POST["ID"];
  $idCita = $_POST["idcita"];
  $Diagnostico = $_POST["descdiag"];



  EditarDiagnosticoModel( $Id,$idCita, $Diagnostico);
  header("Location: diagnosticos.php");
}


?>