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
    <link rel="stylesheet" href="../CSS/style_pago.css">

    <title>Cineplus</title>
</head>
<body>
    
    <?php
        include ('header.php');
    ?>
    
    <div class="container">
        <main>
            <section class="payment-section">
                <h2>Pago</h2>
                <div class="payment-info">
                    <input type="text" placeholder="Kristofer" class="input-field">
                    <input type="text" placeholder="Hernandez" class="input-field">
                    <input type="email" placeholder="krh2_22@gmail.com" class="input-field">
                </div>
                
                <h2>Método de pago</h2>
                <div class="payment-method">
                    <button class="payment-option">Tarjeta de crédito o de débito</button>
                    <button class="payment-option">Click to pay</button>
                    <button class="payment-option">PayPal</button>
                    <button class="payment-option">Kueski pay</button>
                </div>
                
                <div class="action-buttons">
                    <button class="confirm-btn">Confirmar</button>
                    <button class="cancel-btn">Cancelar</button>
                </div>
            </section>
        </main>
    </div>
</body>
</html>
