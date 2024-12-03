<?php
require_once('database.php'); // Conexión a la base de datos

// Consultar 3 películas aleatorias para el carrusel
$sql = "SELECT DISTINCT titulo, foto FROM cartelera ORDER BY RAND() LIMIT 3";
$result = $conn->query($sql);

if ($result && $result->num_rows > 0) {
    $peliculas_mostradas = []; // Lista para evitar duplicados

    while ($row = $result->fetch_assoc()) {
        if (!in_array($row['titulo'], $peliculas_mostradas)) { // Evitar repetición
            echo '<div class="carousel-slide">';
            echo '<img src="' . htmlspecialchars($row['foto']) . '" alt="' . htmlspecialchars($row['titulo']) . '">';
            echo '</div>';

            // Agregar la película a la lista de mostradas
            $peliculas_mostradas[] = $row['titulo'];
        }
    }
} else {
    echo '<p>No hay películas disponibles para el carrusel.</p>';
}

?>
