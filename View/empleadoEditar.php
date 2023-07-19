<?php
include_once 'generales.php';
include_once __DIR__ . '\..\Controller\EmpleadoController.php';
include_once __DIR__ . '/../Model/ConnBD.php';

$conex = new Conexion();
$getConection = $conex->Conectar();

$ci = $_GET['q'];
$sql = "select*from EMPLEADOS where  IdEmpleado=$ci";
$stmt = $getConection->prepare($sql);
$stmt->execute();
while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
   $IdEmp = $row['idempleado'];
   $NombreEmp = $row['nomempleado'];
   $ApellidoEmp = $row['apellidoempleado'];
   $TelefonoEmp = $row['telefonoempleado'];
   $CedulaEmp = $row['cedulaempleado'];
   $CorreoEmp = $row['correoempleado'];
   $PuestoEmp = $row['rolempleado'];


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
   <title>Empleados</title>
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
         <h2 class="health_taital">Editar Empleados</h2>
         <div class="news_section_2">
            <div class="row">
               <div class="col-md-6">
                  <div class="icon_main">
                     <div class="icon_7"><img src="images/icon-7.png"></div>
                     <h4 class="diabetes_text">Editar la informacion usuario</h4>
                  </div>
                  <div class="icon_main">
                     <div class="icon_7"><img src="images/icon-5.png"></div>
                     <h4 class="diabetes_text">verifica la informacion del usuario</h4>
                  </div>
                  <div class="icon_main">
                     <div class="icon_7"><img src="images/icon-6.png"></div>
                     <h4 class="diabetes_text">Dele en "Confirmar" si realmente desea editarlo</h4>
                  </div>
               </div>
               <div class="col-md-6">
                  <div class="contact_box">
                     <form action="" method="post">
                        <h1 class="book_text">Editar la información del usuario</h1>
                        <input type="hidden" value="<?php echo $IdEmp ?>" name="ID">
                        <input type="text" class="Email_text" placeholder="Nombre" name="Nombre"
                           value="<?php echo $NombreEmp ?>">
                        <input type="text" class="Email_text" placeholder="Apellido" name="Apellido"
                           value="<?php echo $ApellidoEmp ?>">
                        <input type="text" class="Email_text" placeholder="Rol" name="Rol"
                           value="<?php echo $PuestoEmp ?>">
                        <input type="text" class="Email_text" placeholder="Cédula" name="Cedula"
                           value="<?php echo $CedulaEmp ?>">
                        <input type="tel" class="Email_text" placeholder="Telefono" name="Telefono"
                           value="<?php echo $TelefonoEmp ?>">
                        <input type="email" class="Email_text" placeholder="Correo" name="Correo"
                           value="<?php echo $CorreoEmp ?>">
                           <div style="text-align: center; padding: 15px;">
                           <button type="reset" class="btn btn-outline-info btn-lg px-5"
                              style="background-color: grey ; padding: 5px 15px; margin-top: 10px; margin:15px;"><a
                                 style="color: white;">Restaurar</a></button>

                           <button type="submit" class="btn btn-outline-info btn-lg px-5"
                              style="background-color: #1becde ; padding: 5px 15px; margin-top: 10px; margin:10px;"
                              name="editarEmp"><a style="color: white;">Confirmar</a></button>
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