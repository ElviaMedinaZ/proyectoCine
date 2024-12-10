<?php
require_once('../php_funcion/database.php');

session_start();
$user_id = $_SESSION['user_id'] ?? null;

if (!$user_id) {
    echo "<script>alert('Error: Usuario no autenticado.'); window.location.href='../php_html/login.php';</script>";
    exit();
}

// Recibir datos enviados por GET
$asientos = $_GET['asientos'] ?? '';
$id_cartelera = $_GET['id_cartelera'] ?? null;
$total_costo = $_GET['costo'] ?? 0;
$metodo_pago = $_GET['metodo_pago'] ?? null;

// Validar datos
if (!$asientos || !$id_cartelera || !$total_costo || !$metodo_pago) {
    echo "<script>alert('Error: Datos incompletos.'); window.history.back();</script>";
    exit();
}

// Generar número de transacción único
$num_transaccion = rand(1000, 9999);

// Sala predeterminada
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
?>

