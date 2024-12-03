<?php
require_once('../php_funcion/database.php');
session_start();

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $user = trim($_POST['user'] ?? '');
    $password = trim($_POST['password'] ?? '');

    // Validar campos vacíos
    if (empty($user) || empty($password)) {
        echo "<script>alert('Por favor, completa todos los campos.'); window.history.back();</script>";
        exit();
    }

    // Consulta SQL para verificar el usuario y la contraseña
    $sql = "SELECT id_usuario, usuario, contraseña FROM usuarios WHERE usuario = ? AND contraseña = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $user, $password);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows === 1) {
        $row = $result->fetch_assoc();

        // Establecer variables de sesión
        $_SESSION['user_id'] = $row['id_usuario'];
        $_SESSION['username'] = $row['usuario'];

        // Redirigir al dashboard
        header("Location: ../php_html/landingSesionAbierta.php");
        exit();
    } else {
        echo "<script>alert('Usuario o contraseña incorrectos.'); window.history.back();</script>";
        exit();
    }
} else {
    echo "<script>alert('Método no permitido.'); window.history.back();</script>";
    exit();
}

$conn->close();
?>
