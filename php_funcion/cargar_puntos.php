<?php
require_once('../php_funcion/database.php'); // Conexión a la base de datos

// Iniciar sesión solo si no está activa
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

$puntos = 0; // Valor por defecto en caso de que no se encuentre el usuario

if (isset($_SESSION['user_id'])) {
    $user_id = $_SESSION['user_id'];

    // Consulta SQL para obtener los puntos del usuario
    $sql = "SELECT puntos FROM usuarios WHERE id_usuario = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows === 1) {
        $row = $result->fetch_assoc();
        $puntos = $row['puntos'];
    }

    $stmt->close();
}


?>

