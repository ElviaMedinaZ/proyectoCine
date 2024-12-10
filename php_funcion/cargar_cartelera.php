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

// Verificar si hay un término de búsqueda
$termino_busqueda = $_GET['site-search'] ?? '';

// Preparar la consulta
if (!empty($termino_busqueda)) {
    // Filtrar películas por el término de búsqueda
    $sql = "SELECT DISTINCT titulo, foto FROM cartelera 
            WHERE id_cine = ? AND titulo LIKE ?";
    $stmt = $conn->prepare($sql);
    $like_busqueda = "%" . $termino_busqueda . "%";
    $stmt->bind_param("is", $id_cine, $like_busqueda);
} else {
    // Mostrar todas las películas del cine seleccionado
    $sql = "SELECT DISTINCT titulo, foto FROM cartelera WHERE id_cine = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id_cine);
}

// Ejecutar la consulta
$stmt->execute();
$result = $stmt->get_result();

// Generar el HTML de la cartelera
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo '<figure class="pelicula">';
        echo '<img src="' . htmlspecialchars($row['foto']) . '" alt="' . htmlspecialchars($row['titulo']) . '">';
        echo '<a class="ver-mas" href="../php_html/seleccionHorarios.php?titulo=' . urlencode($row['titulo']) . '&id_cine=' . $id_cine . '&selection_places=' . urlencode($cine_seleccionado) . '">Ver más</a>';
        echo '<figcaption>' . htmlspecialchars($row['titulo']) . '</figcaption>';
        echo '</figure>';
    }
} else {
    echo '<p>No se encontraron películas para su búsqueda.</p>';
}

// Cerrar conexión
$stmt->close();
$conn->close();
?>
