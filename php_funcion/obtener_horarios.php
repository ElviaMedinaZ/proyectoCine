<?php
require_once('database.php'); // Conexión a la base de datos

function obtenerDetallesPelicula($titulo, $id_cine) {
    global $conn;

    // Consultar detalles de la película usando título e id_cine
    $sql_pelicula = "SELECT c.id_cartelera, c.titulo, c.foto, c.duracion, c.clasificacion, c.genero, c.idioma, c.descripcion 
                     FROM cartelera c
                     WHERE c.titulo = ? AND c.id_cine = ?";
    $stmt = $conn->prepare($sql_pelicula);
    $stmt->bind_param("si", $titulo, $id_cine);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        return $result->fetch_assoc();
    }

    return null;
}


function obtenerHorarios($titulo, $id_cine) {
    global $conn;

    // Consultar horarios disponibles para la película
    $sql_horarios = "SELECT fecha, hora, idioma FROM cartelera WHERE titulo = ? AND id_cine = ?";
    $stmt = $conn->prepare($sql_horarios);
    $stmt->bind_param("si", $titulo, $id_cine);
    $stmt->execute();
    $result = $stmt->get_result();

    $horarios = [];
    while ($row = $result->fetch_assoc()) {
        $horarios[] = $row;
    }

    return $horarios;
}
?>
