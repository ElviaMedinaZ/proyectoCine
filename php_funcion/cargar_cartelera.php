<?php
require_once('database.php'); // Conexión a la base de datos

// Obtener el cine seleccionado
$cine_seleccionado = $_POST['selection_places'] ?? 'plazas'; // Valor por defecto: 'plazas'

// Mapear los nombres de los cines a sus IDs
$mapa_cines = [
    'plazas' => 1,
    'liverpool' => 2,
    'forjadores' => 3,
];

// Obtener el ID del cine
$id_cine = $mapa_cines[$cine_seleccionado] ?? 1; // Por defecto: Las Plazas

// Consultar las películas del cine seleccionado
$sql = "SELECT titulo, foto FROM cartelera WHERE id_cine = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $id_cine);
$stmt->execute();
$result = $stmt->get_result();

// Lista para almacenar películas mostradas
$peliculas_mostradas = [];

// Generar HTML dinámico
while ($row = $result->fetch_assoc()) {
    if (!in_array($row['titulo'], $peliculas_mostradas)) { // Evitar repetición
        echo '<figure class="pelicula">';
        echo '<img src="' . htmlspecialchars($row['foto']) . '" alt="' . htmlspecialchars($row['titulo']) . '">';
        echo '<div class="ver-mas">Ver más</div>';
        echo '<figcaption>' . htmlspecialchars($row['titulo']) . '</figcaption>';
        echo '</figure>';

        // Agregar la película a la lista de mostradas
        $peliculas_mostradas[] = $row['titulo'];
    }
}

// Cerrar conexión
$stmt->close();
$conn->close();
?>
