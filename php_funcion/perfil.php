<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

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
    $apellido = trim($_POST['apellido']);
    $current_image = $_POST['current_image'];
    $image_name = $current_image;

    // Procesar imagen si se subió
    if (isset($_FILES['image']) && $_FILES['image']['error'] === UPLOAD_ERR_OK) {
        $image_name = uniqid() . "_" . basename($_FILES['image']['name']);
        $image_path = "../uploads/" . $image_name;
        move_uploaded_file($_FILES['image']['tmp_name'], $image_path);
    }

    // Actualizar datos en la base de datos
    $sql = "UPDATE usuario SET Nombre = ?, Imagen = ? WHERE ID_Usuario = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sssi", $nombre, $image_name, $user_id);

    if ($stmt->execute()) {
        header("Location: ../php_html/landingSesionAbierta.php");
        exit();
    } else {
        echo "<script>alert('Error al actualizar el perfil.'); window.history.back();</script>";
        exit();
    }
}

// Obtener los datos del usuario para mostrar en el formulario
$sql = "SELECT Nombre, Username, Correo, Imagen, Puntos FROM usuario WHERE ID_Usuario = ?";
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

// Asignar imagen por defecto si no hay ninguna
$user_image = $user['Imagen'] ? "../uploads/" . $user['Imagen'] : "../image/profile.png";
?>
