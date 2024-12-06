<?php

require_once('../php_funcion/database.php');

// Verificar si el usuario está autenticado
if (!isset($_SESSION['user_id'])) {
    header("Location: ../php_html/login.php");
    exit();
}

$user_id = $_SESSION['user_id'];

// Manejar la solicitud POST para actualizar datos
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nombre = trim($_POST['nombre']);
    $apellidos = trim($_POST['apellidos']);
    $correo = trim($_POST['correo']);
    $current_image_blob = $_POST['current_image_blob'];
    $image_blob = $current_image_blob;

    // Validar campos obligatorios
    if (empty($correo)) {
        echo "<script>alert('El correo no puede estar vacío.'); window.history.back();</script>";
        exit();
    }

    // Procesar imagen si se subió
    if (isset($_FILES['image']) && $_FILES['image']['error'] === UPLOAD_ERR_OK) {
        $image_type = mime_content_type($_FILES['image']['tmp_name']);
        if ($image_type !== 'image/png') {
            echo "<script>alert('Solo se permiten imágenes PNG.'); window.history.back();</script>";
            exit();
        }
        $image_blob = file_get_contents($_FILES['image']['tmp_name']);
    }

    // Actualizar datos en la base de datos
    $sql = "UPDATE usuarios SET nombre = ?, apellidos = ?, correo = ?, imagen_blob = ? WHERE id_usuario = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssssi", $nombre, $apellidos, $correo, $image_blob, $user_id);


    if ($stmt->execute()) {
        echo "<script>alert('Perfil actualizado con éxito.'); window.location.href = '../php_html/perfil.php';</script>";
        exit();
    } else {
        echo "<script>alert('Error al actualizar el perfil.'); window.history.back();</script>";
        exit();
    }
}

// Obtener los datos del usuario para mostrar en el formulario
$sql = "SELECT nombre, apellidos, usuario, correo, imagen_blob, puntos FROM usuarios WHERE id_usuario = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows !== 1) {
    header("Location: ../php_html/login.php");
    exit();
}

$user = $result->fetch_assoc();
$conn->close();

// Generar una URL de imagen base64 si la imagen existe
$user_image = $user['imagen_blob'] ? 'data:image/png;base64,' . base64_encode($user['imagen_blob']) : "../image/profile.png";
?>