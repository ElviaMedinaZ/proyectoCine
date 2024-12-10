<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- fuente de la pagina -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    <!-- hoja de estilos -->
    <link rel="stylesheet" href="../CSS/style.css">
    <title>Cineplus</title>
</head>
<body class="login-page">
    <header class="header">
        <div class="logo">
            <img src="../image/logo_cineplus.png" alt="logo cineplus">
        </div>
    </header>

    <div class="container">
        <main>
            <form class="form" id="cambiarForm" action="../php_funcion/cambiar_contraseña.php" method="POST" onsubmit="return validarFormulario()">
                <h1 class="title">Reestablecer contraseña</h1>

                <div>
                    <label class="user" for="user">Usuario</label>
                    <input type="text" id="user" name="user">
                </div>

                <div>
                    <label class="password" for="password">Nueva contraseña</label>
                    <input type="password" id="password" name="password">
                </div>

                <div>
                    <label class="confirm-password" for="confirm-password">Confirmar contraseña</label>
                    <input type="password" id="confirm-password" name="confirm-password">
                </div>

                <button type="submit" id="btn-resetPassword" name="btn-resetPassword" class="btn-resetPassword">Reestablecer</button>
            </form>
        </main>
    </div>

    <script>
        function validarFormulario() {
            const usuario = document.getElementById('user').value.trim();
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirm-password').value;

            if (!usuario || !password || !confirmPassword) {
                alert('Todos los campos son obligatorios.');
                return false;
            }

            if (password !== confirmPassword) {
                alert('Las contraseñas no coinciden.');
                return false;
            }

            return true;
        }
    </script>
</body>
</html>
