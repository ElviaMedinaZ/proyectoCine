<!DOCTYPE html>
<html lang="en">
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
    <?php
        include ('header.php');
    ?>

    <div class="container-rewards">
        <main>
            <section>
                <h1>Puntos y recompensas</h1>
                <h2>Puntos: 10</h2>
                <div class="carrusel">
                    <div class="flechas">
                        <img src="../image/recompensas/Chevron left.png" alt="flecha izquierda">
                    </div>
                    <div class="tarjetas-container">
                        <div class="elemento elemento-seleccion">
                            <img class="recompensa" src="../image/recompensas/entrada.png" alt="boletos">
                            <p>Lorem ipsum dolor sit amet.</p>
                            <a>lorem ipsum</a>
                        </div>
                        <div class="elemento">
                            <img class="recompensa" src="../image/recompensas/image 2.png" alt="boletos">
                            <p>Lorem ipsum dolor sit amet.</p>
                            <a>lorem ipsum</a>
                        </div>
                        <div class="elemento">
                            <img class="recompensa" src="../image/recompensas/nachos.png" alt="boletos">
                            <p>Lorem ipsum dolor sit amet.</p>
                            <a>lorem ipsum</a>
                        </div>
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