<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../CSS/style.css">
    <title>Cineplus - Inicio de Sesión</title>
</head>
<body class="login-page">
    <header class="header">
        <div class="logo">
            <img src="../image/logo_cineplus.png" alt="logo cineplus">
        </div>
    </header>

    <div class="container">
        <main>
            <form class="form" id="loginForm">
                <h1 class="title">Inicio de sesión</h1>

                <div>
                    <label for="user">Usuario</label>
                    <input type="text" id="user" name="user" placeholder="usuario123">
                </div>

                <div>
                    <label for="password">Contraseña</label>
                    <input type="password" id="password" name="password" placeholder="•••••••••••">
                    <a class="forget-password" href="../HTML/olvidarContrasena.html">¿Olvidaste tu contraseña?</a>
                </div>

                <button type="submit" class="btn-login">Ingresar</button>

                <div class="text-container">
                    <span class="text">¿No tienes cuenta?</span>
                    <a class="register" href="../HTML/register.html">Regístrate</a>
                </div>
            </form>
        </main>
    </div>

    <script src="../JS/login.js"></script>
</body>
</html>
