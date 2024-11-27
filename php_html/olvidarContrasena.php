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

            <form class="form" action="Index.html" method="GET">
                
                <h1 class="title">Restablecer contraseña</h1>

                <div>
                    <img src="../image/Lock.png" alt="candado seguridad">
                </div>

                <div>
                    <p>Ingrese su correo electrónico  para 
                        <br>enviarle un código de verificación</p>
                </div>

                <div>
                    <input type="text" id="user" name="user">
                </div>

                <button type="submit" id="btn-register" name="btn-register" class="btn-register">Enviar</button>
            </form>
            
        </main>
    </div>

</body>
</html>