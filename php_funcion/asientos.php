<?php
// Ejemplo de datos simulados (puedes reemplazarlo con datos de una base de datos)
$asientos = [
    'A' => ['D', 'D', 'D', 'O', 'O', 'D', 'D', 'D', 'D', 'D'], // D = Disponible, O = Ocupado
    'B' => ['D', 'D', 'D', 'D', 'D', 'D', 'D', 'D', 'D', 'D'],
    'C' => ['D', 'D', 'D', 'D', 'D', 'D', 'D', 'D', 'D', 'D'],
    'D' => ['R', 'R', 'D', 'D', 'D', 'D', 'D', 'D', 'R', 'R'], // R = Reservado o discapacitado
    'E' => ['D', 'D', 'D', 'D', 'D', 'D', 'D', 'D', 'D', 'D'],
    'F' => ['D', 'D', 'D', 'D', 'S', 'S', 'D', 'D', 'D', 'D'], // S = Seleccionado (VIP)
];

// Función para renderizar un asiento
function renderizarAsiento($estado)
{
    $icono = "";
    $clase = "";

    switch ($estado) {
        case 'D': // Disponible
            $icono = '../image/asientos/asiento_normal.png';
            $clase = 'disponible';
            break;
        case 'O': // Ocupado
            $icono = '../image/asientos/asiento_rojo.png';
            $clase = 'ocupado';
            break;
        case 'R': // Reservado o discapacitados
            $icono = '../image/asientos/asiento_discapacitados.png';
            $clase = 'reservado';
            break;
        case 'S': // Seleccionado (VIP)
            $icono = '../image/asientos/asiento_dorado.png';
            $clase = 'vip';
            break;
    }

    return "<div class='asiento $clase'><img src='$icono' alt='asiento'></div>";
}

// Renderizar las filas de asientos
foreach ($asientos as $fila => $columnas) {
    echo "<div class='fila'>";
    echo "<span class='fila-label'>$fila</span>";

    foreach ($columnas as $estado) {
        echo renderizarAsiento($estado);
    }

    echo "</div>";
}
?>
