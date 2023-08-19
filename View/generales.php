<?php 

function  links(){
echo ' <!-- bootstrap css -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<!-- style css -->
<link rel="stylesheet" href="assets/css/style.css">
<!-- Responsive-->
<link rel="stylesheet" href="assets/css/responsive.css">
<!-- fevicon -->
<link rel="icon" href="images/fevicon.png" type="image/gif" />
<!-- Scrollbar Custom CSS -->
<link rel="stylesheet" href="assets/css/jquery.mCustomScrollbar.min.css">
<!-- Tweaks for older IEs-->
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
<!-- owl stylesheets --> 
<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="assets/css/owl.theme.default.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">';

}

function Navbar(){

    echo '
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
       <div class="logo"><a href="index.php"><img src="images/logo.png"></a></div>
       <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
       </button>
       <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
             <li class="nav-item active">
                <a class="nav-link" href="index.php">Inicio</a>
             </li>
             <!-- <li class="nav-item">
                <a class="nav-link" href="medicine.html">Medicina</a>
             </li> ESTO NO TIENE NINGUNA FUNCIONALIDAD-->
             <li class="nav-item">
                <a class="nav-link" href="tablas.php">Tablas</a>
             </li>
             <li class="nav-item">
                <a class="nav-link" href="contact.php">Contactar</a>
             </li>
             <li class="nav-item">
                <a class="nav-link" href="#"><img src="images/search-icon.png"></a>
             </li>
          </ul>
       </div>
    </nav>
  ';


}


function footer(){
echo '<div class="footer_section layout_padding">
<div class="container">
  <div class="row">
    <div class="col-lg-3 col-sm-6">
      <div class="footer_logo"><a href="index.php"><img src="images/footer-logo.png"></a></div>
      <h1 class="adderss_text">Contáctenos</h1>
      <div class="map_icon"><img src="images/map-icon.png"><span class="paddlin_left_0">123 Calle Principal, Ciudad, País</span></div>
      <div class="map_icon"><img src="images/call-icon.png"><span class="paddlin_left_0">+7586656566</span></div>
      <div class="map_icon"><img src="images/mail-icon.png"><span class="paddlin_left_0">volim@gmail.com</span></div>
    </div>
    <div class="col-lg-3 col-sm-6">
      <h1 class="adderss_text">Doctores</h1>
      <div class="hiphop_text_1">Nuestro equipo de médicos experimentados está listo para brindar servicios de atención médica de alta calidad a nuestros pacientes.</div>
    </div>
    <div class="col-lg-3 col-sm-6">
      <h1 class="adderss_text">Enlaces Útiles</h1>
      <div class="Useful_text">Explora nuestro sitio web para encontrar información útil y recursos para mantener una buena salud.</div>
    </div>
    <div class="col-lg-3 col-sm-6">
      <h1 class="adderss_text">Boletín de Noticias</h1>
      <input type="text" class="Enter_text" placeholder="Ingresa tu correo electrónico" name="Ingresa tu correo electrónico">
      <div class="subscribe_bt"><a href="#">Suscribirse</a></div>
      <div class="social_icon">
        <ul>
          <li><a href="#"><img src="images/fb-icon.png"></a></li>
          <li><a href="#"><img src="images/twitter-icon.png"></a></li>
          <li><a href="#"><img src="images/linkedin-icon.png"></a></li>
          <li><a href="#"><img src="images/instagram-icon.png"></a></li>
        </ul>
      </div>
    </div>
  </div>
</div>
</div>


';
}



function Scripts(){

    echo'<script src="js/jquery.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/jquery-3.0.0.min.js"></script>
    <script src="js/plugin.js"></script>
    <!-- sidebar -->
    <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="js/custom.js"></script>
    <!-- javascript -->
    <script src="js/owl.carousel.js"></script>
    <script src="https:cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>';


}