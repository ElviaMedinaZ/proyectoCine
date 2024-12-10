<?php

// Verifica si la sesión ya está iniciada antes de llamar a session_start()
if (session_status() == PHP_SESSION_NONE) {
    session_start(); // Solo inicia la sesión si no está activa
}

// Verifica si el usuario está autenticado
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

// Conectar a la base de datos
require_once('../php_funcion/database.php');

// Obtener la imagen de perfil del usuario desde la base de datos
$user_id = $_SESSION['user_id'];
$sql = "SELECT imagen_blob FROM usuarios WHERE id_usuario = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();
$user_image = null;

if ($result->num_rows === 1) {
    $user = $result->fetch_assoc();
    // Si existe la imagen en la base de datos, la asignamos a la variable $user_image
    if ($user['imagen_blob']) {
        $user_image = 'data:image/png;base64,' . base64_encode($user['imagen_blob']);
    }
}

// Si no hay imagen, usar la imagen por defecto
if (!$user_image) {
    $user_image = "/proyectoCine/image/profile.png";
}

// Obtener la selección actual del cine (desde GET o POST)
$cine_seleccionado = $_GET['selection_places'] ?? $_POST['selection_places'] ?? 'plazas';
?>
<header class="header">

     <!-- Checkbox para controlar el menú -->
     <input type="checkbox" id="menu-toggle">
    <label for="menu-toggle" class="menu-icon">
        <i class="fa-solid fa-bars"></i>
    </label>


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
            <form method="GET" action="/proyectoCine/php_html/carteleraForjadores.php">
                <input 
                    type="search" 
                    name="site-search" 
                    id="site-search" 
                    class="search" 
                    placeholder="Buscar película" 
                    value="<?php echo htmlspecialchars($_GET['site-search'] ?? '', ENT_QUOTES); ?>" 
                />
                <input type="hidden" name="selection_places" value="<?php echo htmlspecialchars($cine_seleccionado); ?>">
            </form>
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
                <!-- Aquí se muestra la imagen de perfil obtenida desde la base de datos o la predeterminada -->
                <img src="<?php echo $user_image; ?>" alt="Profile Image">
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