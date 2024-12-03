<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Librería Font Awesome (Iconos) -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" rel="stylesheet">
    <!-- Fuente Montserrat -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    <!-- Hoja de estilos -->
    <link rel="stylesheet" href="../CSS/style_perfil.css">
    <title>Cineplus - Información Personal</title>
</head>
<body>

    <?php
        // Incluir el encabezado
        include('header.php');

        // Simulación de datos del usuario para pruebas (puedes reemplazar con consulta real a la base de datos)
        $usuario = [
            'nombre' => 'Kristofer',
            'apellido' => 'Hernandez',
            'usuario' => 'Krhe_22',
            'correo' => 'krhe_22@alu.uabcs.mx',
            'puntos' => 0,
            'imagen' => '../image/profile.png' // Imagen de perfil por defecto
        ];
    ?>

    <div class="container">
        <h1>Información Personal</h1>
        <form action="procesar_perfil.php" method="POST" enctype="multipart/form-data">
            <div class="profile-section">
                <!-- Imagen de perfil -->
                <div class="profile-image">
                    <img src="<?= htmlspecialchars($usuario['imagen']); ?>" alt="Imagen de perfil" onclick="document.getElementById('image').click();">
                    <p>Puntos: <?= htmlspecialchars($usuario['puntos']); ?></p>
                    <input type="file" id="image" name="image" style="display: none;" accept="image/*">
                    <span class="upload-text">Subir imagen</span>
                </div>

                <!-- Información del usuario -->
                <div class="profile-details">
                    <div class="form-group">
                        <label for="nombre">Nombre(s)</label>
                        <input type="text" id="nombre" name="nombre" value="<?= htmlspecialchars($usuario['nombre']); ?>" required>
                    </div>
                    <div class="form-group">
                        <label for="apellido">Apellido</label>
                        <input type="text" id="apellido" name="apellido" value="<?= htmlspecialchars($usuario['apellido']); ?>" required>
                    </div>
                    <div class="form-group">
                        <label for="usuario">Usuario</label>
                        <input type="text" id="usuario" name="usuario" value="<?= htmlspecialchars($usuario['usuario']); ?>" readonly>
                    </div>
                    <div class="form-group">
                        <label for="correo">Correo</label>
                        <input type="email" id="correo" name="correo" value="<?= htmlspecialchars($usuario['correo']); ?>" readonly>
                    </div>
                </div>
            </div>

            <!-- Botones -->
            <div class="buttons">
                <button type="button" class="cancel" onclick="location.href='index.php';">Cancelar</button>
                <button type="submit" class="save">Guardar</button>
            </div>
        </form>
    </div>

</body>
</html>
