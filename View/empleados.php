<?php
include_once 'generales.php';
include_once __DIR__ . '\..\Controller\EmpleadoController.php';
?>



<!DOCTYPE html>
<html lang="en">

<head>
   <!-- basic -->
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge" >
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

   <div class="templatemo-content-wrapper">
      <div class="templatemo-content">

         <div class="templatemo-panels">
            <h2 style="text-align: center; color: black;">Tabla de Empleados <img src="images/icons8-doctor-70.png">
            </h2>
            <div style="text-align: center;">
               <a style="align-items: center; background-color: #252525; color:white; " class="btn btn-outline-info c"
                  href="empleadoAgregar.php" type="button">Agregar un Empleado</a>
            </div>

            <div class="outer-wrapper">
               <div class="table-wrapper">
                  <table id="tbDatos" class="table table-bordered table-hover table-dark table-fixed">
                     <thead>
                        <tr>
                           <th>id</th>
                           <th>Cedula</th>
                           <th>Nombre</th>
                           <th>Apellido</th>
                           <th>Puesto</th>
                           <th>Telefono</th>
                           <th>Correo</th>
                           <th></th>
                           <th></th>

                        </tr>
                     </thead>
                     <tbody>
                        <?php
                        Empleadolista();
                        ?>
                     </tbody>
                  </table>

               </div>
            </div>

         </div>
      </div>
   </div>
 
   <br>

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