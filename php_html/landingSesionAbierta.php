<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../CSS/style.css">
    <link rel="stylesheet" href="../CSS/styles_carrucel">
    
    <title>Cineplus</title>
</head>
<body>
   
    <?php
        include ('header.php'); // Menú de navegación
    ?>

    <!-- Carrusel de películas destacadas -->
    <section class="carousel">
        <div class="flecha flecha-izquierda" onclick="prevSlide()">
            <img src="../image/recompensas/Chevron left.png" alt="flecha izquierda">
        </div>
        <div class="carousel-container">
            <div class="carousel-slides">
                 <?php include('../php_funcion/cargar_carrucel.php'); // Cargar películas destacadas ?>
            </div>
        </div>
        <div class="flecha flecha-derecha" onclick="nextSlide()">
            <img src="../image/recompensas/Chevron right.png" alt="flecha derecha">
        </div>
    </section>


    <!-- Sección de películas destacadas -->
    <section class="destacadas">
        <div class="titulo-destacadas">
            <h1>Destacadas</h1>
        </div>
        <div class="container-cartelera">
            <main>
                <section class="cartelera">
                    <?php include('../php_funcion/cargar_destacados.php'); // Cargar películas destacadas ?>
                </section>
            </main>
        </div>
    </section>

    <script src="../JS/carrucel.js"></script> <!-- Archivo JS para el carrusel -->
</body>
</html>
