<?php
require_once('../php_funcion/database.php');

// Iniciar la sesión si no está iniciada
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

// Verificar si el usuario está autenticado
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

$user_id = $_SESSION['user_id'];

// Obtener los datos del usuario desde la base de datos
$sql = "SELECT nombre, apellidos, correo FROM usuarios WHERE id_usuario = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 1) {
    $user = $result->fetch_assoc();
} else {
    $user = [
        'nombre' => '',
        'apellidos' => '',
        'correo' => ''
    ];
    echo "<script>alert('No se encontró información del usuario. Por favor, vuelve a iniciar sesión.');</script>";
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    session_start();
    $user_id = $_SESSION['user_id'] ?? null;

    if (!$user_id) {
        echo "<script>alert('Error: Usuario no autenticado.'); window.location.href='../php_html/login.php';</script>";
        exit();
    }

    // Obtener datos enviados desde el formulario
    $metodo_pago = $_POST['metodo_pago'] ?? null;
    $asientos = $_POST['asientos'] ?? '';
    $id_cartelera = $_POST['id_cartelera'] ?? null;
    $total_costo = $_POST['costo'] ?? 0;

    // Validar datos
    if (!$metodo_pago || !$asientos || !$id_cartelera || !$total_costo) {
        echo "<script>alert('Por favor, selecciona un método de pago.'); window.history.back();</script>";
        exit();
    }

    // Generar número de transacción único
    $num_transaccion = rand(1000, 9999);

    // Sala por defecto
    $sala = 3;

    // Insertar en la tabla historial
    $sql_insert = "INSERT INTO historial (num_transaccion, sala, fecha, hora, asiento, id_usuario, id_cartelera, img, costo) 
                   VALUES (?, ?, CURDATE(), CURTIME(), ?, ?, ?, (SELECT foto FROM cartelera WHERE id_cartelera = ?), ?)";
    $stmt_insert = $conn->prepare($sql_insert);
    $stmt_insert->bind_param("iissiii", $num_transaccion, $sala, $asientos, $user_id, $id_cartelera, $id_cartelera, $total_costo);

    if ($stmt_insert->execute()) {
        // Actualizar puntos del usuario
        $sql_update_points = "UPDATE usuarios SET puntos = puntos + 10 WHERE id_usuario = ?";
        $stmt_update = $conn->prepare($sql_update_points);
        $stmt_update->bind_param("i", $user_id);
        $stmt_update->execute();

        echo "<script>alert('¡Pago realizado con éxito! Se te han acreditado 10 puntos.'); window.location.href='../php_html/historial.php';</script>";
    } else {
        echo "<script>alert('Error al procesar el pago.'); window.history.back();</script>";
    }
}
?>

