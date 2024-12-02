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
    <link rel="stylesheet" href="../CSS/style_perfil.css">

    <title>Cineplus</title>
</head>
<body>

    <?php
        include ('header.php');
        include ('../php_funcion/perfil.php'); // Incluimos las variables desde perfil.php
    ?>

    <div class="container">
        <h1>Información personal</h1>
        <form action="../php_funcion/perfil.php" method="POST" enctype="multipart/form-data">
            <div class="profile-section">
                <div class="profile-image">
                    <!-- Imagen del perfil o imagen por defecto -->
                    <img id="profilePic" src="<?= htmlspecialchars($user_image); ?>" alt="Imagen de perfil" />
                    <input type="file" name="image" id="image" accept="image/*">
                    <!-- Campo oculto para almacenar la imagen actual -->
                    <input type="hidden" name="current_image" value="<?= htmlspecialchars($user['Imagen']); ?>">
                </div>
                <div class="profile-details">
                    <label for="nombre">Nombre(s)</label>
                    <input type="text" id="nombre" name="nombre" value="<?= htmlspecialchars($user['Nombre']); ?>" required>

                    <label for="apellido">Apellido</label>
                    <input type="text" id="apellido" name="apellido" value="<?= htmlspecialchars($user['Apellido']); ?>" required>

                    <label for="username">Usuario</label>
                    <input type="text" id="username" name="username" value="<?= htmlspecialchars($user['Username']); ?>" readonly>

                    <label for="correo">Correo</label>
                    <input type="email" id="correo" name="correo" value="<?= htmlspecialchars($user['Correo']); ?>" readonly>

                    <label for="puntos">Puntos</label>
                    <input type="text" id="puntos" name="puntos" value="<?= htmlspecialchars($user['Puntos']); ?>" readonly>
                </div>
            </div>
            <div class="buttons">
                <button type="button" onclick="location.href='../php_html/landingSesionAbierta.php'">Cancelar</button>
                <button type="submit">Guardar</button>
            </div>
        </form>
    </div>
</body>
</html>
