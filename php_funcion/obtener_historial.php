<?php
require_once('database.php'); // Archivo de conexión a la base de datos

// Inicializar el historial como un array vacío
$historial = [];

if (isset($id_usuario)) {
    // Configurar el idioma para mostrar fechas en español
    setlocale(LC_TIME, 'es_ES.UTF-8', 'es_ES', 'esp');


    // Consulta para obtener el historial con el nombre del cine
    $sql = "SELECT h.*, c.titulo, ci.nombre AS cine 
            FROM historial h
            JOIN cartelera c ON h.id_cartelera = c.id_cartelera
            JOIN cine ci ON c.id_cine = ci.id_cine
            WHERE h.id_usuario = ? 
            ORDER BY h.fecha DESC, h.hora DESC";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id_usuario);
    $stmt->execute();
    $result = $stmt->get_result();

    // Almacenar los resultados en el array $historial
    while ($row = $result->fetch_assoc()) {
        // Formatear la fecha en el formato "Viernes, 13 septiembre de 2024"
        $row['fecha'] = strftime('%A, %d %B de %Y', strtotime($row['fecha']));
        $historial[] = $row;
    }

    $stmt->close();
}

$conn->close();
?>
