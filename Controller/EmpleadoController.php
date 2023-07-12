<?php

include_once __DIR__ . '\..\Model\EmpleadoModel.php';

function Empleadolista()
{
  $stmt = ListarEmpleado();
  while($row = $stmt->fetch(PDO::FETCH_ASSOC))
  {
    echo '<tr>';
    echo '<td>' . $row["idempleado"] . '</td>';
    echo '<td>' . $row["nomempleado"] . '</td>';
    echo '<td>' . $row["apellidoempleado"] . '</td>';
    echo '<td>' . $row["cedulaempleado"] . '</td>';
    echo '<td>' . $row["rolempleado"] . '</td>';
    echo '<td><a type="button" href="empleadoEditar.php?q='. $row['idempleado']. '" class="btn btn-outline-secondary">Editar</a>';
    echo '<td><a type="button" href="EliminarEmpleado.php?id='. $row['idempleado']. '"class="btn btn-outline-danger">Eliminar</a>';
    echo '</tr>';
  }
}

if(isset($_POST["agregarEmp"]))
{
  $CedulaEmp = $_POST["Cedula"];
  $NombreEmp= $_POST["Nombre"];
  $ApellidoEmp = $_POST["Apellido"];
  $PuestoEmp = $_POST["Rol"];

  
  AgregarEmpleadoModel($NombreEmp, $ApellidoEmp, $CedulaEmp, $PuestoEmp);
  header("Location: empleados.php");
}




if(isset($_POST["btnConfirmar"]))
{
  $IdEmp = $_POST["id_emp"];
  $CedulaEmp = $_POST["cedula_emp"];
  $NombreEmp= $_POST["nombre_emp"];
  $ApellidoEmp = $_POST["apellido_emp"];
  $TelefonoEmp = $_POST["telefono_emp"];
  $EmailEmp = $_POST["mail_emp"];
  $PuestoEmp = $_POST["rol_emp"];
  $SalarioEmp = $_POST["salario_emp"];

  EditarEmpleadoModel($IdEmp, $NombreEmp, $ApellidoEmp, $TelefonoEmp, $CedulaEmp, $EmailEmp, $PuestoEmp, $SalarioEmp);
  header("Location: Empleado.php");
}



?>