<?php
include_once 'generales.php';

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
   <title>Tablas</title>
   <meta name="keywords" content="">
   <meta name="description" content="">
   <meta name="author" content="">
   <!-- bootstrap css -->
   <?php
   links();

   ?>
</head>

<body>
   <div class="header_section">
      <?php

      Navbar();

      ?>
   </div>
   <div class="news_section layout_padding">
   <div class="container">
      <h1 class="health_taital">Administre la informacion</h1>
      <!-- Omití el contenido del párrafo -->
      <div class="news_section_2 layout_padding">
         <div class="row">
            <div class="col-lg-4 col-sm-6">
               <a href="empleados.php">
                  <div class="box_main">
                     <div class="icon_1"><img src="images/icons8-doctor-70.png"></div>
                     <h4 class="daily_text_1">Empleados</h4>
                  </div>
               </a>
            </div>
            <div class="col-lg-4 col-sm-6">
               <a href="pacientes.php">
                  <div class="box_main">
                     <div class="icon_1"><img src="images/icons8-paciente-70.png"></div>
                     <h4 class="daily_text_1">Pacientes</h4>
                  </div>
               </a>
            </div>
            <div class="col-lg-4 col-sm-6">
            <a href="citas.php">
                  <div class="box_main">
                     <div class="icon_1"><img src="images/icons8-lista-corta-100.png"></div>
                     <h4 class="daily_text_1">Citas</h4>
                  </div>
               </a>
            </div>
            <!-- Nueva caja -->
            <div class="col-lg-4 col-sm-6">
               <a href="servicios.php">
                  <div class="box_main">
                     <div class="icon_1"><img src="images/icons8-servicios-100.png"></div>
                     <h4 class="daily_text_1">Servicios</h4>
                  </div>
               </a>
            </div>
            <div class="col-lg-4 col-sm-6">
               <div class="box_main">
                  <div class="icon_1"><img src="images/icons8-factura-100.png"></div>
                  <h4 class="daily_text_1">Receta</h4>
               </div>
            </div>
            <div class="col-lg-4 col-sm-6">
               <div class="box_main">
                  <div class="icon_1"><img src="images/icons8-pastillas-100.png"></div>
                  <h4 class="daily_text_1">Medicamentos</h4>
               </div>
            </div>
         </div>
         <div class="row justify-content-center">
            <div class="col-lg-4 col-sm-6 ">
               <div class="box_main">
                  <div class="icon_1"><img src="images/icons8-revisión-de-salud-100.png"></div>
                  <h4 class="daily_text_1">Diagnosticos</h4>
               </div>
            </div>
      </div>
   </div>
</div>




   <!-- news section end -->
   <!-- footer section start -->
   <?php
   footer();


   ?>

   <!-- copyright section end -->
  <?php
  Scripts();

  ?>
</body>

</html>