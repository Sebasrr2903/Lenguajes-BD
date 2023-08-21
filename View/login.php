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
   <link rel="stylesheet" href="assets/css/login.css">

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
    <?php
            // Verificar si hay un mensaje de error en la URL
            if (isset($_GET['error'])) {
                ?>
                <div id="success-alert" class="alert alert-success" style="display: none;">
                    <div class="alert alert-success">
                        <?php echo $_GET['error']; ?>
                    </div>
                </div>
                <?php
            }
        ?>

    <div class="login-container">
        <div class="form-container">
        <form action="loginSubmit.php" method="post">
                <!-- Login Controls -->
                <div class="login-title"><h2>Iniciar Sesión</h2></div>
                <div class="form-group">
                    <label class="Campo" for="txtUsername">Usuario</label>
                    <input type="text" class="form-control" id="uname" name="uname" placeholder="Username">
                </div>
                <div class="form-group">
                    <label for="txtPassword" class="Campo">Contraseña</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                </div>
                <!-- Login Button -->
                <div class="form-actions" style="margin-top: 12px;">
                    <button type="submit" class="btn btn-success">Aceptar</button>
                </div>
        </form>

        </div>
        
    </div>
    



  <?php
  footer();
  ?>
  
   <!-- copyright section end -->
   <!-- Javascript files-->
<?php 
Scripts();
?>
<script src="js/alert.js"></script>
</body>

</html>