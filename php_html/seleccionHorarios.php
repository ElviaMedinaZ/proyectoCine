<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- libreria font awesome (iconos) -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" rel="stylesheet">
    <!-- fuente de la pagina -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    <!-- hoja de estilos -->
    <link rel="stylesheet" href="../CSS/style.css">
    <link rel="stylesheet" href="../CSS/styleHorarios.css">
    <title>Cineplus</title>
</head>
<body>

    <!-- Encabezado de navegación -->
    <?php
        include ('header.php');
    ?>

    <!-- Contenedor de los detalles de la película -->
    <main class="detalle-pelicula-container">
        <section class="detalle-pelicula">
            <img src="../image/Forjadores/shrek 2.jpg" alt="Shrek 2" class="pelicula-poster">
            <div class="pelicula-info">
                <h2>Shrek 2</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nec lacinia dui. Etiam vehicula neque in dolor vehicula, sed sagittis metus sagittis. Fusce sit amet hendrerit purus. Nunc accumsan, nunc ac fermentum feugiat, tortor sapien laoreet ligula, a consequat nisi eros non lorem.</p>
                <p> <spam class="color">Género:</spam> Animación, Aventura</p>
                <p> <spam class="color">Clasificación:</spam> Para todo público</p>
                <p> <spam class="color">Duración:</spam> 113 min</p>
            </div>
        </section>

    
        <div class="horarios">
            <!-- Sección de encabezado con fondo de color -->
            <div class="horarios-header">
                <h3>Horarios</h3>
            
            </div>
            
            <!-- Tabla de fechas -->
            <table>

                <p class="cine-texto"> <spam class="color">Cine </spam> Bella Vista</p>
                <div class="cine-linea"></div> <!-- Línea debajo del nombre del cine -->
                <p class="cine-texto"> <spam class="color">Fecha </spam></p>

                <tr >
                    <th>Lun</th>
                    <th>Mar</th>
                    <th>Mié</th>
                    <th>Jue</th>
                    <th>Vie</th>
                    <th>Sab</th>
                    <th>Dom</th>
                </tr>
                <tr class="fila-fechas">
                    <td><input type="radio" id="fecha1" name="fecha" class="fecha-input"><label for="fecha1" class="fecha">09 sep</label></td>
                    <td><input type="radio" id="fecha2" name="fecha" class="fecha-input"><label for="fecha2" class="fecha">10 sep</label></td>
                    <td><input type="radio" id="fecha3" name="fecha" class="fecha-input"><label for="fecha3" class="fecha">11 sep</label></td>
                    <td><input type="radio" id="fecha4" name="fecha" class="fecha-input"><label for="fecha4" class="fecha">12 sep</label></td>
                    <td><input type="radio" id="fecha5" name="fecha" class="fecha-input"><label for="fecha5" class="fecha">13 sep</label></td>
                    <td><input type="radio" id="fecha6" name="fecha" class="fecha-input"><label for="fecha6" class="fecha">14 sep</label></td>
                    <td><input type="radio" id="fecha7" name="fecha" class="fecha-input"><label for="fecha7" class="fecha">15 sep</label></td>
                </tr>
            </table>
            
            <!-- Tipos de sesiones y horarios -->
            <div class="sesion-tipo">Doblada</div>
            <ul>
                <li><input type="radio" id="horario1" name="horario" class="horario-input"><label for="horario1" class="horario">11:30</label> </li>
                <li><input type="radio" id="horario2" name="horario" class="horario-input"><label for="horario2" class="horario">14:00</label></li>
                <li><input type="radio" id="horario3" name="horario" class="horario-input"><label for="horario3" class="horario">15:20</label></li>
                <li>
                    <input type="radio" id="horario4" name="horario" class="horario-input">
                    <label for="horario4" class="horario">15:20</label>
                </li>
                <li>
                    <input type="radio" id="horario5" name="horario" class="horario-input">
                    <label for="horario5" class="horario">16:15</label>
                </li>
            </ul>

            <div class="sesion-tipo">Subtitulada</div>
            <ul>
                <li>
                    <input type="radio" id="horario6" name="horario" class="horario-input">
                    <label for="horario6" class="horario">11:00</label>
                </li>
                <li>
                    <input type="radio" id="horario7" name="horario" class="horario-input">
                    <label for="horario7" class="horario">12:20</label>
                </li>
                <li>
                    <input type="radio" id="horario8" name="horario" class="horario-input">
                    <label for="horario8" class="horario">13:40</label>
                </li>
                <li>
                    <input type="radio" id="horario9" name="horario" class="horario-input">
                    <label for="horario9" class="horario">17:15</label>
                </li>
                <li>
                    <input type="radio" id="horario10" name="horario" class="horario-input">
                    <label for="horario10" class="horario">19:30</label>
                </li>
            </ul>
        </div>
        
    </main>

</body>
</html>