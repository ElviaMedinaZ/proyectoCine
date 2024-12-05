<?php
require_once('database.php'); // Conexión a la base de datos

if ($conn->ping()) { // Verifica si la conexión está activa
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

    // Consultar 6 películas destacadas aleatorias del cine seleccionado
    $sql = "SELECT DISTINCT titulo, foto FROM cartelera WHERE id_cine = ? ORDER BY RAND() LIMIT 6";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id_cine);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result && $result->num_rows > 0) {
        $peliculas_mostradas = []; // Lista para evitar duplicados

        while ($row = $result->fetch_assoc()) {
            if (!in_array($row['titulo'], $peliculas_mostradas)) { // Evitar repetición
                echo '<figure class="pelicula">';
                echo '<img src="' . htmlspecialchars($row['foto']) . '" alt="' . htmlspecialchars($row['titulo']) . '">';
                echo '<a class="ver-mas" href="../php_html/seleccionHorarios.php?titulo=' . urlencode($row['titulo']) . 
                     '&id_cine=' . urlencode($id_cine) . 
                     '&selection_places=' . urlencode($cine_seleccionado) . '">Ver más</a>';
                echo '<figcaption>' . htmlspecialchars($row['titulo']) . '</figcaption>';
                echo '</figure>';

                // Agregar la película a la lista de mostradas
                $peliculas_mostradas[] = $row['titulo'];
            }
        }
    } else {
        echo '<p>No hay películas disponibles.</p>';
    }

    // Cerrar la conexión preparada
    $stmt->close();
} else {
    echo '<p>Error: Conexión a la base de datos no está activa.</p>';
}

// Cerrar la conexión a la base de datos
$conn->close();
?>
