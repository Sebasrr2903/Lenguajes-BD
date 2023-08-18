<?php

include_once __DIR__ . '\..\Model\ServiciosModel.php';
function ServicioLista()
{
    $stmt = ListarServicio();
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        echo '<tr>';
        echo '<td>' . $row["idservicio"] . '</td>';
        echo '<td>' . utf8_encode($row["nomservicio"]) . '</td>';
        echo '<td>' . utf8_encode($row["descservicio"]) . '</td>';
        echo '<td><a type="button" href="servicioEditar.php?q=' . $row['idservicio'] . '" class="btn btn-outline-secondary" style="background-color:blue;">Editar</a>';
        echo '<td><a type="button" href="servicioEliminar.php?id=' . $row['idservicio'] . '"class="btn btn-outline-danger" style="background-color:red;" >Eliminar</a>';
        echo '</tr>';
    }
}


if (isset($_POST["agregarServicio"])) { 
    $IdServicio = $_POST["IdServi"];
    $Nombre = $_POST["Nombre"];
    $Descripcion = $_POST["Descri"];
    
    
    AgregarServicioModel($IdServicio, $Nombre, $Descripcion);

    header("Location: servicios.php");
}

if (isset($_POST["editarServicio"])) {
    $ID = $_POST["ID"];
    $Nombre = $_POST["Nombre"]; 
    $Descripcion = $_POST["Descri"]; 
   

    EditarServicioModel($ID, $Nombre, $Descripcion); // Cambio de función aquí
   
    header("Location: servicios.php");
}

?>