<?php
session_start(); // Inicia sesión para manejo de autenticación

// Verifica si el usuario está autenticado
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

// Obtener la selección actual del cine (desde GET o POST)
$cine_seleccionado = $_GET['selection_places'] ?? $_POST['selection_places'] ?? 'plazas';
?>
<header class="header">
    <div class="nav-container">
        <div class="logo">
            <img src="/proyectoCine/image/logo_cineplus.png" alt="logo cineplus">
        </div>
        <nav class="nav-left">
            <ul>
                <li><a href="/proyectoCine/php_html/landingSesionAbierta.php">Inicio</a></li>
                <li><a href="/proyectoCine/php_html/carteleraForjadores.php?selection_places=<?php echo urlencode($cine_seleccionado); ?>">Cartelera</a></li>
                <li><a href="/proyectoCine/php_html/nosotros.php">Nosotros</a></li>
            </ul>
        </nav>
        <div class="search-container">
            <input type="search" id="site-search" class="search" placeholder="Buscar película" />
            <i class="fa-solid fa-magnifying-glass"></i>
        </div>
        <div class="select_places">
            <form method="GET" action="/proyectoCine/php_html/carteleraForjadores.php" id="cineForm">
                <select class="places" name="selection_places" id="places" onchange="document.getElementById('cineForm').submit();">
                    <option value="plazas" <?php echo ($cine_seleccionado == 'plazas') ? 'selected' : ''; ?>>Las Plazas</option>
                    <option value="liverpool" <?php echo ($cine_seleccionado == 'liverpool') ? 'selected' : ''; ?>>Liverpool</option>
                    <option value="forjadores" <?php echo ($cine_seleccionado == 'forjadores') ? 'selected' : ''; ?>>Forjadores</option>
                </select>
            </form>
        </div>
        <div class="profile">
            <div class="profile-icon">
                <img src="/proyectoCine/image/profile.png" alt="Profile Image">
            </div>
            <div class="dropdown-menu">
                <a href="/proyectoCine/php_html/perfil.php">Perfil</a>
                <a href="/proyectoCine/php_html/historial.php">Historial</a>
                <a href="/proyectoCine/php_html/recompensas.php">Recompensa</a>
                <a href="/proyectoCine/php_funcion/cerrar_sesion.php">Cerrar Sesión</a>
            </div>
        </div>
    </div>
</header>
