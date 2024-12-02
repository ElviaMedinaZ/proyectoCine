<?php

require_once('database.php');
session_start(); // Asegurarse de iniciar la sesión

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $user = trim($_POST['user'] ?? '');
    $password = trim($_POST['password'] ?? '');

    // Validar campos vacíos
    if (empty($user) || empty($password)) {
        echo "<script>alert('Por favor, completa todos los campos.'); window.history.back();</script>";
        exit();
    }

    // Actualizar consulta SQL con el nombre correcto de las columnas
    $sql = "SELECT ID_Usuario, Username, Password FROM usuario WHERE Username = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $user);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows === 1) {
        $row = $result->fetch_assoc();

        // Verificar la contraseña
        if (password_verify($password, $row['Password'])) {
            // Establecer variables de sesión
            $_SESSION['user_id'] = $row['ID_Usuario'];
            $_SESSION['username'] = $row['Username'];
            
            // Redirigir al dashboard
            header("Location: ../php_html/landingSesionAbierta.php");
            exit();
        } else {
            // Contraseña incorrecta
            echo "<script>alert('Contraseña incorrecta.'); window.history.back();</script>";
            exit();
        }
    } else {
        // Usuario no encontrado
        echo "<script>alert('El usuario no existe.'); window.history.back();</script>";
        exit();
    }
} else {
    echo "<script>alert('Método no permitido.'); window.history.back();</script>";
    exit();
}

// Cerrar conexión
$conn->close();
?>
