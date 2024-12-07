-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-12-2024 a las 05:05:48
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
(1, 'puntos:10', 10, 'Entrada de cine', '../image/recompensas/entrada.png'),
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
  `puntos` int(255) DEFAULT 0,
  `correo` varchar(255) DEFAULT NULL,
  `imagen_blob` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `usuario`, `contraseña`, `nombre`, `apellidos`, `puntos`, `correo`, `imagen_blob`) VALUES
(4, 'admin', '1234', 'pio', 'mar', 0, 'admin@gmail.com', 0x89504e470d0a1a0a0000000d4948445200000512000000b4080200000067be47b100000006624b474400ff00ff00ffa0bda7930000200049444154789cecdd795c1377fe3ff04f08210408e11001f1422a6a15d146bc083f50e45aa12a05b12ad66d556cd7af556b57bb5edd6ab555aba55d7ba8edb6767b607d5456bc2da5550e2ba8483d008f6a1508a740b822c7fcfe98efce379b4032396002793dff924f269f797f3e33f339cccc677814451100000000000000e88c15d70100000000000000982f4c9b01000000000000ba8469330000000000004097ac39d96b4e4ecec3870f39d93500000027a64e9d3a70e040aea3b0741881409f3477ee5cae4300e8e3789c2c09161f1f7fe4c8919edf2f0000005752525230b4e51c4620d02761895f80eec6cdafcd8490b8b8b8efbfff9eabbd030000f4241e8fc77508f0bf300281bee4f0e1c30909095c4701d0f7e1d966000000000000802e61da0c000000000000d0254c9b01000000000000ba8469330000000000004097306d06000000000000e812a6cd003dedd1a347bcff969a9aca7cba71e346d58f0a0b0b390c1500008010929b9bbb78f1626f6f6f9148e4e2e23266cc98e79e7beee38f3fbe7bf72ed7a10100f4044c9b017adac08103298afaf6db6f0921ebd6ada3286af6ecd9cca7dbb66da3282a3838f8c0810314458d1c3992bb48ff574343c3f0e1c3a3a3a3b90e0400007a5a4747c7ebafbf3e75ead4fefdfb9f3a75aab6b6f6d6ad5b7bf7eeadafaf7fe595579e7aeaa9b6b636829e0200fa3a4c9b0140078aa23a3a3a3a3a3ab80e0400007adaa64d9b76efdefdd1471feddcb973e4c89142a1d0dddd3d2c2cecf4e9d3515151cc66e82900a06fb3e63a0000307762b118b7e1010058a0c2c2c277de79472a952e5dba54ed233e9fbf69d3a653a74ed17fa2a70080be0dd36600000000e8c4fefdfb3b3a3ae2e3e33bfd74ca94291445f5704800009cc04dda00bd8052a9dcbc79f3c89123edecec5c5c5c6262628e1d3bd6dede4e08d9b66d1bbd78984c26a3373e7dfa349dd2af5f3f2687b6b6b6949494b0b0300f0f0f9148e4e7e7979c9cccdc4d979a9aca2c425654543477ee5c575757facf83070f321fb5b4b43019565757af59b3c6c7c7c7c6c6c6d9d9392a2a2a2323834dc00000d05b9c3f7f9e103276ec58ed9ba97622744fa19a72fffefd8484042727275757d7e8e868b51fa52b2b2b57ae5c3974e8501b1b1b3737b7d8d8d8fcfcfcee2b11008061306d06e80556ac58f1c1071f7cf8e187d5d5d5b76edd1a3972e4ac59b32e5cb84008d9b871234551f6f6f6ccc6919191144549a552d51c4e9f3e3d6fdebce9d3a7dfba75ebe1c387cb962d5bb366cdba75ebe84f67cf9e4d51d4ac59b30821494949afbcf2cac3870f2f5ebcc8e7f3553f62c8e5f28080806fbef9263939b9aaaaead75f7fb5b3b30b0d0d3d78f0a0ce800100a0b7282d2d2584b8baba6adf4cb3a7504d59b56ad5aa55ab4a4a4a5252527efae9a7e79f7f9ed9acacac2c2020e0f0e1c31f7df4514d4dcdcf3fff5c53533365ca949c9c9cee2910008081306d06e805d2d3d3478f1e1d1616261289dcdddd77eddae5ebebab6f262121216fbcf186b3b373bf7efdfee77ffe67fefcf9c9c9c9f5f5f56a9bad5bb72e2424c4cece6ed2a4496d6d6daa3f5933de78e38ddf7ffffdfdf7df8f8e8e767474f4f5f5fde69b6f3c3d3d57ae5c595e5e6eaa800100c01cf0783c63bebe64c9922953a6d8dbdbcf983163e6cc99b9b9b9555555f4476fbcf1c683070ff6ecd9f3a73ffdc9c1c161f4e8d1df7df71d4551fff33fff638ac001004c06d366006ef0f97c424857f72db7b7b7d31bd0222323b3b3b3972d5b76f1e245fa2b454545212121ec77171d1dad7a133521c4dfdfbfb5b5f5c68d1b6a5b4e9c3851676e478f1e2584cc9c399349110a85a1a1a1cdcdcd67ce9c3149c00000c0b901030610429859ae61020202987f0f1a3488fce7476c42486a6aaa959595ea6bab3c3c3c468f1e7df9f2e5478f1e19b3530000d3c2b419801b0e0e0e8410cd1f7b69b5b5b58e8e8ecc9ffbf6ed3b74e8d0bd7bf74243431d1d1d232323e9892b7b7575759b376ff6f3f3737676a61f367bfdf5d709214d4d4d6a5baadeefdd29a552595757676b6b2b168b55d3dddddd092172b9dc2401030000e78283830921050505c664229148987fdbd8d81042e89535e8dea4a3a3432291f0545cb972851072fbf66da342070030294c9b01b841dfb4acf9632f2144a954deb97367f8f0e14c0a8fc74b4c4cfcf1c71f6b6b6b535353298a8a8d8dddb3670fb3819595d593274f5433a9adad55fd33262666ebd6ad4b972e2d2e2eeee8e8a0286aefdebd8410031641150a851289a4a5a545a150a8a6d3b7677b7878b009180000cc5f525292b5b5f59123473afdf4af7ffdab9595556161a161990b85422727276b6bebd6d6564ac3b469d38c081c00c0c4306d06e0868f8fcfc891232f5ebca8f91fea870f1f7673731b33660c93e2e4e4448f4b040241585818bd42e9891327980d3c3d3d4b4a4a983fe572f91f7ffcc1fcd9dede9e9595e5e1e1b172e54a373737fa29b5e6e66683839f33670e21443500a552999e9e2e1289222222d8040c0000e6cfd7d777cb962d7979799f7ffeb9da474545459f7efae9dcb973478e1c6970feb1b1b16d6d6d595959aa89efbefbeee0c183dbdada0cce1600c0e4306d06e0ccdebd7badacaca2a2a27ef8e1879a9a9af6f6f6d2d2d28f3efa68c58a157bf6ecb1b2faafcb73f9f2e50505054aa5b2a2a262e7ce9d14454d9f3e9df9343c3cbcb4b4f41ffff8474343c3ddbb775f7df5d5fefdfb339ff2f9fc909010b95cbe6bd7aeaaaaaae6e6e68c8c8c4f3ef9c4e0c877ecd8e1ededbd6ad5aae3c78f2b148ae2e2e2f9f3e7979595252727d3b76aeb0c1800007a858d1b37ae5fbf7ef9f2e5ebd7af2f2e2e7ef2e4494949c9679f7d366ddab4b163c77ef6d967c664be63c70e1f1f9f175f7cf1d4a9537575753535359f7efae95b6fbdb57bf76e6b6b6b53150100c00434ef8ae9017171717171719cec1ac0ac5cbe7c79e1c28543870e150a8536363603070e8c8f8fcfcaca52db2c3f3f3f292969d4a851f46b90274f9e7ce0c001fa5e6b5a6d6ded92254b3c3d3d4522914c26cbcdcd655e40b56edd3a8aa22a2b2b939292060d1a241008dcdddd172f5ebc7efd7a7a03a954aaf9aa0f2667b56792172c5840a7575555ad5ab5cadbdb5b2010482492888888f4f474f60103581a42484a4a0ad75100462006ba74e952626222dd8988c5e2c993272727272b954afa53cd9e42ad5bd9b06103f5dfcf04cd9c3993fe6e7575f59a356b860d1b261008dcdcdcc2c3c3cf9d3bc759397ba1949414aec6f300168547e9ff64a3f1e2e3e30921df7fff7dcfef1a0000a0e7f178bc949494b973e7721d88a5c30804fa98c3870f27242470329e07b028b8491b000000000000a04b9836030000000000007409d366000000000000802e61da0c000000000000d0254c9b01000000000000bad43ba6cd0f1e3c78f6d967ebebebd96cfcdd77dff1783c1e8f676b6bdbdd81416ff7f5d75fbbb8b83cfdf4d33ffdf4537575f5a041832a2a2ab80eca3476efde4d5f0803070ee43a96eea55952c3ca8ea603f4b27efd7afabd2fd0b7f5ed11486fe9297a4b9c2681b605c03cf58269737e7efe840913c2c3c31d1d1d09210d0d0dc3870f8f8e8eee6afb79f3e65114151a1ada8331f6109d65077d6ddebcf9c2850bfffef7bfb76ddb3664c89079f3e6f5efdf9feba04c63eddab51445f9fbfb731d48b7d32c69a76537dba603d7752fb574e9d237de7863d3a64d5c0702dda8cf8f407a4b4fc132ce1e6e4ebb6977685b00cc9335d701e8505f5f1f1313f3dc73cfad58b1824ea128aaa3a3a3a3a383dbc038d1abcbeee0e0306edcb8cccc4cae03f92f77efdea5fff1d34f3f711b097437b3bd7ccc36b0bea43bda1f1f1f9fa3478f8e1f3fdecfcf0f6f63ee933002e9757af80075d3eed0b6009827739f36efdcb9532e976fdebc9949118bc5cc54c7d25872d9018c64b6978fd906063af9fbfbc7c5c5bdf6da6bb1b1b1d6d6e6de9f82be3002e9757af80075dfeed0b6009821b3be499ba2a883070f4e9a3469c080015cc7020000a06ece9c398f1e3d3a71e204d7818089610402dc42db02606ecc7ada7ceddab5f2f272d5475952535379ffd1d2d2c2a4171616ce9e3d5b2291d8dbdb070505197027deb66ddbe86c6532199d72faf4693aa55fbf7ecc664aa572f3e6cd23478eb4b3b37371718989893976ec587b7b3bfb1cdadada525252c2c2c23c3c3c4422919f9f5f72723273878f6a018b8a8ae6ce9debeaea4aff79f0e0c14ecb5e5d5dbd66cd1a1f1f1f1b1b1b6767e7a8a8a88c8c0c7d8bcf6422140a070e1c3863c68c2fbef8a2b9b959e72e5403be7fff7e424282939393abab6b747434f35fb0f44a1e8d8d8d595959f496f47f9d6a296c555595f68ad27e2c689595952b57ae1c3a74a88d8d8d9b9b5b6c6c6c7e7e3efbb0751e2c3658ee887d253f78f0202121412c16bbbaba2626263e7efcf8fefdfb31313162b1d8d3d373e9d2a50a8542338cc2c2c29933674a24123b3bbb69d3a665656569e6ac7908b4d7214bdaeb50759597dcdcdcd0d050b158ac1624cdc8488c693ab45f623acf437d0333f870b3395d99f2dad9d94d9c38f1f8f1e33366cca0f7b564c9127a1be32f1c9dd81c77362daa31ed0fcdf8833b6edc3842c8993367d8171f7a859e1c8158784fc172f8a4579c9d0e933447386c9acdaebeae7377860d9918685b00cc0ec585b8b8b8b8b8389d9b7df5d5578490eddbb7aba5cf9a358b10d2dcdc4cff79fbf66d2727272f2fafb367cf2a148a828282f0f0f0a143870a85427d03b3b7b70f0c0c544d914aa5aeaeaecc9f4b962c91482467cf9e6d6a6a92cbe56bd7ae2584646464b0cf212d2d8d2e544d4d4d6565e5071f7c60656545af75a156c0e0e0e08c8c8cc6c6c68b172ff2f9fccaca4acdb2979595797b7bbbbbbba7a5a5d5d5d5151515c5c6c6f278bc03070eb02f359d898787475a5a5a7d7dbd5c2edfba752b2164efdebd2c774147356bd6acececec86868673e7ce8944a2808000ed75abbdb03a2b4afbb1282d2d1d326488bbbbfb891327140ac5f5ebd78383836d6d6db3b3b3d987cde660b1a17347ec2b393636362f2fafa1a1e1d0a1438490a8a8a859b3665dbd7a55a1507cf2c9278490d5ab57abeedadfdf5f22914c9b362d333353a150e4e6e68e1d3bd6c6c6e6e79f7fd67908d8d4a14e6cead0dfdfdfdede7eca942974fd6806c926127f7f7f2f2f2fb56cd5520c683a741e1a9d6d021b6a8151061d6e9d55ad56deebd7afcf9831c3cdcd4db5bc26b97058d279dc29162d2acb783a6d7f4c7270ebeaea08214141413acb4b08494949d15d2fd0cdcc760462c93d05c5ee62671fa7da30a9ab118ece6653fbd7bbda9df143264a9fb6855e765be766006024b39e36efdcb99310b26fdf3eb574b5462a3e3e9e1072e4c8116683929212a150d81dd3666f6fefa953a7aa6ee0ebebabefb4392424447583850b170a0482baba3ab5029e3c79523342b5b22f5ebc9810f2edb7df321bb4b4b40c1830402412c9e572dd0556c9446d3c17191949f70a6c764147959696c66c1317174708a1a7fa34edd366cdc2eaac28edc7e285175e20847cfdf5d7cca765656542a1502a95aaed5a4bd86c0e161b3a77c4be924f9c38c16c337af46842c82fbffcc2a4787b7b8f18314275d7f44f253939394c4a41410121c4dfdf5f2d3ccd43c0a60e75625387749057af5eed2a48369118306d66d374e83c343adb0436ba9a36eb75b87556b566792b2a2aececec54cb6b920b87259dc79dd267da6c40fb63aa83cbe3f19e7aea299de5c5b4d94c98ed08c4927b0a8af5b499659c6ac3a4ae46383a9b4ded5fef6a77c60f99682cdb164c9b017a8659dfa44ddff4221008b46f76faf4694248444404933260c0005f5fdfee08293232323b3b7bd9b265172f5ea46fd52b2a2a0a0909619f437474b4da4dd4fefefeadadad376edc50db72e2c4893a733b7af4282164e6cc994c8a50280c0d0d6d6e6e667f630f9d495454946ae2a953a756ad5aa5d72e020202987f0f1a348810525a5aca3206cdc2eaac28edc7223535d5caca4af5b5101e1e1ea3478fbe7cf9f2a3478f5886cdfe60b1a16547ec2b79c28409ccbfe927ee5453bcbcbc34ebdcd6d676d2a449cc9f7e7e7e03060cb876ed5a595999ea669a87807d1d6ac1b20eededede91bd23a0dd224916862d374e83c34c6b7095ae875b87556b56679dddcdc468e1ca9fa15935c38ec693fee7a31201e531d5c6b6b6be69116e833b81a8158664fc11ecb3819da47383a9b4ded5fef6a77a61a32a16d01302b663d6db6b5b52584b4b6b66ad946a9542a140a5b5b5b070707d5f46e7afbeebe7dfb0e1d3a74efdebdd0d0504747c7c8c848ba8964afaeae6ef3e6cd7e7e7ecececef4f32dafbffe3a21a4a9a9496d4b7b7b7bed592995cababa3a5b5b5bb158ac9aeeeeee4e0891cbe56ce2e92a130376219148987fdbd8d81042d83f06ac59589d15a5e558d0617774744824129e8a2b57ae10426edfbecd326cf6078b8dae76a45725d3ef0ea5595959f1f97c3b3b3b2685cfe76bd639fd109a6a0a7d75545454a826aa1d02bdea500b9675e8e4e4a4f64526485345a2864dd3c1e6d018df2668a1d7e1d65ed55d95d7d9d959adbcc65f38ec6939eefa66a56f3c263cb86d6d6d229148df80c1cc713502b1cc9e823d9671aa86d7d50887b06836b57f9de5ee0c1e32a16d01302b663d6df6f4f42484d04f77744528148ac5e2969696868606d5f49a9a1a03f6686565f5e4c913d594dada5ad53f793c5e6262e28f3ffe585b5b9b9a9a4a51546c6cec9e3d7bd8e7101313b375ebd6a54b971617177774745014b577ef5e42084551fa462b140a2512494b4b8bdada1ee5e5e584100f0f0f633231e12e686afd9c4e3a2b4acbb1100a854e4e4ed6d6d6adadad9ab7584c9b36cd54319884092bb9539a57103dbcd03eb0ebe13aacaeae564b61823455249a05d4d974b039343adb841ea3bdaabb2aafea58b39baa5a0b2dc79dfe53678bca9266fb63aa835b5f5f4f5114dd5b415fd2f32310edfa764f41585fec7ac5a97d844358349bdabfce7277861d23b42d00e6c6aca7cd63c68c2184e8bcc987be7986be518a56555555545464c01e3d3d3d4b4a4a983fe572f91f7ffca1ba8193935361612121442010848585d18b22aabe1e407b0eededed5959591e1e1e2b57ae747373a34772c6dc813367ce1c42886a004aa5323d3d5d2412a9de33c6269393274faa268e1f3f7ef5ead5a6da0521c4cece8ee911478c18b17fff7e2d1bb3a928edc7223636b6adad4d6d35e677df7d77f0e0c16d6d6d6c0236f9c1d2c25495dca98686866bd7ae317ffef6db6fa5a5a5fefefe3a3be39eacc3969696dcdcdcae82343e924eb1693a741e1a9d6d42cf6053d59ae595cbe5c5c5c5aadb7453557745fb71272cda64963a6d7f4c7270e9f0e8de0afa929e1f81e8d4577b0a1acb8b5ddf38b58c70d8349bda07485dedce24c7086d0b80d9d1fee8733761b92047474747fffefd35d771515b80e1ce9d3b2e2e2ecc3a96376edc888888a07fa452fdd682050b0821f7eeddd3b2c7152b5610423efcf043854271e7ce9db973e77a7979a9ae48219148828383af5dbbd6d2d2525e5efee69b6f1242b66ddbc63e87e9d3a7134276eedc595959d9d4d4f4d34f3f0d1e3c981072eedcb9ae0aa8a5ecaa6b36d6d7d7336b36eedfbf9f7dc1e94c3c3d3d8f1f3f5e5f5ffff0e1c3975f7ed9ddddfdc183072c77a119f0ba75ebc87f2ff6131919299148fef8e38fecec6c6b6beb9b376f6a2facce8ad27e2ccacbcb7d7c7c860d1b76f2e4c9dadadaeaeaea4f3ef9c4cece4e75610f9d61b339586cce2b9d3b32ac92232222f87cbeea8e828383ededed5553e8c58a6532d9c58b17bb5aacb8ab43c0a60e75169f4d1dd28ba386868676b5a2329b480c58128c4dd3a1f3d0e86c130c3b430c38dc3aab5aadbcbffdf65b6464e490214354cb6b920b8765a9751e778a458bca329e4edb1fe30f2e4551df7cf30d21e4e8d1a35a4a4a235812cc3c98ed08c4927b0a8addc56e409cda47383a9b4ded5fef6a77c60f99287dda162c0906d033cc7ada4c51d4dffef6376b6beb929212fa4fb5e7ca162c5840a7171515cd9e3ddbd1d1915ec4fff8f1e3a1a1a1f4362fbdf412bdcdf4e9d31d1c1cdadadab4ecaeb6b676c992259e9e9e2291482693e5e6e64aa5523a9f75ebd65114959f9f9f9494346ad428fa359e93274f3e70e0007d630fcb1c2a2b2b939292060d1a241008dcdddd172f5ebc7efd7a7a03a9549a9393d3d5ff6b7455f6aaaaaa55ab56797b7b0b04028944121111919e9eae5a28360557cdc4d3d373debc79c5c5c59d7eaab60bb580376cd840fdf72d973367cea4b72c2c2c0c0a0ab2b7b71f346810bd36a996c2eaac2836c7827e77e2b061c30402819b9b5b787838d311b20c5b670c3aab977dfde855c9aa3fd0114276ecd871e1c205d5942d5bb6ecdab58bfeb79797d7a54b97a64d9be6e0e02012898283833333333bcd9968f4bb5aea90e5d9c5a60ee9f9edcd9b37232222c462b15a903a23614acad48f668a314d87f64b4ce779a8bd8a340333ec70b3ac6aa6bc76767653a74efde5975f424242ececec585635fbf3994db3c3e6b86b6f518d697f4c7270298a8a8f8ff7f2f27af2e4899692d208a6cde6c10c4720e829285d173b9b38d90c93d446386c9acdaebe6ec0a88cfd81a6f4695b306d06e819e63e6daeadadf5f2f24a4a4a32728f8f1f3f1689444b962c31329f5ec7620bde332cbc7a4d557ccd9f85fb0cf33f43468c183178f060d3e6c9b2d47de0b8e7e7e7f3783cd597cd6841306d360f1881f4300b2fbe61f46a5b306d06e81966fd6c3321442291a4a5a51d397264dfbe7d06674251d4ca952b1d1d1de997d45b0e8b2d78cfb0f0eab5f0e2b3616e552497cb5d5c5c545706be7ffffeddbb77e9db144dc5dc4add7deeddbb171b1bfbc61b6fcc9b378feb58a05b6004623c0b2fbe61d0b6009827739f361342c68f1f9f979777ead4a9fafa7ac372282f2fbf77ef5e7a7abaf14b4df62e165bf09e61e1d56be1c567c30cabe8f1e3c74949490f1f3e6c6a6aba74e952424282a3a3e3a64d9b4cb80b332c7537f9f4d34fdf7efbedb7df7e9beb40a01b610462240b2fbe61d0b60098271e65d257e9b0141f1f4f08f9fefbef7b7ed700603e76efde4dbf2493b661c3866ddbb671184f9f979e9ebe6fdfbeab57af9696963a3b3bcf9831e3ef7fffbb8f8f4f0f876199c79dc7e3a5a4a4cc9d3b97eb402c1d4620d0c71c3e7c3821218193f13c8045b1e63a0000b05c6bd7ae5dbb762dd7515890d0d05066b1220ee1b803000040efd20b6ed206000000000000e00aa6cd000000000000005dc2b419000000000000a04b9836030000000000007489b325c12e5ebc48af6609000000d0635447200a85a2a6a6a6b5b5f5a9a79ee2362ad0445154434383582ce63a10b3f6e8d123ae4300b008dc4c9ba74c99c2c97e012c5c6969695e5edeb3cf3ecb75200016272e2e6ed0a0415c470164cc9831a5a5a5376edca8a9a9a127cc5656566e6e6e98369ba1a2a2a2e2e2e2909010474747ae63315f03070e8c8b8be33a0a80be8f9bf736030027f0764700b0340d0d0df9f9f997ffe3e6cd9b84104f4f4f994c16181828954aa552a94824e23a4ce8447373736464e49d3b77323333bdbdbdb90e07002c1adedb0c0000007d475b5b5b5151113d49cecacacacfcf6f6f6ff7f4f4944aa5f1f1f152a974ead4a9aeaeae5c8709ba8944a2b4b4b469d3a68585856566667a7878701d1100582efcda0c6041f06b3300f449a5a5a5f424393333f3ead5ab4d4d4d0e0e0efefefed2ff183d7a34d73182812a2b2b8382826c6c6c7ef9e517676767aec301000b855f9b010000a097a9ababfbedb7dfe879f2afbffe5a5959696d6dedebeb4bffa42c93c9c68f1f6f6585d785f4056e6e6ea74e9d0a0c0c9c3973e68f3ffe686767c77544006089306d0600000073d7dada5a505090999949df7d7debd62d8aa2e85baf5f7bed35fa29653ca2dc57797b7b9f3d7b36383878debc793ffcf083b53586af00d0d3d0ee00000080d9696f6f2f2c2c6496f2cacdcd7df2e4899393d3840913e84794274f9eece6e6c67598d043c68c1973e2c489193366fcf9cf7f3e74e8108fc7e33a2200b02c98360300008059a01f51a6656666d6d6d6dadbdb8f1b374e2a952e5bb64c2a953efdf4d3982f59acc993271f3d7a343a3adad9d9f9830f3ee03a1c00b02c98360300000037eaebeb0b0a0ae8d5bcce9f3f5f5e5ecee7f3478c1821954adf7cf34da9543a71e2441b1b1baec30473111616f6cf7ffe33313171e0c0817ffdeb5fb90e07002c08a6cd000000d0435a5b5b8b8b8be9a5bcd41e515ebe7cb94c269b3a752ad67c022de6cf9f5f5b5bbb62c50a171797254b96701d0e00580a4c9b010000a01bddbb778f59ca2b2f2f4fa9544a24923163c6c4c4c4bcf3ce3b93264deadfbf3fd731426ff2ca2baf9496962e5fbedcc9c9292e2e8eeb7000c02260da0c000000a6a4fa88727676764d4d8d4020183b766c6060201e510693d8b66d9b42a158b060814422090b0be33a1c00e8fb306d06000000a328148a6bd7ae314b79fdfefbefcc23ca9b376f964aa501010142a190eb30a14fd9bb77af5c2e8f8b8bfbe9a79fa45229d7e100401f876933000000e8a7adadada8a8885eca2b3333b3b0b0b0a3a3837e4479d1a24552a9542693393b3b731d26f4655656565f7df5d5ac59b32223232f5cb83072e448ae230280be8c475114d73100400f397cf870424202ae7a003040696929b394d7e5cb975b5a5a1c1d1dfdfcfce84972505090878707d73182c5696a6a0a0b0b7bf8f0616666e6e0c183b90e0700fa2c4c9b012c08a6cd00c05e5959595e5e1e3d49cec9c9a9aeae160804c3870f97c96481818152a974d4a8515656565c870996aebaba3a2828c8cacaeafcf9f32e2e2e5c8703007d13a6cd001604d36600d0a2a1a1213f3f9f59cdebe6cd9b849061c386d19364a9543a61c2045b5b5baec30450575252121818e8eeee9e9e9eeee0e0c0753800d007e1d9660000000bc53ca24c3fa57cf5ea55e611e5f8f878a9543a75ea54575757aec304d0c1cbcbebdcb97341414173e6cc397efc38d69f030093c3b4190000c082d06f87a29f52be72e54a7373b3582ca6df0eb572e54a994c366cd830ae6304d0dbf0e1c3d3d2d2424343fffce73fffeb5fffc2e30300605a9836030000f465b5b5b5797979f4525ebffefa6b6565a5b5b5b5afaf2fbdea756060201e5186be212020e0dffffe775454d48a152b3efae823aec301803e05d3660000803ea5b1b1f1ead5abcc23cab76edda228cad3d35326936dd8b0817e4a592412711d2680e94d9b36edbbefbe8b8b8b737777dfb2650bd7e10040df816933000040efd6de74b5ead60000200049444154de5e5858c8cc937373739f3c79e2e4e43461c204fa11e52953a6f4ebd78feb30017ac2ecd9b3f7eddbb77cf9728944b26ad52aaec301803e02d366000080de877e44997e4a393b3bbba9a9c9c1c1c1dfdf5f2a952e5bb64c2a958e1e3d9aeb1801b8919494545555f5da6baf797878cc9b378feb7000a02fc0b4190000a017a8ababfbedb7dfe8a5bc2e5dba545151c13ca2bc7dfb76a9543a69d2248140c07598006661c3860d8f1f3f5eb468914422898a8ae23a1c00e8f5306d0600003047adadad050505f4525eaa8f284ba5d2975f7e5926934d9d3ad5cece8eeb3001ccd4ae5dbb6a6a6ae2e2e2ce9e3d1b1818c8753800d0bbf1288ae23a0600e821870f1f4e4848d079d57ff7dd77cf3fff3c21442814b6b4b4f4486800a0fe88725e5e9e52a994482463c68c91c96481818165656549494904d726003bedededf1f1f11919193ffffcb3bfbf3fd7e100402f8669338005a1a7cd0a8562fcf8f123468c387efcb8968d67cc98919999d93786e60d0d0d6c8a0cd0f39847942f5fbe9c9999595b5bcbe3f19e79e699c0c0407ac9eba79f7e9ac7e3a97ec554d726ae0bb004cdcdcd11111177efdecdcaca1a3a74a8f119e2c201b04cb8491bc0e25014d5d1d1d1d1d1c175203dc7028b0c66abbebebea0a0805ecaebc2850b72b99ccfe78f1831422a95bef1c61bc9c9c97e7e7ea74f9fee8148705d8025108944696969d3a64d0b0b0bcbcccc7477773732435c38009609bf36035810963769d3fad2afcd001c6a6d6d2d2e2ea697f2ba7cf972616161474707fd88322d2828c8c9c9897d86b83601f45551511114142412897efef967bd2e3700001a7e6d06000030b17bf7ee314b795dbe7cb9a5a5c5d1d1d1cfcf6fc68c196fbef9e6fffb7fffcff89fbc0080bdfefdfb9f3c7932282868ce9c39a74e9db2b5b5e53a2200e865acb80e00007a1aef3f547fad2a2c2c9c3d7bb64422b1b7b70f0a0acacccc6499dbb66ddbe8dc6432199d72faf4693aa55fbf7ecc664aa572f3e6cd23478eb4b3b37371718989893976ec587b7b3bfb1cdadada525252c2c2c23c3c3c4422919f9f5f727232739b5c6a6a2a53aea2a2a2b973e7bababad27f1e3c78b0d322575757af59b3c6c7c7c7c6c6c6d9d9392a2a2a2323c3900a0520a4b4b4342d2dedcd37df8c8989717575f5f1f159b264c98f3ffe387af4e84f3ffdf4faf5ebb5b5b5999999c9c9c9f1f1f19dce9955cf61935c9b34e63c170a8503070e9c3163c6175f7cd1dcdcacb93bd594fbf7ef272424383939b9baba464747dfbd7b5735cfcacaca952b570e1d3ad4c6c6c6cdcd2d3636363f3fdfa06a03e8393e3e3e67ce9cb976ed5a4242425b5b9bf68d71e100803a0a002c464a4a0a7dd5cf9a358b10d2dcdc4ca7dfbe7ddbc9c9c9cbcbebecd9b30a85a2a0a0203c3c7ce8d0a142a19065cef6f6f6818181aa2952a9d4d5d595f973c992251289e4ecd9b34d4d4d72b97ceddab584908c8c0cf639a4a5a51142b66fdf5e5353535959f9c1071f585959ad5dbb56f52b74b98283833332321a1b1b2f5ebcc8e7f32b2b2b358b5c5656e6edededeeee9e9696565757575454141b1bcbe3f10e1c38c0b2c860e1eaebeb2f5cb8f0fefbef2726267a7b7bd35deab061c3121313df7ffffd0b172eb4b4b41890ad69af4dfa3cf7f0f0484b4babafaf97cbe55bb76e2584ecddbbb7d3dd3129b366cdcacece6e68683877ee9c48240a08086036282d2d1d326488bbbbfb891327140ac5f5ebd78383836d6d6db3b3b30d282f400fcbceceb6b7b75fb4685147474757dbe0c201004d9836035890aea6cdf1f1f1849023478e305b969494088542134e9bbdbdbda74e9daaba81afafafbed3e6909010d50d162e5c281008eaeaea9814ba5c274f9ed48c50adc88b172f26847cfbedb7cc062d2d2d03060c10894472b95c7781c1f2b4b6b65ebf7efdcb2fbf5cb66cd9d34f3f6d65654508f1f4f48c8e8edeb265cbb163c7aaabab8ddf8b69af4dfa3c4f4949514d8c8c8cd439fa4f4b4b6352e2e2e20821f47f3f5114f5c20b2f1042befefa6b6683b2b232a15028954af52b2a0047d2d2d2acadadd7af5fdfd506b8700040139e6d0600422fdb1b1111c1a40c1830c0d7d7b7b8b8d854bb888c8cfcf8e38f972d5bf6e28b2f060404f0f9fca2a222bd72888e8e8e8e8e564df1f7f7ffd7bffe75e3c68d2953a6a8a64f9c3851676e478f1e2584cc9c399349110a85a1a1a15f7df5d5993367162d5aa4576cd057959696324b795db972a5b9b9592c168f1d3b76c68c19ebd6ad0b0a0a627e67ee26465e9bf4791e1515a59a78ead4299d5f0c080860fe3d68d0204248696929fdd0446a6aaa959595eac5e8e1e1317af4e8cb972f3f7af468e0c0816c0203e0507474f43ffff9cf175e78c1d5d595bef5490d2e1c00d084693380a5532a950a85c2d6d6d6c1c14135bd7ffffe269c36efdbb76fca94295f7ef9656868282124282828292969ce9c39ec73a8abab7befbdf78e1e3dfae8d1a3dada5a26bda9a9496d4b7b7b7bed592995cababa3a5b5b5bb158ac9a4e3f712a97cbd947057d4c5959595e5e1ebd8ed7c58b17abaaaaacadad7d7d7da552e9a2458b020303478d1a45ffcedc038cbc36bb3acfd9904824ccbf6d6c6c0821f43a02749e6a1b306edfbe8dd13ff40a0b172eacadad5db972a5b3b3f34b2fbda4fa112e1c00e814a6cd00964e28148ac5628542d1d0d0a03a3aafa9a9619f899595d593274f54535467b684101e8f979898989898d8dadafaf3cf3fefdebd3b3636f6bdf7de5bb3660dcb1c6262622e5cb8909c9cfcfcf3cff7ebd78fc7e3bdfffefbab57afa6f47f8b9e50289448247575750a85427560545e5e4e08f1f0f0d03743e8bd1a1a1af2f3f39925af6fdebc4908f1f4f494c9641b376e944aa513264ce06ad15d23afcdaece7323437272726a6868686e6eb6b6c610027ab1152b569494942425253939393df7dc734c3a2e1c00e81456d20680ffbd158dbe1d94565555a5d74dd49e9e9e252525cc9f72b9fc8f3ffe50ddc0c9c9a9b0b09010221008c2c2c2e8a5474f9c38c13287f6f6f6acac2c0f0f8f952b57bab9b9f1783c4248737333fb08d5d03f74ab06a0542ad3d3d3452291ea0db1d0f7b4b5b5ddb871e3d0a143afbefaea8409139c9c9c828282de7df7ddc78f1fc7c7c71f3b76acaaaaaab4b4f4f0e1c3afbefaaa4c26e3f64535465e9bf4797ef2e449d5c4f1e3c7af5ebddae090626363dbdadab2b2b25413df7df7ddc18307eb5c9d18c0ac6cdfbefdc5175f5cb870e1f9f3e755d371e10080264c9b01806cdfbeddc5c565d5aa55e7ce9d6b6868b879f3e6c2850bd5ee0bd52e3c3cbcb4b4f41ffff8474343c3ddbb775f7df5d5fefdfbab6db37cf9f2828202a552595151b173e74e8aa2a64f9fce32073e9f1f12122297cb77edda555555d5dcdc9c9191f1c9279f185ce41d3b76787b7baf5ab5eaf8f1e30a85a2b8b878fefcf9656565c9c9c978a16edf43bf1d6afdfaf532994c22918c1933e62f7ff9cbe5cb970303033ffffcf3ebd7afabbd3e8aeb78ff8f91d7267d9eaf5ebd9a5ebcf7d1a347afbcf24a59599931a3ff1d3b76f8f8f8bcf8e28ba74e9daaabababa9a9f9f4d34fdf7aebadddbb77e36734e85d783cdec71f7f1c131313131373e5ca15261d170e007482eb35c900a0e7d02b69ab5ab06001fd515151d1ecd9b31d1d1de977661c3f7e9c7e089910f2d24b2fe9ccb9b6b676c992259e9e9e2291482693e5e6e64aa552faebebd6ada3282a3f3f3f292969d4a851f47b9b274f9e7ce0c001d5f77fe8cca1b2b232292969d0a0410281c0dddd7df1e2c5ebd7afa737904aa53939395d356ef4e22e9a45aeaaaa5ab56a95b7b7b74020904824111111e9e9e926ac6de0506d6dedb973e7b66cd9121d1dede6e64608b1b6b67efae9a7e9b743e5e5e5b5b7b7731da3baae4e5423af4dd5f3dcd3d373debc79c5c5c59dee4eed22dab06103f5df4f40cc9c3993ce937ea5edb061c30402819b9b5b7878f8b973e7baad6200ba9752a90c0f0f7773732b2c2c641271e100801a1ea5ff638100d04b1d3e7c38212101573df43d8d8d8d57af5e651e51be75eb1645519e9e9e52a95426930506064aa5529148c4759800608e140ac5f4e9d3abababb3b2b23c3d3db90e0700cc116e0b010080dea7bdbdbdb0b0909927e7e6e63e79f2c4c9c969c28409f1f1f152a974f2e4c9f4efcc0000da89c5e253a74e050505858787fff2cb2f2e2e2e5c4704006607d3660000e81d4a4b4be949725656564e4e4e6363a3bdbdfdb871e3a452e9b265cba452e9d34f3f4d2f170700a0977efdfa9d3b774e2693fde94f7f4a4f4fd7f9224300b034983603806e5aa6225bb66c79f3cd377b3016b020f5f5f5050505595959999999b9b9b9e5e5e57c3e7fc4881152a9f4edb7df964aa513274ea45f8e6ab1706d0298cac08103e999f39c39738e1f3f6ee16d0b00a8c1b4190074c3e3d0d0335a5b5b0b0a0a323333351f515ebe7cb94c269b3a75aa9d9d1dd7619a115c9b0026347cf8f0b4b4b4d0d0d03ffff9cf5f7df5959515de380300ff0bd3660000e08cda23ca7979794aa5927e47544c4ccc3befbc3369d224cd979901007493891327a6a6a6ce9c39d3c9c969dfbe7d5c870300e602d3660000e851cc23caf453ca8f1f3f16080463c78e0d0c0cc423ca00c0b9d0d0d06fbffd363e3eded3d373e3c68d5c8703006601d3660000e85e0a85e2dab56bf424f9c2850b72b99c794479cb962d52a9342020402814721d2600c0ff9a3367ce3ffef18f975f7ed9d1d171e5ca955c870300dcc3b41900004cacadadada8a8889e27676666161616767474d08f28272525d1ef52767676e63a4c00802e2d5fbebca2a262f5ead51e1e1e73e7cee53a1c00e018a6cd00006002a5a5a5f42499befbbaa5a5c5d1d1d1cfcf6fc68c196fbef966505090878707d7310200e861f3e6cdb5b5b58989898e8e8e9191915c8703005cc2b41900000c515656969797474f92737272aaabab0502c1f0e1c3653219fd88f2a851a3b00e2d00f46aefbdf7dee3c78f9f7beeb973e7ce4d9d3a95eb7000803398360300002b0d0d0df9f9f9cc6a5e376fde24840c1b362c303070d3a64d52a974c28409b6b6b65c87090060323c1e6ffffefd151515cf3efbec850b17468d1ac5754400c00d4c9b0100a073cc23caf453ca57af5e651e518e8f8f974aa58181812e2e2e5c870900d08d0402c1912347c2c3c3c3c2c2b2b2b2860c19c2754400c0011e45515cc700003de4f0e1c3090909b8ea410bfaed50f453ca57ae5c696e6e168bc563c78e954aa552a9342828c8dbdb9beb1801007a5a5d5d5d4848486363e3850b17dcddddb90e07007a1a7e6d0600b068b5b5b5797979f4525e172f5eacaaaab2b6b6f6f5f5954aa58b162d0a0c0cc423ca00001289e4c4891332992c2626263d3d5d2c16ab7edad1d1817612a06fc3afcd007d596969e9a041833a3a3abada202828e8fcf9f33d191270aeb1b1f1ead5ab6a8f287b7a7aca64b2c0c040fa57659148c47598000066e7eeddbb32996cd4a851a74e9d62de36af542ae7cf9fbf65cb96b163c7721b1e00741ffcda0cd0970d18304026935db870a1abff207bfef9e77b3824e879ededed858585cc3c393737f7c99327aa8f284f9932a55fbf7e5c87090060ee7c7c7cce9c39131c1c3c6fdebc23478ef0f9fcc78f1f474545fdfaebaf2e2e2e070e1ce03a4000e82ef8b519a08f3b70e0c0f2e5cb3bfdc199cfe7979696f6efdfbfe7a382ee463fa24c3fa59c9d9dddd4d4e4e0e0e0efef2ffd8fd1a347731d230040aff4f3cf3f474545bdf0c20b5bb66c090d0dbd73e74e6b6bab8d8d4d6969a9abab2bd7d10140b7c0b419a08f7bfcf8b1bbbb7b6b6bab5a3a9fcf9f3163c6e9d3a739890a4caeaeaeeeb7df7ea397f2ba74e952454505f388b2542a95c964e3c68de3f3f95c870900d017a4a6a6c6c5c5492412854241f7b0d6d6d6dbb66d5bb76e1dd7a10140b7c0b419a0ef8b8989397dfa745b5b9b6aa29595d5a14387162c58c0555460a4d6d6d68282027a29afcb972fdfba758ba228fad66bfa29e5679e79c6cece8eeb300100faa0ebd7afcb64b2c6c646d5beb57ffffe8f1e3d1208041c060600dd04d36680beefbbefbe9b3f7fbedac52e140aabaaaa1c1c1cb88acad2dcbb776fd8b061c6e4a0f688725e5e9e52a9944824010101f4525e93274f7673733355c00000d0a9f3e7cfffe94f7f522a956aff1fcde3f10e1f3e1c1717c7556000d07d306d06e8fb9a9a9afaf5ebd7dcdccca4585b5bc7c6c6a6a4a4701895e5b875eb56525292b5b5f54f3ffda4ef779947942f5fbe9c9999595b5b6b6f6f3f6edc38e611e5a79f7e9ac7e37547d80000a0e9d8b163f1f1f1edededededed6a1ff1f9fc8080809c9c1c4e0203806e856933804558b060c1f7df7fcf3ce1cce3f15253539f7df6596ea3eaf31a1b1bb76eddba7bf76e8aa2ecececeaebeb754e71ebebeb0b0a0ae8a5bcce9f3f5f5e5ecee7f3478c18c1cc93274e9c686363d333f1030080aa8a8a8a0913263c7cf850cb3657ae5c193f7e7c8f8504003d03d366008b70e2c489e8e868e64fb1585c5959c9bc7312ba435a5adaf2e5cb2b2a2a98bbf86eddba3572e448b5cd5a5b5b8b8b8be9a5bcd41e51a69f529e32658abdbd7d8f870f00009d686a6afaf0c30fdf7efbed969616cde5360502c1fcf9f3bff8e20b2e4203806e8469338045686d6d757373ababab2384080482458b161d3c7890eba0faacbb77effee52f7f3973e68c959515f3ea2f3e9ffff9e79f2f5ab4881072efde3d66292ffa11654747473f3f3f7a29af891327babbbb735a020000d0e6f1e3c7efbefbeefbefbfdfd1d1a136791608040f1f3e44330ed0c760da0c6029962f5ffecf7ffef3c993278490f4f4f4e9d3a7731d511fd4d2d2f2ce3befecd8b183a228cd81546868a852a9cccbcb532814229168fcf8f113274e0c0808983871e2534f3dc555cc00006098929292bffffdef9f7ffeb9959515d3e60b04822d5bb66cd8b081dbd800c0b4306d06b014bffcf24b48480821c4cdcdadacac0caff035b9f4f4f465cb963d78f040739d18da902143a64f9f3e71e2c44993268d1933062f290100e8038a8a8a366cd8f0c30f3f585b5bd393673737b792921234f2007d09a6cd009682a2282f2fafb2b2b2d5ab57efd9b387eb70fa94929292bffef5afdf7cf38dea5dd99aacadad1b1a1af048390040df73e9d2a5d75f7ffdfcf9f37c3ebfbdbdfddb6fbf9d376f1ed7410180c9fcd7b4392727078369803eaca0a0a0b8b878faf4e92e2e2e5cc7d247747474141717dfbc7953cb6c59152a1f7ac0f7df7f6f7c267bf6ecc17b7400f4555e5e5e5050505757e7e2e28287a1007ab5356bd64c993285f9d34af5b3870f1f1e3972a4c74302801e3278f0600707074cdb4ca8acacacb1b1b15fbf7e767676cccba5783c1e9fcfd77cd7148fc7aba9a9e9f118c1823c7af4c854fd784e4ecec58b174d921580e57077770f0b0b9b3469d293274f1e3f7ecc75380060a023478ea8bd6ace5a732393fc2f350098a7afbffe7ac182055c47d137b5b7b7979494fcaea2a8a8e8f7df7fafaaaaa2efeba1286acc98315f7df515d791429f75f8f0e184840453e53679f2640c09000cd3dadafafbefbffbfafa721d08001842f3c78f4ea6cd00d08761cedc7df87cfee0c183070f1e1c1c1cac9aae542aefdfbf4f4fa4bb5a2d0c0000fa128140803933405f8269330040f7120a8523468c18316204d781000000008021ac746f0200000000000060a9306d06000000000000e812a6cdd0eb393838f054ecdebd9bf968e0c081aa1f6ddcb891c3388db17bf76eba0803070e64ffadefbefb8efe96adadad49c2c8cdcd5dbc78b1b7b7b74824727171193366cc73cf3df7f1c71fdfbd7bd724f9030000981533ecf80c1b12008091306d865eafa1a1e1ead5ab849059b3665114b576ed5ae6a3478f1efdfefbef8490c0c0408aa2b66ddb466f3f7cf8f0e8e868ae02362086b56bd75214e5efefafd75ee6cd9b4751546868a8fe01aaebe8e878fdf5d7a74e9ddabf7fff53a74ed5d6d6deba756befdebdf5f5f5afbcf2ca534f3dd5d6d666fc5e000000cc84d9767c860d0900c048983683c5a128aaa3a3a3a3a383fd571c1c1c643219b731706bd3a64dbb77effee8a38f76eedc3972e448a15048bf9af2f4e9d35151515c4707000060623dd3f1997c800100dd042b6983c5118bc59cdf546c0e31b0575858f8ce3bef48a5d2a54b97aa7dc4e7f3376dda74ead4294e02030000e80ee8f800400da6cd00a0c3fefdfb3b3a3ae2e3e33bfd74ca94291445f57048000000dd071d1f00a8c14dda60595253539915c25a5a5ae844a552b979f3e6912347dad9d9b9b8b8c4c4c41c3b76acbdbd9dfc67e18dc6c6c6acac2cfa5bd6d6fff79f4dd5d5d56bd6acf1f1f1b1b1b17176768e8a8acac8c8d0dc515151d1dcb9735d5d5de93f0f1e3ca819435b5b5b4a4a4a5858988787874824f2f3f34b4e4e36e02eeec2c2c2d9b3674b24127b7bfba0a0a0cccc4ccd6d2a2b2b57ae5c3974e8501b1b1b3737b7d8d8d8fcfc7c2d799e3f7f9e103276ec583601b0ac93070f1e24242488c5625757d7c4c4c4c78f1fdfbf7f3f2626462c167b7a7a2e5dba54a150d0df525dfb243737373434542c16dbd9d94d9b362d2b2b4b3367b5daaeaaaad259b75a4e000000b040ec3b3eed5d8c96ee69fdfaf55a0618faf6d4dabf62642f0900841042a9484949514b01e815e825c1b4a0970463cc9a358b10d2dcdc4cffb964c912894472f6ecd9a6a626b95c4e2f2a969191c16c6f6f6faf96034551656565dededeeeeeee696969757575454545b1b1b13c1eefc081036a3b0a0e0ecec8c8686c6cbc78f1229fcfafacacd48c212d2d8d10b27dfbf69a9a9acacaca0f3ef8c0caca8a5ef683e1efefefe5e5a5a51e6edfbeede4e4e4e5e575f6ec598542515050101e1e3e74e850a150c86c535a5a3a64c8107777f713274e28148aebd7af070707dbdada6667677795ada7a72721e4d75f7fd5b26b7deb243636362f2fafa1a1e1d0a1438490a8a8a859b3665dbd7a55a1507cf2c9278490d5ab57ab95dddede7eca9429d9d9d90d0d0db9b9b963c78eb5b1b1f9f9e79f75d6b6cebad5790200f41626ecc7e3e2e2e2e2e24c921540afc3bee363d37d6b190c743ac060d353ab0d09d87cc5e05e12c0021142525252fe2b45f50f4c9ba197525d495b8dea4ada0cb529abb7b7f7d4a9535537f0f5f5d5396d5ebc783121e4db6fbf65525a5a5a060c18201289e472b9ea8e4e9e3ca91998e6b4392424447583850b170a0482baba3a2645e7b499be9decc891234c4a4949895028549d36bff0c20b8490afbffe9a49292b2b130a8552a9b4ab6ce9d1c3a54b97b4ec9ac6be4e4e9c38c16c337af46842c82fbffcc2a4787b7b8f18314235677ac9d0ab57af322905050584107f7f7f26a5abdad659b73a4f0080de02d366009360dff1b1e9beb50c063a1d60b0e9a9d586046cbe62702f09608134a7cdb8491b804446466667672f5bb6ece2c58bf4adb9454545212121dabf75f4e85142c8cc99339914a150181a1adadcdc7ce6cc19d52d274e9ca83386e8e868e666669abfbf7f6b6beb8d1b375897839c3e7d9a10121111c1a40c1830c0d7d757759bd4d4542b2b2bd5775f7978788c1e3dfaf2e5cb8f1e3dea34db0103061042aaaaaa7406c0be4e264c98a096bf6a8a9797576969a95ae6f6f6f6e3c68d63fef4f3f31b3060c0b56bd7cacaca5437d3ac6d9d756bd8090000007d15fb8e8f7df7cd66304033a0a766ff15037a49002078b6198010b26fdfbe43870eddbb772f3434d4d1d1313232929efe69a1542aebeaea6c6d6dc562b16ababbbb3b21442e97ab26dadbdbeb8ca1aeae6ef3e6cd7e7e7ecececef4e346afbffe3a21a4a9a9896529944aa542a1b0b5b5757070504defdfbfbf5ad81d1d1d128984a7e2ca952b8490dbb76f779a737070302184fe75577b00ecebc4d1d191f9b79595159fcfb7b3b36352f87cbee653554e4e4e6a2974d12a2a2a5413356b5b67dd1a70020000401fc6b2e323fa74df6c0603c4a09e5aafaf18d04b0200c1b4198010c2e3f11213137ffcf1c7dadadad4d4548aa2626363f7ecd9a3ba81da578442a144226969696156aea295979713423c3c3cf48d21262666ebd6ad4b972e2d2e2eeee8e8a0286aefdebd84108af55a9d42a1502c16b7b4b4343434a8a6d7d4d4a86ee3e4e4646d6ddddadaaa793bcab469d33acd392929c9dadafac891239d7efad7bffed5cacaaab0b0d0e475a2a6baba5aad36e809b3eaff0b744a67ddea3c010000c0a2b0ecf888d1dd77a7030c7d7b6ac33a7786f12310004b80693300717272a23b3f8140101616462f3879e2c40966033b3bbb274f9ed0ff1e3162c4fefdfb092173e6cc2184a86ea6542ad3d3d3452291ea6dd26cb4b7b7676565797878ac5cb9d2cdcd8dee449b9b9bf52d48545414f9cfaddab4aaaaaaa2a222d56d626363dbdada9835a869efbefbeee0c183dbdada3acdd6d7d777cb962d7979799f7ffeb9da474545459f7efae9dcb973478e1c494c5a279a5a5a5a727373993f7ffbedb7d2d2527f7f7ffa09b4aeb0a95b9d270000005814961d9ff1dd77a7030c037a6a03be4233d50804a0cfc3b419801042962f5f5e5050a0542a2b2a2a76eedc4951d4f4e9d3994f9f79e699e2e2e2870f1fe6e4e4dcbb772f28288810b263c70e6f6fef55ab561d3f7e5ca150141717cf9f3fbfacac2c393999be2d993d3e9f1f12122297cb77edda555555d5dcdc9c9191412f28ad97eddbb7bbb8b8ac5ab5eadcb9730d0d0d376fde5cb870a1da3ddb3b76ecf0f1f179f1c5174f9d3a555757575353f3e9a79fbef5d65bbb77ef567df5859a8d1b37ae5fbf7ef9f2e5ebd7af2f2e2e7ef2e4494949c9679f7d366ddab4b163c77ef6d9674ce6a6aa134d1289e46f7ffb5b4e4e4e6363635e5edec2850b6d6c6c929393b57f8b65dd6a3f010000c0d2b0e9f88cefbebb1a60e8db531bd6b99ba408009642f52e0eaca40dbd91da533abb76ed623ef2f2f252fd68c3860d6acfac2e58b080a2a8fcfcfca4a4a451a346d1afed9d3c79f2810307e8fb9468858585414141f6f6f683060ddab76f1f935e5555b56ad52a6f6f6f8140209148222222d2d3d3e98f727272babad63a8da1b2b232292969d0a0410281c0dddd7df1e2c5ebd7afa737904aa5bb76ed522b4857b5515454347bf66c474747914814101070fcf8f1d0d050fa5b2fbdf412bd0dfd6ae561c3860904023737b7f0f0f073e7ceb1a9ea4b972e252626d2418ac5e2c993272727272b954ad56dd8d7c9860d1b547f3d2684ecd8b1e3c2850baa295bb66ca1bf4b2f197af3e6cd888808b1582c128982838333333375d6b6ceba65730200f41658491bc0b474767cdabb18eddd13d5f500434b4fddd59040cb578cec25012c10d15849530105b9000013f4494441549b47a93cb770f8f0e18484040a4f3200809919376e5c555555572b880200cd84fd38fd42bbefbfffdef8ac0000007a171e8f9792923277ee5c26053769030000000000007409d366000000000000802e61da0c00666df7eedd3c1eefdab56b2525253c1e6fe3c68d5c4704000000009645dbda7a00009c5bbb76eddab56bb98e02000000002c177e6d06000000000000e89251d3e6070f1e3cfbecb3f5f5f56c36feeebbef783c1e8fc7b3b5b53566a7009dc20946fe733f338fc71b38706077e49f9292326edc38914844efe5faf5eb0667959a9acafb8f9696161306c9d58ec0e470511342d6af5f4fbf53cafc6148d063babba95775ebd6ad8484040f0f0f6b6b6b7aa74e4e4eddbd537383d395812ed5247ae3688a0d33bf528cef4f0d9f36e7e7e74f9830213c3cdcd1d19110d2d0d0307cf8f0e8e8e8aeb69f376f1e4551cc2b64a137d2799439dcb5694f300e4b6a8cb56bd75214e5efefdf1d996765653dfffcf3e1e1e195959577eedc3172b8367bf66c8aa266cd9a65aaf038df11b77ae3196b81bd86018769e9d2a56fbcf1c6a64d9bba2f2a93c090a027754753dfe921bb7ffffe9429536eddbaf5c30f3fd4d7d7d7d7d71f3e7cd8caaa876e54349f66cd0c4f57ae2aa76f74a9dc9e5abd7434450c6dd8cde74236be3f35f0d9e6fafafa989898e79e7b6ec58a15740a45511d1d1d1d1d1d0687d21b3938388c1b372e333393eb407a088747b987776d99e7b376df7fff3d4551afbefaaa8383838383c3c3870fb98e08fe4ff79db1ddd7ca59e0556640917d7c7c8e1e3d3a7efc783f3f3fd5b7479a150c09fa804e0fd9fefdfbebeaeaf6eddb3775ea543a253e3e9e7ea1375721010d95630c6e6baff78ea60cab37f339578def4f0d9c36efdcb9532e976fdebc9949118bc577efde352c37e82d383cca3dbc6b9ccf9ae896ddd5d595eb40a013bdf18ced8d311bc9b022fbfbfbc7c5c5bdf6da6bb1b1b1d6d6e6b8902786047d40a787ecf6eddb8490b163c7721111ce226d5039c6e0b6f67aef68cab07a33ab73d5c8fed4903b6d288a3a78f0e0a44993060c1860c0d701a0376a6f6fe73a04000b3567ce9c478f1e9d387182eb403a8121411fd6dada4a08110a855c0702d0776034c52d63fa5343a6cdd7ae5d2b2f2f577da8a6abe7d10b0b0b67cf9e2d9148eceded8382820cb8cd4f35e7fbf7ef272424383939b9baba46474733ff75b16ddb367a03994c46a79c3e7d9a4ee9d7af9f663e0f1e3c484848108bc5aeaeae8989898f1f3fbe7fff7e4c4c8c582cf6f4f45cba74a942a1d01918bd20476363635656169d2dfd9f16aa3b2a2a2a9a3b77aeabab2bfd675555555b5b5b4a4a4a5858988787874824f2f3f34b4e4e66ee5b605358428852a9dcbc79f3c89123edecec5c5c5c6262628e1d3bc65c84da7741abaeae5eb3668d8f8f8f50281c3870e08c1933bef8e28be6e666ed9f76759499ed6d6c6c9c9d9da3a2a2323232f42a915ea781094f30f625655f90cacaca952b570e1d3ad4c6c6c6cdcd2d3636363f3f5fafa88c3fbe6a0cf88a1abaf8fffef7bf0921f40a1693274f66595eed271b4d2e977755a5c607cf724784f599acef75cd92ce4cb49c185d5d205a8e0e9b53baab564e6775b161f28b9a4d47a0bd1a59e6c0be19573b550e1e3ca86f13ca18376e1c21e4cc99332c6ba327f5e490402d1f3b3bbb8913271e3f7e7cc68c19f4ee962c59426f63e4c9af57269a6d0231fa02a1b1693f19a66d43349b7d558b172f6613a43103120e871c34eda7abbe234fc33a0eb3ad1c9a3977a97ad55e8f8df17af568cab086ddc87355af291bcb321ad59f522ae8e5c5285dbefaea2b42c8f6eddbd5d2e9e7d19b9b9be93f6fdfbeede4e4e4e5e575f6ec598542515050101e1e3e74e850a150a873179de63c6bd6acececec86868673e7ce8944a2808000d56deceded0303035553a452a9ababab663eb1b1b17979790d0d0d870e1d2284444545cd9a35ebead5ab0a85e2934f3e2184ac5ebd9a65609a3b55dd517070704646466363e3c58b17f97c7e6565655a5a1a5d753535359595951f7cf081959515bdb607fbc22e59b24422919c3d7bb6a9a9492e97d3afb4cdc8c8a03fd5b98bb2b2326f6f6f0f0f8fb4b4b4fafa7ab95cbe75eb5642c8debd7b757e4a691c657a7b7777f7b4b4b4bababaa2a2a2d8d8581e8f77e0c001bd0e1f1ba63dc1f42d299b829496960e1932c4ddddfdc489130a85e2faf5ebc1c1c1b6b6b6d9d9d9ec8b69e4f1a528cadfdfdfcbcb8bf993cd57d8d0ac109de56559c94c95a6a7a73b3a3aaa56a96983d7b223f667b261d7b54e3a33d17e62501a0788cdd96858d3cab2bad83079afa1b323d0598d3a7360df8c6b9e2a9a456659937575758490a0a0209d35c0b21f67232e2e2e2e2e4ee7663d3c2450cbe7faf5eb3366cc70737353cdc724273ffb4c340fb4492e109deda7be4dbdbe6d48a7299595958490175e78814d90460e483403e8b12107cbd395fdc8d3808ec36c2b47331f33ec52cd768cd7e9ae7bdd684adf86dde07355af291bcb32b2ef4f0921292929ff95a2fa07cbee76e7ce9d84907dfbf6a9a5ab550abd68c4912347980d4a4a4a8442a1c1d3e6b4b43426252e2e8e10428f4268ec1baf13274e3029a3478f2684fcf2cb2f4c8ab7b7f78811235806a67dda7cf2e449b5f4b4b4b4909010d594850b170a0482baba3ab5ef6a29acb7b7f7d4a9535533f1f5f5559d5669df05fd9fc46ae7416464247ded69ff94d238caf4f6df7efb2db3714b4bcb8001034422915c2e675922964c7b82e95b52360579e1851708215f7ffd35b3415959995028944aa5ec8b69e4f1a53a1b4be9fc0a1b9a15a2b3bc2c2b59b54ae7cf9faf5aa5a60d5ecb8ed89fc9865dd73ae9cc44fb8941691c203667a3614d2bc5aebad83079afa1b323d0598d6ca6cd2c9b71cd538532a809a5f178bca79e7aaaab82337a7edadcc34302cd7c2a2a2aececec54f331c9c9cf3e13cd036d920b4467fba96f53af6f1bd2698adab4597b90460e483403e8b12107cbd395fdc8d3808ec36c2ba7d37cccad4b35db315ea7bbee75a3297d1b7683cf55bda66ceccbc8b23f35cdb4f9adb7de2284ecdfbf5f2d5dad52c462312144a150a86ee3e7e767f0b459b5b359bd7a3521e4dab56b4c0afbc6abbcbc9c49090b0b2384343636322932994c2c16b30c4cfbb4b9aaaa4a670ebb76ed228468feefb596c2befcf2cb8490a54b97e6e4e4b4b5b5e9bb0b89444208a9afafef7463ed9f521a47b9d3ed13131309215f7ef925cb12b164da134cdf92b229884422b1b2b252bb3e9f79e61942c8c3870fd94445197d7c298db1149bafb0a159213acbcbb29255abf4f5d75fd77e6e1813bc961db13f930dbbae0da09689ce1343f3dad479361ad6b452ecaa8b0d93f71a3a3b029dd5c8a62b51d35533dee9a96240134a130804daaf6b5acf4f9b7b7848d0693ecf3cf38c6a3e2639f9d967a279a04d7281e86c3ff56deaf56d433a4d519b36eb0c527b48663be46079bab21f791ad071986de5749a8fb975a9663bc6eb74d7bd6e34a56fc36ef0b96ae494adab32b2ec4f35a7cd86acc949bfc39a5e28a22b4aa552a150d8dada3a3838a8a6f7efdfbfb8b8d8809d1242e85aa6d9d8d810420c7bc4917eab24cdcaca8acfe7dbd9d931297c3edf548ba4dbdbdbaba5d4d5d5bdf7de7b478f1e7df4e8516d6d2d93ded4d4a4b6a596c2eedbb76fca94295f7ef925fd62b4a0a0a0a4a4a43973e6b0d98552a9acababb3b5b5a54f7435da3f65bfbdbbbb3b21442e97b32c91018c3cc1f42da9aaae0a42e7a9b601e3f6eddb2c5fcd67ccf1ed94015f61436779dddcdc5856b26a0ef41b419973c3b4c177b523bdce6463ae6b2d7466a2fdc450a3d7d9a8efb5a95775b1d71dbd8626bdaab153ec0fb7e6a9a246af9a6c6b6b138944ece3ec313d3924e82a1f676767d56d8c3ff9f5ca44ed409be40231a093326d1b6292208d1990b0df9dc9871cddd116e9db71986de574958f5975a9e63cc6eb2a5a2d399be1688a89dc802b45afd343af291bfb321adc9f1ab22498a7a7271d9c966d8442a1582c6e6969696868504dafa9a931608f6c5859593d79f2443545b5caba098fc7d36bfb989898ad5bb72e5dbab4b8b8b8a3a383a2a8bd7bf71242e8ffd260bfd3c4c4c41f7ffcb1b6b636353595a2a8d8d8d83d7bf6b0d98550289448242d2d2d9d2e7ba6fd53f6db97979713423c3c3cd8174a5f469e60fa9694659e4e4e4ed6d6d6adadad9aff65356dda3496f918737c3b6592b3ce80f29aa492bb297835469ec92609526726da4f0ccd1299e46c249db572dd74e19ba4d7d0d911e8ac469d3998f09c645f93f4ffcad39dafb9e9c9214157f9545454a86e63fcc96f4c2626b9400c683f4ddb86982448630624ec7767f22107fbd3d59891672fad9c1e08c6f836d69cc77806e46cb6a329c31af6ee3b575996d198fed49069f398316308218f1e3dd2be5954541421e4f4e9d34c4a555555515191017b64c3d3d3b3a4a484f9532e97fff1c71fddb42f869d9d1dd3628e183162fffefd5a366e6f6fcfcacaf2f0f058b972a59b9b1b3d18ed6a494c2d9c9c9c0a0b0b09210281202c2c8c5e718e5e489dcd2ee8ff5a3e79f2a46ae2f8f1e3e97b51b47faa89de5e751977a552999e9e2e1289222222f42d9a5e8c3cc1f42d291bb1b1b16d6d6d595959aa89efbefbeee0c183dbdada586662e4f15563aab3ae533acb6b6425776bf06a0c3e934d12249b4cb49c189d32c9d948ba68e5bae9c237bed7d0d911e8ac46ed3998fc9c645993744874e76b6e7a7848a0998f5c2e57fb65c32427bf319998e402d1abfdec8e36c4c8208d1f9074b5bb1e1872b03c5d0d1e79f6eaca6183db2e9598f118cfb09ccd76346558c3de1de72afb321ad59faafe9706cb67a23a3a3afaf7efaff9b49bda9deb77eedc717171615657bb71e346444444fffefdd5ee775fb0600121e4debd7b5af6a8f918c0ba75eb082157af5e655256ac584108f9f0c30f150ac59d3b77e6ce9debe5e5d5e91326aaf9444444f0f97cd56d828383ededed7556022d3232522291fcf1c71fd9d9d9d6d6d6376fdeec6a47b4e9d3a7134276eedc595959d9d4d4f4d34f3f0d1e3c981072eedc39f685954824c1c1c1d7ae5d6b6969292f2f7ff3cd370921dbb66d63b90b7afd3a4f4fcfe3c78fd7d7d73f7cf8f0e5975f7677777ff0e081ce4f35c3535d0dafbebe9e590d4ff539373687cf80d380e509d6157d4bcaa620e5e5e53e3e3ec3860d3b79f2646d6d6d7575f5279f7c626767a7fa6884ce921a797c298d07ded87cc5b0cb5067790da864b52aedbee0d57664d8996cc2207566a2fdc4d00c8fcdd9c8e6daecb49563535d3d7f51532c3a029dd5a83307c39af1ae3e62539314457df3cd378490a3478feaac819e7fb6b98787046af9fcf6db6f91919143860c51cdc72427bf6199d04c7281e86c3ff56deaf56d433a4de97425edae82347240a219408f0d39589eae868d3c591e2fb3ad1c36f970dea59aed18afd31df5ded114cb2bc524e7aace291b9b3252faf4a7c4244b825114f5b7bffdcddadabaa4a484fef3e8d1a3aa53f1050b16d0e9454545b367cf767474a4d7703f7efc38fd440d21e4a5975e620ae9e0e0d0d5d247393939aa396fd8b081faef9fda67ce9c496f595b5bbb64c9124f4f4f91482493c9727373a55229bdcdba75eb34f3c9cdcd554dd9b163c7850b175453fe7f7b77cfd2481006707c036e610425880489118c85588a8d040441d14f106323a410b6b514418245be8116e227f0a5b7da420403229a5204b58818442162616161ae580821b99dccbeb8bb63febfeecebdd9679e99d99931b99d62b1d8350f777777f3f3f3030303e974da7a8f68db8ddaf2f9f6f66618463a9dd6753d994c160a85adad2debb2d9d959c9ca562a15c330a6a7a7ada317e7e6e60e0f0fad6f2374bd8575cdfbfbfbe6e6e6c4c484aeeba3a3a36b6b6bf7f7f7cd20ed7e6ad7caadd70f0d0dadacac98a6e9b4f9c4ddc04b071390afa97c45ac93e832998caeeb232323cbcbcb6dc3555c538fed6bbdfca02d4e992ee128ff9aa695cb65c9fada255932a5de83976f3bf99eac3919d792eddeb51041c7b01b2082d6914f4be753ae6bba64aafc4b835a3c1188d3285982a3c7786b5771f1086dcae572a954eafbfbbb6b0682df3637025c12b495138fc7b3d9ecf9f9f9c2c2423c1e6fbdc697ce2f5f4867ce3d0e90ce425a9f9fee1ef58e9e21ff6dc4b60f822e2e2e0441ca8424f8e7212e39daba99a0bb3a5a796ace278e0826479529d551f6025be329bd9a72f760f7a5af4a6ed964ead870329f6a7e6d9b3f3e3e52a994611832170bd4ebf5fefefe8d8d0d8fe54069bdd30da259d36846254989e09508d25f3d58e5df53a95462b158eb591d02a16c9b435f124c4d4d8d8f8f7bbc7b9018202122f9024a2427b241463630194a072fcfd17ceadbb6b9d168dcdcdc0c0f0fefeded495edfe9e7e7677d7d3d994cd66a35d7854075bdd30da259d36846254989e09508d25f3d58e5dff3f0f090c964b6b7b725af0f65dbdc08704950abd5128944eb07054f4f4f7d7d7d8542c1f5ad03c6000911c917502239910d32b281c9503a78794ee7d3ce6db39b578259666666aeafafcfcece3e3f3fdd95f0fafafaf8f8689a66c0aff843a4f44e3788664da319952425825722487ff560957fcfc1c141a9542a954a6107d245904b827abd6e1846b55afdfafabababacae7f38383833b3b3beeee1b3c06488848be8012c9896c90910d4c86d2c1cbf33e9fc61a2ddf803f3e3ecee7f30d5f4f76519ae07ca962b168bd4e039145f3017f0c83ba2b1fe7f15c2ea769dac9c989f7a2fc659ae6fefefeedededcbcb4b2291585a5adadddd9d9c9c0c3b2e00c0df118bc58e8e8e5657579b7fd3176234d1c76f109446f3017f0c831a9aa62d2e2e365f3903004030dc7f491b00000000803f8f6d330000000000b6d8360300000000608b6d330000000000b6d836030000000060eb3f6fd2169cf00100007ac4e9e9294b020000b4b6739b9f9f9f2f2f2f438c06000078d47acea46be572b95aad7a2f0700001565b3d9b1b1b1e61f631c830900000000801dfe6f330000000000b6d8360300000000608b6d330000000000b6fe01ce650858632cf6a10000000049454e44ae426082),
(5, 'admin2', '1234', 'juan', 'perez', 100, 'admin1@gmail.com', '');

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
