

<?php
// Iniciar sesión
session_start();

// Borrar variables de sesión
session_destroy();

// Redirigir al home 
header("Location: index.php");
exit();
?>
