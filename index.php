<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="CSS/style.css">
    <title>Cineplus</title>
</head>
<body>

<!-- Menú superior -->

    <?php
    // Verifica si el usuario está autenticado
    session_start(); // Inicia la sesión

    // Verifica si el usuario está autenticado
    if (isset($_SESSION['user_id'])) {
    header("Location: php_html/landingSesionAbierta.php");
    exit();
    }

    ?>
    <header class="header">
        <div class="nav-container">
            <div class="logo">
                <img src="/proyectoCine/image/logo_cineplus.png" alt="logo cineplus">
            </div>
            <nav class="nav-left">
                <ul>
                    <li><a href="/proyectoCine/php_html/landingSesionAbierta.php">Inicio</a></li>
                    <li><a href="/proyectoCine/php_html/carteleraForjadores.php">Cartelera</a></li>
                    <li><a href="/proyectoCine/php_html/nosotros.php">Nosotros</a></li>
                </ul>
            </nav>
            <div class="search-container">
                <input type="search" id="site-search" class="search" placeholder="Buscar película"/>
                <i class="fa-solid fa-magnifying-glass"></i>
            </div>
            <div class="select_places">
                <select class="places" name="selection_places" id="places">
                    <option value="plazas">Las Plazas</option>
                    <option value="liverpool">Liverpool</option>
                    <option value="forjadores">Forjadores</option>
                </select>
            </div>
            <div class="profile">
                <div class="profile-icon">
                    <img src="/proyectoCine/image/profile.png" alt="Profile Image">
                </div>
                <div class="dropdown-menu">
                    <a href="/proyectoCine/php_html/login.php">Iniciar sesión</a>
                    <a href="/proyectoCine/php_html/register.php">Registrarse</a>
                </div>
            </div>
        </div>
    </header>

    <!-- Carrusel de películas destacadas -->
    <section class="carousel">
        <div class="flecha flecha-izquierda">
            <img src="image/recompensas/Chevron left.png" alt="flecha izquierda">
        </div>
        <div class="carousel-container">
            <div class="carousel-slide">
                <img src="image/Forjadores/alien.jpeg" alt="alien">
            </div>
        </div>
        <div class="flecha flecha-derecha">
            <img src="image/recompensas/Chevron right.png" alt="flecha derecha">
        </div>
    </section>

    <!-- Sección de películas destacadas -->
    <section class="destacadas">
        <div class="titulo-destacadas">
            <h1>Destacadas</h1>
        </div>
        <div class="container-cartelera">
            <main>
                <section class="cartelera">
                    
                    <figure class="pelicula">
                        <img src="image/Forjadores/cenicienta.jpg" alt="Cenicienta">
                        <div class="ver-mas">Ver más</div>
                        <figcaption>Cenicienta</figcaption>
                    </figure>
                    
                    <figure class="pelicula">
                        <img src="image/Forjadores/romper circulo.jpg" alt="Romper el Círculo">
                        <div class="ver-mas">Ver más</div>
                        <figcaption>Romper el círculo</figcaption>
                    </figure>
    
                    <figure class="pelicula">
                        <img src="image/Forjadores/Deadpool&Wolverine.jpg" alt="Deadpool y Wolverine">
                        <div class="ver-mas">Ver más</div>
                        <figcaption>Deadpool y Wolverine</figcaption>
                    </figure>
                    
                    <figure class="pelicula">
                        <img src="image/Forjadores/alien.jpeg" alt="Alien">
                        <div class="ver-mas">Ver más</div>
                        <figcaption>Alien</figcaption>
                    </figure>
    
                    <figure class="pelicula">
                        <img src="image/Forjadores/shrek 2.jpg" alt="Wall-e">
                        <div class="ver-mas">Ver más</div>
                        <figcaption>Wall-e</figcaption>
                    </figure>
                    
                    <figure class="pelicula">
                        <img src="image/Forjadores/como entrenar a tu dragon 3.jpg" alt="Como Entrenar a tu Dragon 3">
                        <div class="ver-mas">Ver más</div>
                        <figcaption>Como entrenar a tu dragon 3</figcaption>
                    </figure>
                </section>
    </section>
</body>
</html>
