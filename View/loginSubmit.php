<?php
session_start();


include_once __DIR__ . '/../Model/ConnBD.php';

if (isset($_POST['uname']) && isset($_POST['password'])) {

    // Incluye el archivo con la función validate
    include "validateForm.php";

    $uname = validate($_POST['uname']);
    $pass = validate($_POST['password']);

    if (empty($uname)) {
        header("Location: login.php?error=Nombre de usuario no puede estar vacío");
        exit();
    } else if (empty($pass)) {
        header("Location: login.php?error=Contraseña no puede estar vacía");
        exit();
    } else {
        $conexion = new Conexion();
        $conn = $conexion->Conectar(); // Obtiene la conexión a la base de datos

        // Consulta SQL utilizando parámetros con marcadores de posición
        $sql = "SELECT * FROM users WHERE username = :uname AND password = :pass";

        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':uname', $uname);
        $stmt->bindParam(':pass', $pass);
        
        // Ejecuta la consulta
        $stmt->execute();

        // Comprueba si se encontró un usuario
        if ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            // Obtiene los valores del usuario
            $user_id = $row['id'];
            $role = $row['role'];

            // Almacena el ID del usuario en la variable de sesión
            $_SESSION['user_id'] = $user_id;

            // Almacena el tipo de usuario en la variable de sesión
            $_SESSION['role'] = $role;

            // Redirige a la página principal
            header("Location: index.php");
            exit();
        } else {
            header("Location: login.php?error=Usuario o contraseña incorrectos");
            exit();
        }
    }
} else {
    header("Location: login.php");
    exit();
}
?>
