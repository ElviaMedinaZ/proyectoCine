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
    <link rel="stylesheet" href="../CSS/styleHistorial.css">
    <title>Cineplus</title>
</head>
<body>

    <?php
    include ('header.php');
    ?>

    <div class="historial-compras">
        <h1>Historial de compras</h1>
        <p class="fecha-actual">Hoy, 13 de septiembre de 2024</p>
    
        <div class="tarjetas-wrapper">
            <button class="navegacion izquierda">&lt;</button>
            
            <div class="tarjetas-container">
                <div class="tarjeta">
                    <h2>Lorem ipsum dolor sit amet</h2>
                    <p><strong class="color">Número de transacción:</strong> 45454</p>
                    <p><strong class="color">Cine:</strong> Cinepolis, Las Plazas</p>
                    <p><strong class="color">Sala:</strong> 4</p>
                    <p><strong class="color">Fecha:</strong> Viernes, 13 septiembre de 2024</p>
                    <p><strong class="color">Hora:</strong> 18:12</p>
                    <p><strong class="color">Asientos:</strong> B4, B5, B6</p>
                    <p><strong class="color">ID cine:</strong> 8457</p>
                    <img src="../image/Forjadores/cenicienta.jpg" alt="Póster de película">
                    <p class="total"><strong class="color">Total de la compra:</strong> <span class="total-precio">$180</span></p>
                </div>
    
                <div class="tarjeta">
                    <h2>Lorem ipsum dolor sit amet</h2>
                    <p><strong class="color">Número de transacción:</strong> 45454</p>
                    <p><strong class="color">Cine:</strong> Cinepolis, Las Plazas</p>
                    <p><strong class="color">Sala:</strong> 4</p>
                    <p><strong class="color">Fecha:</strong> Viernes, 13 septiembre de 2024</p>
                    <p><strong class="color">Hora:</strong> 18:12</p>
                    <p><strong class="color">Asientos:</strong> B4, B5, B6</p>
                    <p><strong class="color">ID cine:</strong> 8457</p>
                    <img src="../image/Forjadores/alien.jpeg" alt="Póster de película">
                    <p class="total"><strong class="color">Total de la compra:</strong> <span class="total-precio">$180</span></p>
                </div>
            </div>
    
            <button class="navegacion derecha">&gt;</button>
        </div>
    </div>
</body>
</html>