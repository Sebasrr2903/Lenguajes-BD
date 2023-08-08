<?php
include_once 'generales.php';
include_once __DIR__ . '\..\Controller\CitaController.php';
include_once __DIR__ . '/../Model/ConnBD.php';

$conex = new Conexion();
$getConection = $conex->Conectar();

$ci = $_GET['q'];
$sql = "select*from CITAS where  IdCita=$ci";
$stmt = $getConection->prepare($sql);
$stmt->execute();
while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    $idCitas= $row['idcita'];
    $idpaciente = $row['idpaciente'];
    $idempleado= $row['idempleado'];
    $idservicio = $row['idservicio'];
    $fecha = $row['fechacita'];
    $estado = $row['estadocita'];

}

?>



<!DOCTYPE html>
<html lang="en">

<head>
    <!-- basic -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- mobile metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <!-- site metas -->
    <title>Citass</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">
    <?php
    links()

        ?>
</head>

<body>

    <?php
    Navbar()

        ?>
    <div class="contact_section layout_padding">
        <div class="container">
            <h2 class="health_taital">Editar Citas</h2>
            <div class="news_section_2">
                <div class="row">
                    <div class="col-md-6">
                        <div class="icon_main">
                            <div class="icon_7"><img src="images/icon-7.png"></div>
                            <h4 class="diabetes_text">Editar la informacion del Citas</h4>
                        </div>
                        <div class="icon_main">
                            <div class="icon_7"><img src="images/icon-5.png"></div>
                            <h4 class="diabetes_text">verifica la informacion del Citas</h4>
                        </div>
                        <div class="icon_main">
                            <div class="icon_7"><img src="images/icon-6.png"></div>
                            <h4 class="diabetes_text">Presiona en "Confirmar" si realmente desea editarlo</h4>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="contact_box">
                            <form action="" method="post">
                                <h1 class="book_text">Editar la información del Citas</h1>
                                <input type="hidden" value="<?php echo $idCitas ?>" name="ID">

                                <input type="text" class="Email_text" placeholder="Id del Paciente" name="IdPacien"
                                    value="<?php echo $idpaciente ?>">
                                <input type="text" class="Email_text" placeholder="Apellido" name="IdEmpl"
                                    value="<?php echo $idempleado ?>">
                                <input type="text" class="Email_text" placeholder="Cédula" name="IdServi"
                                    value="<?php echo $idservicio?>">
                                <input type="" class="Email_text" placeholder="Telefono" name="Fecha"
                                    value="<?php echo $fecha ?>">
                                <input type="" class="Email_text" placeholder="Correo" name="Estado"
                                    value="<?php echo $estado ?>">
                                <div style="text-align: center; padding: 15px;">
                                    <button type="reset" class="btn btn-outline-info btn-lg px-5"
                                        style="background-color: grey ; padding: 5px 15px; margin-top: 10px; margin:15px;"><a
                                            style="color: white;">Restaurar</a></button>

                                    <button type="submit" class="btn btn-outline-info btn-lg px-5"
                                        style="background-color: #1becde ; padding: 5px 15px; margin-top: 10px; margin:10px;"
                                        name="editarCita"><a style="color: white;">Confirmar</a></button>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer>
        <?php
        footer();
        ?>

    </footer>

    <?php
    Scripts()
        ?>

</body>

</html>