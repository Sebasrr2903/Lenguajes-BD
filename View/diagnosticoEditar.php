<?php
include_once 'generales.php';
include_once __DIR__ . '\..\Controller\DiagnosticoController.php';
include_once __DIR__ . '/../Model/ConnBD.php';

$conex = new Conexion();
$getConection = $conex->Conectar();

$ci = $_GET['q'];
$sql = "select*from DIAGNOSTICOS where  IdDiagnostico=$ci";
$stmt = $getConection->prepare($sql);
$stmt->execute();
while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
   $IdDiag = $row['iddiagnostico'];
   $idCita = $row['idcita'];
   $Diagnostico = $row['descdiagnostico'];

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
   <title>Diagnosticos</title>
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
         <h2 class="health_taital">Editar Diagnostico</h2>
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
                        <h1 class="book_text">Editar la información del diagnostico</h1>
                        <input type="hidden" value="<?php echo $IdDiag ?>" name="ID">
                        <input type="text" class="Email_text" placeholder="Id cita" name="idcita"
                           value="<?php echo $idCita ?>">
                        <input type="text" class="Email_text" placeholder="Descripcion" name="descdiag"
                           value="<?php echo utf8_encode($Diagnostico) ?>">
                           <div style="text-align: center; padding: 15px;">
                           <button type="reset" class="btn btn-outline-info btn-lg px-5"
                              style="background-color: grey ; padding: 5px 15px; margin-top: 10px; margin:15px;"><a
                                 style="color: white;">Restaurar</a></button>

                           <button type="submit" class="btn btn-outline-info btn-lg px-5"
                              style="background-color: #1becde ; padding: 5px 15px; margin-top: 10px; margin:10px;"
                              name="editarDiagnostico"><a style="color: white;">Confirmar</a></button>
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