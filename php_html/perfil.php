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
    <link rel="stylesheet" href="../CSS/style_perfil.css">

    <title>Cineplus</title>
</head>
<body>
    <?php 
        include('header.php');
        include('../php_funcion/perfil.php');
    ?>

    <div class="container">
        <form action="../php_html/perfil.php" method="POST" enctype="multipart/form-data" class="profile-form">
            <div class="profile-container">
                <!-- Contenedor izquierdo: Imagen y puntos -->
                <div class="profile-image-container">
                    <span class="upload-text">Subir imagen</span>
                    <img id="profilePic" src="<?= htmlspecialchars($user_image); ?>" alt="Imagen de perfil" onclick="document.getElementById('image').click();" />
                    <input type="file" name="image" id="image" accept="image/png" style="display: none;" onchange="previewImage(event)">
                    <input type="hidden" name="current_image_blob" value="<?= htmlspecialchars($user['imagen_blob']); ?>">
                </div>

                <!-- Contenedor derecho: Campos del perfil -->
                <div class="profile-details-container">
                    <h1 class="title">Información personal</h1>
                    <div class="profile-details">
                        <div class="input-group">
                            <div>
                                <label for="nombre">Nombre(s)</label>
                                <input type="text" name="nombre" id="nombre" value="<?= htmlspecialchars($user['nombre']); ?>">
                            </div>
                            <div>
                                <label for="apellidos">Apellido(s)</label>
                                <input type="text" name="apellidos" id="apellidos" value="<?= htmlspecialchars($user['apellidos']); ?>">
                            </div>
                        </div>

                        <div class="input-group">
                            <div>
                                <label for="user">Usuario</label>
                                <input type="text" id="user" value="<?= htmlspecialchars($user['usuario']); ?>" disabled>
                            </div>
                            <div>
                                <label for="correo">Correo</label>
                                <input type="text" name="correo" id="correo" value="<?= htmlspecialchars($user['correo']); ?>" required>
                            </div>
                        </div>

                        <div class="form-buttons">
                            <button type="button" class="btn cancel-btn" onclick="window.location.href='../php_html/landingSesionAbierta.php';">Cancelar</button>
                            <button type="submit" class="btn save-btn">Guardar</button>
                        </div>
                    </div>

                    <div class="points-container">
                        <p class="points">Puntos: <span id="points"><?= htmlspecialchars($user['puntos']); ?></span></p>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <script src="../JS/profile.js"></script>
</body>
</html>