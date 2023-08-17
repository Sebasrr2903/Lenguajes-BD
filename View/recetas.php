<?php
include_once 'generales.php';
include_once __DIR__ . '\..\Controller\RecetasController.php';
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
   <title>Recetas</title>
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
            <h2 style="text-align: center; color: black;">Tabla de Recetas <img src="images/icons8-factura-100.png">
            </h2>
            <div style="text-align: center;">
               <a style="align-items: center; background-color: #252525; color:white; " class="btn btn-outline-info c"
                  href="RecetaAgregar.php" type="button">Agregar un Receta</a>
            </div>

            <div class="outer-wrapper">
               <div class="table-wrapper">
                  <table id="tbDatos" class="table table-bordered table-hover table-dark table-fixed">
                     <thead>
                        <tr>
                           <th>id</th>
                           <th>Nombre del paciente</th>
                           <th>Apellido del paciente</th>
                           <th>Diagnostico</th>
                           <th>Medicamento</th>
                           <th>Cantidad</th>
                           <th></th>
                           <th></th>

                        </tr>
                     </thead>
                     <tbody>
                        <?php
                        RecetaLista();
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