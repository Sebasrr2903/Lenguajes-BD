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
   <title>HomeCare</title>
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
      <!-- banner section start -->
      <div id="main_slider" class="carousel slide" data-ride="carousel">
   <div class="carousel-inner">
      <div class="carousel-item active">
         <div class="banner_section">
            <div class="container">
               <div class="row">
                  <div class="col-md-6">
                     <h1 class="banner_taital">Cuidado de <br><span style="color: #151515;">Salud</span></h1>
                     <div class="btn_main">
                        <div class="more_bt"><a href="tablas.php">Administrar Tablas</a></div>
   
                     </div>
                  </div>
                  <div class="col-md-6">
                     <div class="image_1"><img src="images/img-1.png"></div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <div class="carousel-item">
         <div class="banner_section">
            <div class="container">
               <div class="row">
                  <div class="col-md-6">
                     <h1 class="banner_taital">Cuidado de <br><span style="color: #151515;">Salud</span></h1>
                     <div class="btn_main">
                     </div>
                  </div>
                  <div class="col-md-6">
                     <div class="image_1"><img src="images/img-1.png"></div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <div class="carousel-item">
         <div class="banner_section">
            <div class="container">
               <div class="row">
                  <div class="col-md-6">
                     <h1 class="banner_taital">Cuidado de <br><span style="color: #151515;">Salud</span></h1>
                     
                     <div class="btn_main">
                     </div>
                  </div>
                  <div class="col-md-6">
                     <div class="image_1"><img src="images/img-1.png"></div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <a class="carousel-control-prev" href="#main_slider" role="button" data-slide="prev">
      <i class="fa fa-long-arrow-left" style="font-size:24px; padding-top: 4px;"></i>
   </a>
   <a class="carousel-control-next" href="#main_slider" role="button" data-slide="next">
      <i class="fa fa-long-arrow-right" style="font-size:24px; padding-top: 4px;"></i>
   </a>
</div>
<!-- sección de banner termina -->
<!-- sección de salud comienza -->
<div class="health_section layout_padding">
   <div class="container">
      <h1 class="health_taital">Lo Mejor en Cuidado de Salud para Ti</h1>
      <div class="health_section layout_padding">
         <div class="row">
            <div class="col-sm-7">
               <div class="image_main">
                  <div class="main">
                     <img src="images/img-2.png" alt="Avatar" class="image" style="width:100%">
                  </div>
                  <div class="middle">
                     <div class="text"><img src="images/icon-1.png" style="width: 40px;"></div>
                  </div>
               </div>
            </div>
            <div class="col-sm-5">
               <div class="image_main_1">
                  <div class="main">
                     <img src="images/img-3.png" alt="Avatar" class="image" style="width:100%">
                  </div>
                  <div class="middle">
                     <div class="text"><img src="images/icon-1.png" style="width: 40px;"></div>
                  </div>
               </div>
            </div>
         </div>
         <div class="getquote_bt_1"><a href="#">Leer Más <span><img src="images/right-arrow.png"></span></a></div>
      </div>
   </div>
</div>
<!-- sección de salud termina -->
<!-- sección de clientes comienza -->
<div class="client_section layout_padding">
   <div id="my_slider" class="carousel slide" data-ride="carousel">
      <div class="carousel-inner">
         <div class="carousel-item active">
            <div class="container">
               <h1 class="client_taital">Lo que la Gente Dice</h1>
               <p class="client_text">Es un hecho establecido de que un lector se distraerá </p>
               <div class="client_section_2">
                  <div class="client_left">
                     <div><img src="images/client-img.png" class="client_img"></div>
                  </div>
                  <div class="client_right">
                     <h3 class="distracted_text">Distraído por</h3>
                     <p class="lorem_text">Es un hecho establecido de que un lector se distraerá con el contenido legible de una página al observar su diseño. El punto de usar Lorem Ipsum es que tiene una distribución de letras más o menos normal</p>
                     <div class="quote_icon"><img src="images/quote-icon.png"></div>
                  </div>
               </div>
            </div>
         </div>
         <div class="carousel-item">
            <div class="container">
               <h1 class="client_taital">Lo que la Gente Dice</h1>
               <p class="client_text">Es un hecho establecido de que un lector se distraerá </p>
               <div class="client_section_2">
                  <div class="client_left">
                     <div><img src="images/client-img.png" class="client_img"></div>
                  </div>
                  <div class="client_right">
                     <h3 class="distracted_text">Distraído por</h3>
                     <p class="lorem_text">Es un hecho establecido de que un lector se distraerá con el contenido legible de una página al observar su diseño. El punto de usar Lorem Ipsum es que tiene una distribución de letras más o menos normal</p>
                     <div class="quote_icon"><img src="images/quote-icon.png"></div>
                  </div>
               </div>
            </div>
         </div>
         <div class="carousel-item">
            <div class="container">
               <h1 class="client_taital">Lo que la Gente Dice</h1>
               <p class="client_text">Es un hecho establecido de que un lector se distraerá </p>
               <div class="client_section_2">
                  <div class="client_left">
                     <div><img src="images/client-img.png" class="client_img"></div>
                  </div>
                  <div class="client_right">
                     <h3 class="distracted_text">Distraído por</h3>
                     <p class="lorem_text">Es un hecho establecido de que un lector se distraerá con el contenido legible de una página al observar su diseño. El punto de usar Lorem Ipsum es que tiene una distribución de letras más o menos normal</p>
                     <div class="quote_icon"><img src="images/quote-icon.png"></div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <a class="carousel-control-prev" href="#my_slider" role="button" data-slide="prev">
         <i class="fa fa-long-arrow-left" style="font-size:24px; padding-top: 4px;"></i>
      </a>
      <a class="carousel-control-next" href="#my_slider" role="button" data-slide="next">
         <i class="fa fa-long-arrow-right" style="font-size:24px; padding-top: 4px;"></i>
      </a>
   </div>
</div>

   <!-- client section end -->
   <!-- footer section start -->
  <?php
  footer();
  ?>
  
   <!-- copyright section end -->
   <!-- Javascript files-->
<?php 
Scripts();
?>
</body>

</html>