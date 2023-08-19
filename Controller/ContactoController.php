
<?php

include_once __DIR__ . '\..\Model\ContactoModel.php';
function ContactoLista()
{
    $stmt = ListarContactos();
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        echo '<tr>';
        echo '<td>' . $row["idcontacto"] . '</td>';
        echo '<td>' . utf8_encode($row["nombre"]) . '</td>';
        echo '<td>' . utf8_encode($row["apellido"]) . '</td>';
        echo '<td>' . $row["telefono"] . '</td>';
        echo '<td>' . utf8_encode($row["mensaje"]) . '</td>';
        //echo '<td><a type="button" href="citasEditar.php?q=' . $row['idcita'] . '" class="btn btn-outline-secondary" style="background-color:blue;">Editar</a>';
        //echo '<td><a type="button" href="citasEliminar.php?id=' . $row['idcita'] . '"class="btn btn-outline-danger" style="background-color:red;" >Eliminar</a>';
        echo '</tr>';
    }
}


if (isset($_POST["agregarContacto"])) {
    $Nombre=$_POST["Nombre"];
    $Apellido= $_POST["Apellido"];
    $Telefono= $_POST["Telefono"];
    $Mensaje= $_POST["Mensaje"];
    AgregarContactoModel($Nombre, $Apellido, $Telefono, $Mensaje);
    header("Location: index.php");
}

?>