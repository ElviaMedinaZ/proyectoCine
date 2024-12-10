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

            <form class="form" id="registerForm" action="../php_funcion/registro.php" method="POST">
            
                <h1 class="title">Registro</h1>

                <div>
                    <label class="user" for="user">Usuario</label>
                    <input type="text" id="user" name="user">
                </div>

                <div>
                    <label class="email" for="email">Correo</label>
                    <input type="email" id="email" name="email">
                </div>

                <div>
                    <label class="password" for="password">Contraseña</label>
                    <input type="password" id="password" name="password">
                </div>

                    <button type="submit" id="btn-register" name="btn-register" class="btn-register">Registrar</button>
            </form>
        </main>
    </div>


</body>
</html>