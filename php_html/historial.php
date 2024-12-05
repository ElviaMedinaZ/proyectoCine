<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Librería Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" rel="stylesheet">
    <!-- Fuente -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    <!-- Hojas de estilo -->
    <link rel="stylesheet" href="../CSS/style.css">
    <link rel="stylesheet" href="../CSS/style_Historial.css">
    <title>Cineplus</title>
</head>
<body>

    <?php
    include('header.php');
    $id_usuario = $_SESSION['user_id'];
    include('../php_funcion/obtener_historial.php'); // Obtener el historial desde la base de datos
    
    $fecha_actual = date('Y-m-d'); // Obtén la fecha actual
    $dias = ['Sunday' => 'domingo', 'Monday' => 'lunes', 'Tuesday' => 'martes', 'Wednesday' => 'miércoles', 'Thursday' => 'jueves', 'Friday' => 'viernes', 'Saturday' => 'sábado'];
    $meses = ['January' => 'enero', 'February' => 'febrero', 'March' => 'marzo', 'April' => 'abril', 'May' => 'mayo', 'June' => 'junio', 'July' => 'julio', 'August' => 'agosto', 'September' => 'septiembre', 'October' => 'octubre', 'November' => 'noviembre', 'December' => 'diciembre'];
    
    $dia_semana = $dias[date('l', strtotime($fecha_actual))];
    $mes = $meses[date('F', strtotime($fecha_actual))];
    $fecha_hoy = ucfirst($dia_semana) . ', ' . date('d', strtotime($fecha_actual)) . ' ' . $mes . ' de ' . date('Y');
    ?>

        

    <div class="historial-compras">
        <h1>Historial de compras</h1>
        <p class="fecha-actual">Hoy, <?php echo ucfirst($fecha_hoy); ?></p> 

        <div class="tarjetas-wrapper">
            <button class="navegacion izquierda" onclick="cambiarPagina(-1)">&lt;</button>

            <div class="tarjetas-container" id="tarjetas-container">
                <!-- Tarjetas dinámicas generadas con JavaScript -->
            </div>

            <button class="navegacion derecha" onclick="cambiarPagina(1)">&gt;</button>
        </div>
    </div>

    <script>
        const historial = <?php echo json_encode($historial); ?>; // Historial en formato JSON
        const tarjetasContainer = document.getElementById('tarjetas-container');
        let paginaActual = 0; // Página actual
        const elementosPorPagina = 2; // Número de elementos por página

        // Función para renderizar las tarjetas
        function renderizarTarjetas() {
            tarjetasContainer.innerHTML = ''; // Limpiar contenido anterior
            const inicio = paginaActual * elementosPorPagina;
            const fin = inicio + elementosPorPagina;
            const tarjetasAMostrar = historial.slice(inicio, fin);

            tarjetasAMostrar.forEach(compra => {
                const tarjeta = document.createElement('div');
                tarjeta.className = 'tarjeta';
                tarjeta.innerHTML = `
                    <h2>${compra.titulo}</h2>
                    <p><strong class="color">Número de transacción:</strong> ${compra.num_transaccion}</p>
                    <p><strong class="color">Cine:</strong> Cineplus, ${compra.cine}</p>
                    <p><strong class="color">Sala:</strong> ${compra.sala}</p>
                    <p><strong class="color">Fecha:</strong> ${compra.fecha}</p>
                    <p><strong class="color">Hora:</strong> ${compra.hora}</p>
                    <p><strong class="color">Asientos:</strong> ${compra.asiento}</p>
                    <img src="${compra.img}" alt="Póster de película">
                    <p class="total"><strong class="color">Total de la compra:</strong> <span class="total-precio">$${compra.costo}</span></p>
                `;
                tarjetasContainer.appendChild(tarjeta);
            });
        }

        // Función para cambiar de página
        function cambiarPagina(direccion) {
            const totalPaginas = Math.ceil(historial.length / elementosPorPagina);
            paginaActual = Math.min(Math.max(paginaActual + direccion, 0), totalPaginas - 1);
            renderizarTarjetas();
        }

        // Inicializar la vista
        renderizarTarjetas();
    </script>
</body>
</html>
