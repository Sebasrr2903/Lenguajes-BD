<?php
include_once 'generales.php';
include_once __DIR__ . '\..\Controller\ContactoController.php';
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
      <title>Contact</title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <!-- bootstrap css -->

      <?php
      links();

      ?>
 
   </head>
   <body>
      <!-- header section start -->
       <?php
       Navbar();

       ?>
      <!-- header section end -->
      <!-- contact section start -->
      <div class="contact_section layout_padding margin_90">
  <div class="container">
    <h1 class="contact_taital">Lo que hacemos</h1>
    <div class="news_section_2">
      <div class="row">
        <div class="col-md-6">
          <div class="icon_main">
            <div class="icon_7"><img src="images/icon-7.png"></div>
            <h4 class="diabetes_text">Asesoramiento sobre diabetes y obesidad</h4>
          </div>
          <div class="icon_main">
            <div class="icon_7"><img src="images/icon-5.png"></div>
            <h4 class="diabetes_text">Obstetricia y ginecología</h4>
          </div>
          <div class="icon_main">
            <div class="icon_7"><img src="images/icon-6.png"></div>
            <h4 class="diabetes_text">Oncología quirúrgica y médica</h4>
          </div>
        </div>
        <div class="col-md-6">
          <div class="contact_box">
            <h1 class="book_text">Contacto</h1>
            <form action="" method="post">
            <input type="text" class="Email_text" placeholder="Nombre" name="Nombre">
            <input type="text" class="Email_text" placeholder="Apellido" name="Apellido">
            <input type="tel" class="Email_text" placeholder="Telefono" name="Telefono">
            <textarea class="Email_text" name="Mensaje" placeholder="Escribe Aqui"></textarea>
            <!-- <input style="height: 150px;" type="text" class="Email_text" placeholder="Escribe aqui" name="Mensaje">-->
            <!--<div class="send_bt"><a href="#">ENVIAR</a></div>-->
            <div style="text-align: center; padding: 10px;">
                <button type="submit" class="btn btn-outline-info btn-lg px-5"
                style="background-color: #1becde ; padding: 5px 15px; margin-top: 20px; border-radius: 0px;"
                name="agregarContacto"><a style="color: white;">ENVIAR</a></button>
            </form>
           </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

      <!-- contact section end -->
      <!-- footer section start -->
     <?php footer(); ?>
      <!-- copyright section end -->



      
      <!-- Javascript files-->
      <script src="js/jquery.min.js"></script>
      <script src="js/popper.min.js"></script>
      <script src="js/bootstrap.bundle.min.js"></script>
      <script src="js/jquery-3.0.0.min.js"></script>
      <script src="js/plugin.js"></script>
      <!-- sidebar -->
      <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
      <script src="js/custom.js"></script>
      <!-- javascript --> 
      <script src="js/owl.carousel.js"></script>
      <script src="https:cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>
   </body>
</html>