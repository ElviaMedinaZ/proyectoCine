<?php
require_once('database.php'); // Conexión a la base de datos

// Obtener el cine seleccionado
$cine_seleccionado = $_GET['selection_places'] ?? 'plazas';

// Mapear los nombres de los cines a sus IDs
$mapa_cines = [
    'plazas' => 1,
    'liverpool' => 2,
    'forjadores' => 3,
];

// Obtener el ID del cine
$id_cine = $mapa_cines[$cine_seleccionado] ?? 1;

// Consultar las películas del cine seleccionado
$sql = "SELECT DISTINCT titulo, foto FROM cartelera WHERE id_cine = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $id_cine);
$stmt->execute();
$result = $stmt->get_result();

// Generar el HTML de la cartelera
while ($row = $result->fetch_assoc()) {
    echo '<figure class="pelicula">';
    echo '<img src="' . htmlspecialchars($row['foto']) . '" alt="' . htmlspecialchars($row['titulo']) . '">';
    echo '<a class="ver-mas" href="../php_html/seleccionHorarios.php?titulo=' . urlencode($row['titulo']) . '&id_cine=' . $id_cine . '&selection_places=' . urlencode($cine_seleccionado) . '">Ver más</a>';
    echo '<figcaption>' . htmlspecialchars($row['titulo']) . '</figcaption>';
    echo '</figure>';
}

// Cerrar conexión
$stmt->close();
$conn->close();
?>
