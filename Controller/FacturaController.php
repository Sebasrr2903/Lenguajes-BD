
<?php

include_once __DIR__ . '\..\Model\FacturaModel.php';

function FacturaLista()
{
  $stmt = ListarFactura();
  while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    echo '<tr>';
    echo '<td>' . $row["idfactura"] . '</td>';
    echo '<td>' . $row["idcita"] . '</td>';
    echo '<td>' . utf8_encode($row["nompaciente"]) . '</td>';
    echo '<td>' .utf8_encode($row["nomservicio"]) . '</td>';
    echo '<td>' . $row["nommedicamento"] . '</td>';
    echo '<td>' . $row["costoadicional"] . '</td>';
    echo '<td>' . $row["total"] . '</td>';
    echo '<td><a type="button" href="facturaEditar.php?q=' . $row['idfactura'] . '" class="btn btn-outline-secondary" style="background-color:blue;">Editar</a>';
    echo '<td><a type="button" href="facturaEliminar.php?id=' . $row['idfactura'] . '"class="btn btn-outline-danger" style="background-color:red;" >Eliminar</a>';
    echo '</tr>';
  }
}

if (isset($_POST["agregarFactura"])) {
  $IdCita = $_POST["IdCita"];
  $IdReceta = $_POST["IdReceta"];
  $CostoAdicional = $_POST["CostoAdicional"];

  AgregarFacturaModel($IdCita, $IdReceta, $CostoAdicional);
  header("Location: facturas.php");
}




if (isset($_POST["editarFactura"])) {
  $Id = $_POST["ID"];
  $IdCita = $_POST["IdCita"];
  $IdReceta = $_POST["IdReceta"];
  $CostoAdicional = $_POST["CostoAdicional"];
  $Total = $_POST["Total"];


  EditarFacturaModel( $Id, $IdCita, $IdReceta,$CostoAdicional, $Total);
  header("Location: facturas.php");
}


?>