<?php
require_once('database.php'); // Conexión a la base de datos

// Consultar las recompensas
$sql = "SELECT nombre, imagen, costo, descripcion FROM recompensas"; // Cambiar 'img' a 'imagen'
$result = $conn->query($sql);

// Lista para almacenar recompensas mostradas
$recompensas_mostradas = [];

// Generar HTML dinámico
while ($row = $result->fetch_assoc()) {
    if (!in_array($row['nombre'], $recompensas_mostradas)) { // Evitar repetición
        echo '<div class="elemento">';
        echo '<img class="recompensa" src="' . htmlspecialchars($row['imagen']) . '" alt="' . htmlspecialchars($row['nombre']) . '">';
        echo '<p>' . htmlspecialchars($row['descripcion']) . '</p>';
        echo '<a>' . htmlspecialchars($row['nombre']) . '</a>';
        echo '</div>';

        // Agregar la recompensa a la lista de mostradas
        $recompensas_mostradas[] = $row['nombre'];
    }
}

// Cerrar conexión
$conn->close();
?>
