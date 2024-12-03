<?php
require_once('database.php'); // Conexión a la base de datos

if ($conn->ping()) { // Verifica si la conexión está activa
    // Consultar 6 películas destacadas aleatorias
    $sql = "SELECT DISTINCT titulo, foto FROM cartelera ORDER BY RAND() LIMIT 6";
    $result = $conn->query($sql);

    if ($result && $result->num_rows > 0) {
        $peliculas_mostradas = []; // Lista para evitar duplicados

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
    } else {
        echo '<p>No hay películas disponibles.</p>';
    }
} else {
    echo '<p>Error: Conexión a la base de datos no está activa.</p>';
}
?>
