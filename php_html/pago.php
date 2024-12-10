<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- librería font awesome (iconos) -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" rel="stylesheet">
    <!-- fuente de la página -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    <!-- hoja de estilos -->
    <link rel="stylesheet" href="../CSS/style.css">
    <link rel="stylesheet" href="../CSS/style_pago.css">

    <title>Cineplus</title>
    <script>
        document.addEventListener("DOMContentLoaded", () => {
            let metodoPagoSeleccionado = null;

            // Seleccionar método de pago
            document.querySelectorAll('.payment-option').forEach(option => {
                option.addEventListener('click', () => {
                    document.querySelectorAll('.payment-option').forEach(opt => opt.classList.remove('selected'));
                    option.classList.add('selected');
                    metodoPagoSeleccionado = option.getAttribute('data-method'); // Obtener método de pago
                });
            });

            document.querySelector('.confirm-btn').addEventListener('click', () => {
                if (!metodoPagoSeleccionado) {
                    alert('Por favor, selecciona un método de pago antes de confirmar.');
                    return;
                }

                // Variables enviadas desde selección de asientos
                const asientos = "<?php echo htmlspecialchars($_GET['asientos'] ?? ''); ?>";
                const idCartelera = "<?php echo htmlspecialchars($_GET['id_cartelera'] ?? ''); ?>";
                const costo = "<?php echo htmlspecialchars($_GET['costo'] ?? ''); ?>";

                // Verifica en la consola que las variables tengan datos
                console.log({ asientos, idCartelera, costo, metodoPagoSeleccionado });

                // Generar URL para enviar datos
                const url = `../php_funcion/ingresar_historial.php?asientos=${encodeURIComponent(asientos)}&id_cartelera=${idCartelera}&costo=${costo}&metodo_pago=${encodeURIComponent(metodoPagoSeleccionado)}`;
                
                // Redirigir a la URL
                window.location.href = url;
            });

            // Cancelar operación
            document.querySelector('.cancel-btn').addEventListener('click', () => {
                window.location.href = 'seleccionHorarios.php';
            });
        });
    </script>
</head>
<body>
    <?php 
        include('header.php'); 
        include('../php_funcion/pago.php');
      

        // Validar y definir las variables necesarias
        $asientos = htmlspecialchars($_GET['asientos'] ?? ''); // Si no está definido, usa un valor vacío
        $id_cartelera = htmlspecialchars($_GET['id_cartelera'] ?? ''); // Igual para id_cartelera
        $costo = htmlspecialchars($_GET['costo'] ?? 0); // Igual para costo, con valor 0 predeterminado

        // Generar datos adicionales como número de transacción
        $num_transaccion = rand(1000, 9999); // Generar un número aleatorio para la transacción
    ?>
    


    <div class="container">
        <main>
            <form id="pagoForm" method="POST" action="../php_funcion/ingresar_historial.php">
                <section class="payment-section">
                    <h2>Pago</h2>
                    <div class="payment-info">
                        <!-- Cargar datos del usuario -->
                        <input type="text" value="<?= htmlspecialchars($user['nombre']); ?>" placeholder="Nombre" class="input-field" readonly>
                        <input type="text" value="<?= htmlspecialchars($user['apellidos']); ?>" placeholder="Apellido" class="input-field" readonly>
                        <input type="email" value="<?= htmlspecialchars($user['correo']); ?>" placeholder="Correo electrónico" class="input-field" readonly>
                    </div>
                    
                    <h2>Método de pago</h2>
                <div class="payment-method">
                    <button type="button" class="payment-option" data-method="Tarjeta de crédito o de débito">Tarjeta de crédito o de débito</button>
                    <button type="button" class="payment-option" data-method="Click to pay">Click to pay</button>
                    <button type="button" class="payment-option" data-method="PayPal">PayPal</button>
                    <button type="button" class="payment-option" data-method="Kueski Pay">Kueski Pay</button>
                </div>

                <div class="action-buttons">
                    <button type="button" class="confirm-btn">Confirmar</button>
                    <button type="button" class="cancel-btn">Cancelar</button>
                </div>

                </section>
            </form>
        </main>
    </div>
</body>
</html>
