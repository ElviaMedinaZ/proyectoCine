<?php

if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
require_once('../php_funcion/database.php');

// Obtener datos de la URL
$id_cartelera = $_GET['id_cartelera'] ?? null;

if (!$id_cartelera) {
    die("ID de cartelera no proporcionado.");
}

// Consultar detalles de la película usando el id_cartelera
$sql = "SELECT c.titulo, c.foto, c.duracion, c.clasificacion, c.genero, c.idioma, c.descripcion, cine.nombre AS cine, c.id_cine
        FROM cartelera c
        JOIN cine ON c.id_cine = cine.id_cine
        WHERE c.id_cartelera = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $id_cartelera);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $pelicula = $result->fetch_assoc();
} else {
    die("No se encontró la película con ese ID.");
}

// Consultar asientos ocupados
$sql_asientos = "SELECT lugar FROM asientos WHERE id_cine = ? AND disponibilidad = 0";
$stmt_asientos = $conn->prepare($sql_asientos);
$stmt_asientos->bind_param("i", $pelicula['id_cine']);
$stmt_asientos->execute();
$result_asientos = $stmt_asientos->get_result();

$asientos_ocupados = [];
while ($row = $result_asientos->fetch_assoc()) {
    $asientos_ocupados[] = $row['lugar'];
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../CSS/style.css">
    <link rel="stylesheet" href="../CSS/style_Asientos.css">
    <title><?php echo htmlspecialchars($pelicula['titulo']); ?> - Selección de Asientos</title>
    <script>
        document.addEventListener("DOMContentLoaded", () => {
            const boletos = { adulto: 0, nino: 0, terceraEdad: 0 };
            const precios = { adulto: 90, nino: 70, terceraEdad: 70 };
            const asientosSeleccionados = [];

            const actualizarResumen = () => {
                const totalBoletos = boletos.adulto + boletos.nino + boletos.terceraEdad;
                const totalPrecio = (boletos.adulto * precios.adulto) + 
                                    (boletos.nino * precios.nino) + 
                                    (boletos.terceraEdad * precios.terceraEdad);

                document.querySelector(".total-precio").innerText = `$${totalPrecio}`;
                document.querySelector(".asientos-seleccionados").innerText = asientosSeleccionados.join(", ") || "Ninguno";
            };

            // Manejo de botones para boletos
            document.querySelectorAll(".contador button").forEach(button => {
                button.addEventListener("click", () => {
                    const tipo = button.dataset.tipo;
                    const accion = button.dataset.accion;

                    if (accion === "incrementar") {
                        boletos[tipo]++;
                    } else if (accion === "decrementar" && boletos[tipo] > 0) {
                        boletos[tipo]--;
                    }

                    document.getElementById(`cantidad_${tipo}`).innerText = boletos[tipo];
                    actualizarResumen();
                });
            });

            // Manejo de selección de asientos
            document.querySelectorAll(".asiento img").forEach(asiento => {
                asiento.addEventListener("click", () => {
                    const lugar = asiento.dataset.lugar;

                    if (asiento.classList.contains("ocupado")) {
                        alert("Este asiento ya está ocupado.");
                        return;
                    }

                    const totalBoletos = boletos.adulto + boletos.nino + boletos.terceraEdad;

                    if (asientosSeleccionados.length >= totalBoletos && !asiento.classList.contains("seleccionado")) {
                        alert("Ya seleccionaste el número máximo de asientos.");
                        return;
                    }

                    asiento.classList.toggle("seleccionado");

                    if (asientosSeleccionados.includes(lugar)) {
                        asientosSeleccionados.splice(asientosSeleccionados.indexOf(lugar), 1);
                        asiento.src = "../image/asientos/asiento_normal.png";
                    } else {
                        asientosSeleccionados.push(lugar);
                        asiento.src = "../image/asientos/asiento dorado .png";
                    }

                    actualizarResumen();
                });
            });

            // Botón Seleccionar
            document.getElementById("botonSeleccionar").addEventListener("click", () => {
                const totalBoletos = boletos.adulto + boletos.nino + boletos.terceraEdad;

                if (asientosSeleccionados.length !== totalBoletos) {
                    alert("Debes seleccionar el mismo número de asientos que boletos.");
                    return;
                }

                const numTransaccion = Math.floor(Math.random() * 9000 + 1000); // Generar número de transacción aleatorio
                const sala = 3; // Sala predeterminada

                const url = `../php_html/pago.php?num_transaccion=${numTransaccion}&sala=${sala}&asientos=${encodeURIComponent(asientosSeleccionados.join(","))}&adulto=${boletos.adulto}&nino=${boletos.nino}&terceraEdad=${boletos.terceraEdad}`;
                window.location.href = url;
            });

            // Botón Cancelar
            document.getElementById("botonCancelar").addEventListener("click", () => {
                const peliculaTitulo = "<?php echo urlencode($pelicula['titulo']); ?>";
                const cineId = "<?php echo $pelicula['id_cine']; ?>";
                const url = `../php_html/seleccionHorarios.php?titulo=${peliculaTitulo}&id_cine=${cineId}`;
                window.location.href = url;
            });
        });
    </script>
</head>
<body>
    <!-- Menú superior -->
    <?php include('header.php'); ?>

    <main class="seleccion-asientos-container">
        <section class="seleccion-asientos">
            <h2>Selección de asientos</h2>

            <div class="leyenda">
                <div class="opcion"><img src="../image/asientos/asiento_normal.png" alt="Disponible" class="icono-asiento"> Disponible</div>
                <div class="opcion"><img src="../image/asientos/asiento dorado .png" alt="Selección" class="icono-asiento"> Selección</div>
                <div class="opcion"><img src="../image/asientos/asiento rojo .png" alt="Ocupado" class="icono-asiento"> Ocupado</div>
                <div class="opcion"><img src="../image/asientos/asiento_discapacitados.png" alt="Silla de ruedas" class="icono-asiento"> Silla de ruedas</div>
            </div>

            <div class="linea-curva"></div>
            <div class="pantalla">Pantalla</div>

            <div class="asientos-grid">
                <?php
                $filas = ['A', 'B', 'C', 'D', 'E', 'F'];
                $columnas = range(1, 10);

                foreach ($filas as $fila) {
                    echo '<div class="fila">';
                    echo '<span class="fila-label">' . $fila . '</span>';
                    foreach ($columnas as $columna) {
                        $lugar = $fila . $columna;
                        $clase = in_array($lugar, $asientos_ocupados) ? 'ocupado' : 'disponible';
                        $img = $clase === 'ocupado' ? '../image/asientos/asiento rojo .png' : '../image/asientos/asiento_normal.png';
                        echo '<div class="asiento">';
                        echo '<img src="' . $img . '" alt="' . $lugar . '" class="' . $clase . '" data-lugar="' . $lugar . '">';
                        echo '</div>';
                    }
                    echo '</div>';
                }
                ?>
                <div class="column-numbers">
                    <?php foreach ($columnas as $col) echo "<span>$col</span>"; ?>
                </div>
            </div>
        </section>

        <div class="resumen-compra">
            <div class="resumen-heder">
                <h3 class="titulo-pelicula"><strong><?php echo htmlspecialchars($pelicula['titulo']); ?></strong></h3>
            </div>

            <div class="contenedor">
                <div class="imagenes-resumenS">
                    <img src="<?php echo htmlspecialchars($pelicula['foto']); ?>" alt="<?php echo htmlspecialchars($pelicula['titulo']); ?>" class="pelicula-poster">
                </div>

                <div class="informacion">
                    <div class="detalles">
                        <p><span class="color-letra">Clasificación:</span> <?php echo htmlspecialchars($pelicula['clasificacion']); ?></p>
                        <p><span class="color-letra">Duración:</span> <?php echo htmlspecialchars($pelicula['duracion']); ?> min</p>
                        <p><span class="color-letra">Cine:</span> <?php echo htmlspecialchars($pelicula['cine']); ?></p>
                        <p><span class="color-letra">Asientos:</span> <span class="asientos-seleccionados">Ninguno</span></p>
                    </div>

                    <div class="tipo-boleto">
                        <p><span class="color-letra">Tipo de boleto</span></p>
                        <div class="boletos">
                            <div class="boleto">
                                <span class="nombre">Adulto</span>
                                <div class="precio-contador">
                                    <span class="precio">$90</span>
                                    <div class="contador">
                                        <button data-tipo="adulto" data-accion="decrementar">-</button>
                                        <span id="cantidad_adulto">0</span>
                                        <button data-tipo="adulto" data-accion="incrementar">+</button>
                                    </div>
                                </div>
                            </div>
                            <div class="boleto">
                                <span class="nombre">Niños</span>
                                <div class="precio-contador">
                                    <span class="precio">$70</span>
                                    <div class="contador">
                                        <button data-tipo="nino" data-accion="decrementar">-</button>
                                        <span id="cantidad_nino">0</span>
                                        <button data-tipo="nino" data-accion="incrementar">+</button>
                                    </div>
                                </div>
                            </div>
                            <div class="boleto">
                                <span class="nombre">Tercera edad</span>
                                <div class="precio-contador">
                                    <span class="precio">$70</span>
                                    <div class="contador">
                                        <button data-tipo="terceraEdad" data-accion="decrementar">-</button>
                                        <span id="cantidad_terceraEdad">0</span>
                                        <button data-tipo="terceraEdad" data-accion="incrementar">+</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="total-container">
                        <span class="total-text">Total:</span>
                        <span class="total-precio">$0</span>
                    </div>
                </div>
            </div>
            <div class="botones">
                <button class="boton-seleccionar" id="botonSeleccionar">Seleccionar</button>
                <button class="boton-volver" id="botonCancelar">Cancelar</button>
            </div>


        </div>
    </main>
</body>
</html>
