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
            <form class="form" action="../HTML/landingSesionAbierta.html" method="GET">

                <h1 class="title">Inicio de sesión</h1>

                <div>
                    
                    <label class="user" for="user">Usuario</label>
                    <input type="text" id="user" name="user" placeholder="usuario123">
                </div>

                <div>
                    <label class="password" for="password">Contraseña</label>
                    <input type="password" id="password" name="password" placeholder="•••••••••••">
                    <a class="forget-password" href="../HTML/olvidarContrasena.html">¿Olvidaste tu contraseña?</a>
                </div>

                <button type="submit" id="btn-login" name="btn-login" class="btn-login">Ingresar</button>
                <div class="text-container">
                    <span class="text">¿No tienes cuenta?</span>
                    <a class="register" href="../HTML/register.html">Regístrate</a>
                </div>
            </form>
            
        </main>
    </div>
</body>
</html>