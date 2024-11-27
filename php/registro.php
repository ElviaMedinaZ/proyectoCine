<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "bd_cine";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}

$errors = [];

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $user = $_POST['user'] ?? '';
    $email = $_POST['email'] ?? '';
    $password = $_POST['password'] ?? '';

    if (empty($user)) {
        $errors['user'] = "El campo de usuario es obligatorio.";
    }
    if (empty($email)) {
        $errors['email'] = "El campo de correo es obligatorio.";
    }
    if (empty($password)) {
        $errors['password'] = "El campo de contraseña es obligatorio.";
    }

    if (empty($errors)) {
        $check_sql = "SELECT Username, Correo FROM usuario WHERE Username = ? OR Correo = ?";
        $stmt = $conn->prepare($check_sql);
        $stmt->bind_param("ss", $user, $email);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            if (strtolower($row['Username']) === strtolower($user)) {
                $errors['user'] = "El nombre de usuario ya existe.";
            }
            if (strtolower($row['Correo']) === strtolower($email)) {
                $errors['email'] = "El correo electrónico ya está registrado.";
            }
        }
    }

    if (empty($errors)) {
        $hashed_password = password_hash($password, PASSWORD_BCRYPT);
        $insert_sql = "INSERT INTO usuario (Username, Correo, Password) VALUES (?, ?, ?)";
        $stmt = $conn->prepare($insert_sql);
        $stmt->bind_param("sss", $user, $email, $hashed_password);

        if ($stmt->execute()) {
            http_response_code(200);
            echo json_encode([]); // Devuelve un JSON vacío en caso de éxito
            exit();
        } else {
            $errors['general'] = "Ocurrió un error al registrar. Inténtalo de nuevo.";
        }
    }

    header('Content-Type: application/json');
    echo json_encode($errors); // Devuelve errores si los hay
    exit();
}

$conn->close();
?>