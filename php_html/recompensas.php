
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
        include('../php_funcion/cargar_puntos.php'); // Este archivo debe inicializar la variable $puntos
    ?>

    <div class="container-rewards">
        <main>
            <section>
                <h1>Puntos y recompensas</h1>
                <h2>Puntos: <?= htmlspecialchars($puntos) ?></h2>
                <div class="carrusel">
                    <div class="flechas">
                        <img src="../image/recompensas/Chevron left.png" alt="flecha izquierda">
                    </div>
                    <div class="tarjetas-container">
                        <?php include('../php_funcion/cargar_recompensas.php'); ?>
                    </div>
                    <div class="flechas">
                        <img src="../image/recompensas/Chevron right.png" alt="flecha derecha">
                    </div>
                </div>
            </section>
        </main>
    </div>
</body>
</html>
