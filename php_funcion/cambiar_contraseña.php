<?php
require_once('../php_funcion/database.php'); // Conexión a la base de datos

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $user = trim($_POST['user'] ?? '');
    $password = trim($_POST['password'] ?? '');
    $confirmPassword = trim($_POST['confirm-password'] ?? '');

    // Validar que los campos no estén vacíos
    if (empty($user) || empty($password) || empty($confirmPassword)) {
        echo "<script>alert('Por favor, completa todos los campos.'); window.history.back();</script>";
        exit();
    }

    // Validar que las contraseñas coincidan
    if ($password !== $confirmPassword) {
        echo "<script>alert('Las contraseñas no coinciden.'); window.history.back();</script>";
        exit();
    }

    // Verificar si el usuario existe
    $check_sql = "SELECT id_usuario FROM usuarios WHERE usuario = ?";
    $stmt = $conn->prepare($check_sql);
    $stmt->bind_param("s", $user);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows === 0) {
        echo "<script>alert('El usuario no existe.'); window.history.back();</script>";
        exit();
    }

    // Actualizar la contraseña del usuario
    $update_sql = "UPDATE usuarios SET contraseña = ? WHERE usuario = ?";
    $stmt = $conn->prepare($update_sql);
    $stmt->bind_param("ss", $password, $user);

    if ($stmt->execute()) {
        echo "<script>alert('Contraseña actualizada con éxito. Redirigiendo al inicio de sesión...'); window.location.href = '../php_html/login.php';</script>";
        exit();
    } else {
        echo "<script>alert('Ocurrió un error al actualizar la contraseña. Inténtalo de nuevo.'); window.history.back();</script>";
        exit();
    }
} else {
    echo "<script>alert('Método no permitido.'); window.history.back();</script>";
    exit();
}

$conn->close();
?>
