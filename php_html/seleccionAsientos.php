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
    <link rel="stylesheet" href="../CSS/styleAsientos.css">
    <title>Cineplus</title>
</head>
<body>

    <!-- Encabezado de navegación -->
    <header class="header">
        <div class="nav-container">
            <div class="logo">
                <img src="../image/logo_cineplus.png" alt="logo cineplus">
            </div>
            <nav class="nav-left">
                <ul>
                    <li><a href="">Inicio</a></li>
                    <li><a href="">Cartelera</a></li>
                    <li><a href="/HTML/nosotros.html">Nosotros</a></li>
                </ul>
            </nav>
            <div class="search-container">
                <i class="fa-solid fa-magnifying-glass"></i>
                <input type="search" id="site-search" class="search" placeholder="Buscar película"/>
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
                    <img src="../image/profile.png" alt="Profile Image">
                </div>
            </div>
        </div>
    </header>

    <main class="seleccion-asientos-container">
        <!-- Selección de Asientos -->
        <section class="seleccion-asientos">



            <h2>Selección de asientos</h2>

            <div class="leyenda">
                <div class="opcion">
                    <img src="/image/asientos/asiento_normal.png" alt="Disponible" class="icono-asiento">
                    <span>Disponible</span>
                </div>
                <div class="opcion">
                    <img src="/image/asientos/asiento dorado .png" alt="Selección" class="icono-asiento">
                    <span>Selección</span>
                </div>
                <div class="opcion">
                    <img src="/image/asientos/asiento rojo .png" alt="Ocupado" class="icono-asiento">
                    <span>Ocupado</span>
                </div>
                <div class="opcion">
                    <img src="/image/asientos/asiento_discapacitados.png" alt="Silla de ruedas" class="icono-asiento">
                    <span>Silla de ruedas</span>
                </div>
            </div>

            <div class="linea-curva"></div>
            <div class="pantalla">Pantalla</div>
            
            <div class="asientos-grid">
                <!-- Fila A -->
                <div class="fila">
                    <span class="fila-label">A</span>
    
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento rojo .png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento rojo .png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                </div>
                
                <!-- Fila B -->
                <div class="fila">
                    <span class="fila-label">B</span>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                </div>
                
                <!-- Fila C -->
                <div class="fila">
                    <span class="fila-label">C</span>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                </div>
                <!-- Fila D -->
                <div class="fila">
                    <span class="fila-label">D</span>
                    <div class="asiento "> <img src="/image/asientos/asiento_discapacitados.png" alt=""></div>
                    <div class="asiento "> <img src="/image/asientos/asiento_discapacitados.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento"> <img src="/image/asientos/asiento_discapacitados.png" alt=""></div>
                    <div class="asiento"> <img src="/image/asientos/asiento_discapacitados.png" alt=""></div>
                </div>
                <!-- Fila E -->
                <div class="fila">
                    <span class="fila-label">E</span>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div><div class="blanco"></div>
                </div>
                <!-- Fila F -->
                <div class="fila">
                    <span class="fila-label">F</span>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento dorado .png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento dorado .png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                    <div class="asiento "><img src="/image/asientos/asiento_normal.png" alt=""></div>
                </div>
                <!-- Números de columnas -->
                <div class="column-numbers">
                    <span>1</span><span>2</span><span>3</span><span>4</span><span>5</span><span>6</span><span>7</span><span>8</span><span>9</span><span>10</span>
                </div>
            </div>
        </section>
    
    
        <div class="resumen-compra">
            <div class="resumen-heder">
                <h3 class="titulo-pelicula"><strong>Shrek 2</strong></h3>
            </div>
            
            <div class="contenedor">
                <div class="imagenes-resumenS">
                    <img src="/image/Forjadores/shrek 2.jpg" alt="Shrek 2" class="pelicula-poster">
                </div>
        
                <div class="informacion">
                    <div class="detalles">
                        <p><span class="color-letra">Clasificación:</span> <span class="clasificacion">B</span> <span class="color-letra">Duración:</span> 113 min</p>
                        <p><span class="color-letra">Cine:</span>  <br> Forjadores</p>
                        <p><span class="color-letra">Fecha y hora:</span> <br>10 septiembre 2024, 16:15 pm</p>
                        <p><span class="color-letra">Asientos:</span><br> F5, F6</p>
                    </div>
                    
                    <div class="tipo-boleto">
                        <p><span class="color-letra">Tipo de boleto</span></p>
                        <div class="boletos">
                            <div class="boleto">
                                <span class="nombre">Adulto</span>
                                <div class="precio-contador">
                                    <span class="precio">$90</span>
                                    <div class="contador">
                                        <button class="decrementar">-</button>
                                        <span class="cantidad">2</span>
                                        <button class="incrementar">+</button>
                                    </div>
                                </div>
                            </div>
                            <div class="boleto">
                                <span class="nombre">Niños</span>
                                <div class="precio-contador">
                                    <span class="precio">$70</span>
                                    <div class="contador">
                                        <button class="decrementar">-</button>
                                        <span class="cantidad">0</span>
                                        <button class="incrementar">+</button>
                                    </div>
                                </div>
                            </div>
                            <div class="boleto">
                                <span class="nombre">Tercera edad</span>
                                <div class="precio-contador">
                                    <span class="precio">$70</span>
                                    <div class="contador">
                                        <button class="decrementar">-</button>
                                        <span class="cantidad">0</span>
                                        <button class="incrementar">+</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="total-container">
                        <span class="total-text">Total:</span>
                        <span class="total-precio">$180.00</span>
                    </div>
                </div>
            </div>
            
            <div class="botones">
                <button class="boton-seleccionar">Seleccionar</button>
                <button class="boton-volver">Volver</button>
            </div>
        </div>
        </section>
    </main>
    

</body>
</html>