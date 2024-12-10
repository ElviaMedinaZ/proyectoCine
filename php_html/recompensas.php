<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- librería font awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" rel="stylesheet">
    <!-- fuente -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    <!-- estilos -->
    <link rel="stylesheet" href="../CSS/style.css">
    <link rel="stylesheet" href="../CSS/style_recompensas.css">
    <title>Cineplus</title>
</head>
<body>
    <?php 
        include('header.php'); 
        include('../php_funcion/cargar_puntos.php'); // Cargar puntos del usuario
        include('../php_funcion/cargar_recompensas.php'); // Cargar recompensas como arreglo JSON
    ?>

    <div class="container-rewards">
        <main>
            <section>
                <h1>Puntos y recompensas</h1>
                <h2>Puntos: <?= htmlspecialchars($puntos) ?></h2>
                <div class="carrusel-container">
                    <div class="flecha-izq" onclick="cambiarPagina(-1)">
                        <img src="../image/recompensas/Chevron left.png" alt="flecha izquierda">
                    </div>
                    <div class="tarjetas-container" id="tarjetas-container">
                        <!-- Tarjetas dinámicas generadas con JavaScript -->
                    </div>
                    <div class="flecha-der" onclick="cambiarPagina(1)">
                        <img src="../image/recompensas/Chevron right.png" alt="flecha derecha">
                    </div>
                </div>
            </section>
        </main>
    </div>

    <script>
        // Recompensas cargadas desde PHP como JSON
        const recompensas = <?php echo json_encode($recompensas); ?>;

        const tarjetasContainer = document.getElementById('tarjetas-container');
        let paginaActual = 0;
        const elementosPorPaginaEscritorio = 3; // Elementos visibles en escritorio
        const elementosPorPaginaMovil = 1; // Elementos visibles en móvil

        // Detectar si el dispositivo es móvil
        function esMovil() {
            return window.innerWidth <= 500;
        }

        // Obtener la cantidad de elementos por página según el dispositivo
        function obtenerElementosPorPagina() {
            return esMovil() ? elementosPorPaginaMovil : elementosPorPaginaEscritorio;
        }

        // Renderizar las recompensas dinámicamente
        function renderizarTarjetas() {
            tarjetasContainer.innerHTML = ''; // Limpiar contenido previo
            const elementosPorPagina = obtenerElementosPorPagina();
            const inicio = paginaActual * elementosPorPagina;
            const fin = inicio + elementosPorPagina;
            const recompensasAMostrar = recompensas.slice(inicio, fin);

            recompensasAMostrar.forEach(recompensa => {
                const tarjeta = document.createElement('div');
                tarjeta.className = 'elemento';
                tarjeta.innerHTML = `
                    <img class="recompensa" src="${recompensa.imagen}" alt="${recompensa.nombre}">
                    <p>${recompensa.descripcion}</p>
                    <a>${recompensa.nombre}</a>
                `;
                tarjetasContainer.appendChild(tarjeta);
            });
        }

        // Cambiar de página
        function cambiarPagina(direccion) {
            const elementosPorPagina = obtenerElementosPorPagina();
            const totalPaginas = Math.ceil(recompensas.length / elementosPorPagina);
            paginaActual = Math.min(Math.max(paginaActual + direccion, 0), totalPaginas - 1);
            renderizarTarjetas();
        }

        // Detectar cambios en el tamaño de la ventana
        window.addEventListener('resize', () => {
            paginaActual = 0; // Reiniciar a la primera página
            renderizarTarjetas();
        });

        // Inicializar el carrusel
        renderizarTarjetas();
    </script>
</body>
</html>
