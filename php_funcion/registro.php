<?php
require_once('../php_funcion/database.php');

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $user = trim($_POST['user'] ?? '');
    $email = trim($_POST['email'] ?? '');
    $password = trim($_POST['password'] ?? '');

    // Validar campos vacíos
    if (empty($user) || empty($email) || empty($password)) {
        echo "<script>alert('Por favor, completa todos los campos.'); window.history.back();</script>";
        exit();
    }

    // Verificar si el usuario o el correo ya existen
    $check_sql = "SELECT usuario, correo FROM usuarios WHERE usuario = ? OR correo = ?";
    $stmt = $conn->prepare($check_sql);
    $stmt->bind_param("ss", $user, $email);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        if (strtolower($row['usuario']) === strtolower($user)) {
            echo "<script>alert('El nombre de usuario ya existe.'); window.history.back();</script>";
            exit();
        }
        if (strtolower($row['correo']) === strtolower($email)) {
            echo "<script>alert('El correo electrónico ya está registrado.'); window.history.back();</script>";
            exit();
        }
    }

    // Insertar el nuevo usuario con la contraseña sin encriptar
    $insert_sql = "INSERT INTO usuarios (usuario, correo, contraseña) VALUES (?, ?, ?)";
    $stmt = $conn->prepare($insert_sql);
    $stmt->bind_param("sss", $user, $email, $password);

    if ($stmt->execute()) {
        echo "<script>alert('Registro exitoso. Redirigiendo al inicio de sesión...'); window.location.href = '../php_html/login.php';</script>";
        exit();
    } else {
        echo "<script>alert('Ocurrió un error al registrar. Inténtalo de nuevo.'); window.history.back();</script>";
        exit();
    }
} else {
    echo "<script>alert('Método no permitido.'); window.history.back();</script>";
    exit();
}

$conn->close();
?>
