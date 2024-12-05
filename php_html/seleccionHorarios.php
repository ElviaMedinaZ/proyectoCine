<?php
require_once('../php_funcion/obtener_horarios.php');

// Obtener datos de la URL
$titulo = $_GET['titulo'] ?? 'Shrek 2';
$cine_seleccionado = $_GET['selection_places'] ?? 'plazas';
$id_cine = $_GET['id_cine'] ?? 1;

// Obtener detalles y horarios
$detalles = obtenerDetallesPelicula($titulo, $id_cine);
$horarios = obtenerHorarios($titulo, $id_cine);

// Mapear IDs de cines con nombres
$mapa_cines = [
    1 => 'Plazas',
    2 => 'Liverpool',
    3 => 'Forjadores'
];

// Determinar el nombre del cine seleccionado
$nombre_cine = $mapa_cines[$id_cine] ?? 'Desconocido';
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../CSS/style.css">
    <link rel="stylesheet" href="../CSS/style_Horarios.css">
    <title>Cineplus - <?php echo htmlspecialchars($detalles['titulo']); ?></title>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const fechaInputs = document.querySelectorAll(".fecha-input");
            const sesionTipoContainers = document.querySelectorAll(".sesion-tipo-container");
            const horarioInputs = document.querySelectorAll(".horario-input");

            // Ocultar horarios inicialmente
            sesionTipoContainers.forEach(container => container.style.display = "none");

            // Mostrar horarios cuando se selecciona un día
            fechaInputs.forEach(input => {
                input.addEventListener("change", function () {
                    const fechaSeleccionada = this.value;

                    // Mostrar solo si se seleccionó un día
                    sesionTipoContainers.forEach(container => {
                        if (container.dataset.fecha === fechaSeleccionada) {
                            container.style.display = "block";
                        } else {
                            container.style.display = "none";
                        }
                    });
                });
            });

            // Redirigir al seleccionar un horario
            horarioInputs.forEach(input => {
                input.addEventListener("change", function () {
                    const horaSeleccionada = this.dataset.hora;
                    const fechaSeleccionada = document.querySelector(".fecha-input:checked").value;
                    const titulo = "<?php echo htmlspecialchars($titulo); ?>";
                    const idCine = "<?php echo htmlspecialchars($id_cine); ?>";
                    const idCartelera = "<?php echo htmlspecialchars($detalles['id_cartelera']); ?>";  // Obtén el id_cartelera

                    // Redirigir con los datos seleccionados
                    const url = `seleccionAsientos.php?titulo=${encodeURIComponent(titulo)}&id_cine=${idCine}&fecha=${fechaSeleccionada}&hora=${horaSeleccionada}&id_cartelera=${idCartelera}`;
                    window.location.href = url;
                });
            });
        });
    </script>
</head>
<body>
    <!-- Menú superior -->
    <?php include('header.php'); ?>

    <main class="detalle-pelicula-container">
        <!-- Detalles de la película -->
        <section class="detalle-pelicula">
            <img src="<?php echo htmlspecialchars($detalles['foto']); ?>" alt="<?php echo htmlspecialchars($detalles['titulo']); ?>" class="pelicula-poster">
            <div class="pelicula-info">
                <h2><?php echo htmlspecialchars($detalles['titulo']); ?></h2>
                <p><?php echo htmlspecialchars($detalles['descripcion']); ?></p>
                <p><span class="color">Género:</span> <?php echo htmlspecialchars($detalles['genero']); ?></p>
                <p class="classification"><span class="color">Clasificación:</span> <span class="b-letter"><?php echo htmlspecialchars($detalles['clasificacion']); ?></span></p>
                <p><span class="color">Duración:</span> <?php echo htmlspecialchars($detalles['duracion']); ?></p>
            </div>
        </section>

        <!-- Horarios -->
        <div class="horarios">
            <div class="horarios-header">
                <h3>Horarios</h3>
                <p class="cine-texto"><span class="color">Cine:</span> <?php echo htmlspecialchars($nombre_cine); ?></p>
                <div class="cine-linea"></div>
            </div>

            <!-- Tabla de fechas -->
            <p class="cine-texto"><span class="color">Fecha:</span></p>
            <table>
                <tr>
                    <th>Lun</th>
                    <th>Mar</th>
                    <th>Mié</th>
                    <th>Jue</th>
                    <th>Vie</th>
                    <th>Sab</th>
                    <th>Dom</th>
                </tr>
                <tr class="fila-fechas">
                    <?php
                    // Generar fechas únicas
                    $fechas_unicas = array_unique(array_column($horarios, 'fecha'));
                    foreach ($fechas_unicas as $fecha) {
                        $fecha_formateada = date('d M', strtotime($fecha));
                        echo "<td><input type='radio' id='fecha_$fecha' name='fecha' class='fecha-input' value='$fecha'><label for='fecha_$fecha' class='fecha'>$fecha_formateada</label></td>";
                    }
                    ?>
                </tr>
            </table>

            <!-- Contenedor de horarios por tipo de sesión -->
            <?php
            foreach ($fechas_unicas as $fecha) {
                echo "<div class='sesion-tipo-container' data-fecha='$fecha'>";
                echo "<div class='sesion-tipo'>Doblada</div>";
                echo "<ul>";
                foreach ($horarios as $horario) {
                    if ($horario['fecha'] === $fecha && $horario['idioma'] === 'Español') {
                        echo "<li><input type='radio' id='horario_{$horario['hora']}' name='horario' class='horario-input' data-hora='{$horario['hora']}'><label for='horario_{$horario['hora']}' class='horario'>{$horario['hora']}</label></li>";
                    }
                }
                echo "</ul>";

                echo "<div class='sesion-tipo'>Subtitulada</div>";
                echo "<ul>";
                foreach ($horarios as $horario) {
                    if ($horario['fecha'] === $fecha && $horario['idioma'] === 'Inglés') {
                        echo "<li><input type='radio' id='horario_{$horario['hora']}' name='horario' class='horario-input' data-hora='{$horario['hora']}'><label for='horario_{$horario['hora']}' class='horario'>{$horario['hora']}</label></li>";
                    }
                }
                echo "</ul>";
                echo "</div>";
            }
            ?>
        </div>
    </main>
</body>
</html>
