<?php
// Datos simulados de los asientos seleccionados
$asientosSeleccionados = ['F5', 'F6'];
$pelicula = "Shrek 2";
$clasificacion = "B";
$duracion = 113;
$cine = "Forjadores";
$fechaHora = "10 septiembre 2024, 16:15 pm";

// Información de precios y tipos de boletos
$boletos = [
    ['tipo' => 'Adulto', 'precio' => 90, 'cantidad' => 2],
    ['tipo' => 'Niños', 'precio' => 70, 'cantidad' => 0],
    ['tipo' => 'Tercera edad', 'precio' => 70, 'cantidad' => 0]
];

// Calcular el total
$total = 0;
foreach ($boletos as $boleto) {
    $total += $boleto['precio'] * $boleto['cantidad'];
}

// Renderizar resumen de compra
echo "
    <div class='informacion'>
        <div class='detalles'>
            <p><span class='color-letra'>Película:</span> $pelicula</p>
            <p><span class='color-letra'>Clasificación:</span> $clasificacion</p>
            <p><span class='color-letra'>Duración:</span> $duracion min</p>
            <p><span class='color-letra'>Cine:</span> $cine</p>
            <p><span class='color-letra'>Fecha y hora:</span> $fechaHora</p>
            <p><span class='color-letra'>Asientos:</span> " . implode(", ", $asientosSeleccionados) . "</p>
        </div>
        <div class='tipo-boleto'>
            <p><span class='color-letra'>Tipo de boleto</span></p>";
foreach ($boletos as $boleto) {
    echo "
            <div class='boleto'>
                <span class='nombre'>{$boleto['tipo']}</span>
                <span class='precio'>$ {$boleto['precio']} x {$boleto['cantidad']}</span>
            </div>";
}
echo "
        </div>
        <div class='total-container'>
            <span class='total-text'>Total:</span>
            <span class='total-precio'>$ $total.00</span>
        </div>
    </div>";
?>
