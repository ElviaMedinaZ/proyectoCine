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

    <title>Cineplus</title>
</head>
<body>

    <?php include('header.php'); ?>

    <div class="container-cartelera">
        <main>
            <h1>Cartelera</h1>
            <section class="cartelera">
                <?php
                include('../php_funcion/cargar_cartelera.php'); // Cargar películas dinámicamente
                ?>
            </section>
        </main>
    </div>
</body>
</html>
