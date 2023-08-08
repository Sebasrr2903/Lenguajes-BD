<?php

include_once __DIR__ . '\..\Model\EmpleadoModel.php';

function Empleadolista()
{
  $stmt = ListarEmpleado();
  while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    echo '<tr>';
    echo '<td>' . $row["idempleado"] . '</td>';
    echo '<td>' . $row["nomempleado"] . '</td>';
    echo '<td>' . $row["apellidoempleado"] . '</td>';
    echo '<td>' . $row["cedulaempleado"] . '</td>';
    echo '<td>' . $row["rolempleado"] . '</td>';
    echo '<td>' . $row["telefonoempleado"] . '</td>';
    echo '<td>' . $row["correoempleado"] . '</td>';
    echo '<td><a type="button" href="empleadoEditar.php?q=' . $row['idempleado'] . '" class="btn btn-outline-secondary" style="background-color:blue;">Editar</a>';
    echo '<td><a type="button" href="empleadoEliminar.php?id=' . $row['idempleado'] . '"class="btn btn-outline-danger" style="background-color:red;" >Eliminar</a>';
    echo '</tr>';
  }
}

if (isset($_POST["agregarEmp"])) {
  $CedulaEmp = $_POST["Cedula"];
  $NombreEmp = $_POST["Nombre"];
  $ApellidoEmp = $_POST["Apellido"];
  $PuestoEmp = $_POST["Rol"];
  $TelefonoEmp = $_POST["Telefono"];
  $CorreoEmp = $_POST["Correo"];


  AgregarEmpleadoModel($NombreEmp, $ApellidoEmp, $CedulaEmp, $PuestoEmp, $TelefonoEmp, $CorreoEmp);
  header("Location: empleados.php");
}




if (isset($_POST["editarEmp"])) {
  $Id = $_POST["ID"];
  $CedulaEmp = $_POST["Cedula"];
  $NombreEmp = $_POST["Nombre"];
  $ApellidoEmp = $_POST["Apellido"];
  $PuestoEmp = $_POST["Rol"];
  $TelefonoEmp = $_POST["Telefono"];
  $CorreoEmp = $_POST["Correo"];


  EditarEmpleadoModel( $Id,$NombreEmp, $ApellidoEmp, $CedulaEmp, $PuestoEmp, $TelefonoEmp, $CorreoEmp);
  header("Location: empleados.php");
}


?>