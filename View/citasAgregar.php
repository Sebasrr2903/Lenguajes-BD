<?php
include_once 'generales.php';
include_once __DIR__ . '\..\Controller\CitaController.php';
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
         <h2 class="health_taital">Agregar Cita</h2>
         <div class="news_section_2">
            <div class="row">
               <div class="col-md-6">
                  <div class="icon_main">
                     <div class="icon_7"><img src="images/icon-7.png"></div>
                     <h4 class="diabetes_text">Agregue la informacion usuario</h4>
                  </div>
                  <div class="icon_main">
                     <div class="icon_7"><img src="images/icon-5.png"></div>
                     <h4 class="diabetes_text">verifica la informacion del usuario</h4>
                  </div>
                  <div class="icon_main">
                     <div class="icon_7"><img src="images/icon-6.png"></div>
                     <h4 class="diabetes_text">Dele en "Confirmar" si realmente desea agregarlo</h4>
                  </div>
               </div>
               <div class="col-md-6">
                  <div class="contact_box">
                     <form action="" method="post">
                        <h1 class="book_text">Agregue la información del usuario</h1>
                        <input type="text" class="Email_text" placeholder="IdPaciente" name="IdPacien">
                        <input type="text" class="Email_text" placeholder="IdEmpl" name="IdEmpl">
                        <input type="text" class="Email_text" placeholder="IdServicio" name="IdServi">
                        <input type="text" class="Email_text" placeholder="Estado" name="Estado">
                        <input type="Text" class="Email_text" placeholder="DD/MM/YY" name="Fecha">
                        
                        <div style="text-align: center; padding: 10px;">
                           <button type="submit" class="btn btn-outline-info btn-lg px-5"
                              style="background-color: #1becde ; padding: 5px 15px; margin-top: 10px;"
                              name="agregarCita"><a style="color: white;">Confirmar</a></button>
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