-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-12-2024 a las 06:38:44
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
-- Estructura de tabla para la tabla `asientos`
--

CREATE TABLE `asientos` (
  `id_asiento` int(11) NOT NULL,
  `id_cine` int(11) NOT NULL,
  `tipo` enum('Normal','Preferencial','blanco','rojo') NOT NULL,
  `lugar` varchar(10) NOT NULL,
  `disponibilidad` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `asientos`
--

INSERT INTO `asientos` (`id_asiento`, `id_cine`, `tipo`, `lugar`, `disponibilidad`) VALUES
(1, 1, 'blanco', '1A', 0),
(2, 1, 'blanco', '2A', 0),
(3, 1, 'Normal', '3A', 1),
(4, 1, 'Normal', '4A', 1),
(5, 1, 'Normal', '5A', 1),
(6, 1, 'Normal', '6A', 1),
(7, 1, 'Preferencial', '7A', 1),
(8, 1, 'Preferencial', '8A', 1),
(9, 1, 'blanco', '9A', 0),
(10, 1, 'blanco', '10A', 0),
(11, 1, 'blanco', '1B', 0),
(12, 1, 'blanco', '2B', 0),
(13, 1, 'Normal', '3B', 1),
(14, 1, 'Normal', '4B', 1),
(15, 1, 'Normal', '5B', 1),
(16, 1, 'Normal', '6B', 1),
(17, 1, 'Normal', '7B', 1),
(18, 1, 'Normal', '8B', 1),
(19, 1, 'blanco', '9B', 0),
(20, 1, 'blanco', '10B', 0),
(21, 1, 'blanco', '1C', 0),
(22, 1, 'blanco', '2C', 0),
(23, 1, 'Normal', '3C', 1),
(24, 1, 'Normal', '4C', 1),
(25, 1, 'Normal', '5C', 1),
(26, 1, 'Normal', '6C', 1),
(27, 1, 'Normal', '7C', 1),
(28, 1, 'Normal', '8C', 1),
(29, 1, 'blanco', '9C', 0),
(30, 1, 'blanco', '10C', 0),
(31, 1, 'blanco', '1D', 0),
(32, 1, 'blanco', '2D', 0),
(33, 1, 'Normal', '3D', 1),
(34, 1, 'Normal', '4D', 1),
(35, 1, 'Normal', '5D', 1),
(36, 1, 'Normal', '6D', 1),
(37, 1, 'Normal', '7D', 1),
(38, 1, 'Normal', '8D', 1),
(39, 1, 'blanco', '9D', 0),
(40, 1, 'blanco', '10D', 0),
(41, 1, 'blanco', '1E', 0),
(42, 1, 'Normal', '2E', 1),
(43, 1, 'Normal', '3E', 1),
(44, 1, 'Normal', '4E', 1),
(45, 1, 'Normal', '5E', 1),
(46, 1, 'Normal', '6E', 1),
(47, 1, 'Normal', '7E', 1),
(48, 1, 'Normal', '8E', 1),
(49, 1, 'Normal', '9E', 1),
(50, 1, 'blanco', '10E', 0),
(51, 1, 'Normal', '1F', 1),
(52, 1, 'Normal', '2F', 1),
(53, 1, 'Normal', '3F', 1),
(54, 1, 'Normal', '4F', 1),
(55, 1, 'rojo', '5F', 0),
(56, 1, 'rojo', '6F', 0),
(57, 1, 'Normal', '7F', 1),
(58, 1, 'Normal', '8F', 1),
(59, 1, 'Normal', '9F', 1),
(60, 1, 'Normal', '10F', 1);

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
  `titulo` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cartelera`
--

INSERT INTO `cartelera` (`id_cartelera`, `genero`, `clasificacion`, `duracion`, `hora`, `id_cine`, `fecha`, `idioma`, `foto`, `titulo`, `descripcion`) VALUES
(1, 'Animación', 'A', '01:55:00', '14:00:00', 1, '2024-12-03', 'Español', '../image/Forjadores/tu nombre.jpg', 'Your Name', 'Una historia conmovedora de amor y destinos cruzados que desafía el tiempo y el espacio.'),
(2, 'Animación', 'A', '01:55:00', '16:30:00', 1, '2024-12-03', 'Inglés', '../image/Forjadores/tu nombre.jpg', 'Your Name', 'Una historia conmovedora de amor y destinos cruzados que desafía el tiempo y el espacio.'),
(3, 'Animación', 'A', '01:55:00', '19:00:00', 1, '2024-12-04', 'Español', '../image/Forjadores/tu nombre.jpg', 'Your Name', 'Una historia conmovedora de amor y destinos cruzados que desafía el tiempo y el espacio.'),
(4, 'Animación', 'A', '01:55:00', '21:30:00', 1, '2024-12-04', 'Inglés', '../image/Forjadores/tu nombre.jpg', 'Your Name', 'Una historia conmovedora de amor y destinos cruzados que desafía el tiempo y el espacio.'),
(5, 'Animación', 'A', '01:45:00', '14:00:00', 1, '2024-12-03', 'Español', '../image/Forjadores/como entrenar a tu dragon 3.jpg', 'Cómo Entrenar a tu Dragón 3', 'Hipo y Chimuelo descubren un mundo secreto mientras enfrentan el mayor desafío de sus vidas.'),
(6, 'Animación', 'A', '01:45:00', '16:30:00', 1, '2024-12-03', 'Inglés', '../image/Forjadores/como entrenar a tu dragon 3.jpg', 'Cómo Entrenar a tu Dragón 3', 'Hipo y Chimuelo descubren un mundo secreto mientras enfrentan el mayor desafío de sus vidas.'),
(7, 'Animación', 'A', '01:45:00', '19:00:00', 1, '2024-12-04', 'Español', '../image/Forjadores/como entrenar a tu dragon 3.jpg', 'Cómo Entrenar a tu Dragón 3', 'Hipo y Chimuelo descubren un mundo secreto mientras enfrentan el mayor desafío de sus vidas.'),
(8, 'Animación', 'A', '01:45:00', '21:30:00', 1, '2024-12-04', 'Inglés', '../image/Forjadores/como entrenar a tu dragon 3.jpg', 'Cómo Entrenar a tu Dragón 3', 'Hipo y Chimuelo descubren un mundo secreto mientras enfrentan el mayor desafío de sus vidas.'),
(9, 'Romance', 'B', '01:50:00', '14:00:00', 1, '2024-12-03', 'Español', '../image/Forjadores/romper circulo.jpg', 'Romper el Círculo', 'Un poderoso drama que explora el amor, las relaciones y la fuerza para cambiar el destino.'),
(10, 'Romance', 'B', '01:50:00', '16:30:00', 1, '2024-12-03', 'Inglés', '../image/Forjadores/romper circulo.jpg', 'Romper el Círculo', 'Un poderoso drama que explora el amor, las relaciones y la fuerza para cambiar el destino.'),
(11, 'Romance', 'B', '01:50:00', '19:00:00', 1, '2024-12-04', 'Español', '../image/Forjadores/romper circulo.jpg', 'Romper el Círculo', 'Un poderoso drama que explora el amor, las relaciones y la fuerza para cambiar el destino.'),
(12, 'Romance', 'B', '01:50:00', '21:30:00', 1, '2024-12-04', 'Inglés', '../image/Forjadores/romper circulo.jpg', 'Romper el Círculo', 'Un poderoso drama que explora el amor, las relaciones y la fuerza para cambiar el destino.'),
(13, 'Animación', 'A', '01:45:00', '14:00:00', 1, '2024-12-03', 'Español', '../image/Forjadores/kung fu panda 2.jpg', 'Kung Fu Panda 2', 'Po y los Cinco Furiosos enfrentan a un nuevo enemigo en una épica aventura llena de acción.'),
(14, 'Animación', 'A', '01:45:00', '16:30:00', 1, '2024-12-03', 'Inglés', '../image/Forjadores/kung fu panda 2.jpg', 'Kung Fu Panda 2', 'Po y los Cinco Furiosos enfrentan a un nuevo enemigo en una épica aventura llena de acción.'),
(15, 'Animación', 'A', '01:45:00', '19:00:00', 1, '2024-12-04', 'Español', '../image/Forjadores/kung fu panda 2.jpg', 'Kung Fu Panda 2', 'Po y los Cinco Furiosos enfrentan a un nuevo enemigo en una épica aventura llena de acción.'),
(16, 'Animación', 'A', '01:45:00', '21:30:00', 1, '2024-12-04', 'Inglés', '../image/Forjadores/kung fu panda 2.jpg', 'Kung Fu Panda 2', 'Po y los Cinco Furiosos enfrentan a un nuevo enemigo en una épica aventura llena de acción.'),
(17, 'Romance', 'A', '02:05:00', '14:00:00', 1, '2024-12-03', 'Español', '../image/Forjadores/orgullo y prejuicio.jpg', 'Orgullo y Prejuicio', 'Una adaptación clásica de la obra maestra de Jane Austen sobre el amor y los malentendidos.'),
(18, 'Romance', 'A', '02:05:00', '16:30:00', 1, '2024-12-03', 'Inglés', '../image/Forjadores/orgullo y prejuicio.jpg', 'Orgullo y Prejuicio', 'Una adaptación clásica de la obra maestra de Jane Austen sobre el amor y los malentendidos.'),
(19, 'Romance', 'A', '02:05:00', '19:00:00', 1, '2024-12-04', 'Español', '../image/Forjadores/orgullo y prejuicio.jpg', 'Orgullo y Prejuicio', 'Una adaptación clásica de la obra maestra de Jane Austen sobre el amor y los malentendidos.'),
(20, 'Romance', 'A', '02:05:00', '21:30:00', 1, '2024-12-04', 'Inglés', '../image/Forjadores/orgullo y prejuicio.jpg', 'Orgullo y Prejuicio', 'Una adaptación clásica de la obra maestra de Jane Austen sobre el amor y los malentendidos.'),
(21, 'Animación', 'A', '01:30:00', '14:00:00', 1, '2024-12-03', 'Español', '../image/Forjadores/Phineas_y_ferb.jpeg', 'Phineas y Ferb', 'Una divertida película de las increíbles aventuras de dos hermanos geniales y su ornitorrinco espía.'),
(22, 'Animación', 'A', '01:30:00', '16:30:00', 1, '2024-12-03', 'Inglés', '../image/Forjadores/Phineas_y_ferb.jpeg', 'Phineas y Ferb', 'Una divertida película de las increíbles aventuras de dos hermanos geniales y su ornitorrinco espía.'),
(23, 'Animación', 'A', '01:30:00', '19:00:00', 1, '2024-12-04', 'Español', '../image/Forjadores/Phineas_y_ferb.jpeg', 'Phineas y Ferb', 'Una divertida película de las increíbles aventuras de dos hermanos geniales y su ornitorrinco espía.'),
(24, 'Animación', 'A', '01:30:00', '21:30:00', 1, '2024-12-04', 'Inglés', '../image/Forjadores/Phineas_y_ferb.jpeg', 'Phineas y Ferb', 'Una divertida película de las increíbles aventuras de dos hermanos geniales y su ornitorrinco espía.'),
(25, 'Ciencia Ficción', 'A', '01:40:00', '14:00:00', 1, '2024-12-03', 'Español', '../image/Forjadores/wall e.jpg', 'Wall-E', 'Un tierno robot descubre el verdadero significado del amor mientras intenta salvar el planeta.'),
(26, 'Ciencia Ficción', 'A', '01:40:00', '16:30:00', 1, '2024-12-03', 'Inglés', '../image/Forjadores/wall e.jpg', 'Wall-E', 'Un tierno robot descubre el verdadero significado del amor mientras intenta salvar el planeta.'),
(27, 'Ciencia Ficción', 'A', '01:40:00', '19:00:00', 1, '2024-12-04', 'Español', '../image/Forjadores/wall e.jpg', 'Wall-E', 'Un tierno robot descubre el verdadero significado del amor mientras intenta salvar el planeta.'),
(28, 'Ciencia Ficción', 'A', '01:40:00', '21:30:00', 1, '2024-12-04', 'Inglés', '../image/Forjadores/wall e.jpg', 'Wall-E', 'Un tierno robot descubre el verdadero significado del amor mientras intenta salvar el planeta.'),
(29, 'Ciencia Ficción', 'B15', '02:15:00', '14:00:00', 2, '2024-12-03', 'Español', '../image/Forjadores/deadpool&wolverine.jpg', 'Deadpool y Wolverine', 'Un explosivo cruce de héroes donde el sarcasmo y la acción se combinan en una aventura épica.'),
(30, 'Ciencia Ficción', 'B15', '02:15:00', '16:30:00', 2, '2024-12-03', 'Inglés', '../image/Forjadores/deadpool&wolverine.jpg', 'Deadpool y Wolverine', 'Un explosivo cruce de héroes donde el sarcasmo y la acción se combinan en una aventura épica.'),
(31, 'Ciencia Ficción', 'B15', '02:15:00', '19:00:00', 2, '2024-12-04', 'Español', '../image/Forjadores/deadpool&wolverine.jpg', 'Deadpool y Wolverine', 'Un explosivo cruce de héroes donde el sarcasmo y la acción se combinan en una aventura épica.'),
(32, 'Ciencia Ficción', 'B15', '02:15:00', '21:30:00', 2, '2024-12-04', 'Inglés', '../image/Forjadores/deadpool&wolverine.jpg', 'Deadpool y Wolverine', 'Un explosivo cruce de héroes donde el sarcasmo y la acción se combinan en una aventura épica.'),
(33, 'Ciencia Ficción', 'A', '01:40:00', '14:00:00', 2, '2024-12-03', 'Español', '../image/Forjadores/wall e.jpg', 'Wall-E', 'Un tierno robot descubre el verdadero significado del amor mientras intenta salvar el planeta.'),
(34, 'Ciencia Ficción', 'A', '01:40:00', '16:30:00', 2, '2024-12-03', 'Inglés', '../image/Forjadores/wall e.jpg', 'Wall-E', 'Un tierno robot descubre el verdadero significado del amor mientras intenta salvar el planeta.'),
(35, 'Ciencia Ficción', 'A', '01:40:00', '19:00:00', 2, '2024-12-04', 'Español', '../image/Forjadores/wall e.jpg', 'Wall-E', 'Un tierno robot descubre el verdadero significado del amor mientras intenta salvar el planeta.'),
(36, 'Ciencia Ficción', 'A', '01:40:00', '21:30:00', 2, '2024-12-04', 'Inglés', '../image/Forjadores/wall e.jpg', 'Wall-E', 'Un tierno robot descubre el verdadero significado del amor mientras intenta salvar el planeta.'),
(37, 'Comedia', 'B', '01:40:00', '14:00:00', 2, '2024-12-03', 'Español', '../image/Forjadores/shrek 2.jpg', 'Shrek 2', 'El regreso del ogro favorito del mundo en una hilarante y mágica historia familiar.'),
(38, 'Comedia', 'B', '01:40:00', '16:30:00', 2, '2024-12-03', 'Inglés', '../image/Forjadores/shrek 2.jpg', 'Shrek 2', 'El regreso del ogro favorito del mundo en una hilarante y mágica historia familiar.'),
(39, 'Comedia', 'B', '01:40:00', '19:00:00', 2, '2024-12-04', 'Español', '../image/Forjadores/shrek 2.jpg', 'Shrek 2', 'El regreso del ogro favorito del mundo en una hilarante y mágica historia familiar.'),
(40, 'Comedia', 'B', '01:40:00', '21:30:00', 2, '2024-12-04', 'Inglés', '../image/Forjadores/shrek 2.jpg', 'Shrek 2', 'El regreso del ogro favorito del mundo en una hilarante y mágica historia familiar.'),
(41, 'Ciencia Ficción', 'B15', '02:00:00', '14:00:00', 2, '2024-12-03', 'Español', '../image/Forjadores/alien.jpeg', 'Alien', NULL),
(42, 'Ciencia Ficción', 'B15', '02:00:00', '16:30:00', 2, '2024-12-03', 'Inglés', '../image/Forjadores/alien.jpeg', 'Alien', NULL),
(43, 'Ciencia Ficción', 'B15', '02:00:00', '19:00:00', 2, '2024-12-04', 'Español', '../image/Forjadores/alien.jpeg', 'Alien', NULL),
(44, 'Ciencia Ficción', 'B15', '02:00:00', '21:30:00', 2, '2024-12-04', 'Inglés', '../image/Forjadores/alien.jpeg', 'Alien', NULL),
(45, 'Animación', 'A', '01:45:00', '14:00:00', 2, '2024-12-03', 'Español', '../image/Forjadores/como entrenar a tu dragon 3.jpg', 'Cómo Entrenar a tu Dragón 3', 'Hipo y Chimuelo descubren un mundo secreto mientras enfrentan el mayor desafío de sus vidas.'),
(46, 'Animación', 'A', '01:45:00', '16:30:00', 2, '2024-12-03', 'Inglés', '../image/Forjadores/como entrenar a tu dragon 3.jpg', 'Cómo Entrenar a tu Dragón 3', 'Hipo y Chimuelo descubren un mundo secreto mientras enfrentan el mayor desafío de sus vidas.'),
(47, 'Animación', 'A', '01:45:00', '19:00:00', 2, '2024-12-04', 'Español', '../image/Forjadores/como entrenar a tu dragon 3.jpg', 'Cómo Entrenar a tu Dragón 3', 'Hipo y Chimuelo descubren un mundo secreto mientras enfrentan el mayor desafío de sus vidas.'),
(48, 'Animación', 'A', '01:45:00', '21:30:00', 2, '2024-12-04', 'Inglés', '../image/Forjadores/como entrenar a tu dragon 3.jpg', 'Cómo Entrenar a tu Dragón 3', 'Hipo y Chimuelo descubren un mundo secreto mientras enfrentan el mayor desafío de sus vidas.'),
(49, 'Animación', 'A', '01:30:00', '14:00:00', 2, '2024-12-03', 'Español', '../image/Forjadores/cenicienta.jpg', 'Cenicienta', 'Un clásico cuento de hadas que revive con magia, romance y un inolvidable zapato de cristal.'),
(50, 'Animación', 'A', '01:30:00', '16:30:00', 2, '2024-12-03', 'Inglés', '../image/Forjadores/cenicienta.jpg', 'Cenicienta', 'Un clásico cuento de hadas que revive con magia, romance y un inolvidable zapato de cristal.'),
(51, 'Animación', 'A', '01:30:00', '19:00:00', 2, '2024-12-04', 'Español', '../image/Forjadores/cenicienta.jpg', 'Cenicienta', 'Un clásico cuento de hadas que revive con magia, romance y un inolvidable zapato de cristal.'),
(52, 'Animación', 'A', '01:30:00', '21:30:00', 2, '2024-12-04', 'Inglés', '../image/Forjadores/cenicienta.jpg', 'Cenicienta', 'Un clásico cuento de hadas que revive con magia, romance y un inolvidable zapato de cristal.'),
(53, 'Drama', 'B15', '02:10:00', '14:00:00', 2, '2024-12-03', 'Español', '../image/Forjadores/mientras dormias.jpg', 'Mientras Dormías', 'Una historia romántica inesperada sobre la magia de la Navidad y el destino.'),
(54, 'Drama', 'B15', '02:10:00', '16:30:00', 2, '2024-12-03', 'Inglés', '../image/Forjadores/mientras dormias.jpg', 'Mientras Dormías', 'Una historia romántica inesperada sobre la magia de la Navidad y el destino.'),
(55, 'Drama', 'B15', '02:10:00', '19:00:00', 2, '2024-12-04', 'Español', '../image/Forjadores/mientras dormias.jpg', 'Mientras Dormías', 'Una historia romántica inesperada sobre la magia de la Navidad y el destino.'),
(56, 'Drama', 'B15', '02:10:00', '21:30:00', 2, '2024-12-04', 'Inglés', '../image/Forjadores/mientras dormias.jpg', 'Mientras Dormías', 'Una historia romántica inesperada sobre la magia de la Navidad y el destino.'),
(57, 'Drama', 'B15', '02:10:00', '14:00:00', 3, '2024-12-03', 'Español', '../image/Forjadores/mientras dormias.jpg', 'Mientras Dormías', 'Una historia romántica inesperada sobre la magia de la Navidad y el destino.'),
(58, 'Drama', 'B15', '02:10:00', '16:30:00', 3, '2024-12-03', 'Inglés', '../image/Forjadores/mientras dormias.jpg', 'Mientras Dormías', 'Una historia romántica inesperada sobre la magia de la Navidad y el destino.'),
(59, 'Drama', 'B15', '02:10:00', '19:00:00', 3, '2024-12-04', 'Español', '../image/Forjadores/mientras dormias.jpg', 'Mientras Dormías', 'Una historia romántica inesperada sobre la magia de la Navidad y el destino.'),
(60, 'Drama', 'B15', '02:10:00', '21:30:00', 3, '2024-12-04', 'Inglés', '../image/Forjadores/mientras dormias.jpg', 'Mientras Dormías', 'Una historia romántica inesperada sobre la magia de la Navidad y el destino.'),
(61, 'Ciencia Ficción', 'B15', '02:15:00', '14:00:00', 3, '2024-12-03', 'Español', '../image/Forjadores/deadpool&wolverine.jpg', 'Deadpool y Wolverine', 'Un explosivo cruce de héroes donde el sarcasmo y la acción se combinan en una aventura épica.'),
(62, 'Ciencia Ficción', 'B15', '02:15:00', '16:30:00', 3, '2024-12-03', 'Inglés', '../image/Forjadores/deadpool&wolverine.jpg', 'Deadpool y Wolverine', 'Un explosivo cruce de héroes donde el sarcasmo y la acción se combinan en una aventura épica.'),
(63, 'Ciencia Ficción', 'B15', '02:15:00', '19:00:00', 3, '2024-12-04', 'Español', '../image/Forjadores/deadpool&wolverine.jpg', 'Deadpool y Wolverine', 'Un explosivo cruce de héroes donde el sarcasmo y la acción se combinan en una aventura épica.'),
(64, 'Ciencia Ficción', 'B15', '02:15:00', '21:30:00', 3, '2024-12-04', 'Inglés', '../image/Forjadores/deadpool&wolverine.jpg', 'Deadpool y Wolverine', 'Un explosivo cruce de héroes donde el sarcasmo y la acción se combinan en una aventura épica.'),
(65, 'Animación', 'A', '01:45:00', '14:00:00', 3, '2024-12-03', 'Español', '../image/Forjadores/como entrenar a tu dragon 3.jpg', 'Cómo Entrenar a tu Dragón 3', 'Hipo y Chimuelo descubren un mundo secreto mientras enfrentan el mayor desafío de sus vidas.'),
(66, 'Animación', 'A', '01:45:00', '16:30:00', 3, '2024-12-03', 'Inglés', '../image/Forjadores/como entrenar a tu dragon 3.jpg', 'Cómo Entrenar a tu Dragón 3', 'Hipo y Chimuelo descubren un mundo secreto mientras enfrentan el mayor desafío de sus vidas.'),
(67, 'Animación', 'A', '01:45:00', '19:00:00', 3, '2024-12-04', 'Español', '../image/Forjadores/como entrenar a tu dragon 3.jpg', 'Cómo Entrenar a tu Dragón 3', 'Hipo y Chimuelo descubren un mundo secreto mientras enfrentan el mayor desafío de sus vidas.'),
(68, 'Animación', 'A', '01:45:00', '21:30:00', 3, '2024-12-04', 'Inglés', '../image/Forjadores/como entrenar a tu dragon 3.jpg', 'Cómo Entrenar a tu Dragón 3', 'Hipo y Chimuelo descubren un mundo secreto mientras enfrentan el mayor desafío de sus vidas.'),
(69, 'Drama', 'B', '02:00:00', '14:00:00', 3, '2024-12-03', 'Español', '../image/Forjadores/una voz silenciosa.jpg', 'Una Voz Silenciosa', 'Un conmovedor viaje de redención y amistad en la vida de un joven atormentado por el pasado.'),
(70, 'Drama', 'B', '02:00:00', '16:30:00', 3, '2024-12-03', 'Inglés', '../image/Forjadores/una voz silenciosa.jpg', 'Una Voz Silenciosa', 'Un conmovedor viaje de redención y amistad en la vida de un joven atormentado por el pasado.'),
(71, 'Drama', 'B', '02:00:00', '19:00:00', 3, '2024-12-04', 'Español', '../image/Forjadores/una voz silenciosa.jpg', 'Una Voz Silenciosa', 'Un conmovedor viaje de redención y amistad en la vida de un joven atormentado por el pasado.'),
(72, 'Drama', 'B', '02:00:00', '21:30:00', 3, '2024-12-04', 'Inglés', '../image/Forjadores/una voz silenciosa.jpg', 'Una Voz Silenciosa', 'Un conmovedor viaje de redención y amistad en la vida de un joven atormentado por el pasado.'),
(73, 'Ciencia Ficción', 'A', '01:40:00', '14:00:00', 3, '2024-12-03', 'Español', '../image/Forjadores/wall e.jpg', 'Wall-E', 'Un tierno robot descubre el verdadero significado del amor mientras intenta salvar el planeta.'),
(74, 'Ciencia Ficción', 'A', '01:40:00', '16:30:00', 3, '2024-12-03', 'Inglés', '../image/Forjadores/wall e.jpg', 'Wall-E', 'Un tierno robot descubre el verdadero significado del amor mientras intenta salvar el planeta.'),
(75, 'Ciencia Ficción', 'A', '01:40:00', '19:00:00', 3, '2024-12-04', 'Español', '../image/Forjadores/wall e.jpg', 'Wall-E', 'Un tierno robot descubre el verdadero significado del amor mientras intenta salvar el planeta.'),
(76, 'Ciencia Ficción', 'A', '01:40:00', '21:30:00', 3, '2024-12-04', 'Inglés', '../image/Forjadores/wall e.jpg', 'Wall-E', 'Un tierno robot descubre el verdadero significado del amor mientras intenta salvar el planeta.'),
(77, 'Animación', 'A', '01:30:00', '14:00:00', 3, '2024-12-03', 'Español', '../image/Forjadores/Phineas_y_ferb.jpeg', 'Phineas y Ferb', 'Una divertida película de las increíbles aventuras de dos hermanos geniales y su ornitorrinco espía.'),
(78, 'Animación', 'A', '01:30:00', '16:30:00', 3, '2024-12-03', 'Inglés', '../image/Forjadores/Phineas_y_ferb.jpeg', 'Phineas y Ferb', 'Una divertida película de las increíbles aventuras de dos hermanos geniales y su ornitorrinco espía.'),
(79, 'Animación', 'A', '01:30:00', '19:00:00', 3, '2024-12-04', 'Español', '../image/Forjadores/Phineas_y_ferb.jpeg', 'Phineas y Ferb', 'Una divertida película de las increíbles aventuras de dos hermanos geniales y su ornitorrinco espía.'),
(80, 'Animación', 'A', '01:30:00', '21:30:00', 3, '2024-12-04', 'Inglés', '../image/Forjadores/Phineas_y_ferb.jpeg', 'Phineas y Ferb', 'Una divertida película de las increíbles aventuras de dos hermanos geniales y su ornitorrinco espía.'),
(81, 'Comedia', 'A', '01:50:00', '14:00:00', 3, '2024-12-03', 'Español', '../image/Forjadores/ratatouille.jpg', 'Ratatouille', 'Un ratón con un sueño se embarca en una deliciosa aventura culinaria en París.'),
(82, 'Comedia', 'A', '01:50:00', '16:30:00', 3, '2024-12-03', 'Inglés', '../image/Forjadores/ratatouille.jpg', 'Ratatouille', 'Un ratón con un sueño se embarca en una deliciosa aventura culinaria en París.'),
(83, 'Comedia', 'A', '01:50:00', '19:00:00', 3, '2024-12-04', 'Español', '../image/Forjadores/ratatouille.jpg', 'Ratatouille', 'Un ratón con un sueño se embarca en una deliciosa aventura culinaria en París.'),
(84, 'Comedia', 'A', '01:50:00', '21:30:00', 3, '2024-12-04', 'Inglés', '../image/Forjadores/ratatouille.jpg', 'Ratatouille', 'Un ratón con un sueño se embarca en una deliciosa aventura culinaria en París.');

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
  `id_cartelera` int(11) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `costo` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historial`
--

INSERT INTO `historial` (`id_historial`, `num_transaccion`, `sala`, `fecha`, `hora`, `asiento`, `id_usuario`, `id_cartelera`, `img`, `costo`) VALUES
(17, '4545', 'Sala 4', '2024-12-10', '14:00:00', 'B4, B5, B6', 4, 1, '../image/Forjadores/tu nombre.jpg', 180.00),
(18, '4565', 'Sala 2', '2024-12-10', '16:30:00', 'A1, A2', 4, 6, '../image/Forjadores/como entrenar a tu dragon 3.jpg', 120.00),
(19, '4232', 'Sala 1', '2024-12-10', '19:00:00', 'C3, C4', 4, 9, '../image/Forjadores/romper circulo.jpg', 150.00),
(20, '1323', 'Sala 3', '2024-12-10', '21:30:00', 'D1, D2, D3', 4, 37, '../image/Forjadores/shrek 2.jpg', 200.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recompensas`
--

CREATE TABLE `recompensas` (
  `id_recompensas` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `costo` int(11) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `recompensas`
--

INSERT INTO `recompensas` (`id_recompensas`, `nombre`, `costo`, `descripcion`, `imagen`) VALUES
(1, 'Entrada de cine', 10, 'Una entrada para cualquier película.', '../image/recompensas/entrada.png'),
(2, 'Combo de palomitas', 20, 'Un combo con palomitas y refresco.', '../image/recompensas/image 2.png'),
(3, 'Nachos con queso', 15, 'Deliciosos nachos con queso.', '../image/recompensas/nachos.png');

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
  `puntos` int(255) DEFAULT 0,
  `correo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `usuario`, `contraseña`, `nombre`, `apellidos`, `imagen`, `puntos`, `correo`) VALUES
(4, 'admin', '1234', NULL, NULL, NULL, 0, 'admin@gmail.com'),
(5, 'admin2', '1234', 'kristofer', 'hernandez', NULL, 100, 'admin1@gmail.com');

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
-- Indices de la tabla `asientos`
--
ALTER TABLE `asientos`
  ADD PRIMARY KEY (`id_asiento`),
  ADD KEY `id_cine` (`id_cine`);

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
-- AUTO_INCREMENT de la tabla `asientos`
--
ALTER TABLE `asientos`
  MODIFY `id_asiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

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
  MODIFY `id_historial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `recompensas`
--
ALTER TABLE `recompensas`
  MODIFY `id_recompensas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asientos`
--
ALTER TABLE `asientos`
  ADD CONSTRAINT `asientos_ibfk_1` FOREIGN KEY (`id_cine`) REFERENCES `cine` (`id_cine`);

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
