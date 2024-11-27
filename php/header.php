<!-- Menú superior -->
<header class="header">
        <div class="nav-container">
            <div class="logo">
                <img src="/proyectoCine/image/logo_cineplus.png" alt="logo cineplus">
            </div>
            <nav class="nav-left">
                <ul>
                    <li><a href="/proyectoCine/php/landingSesionAbierta.php">Inicio</a></li>
                    <li><a href="/proyectoCine/php/carteleraForjadores.php">Cartelera</a></li>
                    <li><a href="/proyectoCine/php/nosotros.php">Nosotros</a></li>
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
                    <a href="/proyectoCine/php/login.php">Iniciar sesión</a>
                    <a href="/proyectoCine/php/register.php">Registrarse</a>
                </div>
            </div>
        </div>
    </header>