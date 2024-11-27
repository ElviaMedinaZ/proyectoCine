<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "bd_cine";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}

$response = ["error" => false, "message" => ""];

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $user = $_POST['user'] ?? '';
    $password = $_POST['password'] ?? '';

    if (empty($user) || empty($password)) {
        $response["error"] = true;
        $response["message"] = "Por favor, completa todos los campos.";
        echo json_encode($response);
        exit();
    }

    $sql = "SELECT * FROM usuario WHERE Username = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $user);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows === 1) {
        $row = $result->fetch_assoc();
        if (password_verify($password, $row['Password'])) {
            // Contraseña correcta
            $_SESSION['user_id'] = $row['ID']; // Guardar el ID del usuario en la sesión
            $_SESSION['username'] = $row['Username']; // Opcional: guardar el nombre de usuario
            $response["message"] = "Inicio de sesión exitoso.";

        } else {
            // Contraseña incorrecta
            $response["error"] = true;
            $response["message"] = "Contraseña incorrecta.";
        }
    } else {
        // Usuario no encontrado
        $response["error"] = true;
        $response["message"] = "El usuario no existe.";
    }
}

header('Content-Type: application/json');
echo json_encode($response);
$conn->close();
?>
