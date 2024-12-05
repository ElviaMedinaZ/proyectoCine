-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-12-2024 a las 00:18:45
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_cine`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_cine` (IN `p_id` INT, IN `p_nombre` VARCHAR(100), IN `p_ubicacion` VARCHAR(255))   BEGIN
    UPDATE Cine
    SET nombre = p_nombre, ubicacion = p_ubicacion
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtener_cartelera_por_genero` (IN `p_genero` VARCHAR(50))   BEGIN
    SELECT C.nombre AS cine, CT.genero, CT.clasificacion, CT.duracion, CT.hora, CT.fecha, CT.idioma
    FROM Cartelera CT
    JOIN Cine C ON CT.cine = C.id
    WHERE CT.genero = p_genero;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtener_transacciones_usuario` (IN `p_id_usuario` INT)   BEGIN
    SELECT H.num_transaccion, C.nombre AS cine, H.sala, H.fecha, H.hora, H.asiento
    FROM Historial H
    JOIN Cine C ON H.id_cine = C.id
    WHERE H.id_usuario = p_id_usuario;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_usuario` (IN `p_usuario` VARCHAR(50), IN `p_contraseña` VARCHAR(50), IN `p_nombre` VARCHAR(50), IN `p_apellidos` VARCHAR(50), IN `p_imagen` VARCHAR(255))   BEGIN
    INSERT INTO Usuarios (usuario, contraseña, nombre, apellidos, imagen, puntos)
    VALUES (p_usuario, p_contraseña, p_nombre, p_apellidos, p_imagen, 0);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cartelera`
--

CREATE TABLE `cartelera` (
  `id_cartelera` int(11) NOT NULL,
  `genero` varchar(50) DEFAULT NULL,
  `clasificacion` varchar(10) DEFAULT NULL,
  `duracion` time DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `id_cine` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `idioma` varchar(20) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cartelera`
--

INSERT INTO `cartelera` (`id_cartelera`, `genero`, `clasificacion`, `duracion`, `hora`, `id_cine`, `fecha`, `idioma`, `foto`, `titulo`) VALUES
(1, 'Animación', 'A', '01:55:00', '14:00:00', 1, '2024-12-03', 'Español', '../image/Forjadores/tu nombre.jpg', 'Your Name'),
(2, 'Animación', 'A', '01:55:00', '16:30:00', 1, '2024-12-03', 'Inglés', '../image/Forjadores/tu nombre.jpg', 'Your Name'),
(3, 'Animación', 'A', '01:55:00', '19:00:00', 1, '2024-12-04', 'Español', '../image/Forjadores/tu nombre.jpg', 'Your Name'),
(4, 'Animación', 'A', '01:55:00', '21:30:00', 1, '2024-12-04', 'Inglés', '../image/Forjadores/tu nombre.jpg', 'Your Name'),
(5, 'Animación', 'A', '01:45:00', '14:00:00', 1, '2024-12-03', 'Español', '../image/Forjadores/como entrenar a tu dragon 3.jpg', 'Cómo Entrenar a tu Dragón 3'),
(6, 'Animación', 'A', '01:45:00', '16:30:00', 1, '2024-12-03', 'Inglés', '../image/Forjadores/como entrenar a tu dragon 3.jpg', 'Cómo Entrenar a tu Dragón 3'),
(7, 'Animación', 'A', '01:45:00', '19:00:00', 1, '2024-12-04', 'Español', '../image/Forjadores/como entrenar a tu dragon 3.jpg', 'Cómo Entrenar a tu Dragón 3'),
(8, 'Animación', 'A', '01:45:00', '21:30:00', 1, '2024-12-04', 'Inglés', '../image/Forjadores/como entrenar a tu dragon 3.jpg', 'Cómo Entrenar a tu Dragón 3'),
(9, 'Romance', 'B', '01:50:00', '14:00:00', 1, '2024-12-03', 'Español', '../image/Forjadores/romper circulo.jpg', 'Romper el Círculo'),
(10, 'Romance', 'B', '01:50:00', '16:30:00', 1, '2024-12-03', 'Inglés', '../image/Forjadores/romper circulo.jpg', 'Romper el Círculo'),
(11, 'Romance', 'B', '01:50:00', '19:00:00', 1, '2024-12-04', 'Español', '../image/Forjadores/romper circulo.jpg', 'Romper el Círculo'),
(12, 'Romance', 'B', '01:50:00', '21:30:00', 1, '2024-12-04', 'Inglés', '../image/Forjadores/romper circulo.jpg', 'Romper el Círculo'),
(13, 'Animación', 'A', '01:45:00', '14:00:00', 1, '2024-12-03', 'Español', '../image/Forjadores/kung fu panda 2.jpg', 'Kung Fu Panda 2'),
(14, 'Animación', 'A', '01:45:00', '16:30:00', 1, '2024-12-03', 'Inglés', '../image/Forjadores/kung fu panda 2.jpg', 'Kung Fu Panda 2'),
(15, 'Animación', 'A', '01:45:00', '19:00:00', 1, '2024-12-04', 'Español', '../image/Forjadores/kung fu panda 2.jpg', 'Kung Fu Panda 2'),
(16, 'Animación', 'A', '01:45:00', '21:30:00', 1, '2024-12-04', 'Inglés', '../image/Forjadores/kung fu panda 2.jpg', 'Kung Fu Panda 2'),
(17, 'Romance', 'A', '02:05:00', '14:00:00', 1, '2024-12-03', 'Español', '../image/Forjadores/orgullo y prejuicio.jpg', 'Orgullo y Prejuicio'),
(18, 'Romance', 'A', '02:05:00', '16:30:00', 1, '2024-12-03', 'Inglés', '../image/Forjadores/orgullo y prejuicio.jpg', 'Orgullo y Prejuicio'),
(19, 'Romance', 'A', '02:05:00', '19:00:00', 1, '2024-12-04', 'Español', '../image/Forjadores/orgullo y prejuicio.jpg', 'Orgullo y Prejuicio'),
(20, 'Romance', 'A', '02:05:00', '21:30:00', 1, '2024-12-04', 'Inglés', '../image/Forjadores/orgullo y prejuicio.jpg', 'Orgullo y Prejuicio'),
(21, 'Animación', 'A', '01:30:00', '14:00:00', 1, '2024-12-03', 'Español', '../image/Forjadores/Phineas_y_ferb.jpeg', 'Phineas y Ferb'),
(22, 'Animación', 'A', '01:30:00', '16:30:00', 1, '2024-12-03', 'Inglés', '../image/Forjadores/Phineas_y_ferb.jpeg', 'Phineas y Ferb'),
(23, 'Animación', 'A', '01:30:00', '19:00:00', 1, '2024-12-04', 'Español', '../image/Forjadores/Phineas_y_ferb.jpeg', 'Phineas y Ferb'),
(24, 'Animación', 'A', '01:30:00', '21:30:00', 1, '2024-12-04', 'Inglés', '../image/Forjadores/Phineas_y_ferb.jpeg', 'Phineas y Ferb'),
(25, 'Ciencia Ficción', 'A', '01:40:00', '14:00:00', 1, '2024-12-03', 'Español', '../image/Forjadores/wall e.jpg', 'Wall-E'),
(26, 'Ciencia Ficción', 'A', '01:40:00', '16:30:00', 1, '2024-12-03', 'Inglés', '../image/Forjadores/wall e.jpg', 'Wall-E'),
(27, 'Ciencia Ficción', 'A', '01:40:00', '19:00:00', 1, '2024-12-04', 'Español', '../image/Forjadores/wall e.jpg', 'Wall-E'),
(28, 'Ciencia Ficción', 'A', '01:40:00', '21:30:00', 1, '2024-12-04', 'Inglés', '../image/Forjadores/wall e.jpg', 'Wall-E'),
(29, 'Ciencia Ficción', 'B15', '02:15:00', '14:00:00', 2, '2024-12-03', 'Español', '../image/Forjadores/deadpool&wolverine.jpg', 'Deadpool y Wolverine'),
(30, 'Ciencia Ficción', 'B15', '02:15:00', '16:30:00', 2, '2024-12-03', 'Inglés', '../image/Forjadores/deadpool&wolverine.jpg', 'Deadpool y Wolverine'),
(31, 'Ciencia Ficción', 'B15', '02:15:00', '19:00:00', 2, '2024-12-04', 'Español', '../image/Forjadores/deadpool&wolverine.jpg', 'Deadpool y Wolverine'),
(32, 'Ciencia Ficción', 'B15', '02:15:00', '21:30:00', 2, '2024-12-04', 'Inglés', '../image/Forjadores/deadpool&wolverine.jpg', 'Deadpool y Wolverine'),
(33, 'Ciencia Ficción', 'A', '01:40:00', '14:00:00', 2, '2024-12-03', 'Español', '../image/Forjadores/wall e.jpg', 'Wall-E'),
(34, 'Ciencia Ficción', 'A', '01:40:00', '16:30:00', 2, '2024-12-03', 'Inglés', '../image/Forjadores/wall e.jpg', 'Wall-E'),
(35, 'Ciencia Ficción', 'A', '01:40:00', '19:00:00', 2, '2024-12-04', 'Español', '../image/Forjadores/wall e.jpg', 'Wall-E'),
(36, 'Ciencia Ficción', 'A', '01:40:00', '21:30:00', 2, '2024-12-04', 'Inglés', '../image/Forjadores/wall e.jpg', 'Wall-E'),
(37, 'Comedia', 'B', '01:40:00', '14:00:00', 2, '2024-12-03', 'Español', '../image/Forjadores/shrek 2.jpg', 'Shrek 2'),
(38, 'Comedia', 'B', '01:40:00', '16:30:00', 2, '2024-12-03', 'Inglés', '../image/Forjadores/shrek 2.jpg', 'Shrek 2'),
(39, 'Comedia', 'B', '01:40:00', '19:00:00', 2, '2024-12-04', 'Español', '../image/Forjadores/shrek 2.jpg', 'Shrek 2'),
(40, 'Comedia', 'B', '01:40:00', '21:30:00', 2, '2024-12-04', 'Inglés', '../image/Forjadores/shrek 2.jpg', 'Shrek 2'),
(41, 'Ciencia Ficción', 'B15', '02:00:00', '14:00:00', 2, '2024-12-03', 'Español', '../image/Forjadores/alien.jpeg', 'Alien'),
(42, 'Ciencia Ficción', 'B15', '02:00:00', '16:30:00', 2, '2024-12-03', 'Inglés', '../image/Forjadores/alien.jpeg', 'Alien'),
(43, 'Ciencia Ficción', 'B15', '02:00:00', '19:00:00', 2, '2024-12-04', 'Español', '../image/Forjadores/alien.jpeg', 'Alien'),
(44, 'Ciencia Ficción', 'B15', '02:00:00', '21:30:00', 2, '2024-12-04', 'Inglés', '../image/Forjadores/alien.jpeg', 'Alien'),
(45, 'Animación', 'A', '01:45:00', '14:00:00', 2, '2024-12-03', 'Español', '../image/Forjadores/como entrenar a tu dragon 3.jpg', 'Cómo Entrenar a tu Dragón 3'),
(46, 'Animación', 'A', '01:45:00', '16:30:00', 2, '2024-12-03', 'Inglés', '../image/Forjadores/como entrenar a tu dragon 3.jpg', 'Cómo Entrenar a tu Dragón 3'),
(47, 'Animación', 'A', '01:45:00', '19:00:00', 2, '2024-12-04', 'Español', '../image/Forjadores/como entrenar a tu dragon 3.jpg', 'Cómo Entrenar a tu Dragón 3'),
(48, 'Animación', 'A', '01:45:00', '21:30:00', 2, '2024-12-04', 'Inglés', '../image/Forjadores/como entrenar a tu dragon 3.jpg', 'Cómo Entrenar a tu Dragón 3'),
(49, 'Animación', 'A', '01:30:00', '14:00:00', 2, '2024-12-03', 'Español', '../image/Forjadores/cenicienta.jpg', 'Cenicienta'),
(50, 'Animación', 'A', '01:30:00', '16:30:00', 2, '2024-12-03', 'Inglés', '../image/Forjadores/cenicienta.jpg', 'Cenicienta'),
(51, 'Animación', 'A', '01:30:00', '19:00:00', 2, '2024-12-04', 'Español', '../image/Forjadores/cenicienta.jpg', 'Cenicienta'),
(52, 'Animación', 'A', '01:30:00', '21:30:00', 2, '2024-12-04', 'Inglés', '../image/Forjadores/cenicienta.jpg', 'Cenicienta'),
(53, 'Drama', 'B15', '02:10:00', '14:00:00', 2, '2024-12-03', 'Español', '../image/Forjadores/mientras dormias.jpg', 'Mientras Dormías'),
(54, 'Drama', 'B15', '02:10:00', '16:30:00', 2, '2024-12-03', 'Inglés', '../image/Forjadores/mientras dormias.jpg', 'Mientras Dormías'),
(55, 'Drama', 'B15', '02:10:00', '19:00:00', 2, '2024-12-04', 'Español', '../image/Forjadores/mientras dormias.jpg', 'Mientras Dormías'),
(56, 'Drama', 'B15', '02:10:00', '21:30:00', 2, '2024-12-04', 'Inglés', '../image/Forjadores/mientras dormias.jpg', 'Mientras Dormías'),
(57, 'Drama', 'B15', '02:10:00', '14:00:00', 3, '2024-12-03', 'Español', '../image/Forjadores/mientras dormias.jpg', 'Mientras Dormías'),
(58, 'Drama', 'B15', '02:10:00', '16:30:00', 3, '2024-12-03', 'Inglés', '../image/Forjadores/mientras dormias.jpg', 'Mientras Dormías'),
(59, 'Drama', 'B15', '02:10:00', '19:00:00', 3, '2024-12-04', 'Español', '../image/Forjadores/mientras dormias.jpg', 'Mientras Dormías'),
(60, 'Drama', 'B15', '02:10:00', '21:30:00', 3, '2024-12-04', 'Inglés', '../image/Forjadores/mientras dormias.jpg', 'Mientras Dormías'),
(61, 'Ciencia Ficción', 'B15', '02:15:00', '14:00:00', 3, '2024-12-03', 'Español', '../image/Forjadores/deadpool&wolverine.jpg', 'Deadpool y Wolverine'),
(62, 'Ciencia Ficción', 'B15', '02:15:00', '16:30:00', 3, '2024-12-03', 'Inglés', '../image/Forjadores/deadpool&wolverine.jpg', 'Deadpool y Wolverine'),
(63, 'Ciencia Ficción', 'B15', '02:15:00', '19:00:00', 3, '2024-12-04', 'Español', '../image/Forjadores/deadpool&wolverine.jpg', 'Deadpool y Wolverine'),
(64, 'Ciencia Ficción', 'B15', '02:15:00', '21:30:00', 3, '2024-12-04', 'Inglés', '../image/Forjadores/deadpool&wolverine.jpg', 'Deadpool y Wolverine'),
(65, 'Animación', 'A', '01:45:00', '14:00:00', 3, '2024-12-03', 'Español', '../image/Forjadores/como entrenar a tu dragon 3.jpg', 'Cómo Entrenar a tu Dragón 3'),
(66, 'Animación', 'A', '01:45:00', '16:30:00', 3, '2024-12-03', 'Inglés', '../image/Forjadores/como entrenar a tu dragon 3.jpg', 'Cómo Entrenar a tu Dragón 3'),
(67, 'Animación', 'A', '01:45:00', '19:00:00', 3, '2024-12-04', 'Español', '../image/Forjadores/como entrenar a tu dragon 3.jpg', 'Cómo Entrenar a tu Dragón 3'),
(68, 'Animación', 'A', '01:45:00', '21:30:00', 3, '2024-12-04', 'Inglés', '../image/Forjadores/como entrenar a tu dragon 3.jpg', 'Cómo Entrenar a tu Dragón 3'),
(69, 'Drama', 'B', '02:00:00', '14:00:00', 3, '2024-12-03', 'Español', '../image/Forjadores/una voz silenciosa.jpg', 'Una Voz Silenciosa'),
(70, 'Drama', 'B', '02:00:00', '16:30:00', 3, '2024-12-03', 'Inglés', '../image/Forjadores/una voz silenciosa.jpg', 'Una Voz Silenciosa'),
(71, 'Drama', 'B', '02:00:00', '19:00:00', 3, '2024-12-04', 'Español', '../image/Forjadores/una voz silenciosa.jpg', 'Una Voz Silenciosa'),
(72, 'Drama', 'B', '02:00:00', '21:30:00', 3, '2024-12-04', 'Inglés', '../image/Forjadores/una voz silenciosa.jpg', 'Una Voz Silenciosa'),
(73, 'Ciencia Ficción', 'A', '01:40:00', '14:00:00', 3, '2024-12-03', 'Español', '../image/Forjadores/wall e.jpg', 'Wall-E'),
(74, 'Ciencia Ficción', 'A', '01:40:00', '16:30:00', 3, '2024-12-03', 'Inglés', '../image/Forjadores/wall e.jpg', 'Wall-E'),
(75, 'Ciencia Ficción', 'A', '01:40:00', '19:00:00', 3, '2024-12-04', 'Español', '../image/Forjadores/wall e.jpg', 'Wall-E'),
(76, 'Ciencia Ficción', 'A', '01:40:00', '21:30:00', 3, '2024-12-04', 'Inglés', '../image/Forjadores/wall e.jpg', 'Wall-E'),
(77, 'Animación', 'A', '01:30:00', '14:00:00', 3, '2024-12-03', 'Español', '../image/Forjadores/Phineas_y_ferb.jpeg', 'Phineas y Ferb'),
(78, 'Animación', 'A', '01:30:00', '16:30:00', 3, '2024-12-03', 'Inglés', '../image/Forjadores/Phineas_y_ferb.jpeg', 'Phineas y Ferb'),
(79, 'Animación', 'A', '01:30:00', '19:00:00', 3, '2024-12-04', 'Español', '../image/Forjadores/Phineas_y_ferb.jpeg', 'Phineas y Ferb'),
(80, 'Animación', 'A', '01:30:00', '21:30:00', 3, '2024-12-04', 'Inglés', '../image/Forjadores/Phineas_y_ferb.jpeg', 'Phineas y Ferb'),
(81, 'Comedia', 'A', '01:50:00', '14:00:00', 3, '2024-12-03', 'Español', '../image/Forjadores/ratatouille.jpg', 'Ratatouille'),
(82, 'Comedia', 'A', '01:50:00', '16:30:00', 3, '2024-12-03', 'Inglés', '../image/Forjadores/ratatouille.jpg', 'Ratatouille'),
(83, 'Comedia', 'A', '01:50:00', '19:00:00', 3, '2024-12-04', 'Español', '../image/Forjadores/ratatouille.jpg', 'Ratatouille'),
(84, 'Comedia', 'A', '01:50:00', '21:30:00', 3, '2024-12-04', 'Inglés', '../image/Forjadores/ratatouille.jpg', 'Ratatouille');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cine`
--

CREATE TABLE `cine` (
  `id_cine` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `ubicacion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cine`
--

INSERT INTO `cine` (`id_cine`, `nombre`, `ubicacion`) VALUES
(1, 'Las Plazas', 'Lorem Ipsum 123'),
(2, 'Liverpool', 'Lorem Ipsum 456'),
(3, 'Forjadores', 'Lorem Ipsum 789');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE `historial` (
  `id_historial` int(11) NOT NULL,
  `num_transaccion` varchar(50) DEFAULT NULL,
  `sala` varchar(20) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `asiento` varchar(10) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_cartelera` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Disparadores `historial`
--
DELIMITER $$
CREATE TRIGGER `actualizar_puntos` AFTER INSERT ON `historial` FOR EACH ROW BEGIN
    UPDATE Usuarios
    SET puntos = puntos + 10
    WHERE id_usuario = NEW.id_usuario;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `evitar_compras_horarios_pasados` BEFORE INSERT ON `historial` FOR EACH ROW BEGIN
    IF NEW.fecha < CURDATE() OR (NEW.fecha = CURDATE() AND NEW.hora < CURTIME()) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se pueden realizar compras en horarios pasados.';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `evitar_duplicados_transaccion` BEFORE INSERT ON `historial` FOR EACH ROW BEGIN
    IF EXISTS (
        SELECT 1 
        FROM Historial 
        WHERE num_transaccion = NEW.num_transaccion
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Transacción duplicada.';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recompensas`
--

CREATE TABLE `recompensas` (
  `id_recompensas` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `costo` int(11) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `contraseña` varchar(50) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `puntos` int(11) DEFAULT 0,
  `correo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `usuario`, `contraseña`, `nombre`, `apellidos`, `imagen`, `puntos`, `correo`) VALUES
(4, 'admin', '1234', NULL, NULL, NULL, 0, 'admin@gmail.com');

--
-- Disparadores `usuarios`
--
DELIMITER $$
CREATE TRIGGER `log_cambios_usuarios` AFTER UPDATE ON `usuarios` FOR EACH ROW BEGIN
    INSERT INTO CambiosUsuarios (id_usuario, cambio, fecha_hora)
    VALUES (NEW.id_usuario, 'Actualización de datos', NOW());
END
$$
DELIMITER ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cartelera`
--
ALTER TABLE `cartelera`
  ADD PRIMARY KEY (`id_cartelera`),
  ADD KEY `id_cine` (`id_cine`);

--
-- Indices de la tabla `cine`
--
ALTER TABLE `cine`
  ADD PRIMARY KEY (`id_cine`);

--
-- Indices de la tabla `historial`
--
ALTER TABLE `historial`
  ADD PRIMARY KEY (`id_historial`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `fk_historial_cartelera` (`id_cartelera`);

--
-- Indices de la tabla `recompensas`
--
ALTER TABLE `recompensas`
  ADD PRIMARY KEY (`id_recompensas`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cartelera`
--
ALTER TABLE `cartelera`
  MODIFY `id_cartelera` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;

--
-- AUTO_INCREMENT de la tabla `cine`
--
ALTER TABLE `cine`
  MODIFY `id_cine` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `historial`
--
ALTER TABLE `historial`
  MODIFY `id_historial` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `recompensas`
--
ALTER TABLE `recompensas`
  MODIFY `id_recompensas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cartelera`
--
ALTER TABLE `cartelera`
  ADD CONSTRAINT `cartelera_ibfk_1` FOREIGN KEY (`id_cine`) REFERENCES `cine` (`id_cine`);

--
-- Filtros para la tabla `historial`
--
ALTER TABLE `historial`
  ADD CONSTRAINT `fk_historial_cartelera` FOREIGN KEY (`id_cartelera`) REFERENCES `cartelera` (`id_cartelera`),
  ADD CONSTRAINT `historial_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

DELIMITER $$
--
-- Eventos
--
CREATE DEFINER=`root`@`localhost` EVENT `actualizar_puntos_diario` ON SCHEDULE EVERY 1 DAY STARTS '2024-12-01 20:10:13' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE Usuarios
SET puntos = puntos + 5
WHERE id_usuario IN (SELECT DISTINCT id_usuario FROM Historial WHERE fecha = CURDATE())$$

CREATE DEFINER=`root`@`localhost` EVENT `generar_reporte_semanal` ON SCHEDULE EVERY 1 WEEK STARTS '2024-12-01 20:10:43' ON COMPLETION NOT PRESERVE ENABLE DO INSERT INTO Reportes (tipo, fecha_generacion, detalles)
VALUES ('Transacciones Semanales', NOW(), 'Reporte de la semana actual')$$

CREATE DEFINER=`root`@`localhost` EVENT `expirar_puntos_mensuales` ON SCHEDULE EVERY 1 MONTH STARTS '2024-12-01 20:11:15' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE Usuarios
SET puntos = CASE WHEN puntos > 10 THEN puntos - 10 ELSE 0 END$$

CREATE DEFINER=`root`@`localhost` EVENT `limpiar_historial_anual` ON SCHEDULE EVERY 1 YEAR STARTS '2024-12-01 20:11:53' ON COMPLETION NOT PRESERVE ENABLE DO DELETE FROM Historial WHERE fecha < DATE_SUB(CURDATE(), INTERVAL 1 YEAR)$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
