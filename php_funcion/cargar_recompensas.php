<?php
require_once('database.php'); // Conexión a la base de datos

$recompensas = [];

// Consultar las recompensas desde la base de datos
$sql = "SELECT nombre, imagen, costo, descripcion FROM recompensas";
$result = $conn->query($sql);

// Crear un arreglo de recompensas para usar en el carrusel
while ($row = $result->fetch_assoc()) {
    $recompensas[] = [
        'nombre' => $row['nombre'],
        'imagen' => $row['imagen'],
        'costo' => $row['costo'],
        'descripcion' => $row['descripcion']
    ];
}

// Cerrar la conexión a la base de datos
$conn->close();
?>
