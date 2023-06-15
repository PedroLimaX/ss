-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-05-2023 a las 20:01:57
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `escolar`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `id` int(11) NOT NULL,
  `matricula` varchar(15) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apaterno` varchar(150) NOT NULL,
  `amaterno` varchar(150) DEFAULT NULL,
  `estatus` varchar(45) NOT NULL COMMENT 'El estatus puede ser: activo, baja, permiso temporal, egresado',
  `titulado` tinyint(1) NOT NULL DEFAULT 0,
  `idgrupo` int(11) NOT NULL,
  `idtutor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`id`, `matricula`, `nombre`, `apaterno`, `amaterno`, `estatus`, `titulado`, `idgrupo`, `idtutor`) VALUES
(1, '201928846', 'Pedro', 'Degante', 'Lima', 'Activo', 0, 1, 1),
(2, '201900000', 'Mauricio', 'Jiménez', 'Vega', 'Activo', 0, 2, 2),
(3, '201927245', 'Juan Carlos', 'Tlachi', 'Barranco', 'Activo', 0, 1, 1),
(4, '201922222', 'Otoniel', 'Bruno', 'Valdez', 'Baja', 0, 1, 1),
(5, '201966109', 'Sebastian', 'Castañeda', 'Alvarado', 'Activo', 0, 1, 1),
(8, '201957735', 'Marcos Jafet', 'Valadez', 'Castanedo', 'Activo', 0, 1, 1),
(9, '201966770', 'Ian Joacim', 'German', 'Galindo', 'Activo', 0, 1, 1),
(10, '201800000', 'Jesus', 'Cristo', 'De Nazareth', 'Egresado', 1, 5, 1),
(11, '201811111', 'Ejemplo', 'Ejemplo', 'Ejemplo', 'Permiso Temporal', 0, 5, 1),
(12, '201969007', 'Vidal', 'Zap', 'Bernabe', 'Activo', 0, 2, 2),
(13, '201952865', 'Axel Edrei', 'Marin', 'Robles', 'Activo', 0, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth`
--

CREATE TABLE `auth` (
  `id` int(11) NOT NULL,
  `usuario` varchar(255) NOT NULL,
  `matricula` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion`
--

CREATE TABLE `calificacion` (
  `id` int(11) NOT NULL,
  `estatus` varchar(45) NOT NULL COMMENT 'El estatus puede ser: aprobado, cursando, no aprobada, no cursada.',
  `periodo` varchar(45) DEFAULT NULL,
  `extraordinario` tinyint(1) NOT NULL DEFAULT 0,
  `recurso` int(11) DEFAULT NULL,
  `calificacion` float(3,1) DEFAULT NULL,
  `idalumno` int(11) NOT NULL,
  `idmateria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `calificacion`
--

INSERT INTO `calificacion` (`id`, `estatus`, `periodo`, `extraordinario`, `recurso`, `calificacion`, `idalumno`, `idmateria`) VALUES
(1, 'Aprobada', 'Otoño 2019', 0, NULL, 8.0, 1, 1),
(2, 'Aprobada', 'Otoño 2019', 0, NULL, 8.0, 1, 2),
(3, 'Aprobada', 'Otoño 2019', 0, NULL, 9.0, 1, 3),
(4, 'Aprobada', 'Otoño 2019', 0, NULL, 10.0, 1, 4),
(5, 'Aprobada', 'Otoño 2019', 0, NULL, 9.0, 1, 5),
(6, 'Aprobada', 'Otoño 2019', 0, NULL, 9.0, 1, 6),
(7, 'Aprobada', 'Otoño 2019', 0, NULL, 10.0, 1, 7),
(8, 'Aprobada', 'Otoño 2019', 0, NULL, 9.0, 1, 8),
(9, 'Aprobada', 'Otoño 2019', 0, NULL, 8.0, 1, 9),
(10, 'Aprobada', 'Otoño 2019', 0, NULL, 9.0, 1, 10),
(11, 'Aprobada', 'Primavera 2020', 0, NULL, 9.0, 1, 11),
(12, 'Aprobada', 'Primavera 2020', 0, NULL, 10.0, 1, 12),
(13, 'Aprobada', 'Primavera 2020', 0, NULL, 10.0, 1, 13),
(14, 'Aprobada', 'Primavera 2020', 0, NULL, 10.0, 1, 14),
(15, 'Aprobada', 'Primavera 2020', 0, NULL, 9.0, 1, 15),
(16, 'Aprobada', 'Primavera 2020', 0, NULL, 10.0, 1, 16),
(17, 'Aprobada', 'Primavera 2020', 0, NULL, 10.0, 1, 17),
(18, 'Aprobada', 'Primavera 2020', 0, NULL, 9.0, 1, 18),
(19, 'Aprobada', 'Primavera 2020', 0, NULL, 6.0, 1, 19),
(20, 'Aprobada', 'Otoño 2020', 0, NULL, 10.0, 1, 20),
(21, 'Aprobada', 'Otoño 2020', 0, NULL, 9.0, 1, 21),
(22, 'Aprobada', 'Otoño 2020', 0, NULL, 10.0, 1, 22),
(23, 'Aprobada', 'Otoño 2020', 0, NULL, 10.0, 1, 23),
(24, 'Aprobada', 'Otoño 2020', 0, NULL, 8.0, 1, 24),
(25, 'Aprobada', 'Otoño 2020', 0, NULL, 9.0, 1, 25),
(26, 'Aprobada', 'Otoño 2020', 0, NULL, 8.0, 1, 26),
(27, 'Aprobada', 'Otoño 2020', 0, NULL, 8.0, 1, 27),
(28, 'Aprobada', 'Otoño 2020', 0, NULL, 8.0, 1, 28),
(29, 'Aprobada', 'Otoño 2020', 0, NULL, 10.0, 1, 29),
(30, 'Aprobada', 'Otoño 2020', 0, NULL, 10.0, 1, 30),
(31, 'Aprobada', 'Primavera 2021', 0, NULL, 9.0, 1, 31),
(32, 'Aprobada', 'Primavera 2021', 0, NULL, 10.0, 1, 32),
(33, 'Aprobada', 'Primavera 2021', 0, NULL, 9.0, 1, 33),
(34, 'Aprobada', 'Primavera 2021', 0, NULL, 9.0, 1, 34),
(35, 'Aprobada', 'Primavera 2021', 0, NULL, 10.0, 1, 35),
(36, 'Aprobada', 'Primavera 2021', 0, NULL, 8.0, 1, 36),
(37, 'Aprobada', 'Primavera 2021', 0, NULL, 10.0, 1, 37),
(38, 'Aprobada', 'Primavera 2021', 0, NULL, 10.0, 1, 38),
(39, 'Aprobada', 'Primavera 2021', 0, NULL, 10.0, 1, 39),
(43, 'Aprobada', 'Otoño 2021', 0, NULL, 10.0, 1, 40),
(44, 'Aprobada', 'Otoño 2021', 0, NULL, 10.0, 1, 41),
(45, 'Aprobada', 'Otoño 2021', 0, NULL, 10.0, 1, 42),
(46, 'Aprobada', 'Otoño 2021', 0, NULL, 10.0, 1, 43),
(47, 'Aprobada', 'Otoño 2021', 0, NULL, 9.0, 1, 44),
(48, 'Aprobada', 'Otoño 2021', 0, NULL, 9.0, 1, 45),
(49, 'Aprobada', 'Otoño 2021', 0, NULL, 8.0, 1, 46),
(50, 'Aprobada', 'Otoño 2021', 0, NULL, 9.0, 1, 47),
(51, 'Aprobada', 'Otoño 2021', 0, NULL, 10.0, 1, 48),
(52, 'Aprobada', 'Primavera 2022', 0, NULL, 10.0, 1, 49),
(53, 'Aprobada', 'Primavera 2022', 0, NULL, 9.0, 1, 50),
(54, 'Aprobada', 'Primavera 2022', 0, NULL, 9.0, 1, 51),
(55, 'Aprobada', 'Primavera 2022', 0, NULL, 8.0, 1, 52),
(56, 'Aprobada', 'Primavera 2022', 0, NULL, 9.0, 1, 53),
(57, 'Aprobada', 'Primavera 2022', 0, NULL, 9.0, 1, 54),
(58, 'Aprobada', 'Primavera 2022', 0, NULL, 8.0, 1, 55),
(59, 'Aprobada', 'Primavera 2022', 0, NULL, 9.0, 1, 56),
(60, 'Aprobada', 'Primavera 2022', 0, NULL, 10.0, 1, 57),
(70, 'No cursada', 'Otoño 2022', 0, NULL, NULL, 1, 73),
(71, 'Cursando', 'Primavera 2023', 0, NULL, NULL, 1, 114),
(72, 'Cursando', 'Primavera 2023', 0, NULL, NULL, 1, 115),
(73, 'Cursando', 'Primavera 2023', 0, NULL, NULL, 1, 116),
(74, 'Cursando', 'Primavera 2023', 0, NULL, NULL, 1, 72),
(76, 'Aprobada', 'Otoño 2019', 0, NULL, 9.0, 8, 2),
(77, 'Aprobada', 'Otoño 2019', 0, NULL, 8.0, 8, 1),
(78, 'Aprobada', 'Otoño 2019', 0, NULL, 8.0, 8, 3),
(79, 'Aprobada', 'Otoño 2019', 0, NULL, 6.0, 8, 4),
(80, 'Aprobada', 'Otoño 2019', 0, NULL, 9.0, 8, 5),
(81, 'Aprobada', 'Otoño 2019', 0, NULL, 9.0, 8, 6),
(82, 'Aprobada', 'Otoño 2019', 0, NULL, 8.0, 8, 7),
(83, 'Aprobada', 'Otoño 2019', 0, NULL, 7.0, 8, 8),
(84, 'Aprobada', 'Otoño 2019', 0, NULL, 8.0, 8, 9),
(85, 'Aprobada', 'Otoño 2019', 0, NULL, 9.0, 8, 10),
(86, 'Cursando', 'Primavera 2023', 0, NULL, NULL, 8, 11),
(87, 'Aprobada', 'Primavera 2020', 0, NULL, 10.0, 8, 12),
(88, 'Aprobada', 'Primavera 2020', 0, NULL, 8.0, 8, 13),
(89, 'Aprobada', 'Primavera 2020', 0, NULL, 7.0, 8, 14),
(90, 'Aprobada', 'Primavera 2020', 0, NULL, 6.0, 8, 15),
(91, 'Aprobada', 'Verano 2021', 1, 2, 10.0, 8, 16),
(92, 'Aprobada', 'Primavera 2020', 1, NULL, 6.0, 8, 17),
(93, 'Aprobada', 'Primavera 2020', 0, NULL, 7.0, 8, 18),
(94, 'Aprobada', 'Primavera 2020', 0, NULL, 8.0, 8, 19),
(95, 'Aprobada', 'Otoño 2020', 0, NULL, 7.0, 8, 20),
(96, 'Aprobada', 'Otoño 2020', 0, NULL, 10.0, 8, 21),
(97, 'Aprobada', 'Otoño 2020', 0, NULL, 7.0, 8, 22),
(98, 'Aprobada', 'Otoño 2020', 0, NULL, 8.0, 8, 23),
(99, 'Aprobada', 'Otoño 2021', 1, 1, 7.0, 8, 24),
(100, 'Aprobada', 'Primavera 2021', 1, 1, 7.0, 8, 25),
(101, 'Aprobada', 'Otoño 2020', 0, NULL, 6.0, 8, 26),
(102, 'Aprobada', 'Primavera 2021', 1, 1, 6.0, 8, 27),
(103, 'Aprobada', 'Otoño 2020', 0, NULL, 7.0, 8, 28),
(104, 'Aprobada', 'Otoño 2020', 0, NULL, 6.0, 8, 29),
(105, 'Aprobada', 'Otoño 2020', 0, NULL, 6.0, 8, 30),
(106, 'Aprobada', 'Otoño 2021', 1, 1, 8.0, 8, 32),
(107, 'Aprobada', 'Primavera 2021', 0, NULL, 9.0, 8, 33),
(108, 'Aprobada', 'Otoño 2022', 1, 2, 6.0, 8, 34),
(109, 'Aprobada', 'Primavera 2021', 0, NULL, 7.0, 8, 31),
(110, 'Cursando', 'Primavera 2023', 0, NULL, NULL, 8, 35),
(111, 'Aprobada', 'Otoño 2021', 1, 1, 8.0, 8, 36),
(112, 'Cursando', 'Primavera 2023', 0, NULL, NULL, 8, 37),
(113, 'Aprobada', 'Primavera 2021', 1, NULL, 6.0, 8, 38),
(114, 'Aprobada', 'Primavera 2021', 0, NULL, 10.0, 8, 39),
(115, 'Aprobada', 'Primavera 2022', 1, 1, 6.0, 8, 40),
(116, 'Aprobada', 'Otoño 2021', 0, NULL, 10.0, 8, 41),
(117, 'Aprobada', 'Otoño 2021', 0, NULL, 10.0, 8, 42),
(118, 'Aprobada', 'Otoño 2021', 0, NULL, 7.0, 8, 43),
(119, 'Aprobada', 'Otoño 2021', 0, NULL, 7.0, 8, 44),
(120, 'Aprobada', 'Primavera 2022', 1, 1, 8.0, 8, 45),
(121, 'Aprobada', 'Otoño 2021', 0, NULL, 7.0, 8, 46),
(122, 'Cursando', 'Primavera 2023', 0, NULL, NULL, 8, 47),
(123, 'Aprobada', 'Otoño 2021', 0, NULL, 8.0, 8, 48),
(124, 'Aprobada', 'Primavera 2022', 0, NULL, 10.0, 8, 49),
(125, 'Aprobada', 'Primavera 2022', 0, NULL, 9.0, 8, 50),
(126, 'Aprobada', 'Primavera 2022', 0, NULL, 9.0, 8, 51),
(127, 'No cursada', NULL, 0, NULL, NULL, 8, 52),
(128, 'No aprobada', 'Verano 2022', 0, NULL, 5.0, 8, 53),
(129, 'No aprobada', 'Primavera 2022', 0, NULL, 5.0, 8, 54),
(130, 'Aprobada', 'Primavera 2022', 0, NULL, 7.0, 8, 55),
(131, 'Aprobada', 'Primavera 2022', 0, NULL, 8.0, 8, 56),
(132, 'Aprobada', 'Primavera 2022', 0, NULL, 8.0, 8, 57),
(133, 'Aprobada', 'Otoño 2022', 0, NULL, 8.0, 8, 92),
(134, 'Aprobada', 'Otoño 2022', 1, NULL, 6.0, 8, 99),
(135, 'Aprobada', 'Otoño 2022', 0, NULL, 7.0, 8, 100),
(136, 'Aprobada', 'Otoño 2022', 0, NULL, 9.0, 8, 101),
(137, 'Aprobada', 'Otoño 2022', 0, NULL, 7.0, 8, 62),
(138, 'Aprobada', 'Otoño 2022', 0, NULL, 8.0, 8, 63),
(139, 'Aprobada', 'Otoño 2022', 0, NULL, 7.0, 8, 64),
(140, 'Aprobada', 'Otoño 2022', 0, NULL, 10.0, 8, 65),
(141, 'Aprobada', 'Otoño 2022', 0, NULL, 9.0, 8, 66),
(142, 'No cursada', NULL, 0, NULL, NULL, 8, 73),
(146, 'No cursada', NULL, 0, NULL, NULL, 8, 72),
(147, 'Aprobada', 'Otoño 2019', 0, NULL, 8.0, 9, 2),
(148, 'Aprobada', 'Otoño 2019', 0, NULL, 8.0, 9, 1),
(149, 'Aprobada', 'Otoño 2019', 0, NULL, 10.0, 9, 3),
(150, 'Aprobada', 'Otoño 2019', 0, NULL, 10.0, 9, 4),
(151, 'Aprobada', 'Otoño 2019', 0, NULL, 10.0, 9, 5),
(152, 'Aprobada', 'Otoño 2019', 0, NULL, 9.0, 9, 6),
(153, 'Aprobada', 'Otoño 2019', 0, NULL, 8.0, 9, 7),
(154, 'Aprobada', 'Otoño 2019', 0, NULL, 8.0, 9, 8),
(155, 'Aprobada', 'Otoño 2019', 0, NULL, 8.0, 9, 9),
(156, 'Aprobada', 'Otoño 2019', 0, NULL, 9.0, 9, 10),
(157, 'Aprobada', 'Primavera 2020', 0, NULL, 9.0, 9, 11),
(158, 'Aprobada', 'Primavera 2020', 0, NULL, 10.0, 9, 12),
(159, 'Aprobada', 'Primavera 2020', 0, NULL, 9.0, 9, 13),
(160, 'Aprobada', 'Primavera 2020', 0, NULL, 7.0, 9, 14),
(161, 'Aprobada', 'Primavera 2020', 0, 0, 6.0, 9, 15),
(162, 'Aprobada', 'Primavera 2020', 1, NULL, 6.0, 9, 16),
(163, 'Aprobada', 'Otoño 2020', 0, 1, 6.0, 9, 17),
(164, 'Aprobada', 'Otoño 2021', 0, 1, 8.0, 9, 18),
(165, 'Aprobada', 'Primavera 2020', 0, NULL, 7.0, 9, 19),
(166, 'Aprobada', 'Primavera 2021', 1, 1, 7.0, 9, 20),
(167, 'Aprobada', 'Otoño 2020', 0, NULL, 10.0, 9, 21),
(168, 'Aprobada', 'Otoño 2020', 0, NULL, 7.0, 9, 22),
(169, 'Aprobada', 'Otoño 2020', 0, NULL, 7.0, 9, 23),
(170, 'Aprobada', 'Otoño 2021', 0, 2, 6.0, 9, 24),
(171, 'Aprobada', 'Primavera 2021', 0, 1, 7.0, 9, 25),
(172, 'Aprobada', 'Otoño 2020', 0, NULL, 6.0, 9, 26),
(173, 'Aprobada', 'Primavera 2021', 0, 1, 6.0, 9, 27),
(174, 'Aprobada', 'Otoño 2020', 0, NULL, 7.0, 9, 28),
(175, 'Aprobada', 'Otoño 2020', 0, NULL, 7.0, 9, 29),
(176, 'Aprobada', 'Otoño 2020', 0, NULL, 6.0, 9, 30),
(177, 'Aprobada', 'Otoño 2021', 0, NULL, 9.0, 9, 32),
(178, 'Aprobada', 'Otoño 2022', 0, NULL, 10.0, 9, 33),
(179, 'Aprobada', 'Otoño 2022', 1, 2, 6.0, 9, 34),
(180, 'No aprobada', 'Otoño 2022', 1, NULL, 5.0, 9, 31),
(181, 'Cursando', 'Primavera 2023', 1, 2, NULL, 9, 35),
(182, 'Aprobada', 'Otoño 2021', 0, 1, 8.0, 9, 36),
(183, 'Cursando', 'Primavera 2023', 1, 2, NULL, 9, 37),
(184, 'Aprobada', 'Primavera 2021', 1, NULL, 6.0, 9, 38),
(185, 'Aprobada', 'Primavera 2021', 0, NULL, 10.0, 9, 39),
(186, 'No cursada', NULL, 0, NULL, NULL, 9, 40),
(187, 'No cursada', NULL, 0, NULL, NULL, 9, 41),
(188, 'No cursada', NULL, 0, NULL, NULL, 9, 42),
(189, 'No aprobada', 'Otoño 2021', 1, NULL, 5.0, 9, 43),
(190, 'Aprobada', 'Otoño 2021', 0, NULL, 8.0, 9, 44),
(191, 'Aprobada', 'Primavera 2022', 0, 1, 8.0, 9, 45),
(192, 'No aprobada', 'Otoño 2021', 1, NULL, 5.0, 9, 46),
(193, 'Cursando', 'Primavera 2023', 0, NULL, NULL, 9, 47),
(194, 'Aprobada', 'Otoño 2021', 0, NULL, 8.0, 9, 48),
(195, 'Aprobada', 'Primavera 2022', 0, NULL, 10.0, 9, 49),
(196, 'Aprobada', 'Primavera 2022', 0, NULL, 9.0, 9, 50),
(197, 'Aprobada', 'Primavera 2022', 0, NULL, 9.0, 9, 51),
(198, 'No cursada', NULL, 0, NULL, NULL, 9, 52),
(199, 'Aprobada', 'Verano 2022', 0, 1, 7.0, 9, 53),
(200, 'No aprobada', 'Primavera 2022', 1, NULL, 5.0, 9, 54),
(201, 'Aprobada', 'Primavera 2022', 0, NULL, 7.0, 9, 55),
(202, 'Aprobada', 'Primavera 2022', 0, NULL, 7.0, 9, 56),
(203, 'Aprobada', 'Primavera 2022', 0, NULL, 8.0, 9, 57),
(204, 'Cursando', 'Primavera 2023', 0, NULL, NULL, 9, 88),
(205, 'Cursando', 'Primavera 2023', 0, NULL, NULL, 9, 89),
(206, 'Cursando', 'Primavera 2023', 0, NULL, NULL, 9, 90),
(207, 'Cursando', 'Primavera 2023', 0, NULL, NULL, 9, 91),
(208, 'No cursada', NULL, 0, NULL, NULL, 9, 62),
(209, 'No cursada', NULL, 0, NULL, NULL, 9, 63),
(210, 'No cursada', NULL, 0, NULL, NULL, 9, 64),
(211, 'No cursada', NULL, 0, NULL, NULL, 9, 65),
(212, 'Aprobada', 'Otoño 2022', 0, NULL, 10.0, 9, 66),
(213, 'No cursada', NULL, 0, NULL, NULL, 9, 73),
(217, 'No cursada', NULL, 0, NULL, NULL, 9, 72),
(218, 'Cursando', 'Primavera 2023', 0, NULL, NULL, 1, 117),
(225, 'Aprobada', 'Otoño 2019', 0, NULL, 6.0, 5, 2),
(226, 'Aprobada', 'Otoño 2019', 0, NULL, 6.0, 5, 1),
(227, 'Aprobada', 'Otoño 2019', 0, NULL, 6.0, 5, 3),
(228, 'Aprobada', 'Otoño 2019', 0, NULL, 9.0, 5, 4),
(229, 'Aprobada', 'Otoño 2019', 0, NULL, 9.0, 5, 5),
(230, 'Aprobada', 'Otoño 2019', 0, NULL, 10.0, 5, 6),
(231, 'Aprobada', 'Otoño 2020', 1, 2, 10.0, 5, 7),
(232, 'Aprobada', 'Otoño 2019', 0, NULL, 6.0, 5, 8),
(233, 'Aprobada', 'Otoño 2019', 0, NULL, 7.0, 5, 9),
(234, 'Aprobada', 'Otoño 2019', 0, NULL, 7.0, 5, 10),
(235, 'Aprobada', 'Primavera 2020', 1, NULL, 6.0, 5, 11),
(236, 'Aprobada', 'Primavera 2020', 0, NULL, 8.0, 5, 12),
(237, 'Aprobada', 'Otoño 2020', 0, NULL, 10.0, 5, 13),
(238, 'Aprobada', 'Primavera 2020', 0, NULL, 10.0, 5, 14),
(239, 'Aprobada', 'Otoño 2022', 1, 3, 8.0, 5, 15),
(240, 'Aprobada', 'Primavera 2020', 0, NULL, 10.0, 5, 16),
(241, 'Aprobada', 'Primavera 2020', 0, NULL, 6.0, 5, 17),
(242, 'Aprobada', 'Primavera 2020', 0, NULL, 7.0, 5, 18),
(243, 'Aprobada', 'Primavera 2020', 0, NULL, 8.0, 5, 19),
(244, 'Aprobada', 'Otoño 2020', 0, NULL, 7.0, 5, 20),
(245, 'Aprobada', 'Otoño 2020', 0, NULL, 10.0, 5, 21),
(246, 'Aprobada', 'Otoño 2020', 0, NULL, 10.0, 5, 22),
(247, 'Aprobada', 'Otoño 2020', 0, NULL, 9.0, 5, 23),
(248, 'Aprobada', 'Otoño 2020', 0, NULL, 8.0, 5, 24),
(249, 'Aprobada', 'Otoño 2020', 0, NULL, 7.0, 5, 25),
(250, 'Aprobada', 'Otoño 2020', 0, NULL, 7.0, 5, 26),
(251, 'Aprobada', 'Otoño 2020', 0, NULL, 8.0, 5, 27),
(252, 'Aprobada', 'Otoño 2020', 0, NULL, 8.0, 5, 28),
(253, 'Aprobada', 'Otoño 2020', 0, NULL, 10.0, 5, 29),
(254, 'Aprobada', 'Otoño 2022', 1, 1, 8.0, 5, 30),
(255, 'Aprobada', 'Primavera 2021', 0, NULL, 6.0, 5, 32),
(256, 'Aprobada', 'Primavera 2021', 0, NULL, 7.0, 5, 33),
(257, 'Aprobada', 'Primavera 2021', 0, NULL, 8.0, 5, 34),
(258, 'Aprobada', 'Primavera 2021', 1, NULL, 6.0, 5, 31),
(259, 'Aprobada', 'Primavera 2021', 0, NULL, 8.0, 5, 35),
(260, 'Aprobada', 'Primavera 2021', 0, NULL, 6.0, 5, 36),
(261, 'Aprobada', 'Primavera 2021', 0, NULL, 8.0, 5, 37),
(262, 'Aprobada', 'Primavera 2021', 1, NULL, 6.0, 5, 38),
(263, 'Cursando', 'Primavera 2023', 0, NULL, NULL, 5, 39),
(264, 'Aprobada', 'Otoño 2021', 1, NULL, 6.0, 5, 40),
(265, 'Aprobada', 'Otoño 2021', 0, NULL, 10.0, 5, 41),
(266, 'Aprobada', 'Otoño 2021', 0, NULL, 10.0, 5, 42),
(267, 'Aprobada', 'Otoño 2021', 0, NULL, 9.0, 5, 43),
(268, 'Aprobada', 'Otoño 2021', 0, NULL, 8.0, 5, 44),
(269, 'Cursando', 'Primavera 2023', 1, 2, NULL, 5, 45),
(270, 'Aprobada', 'Otoño 2021', 0, NULL, 7.0, 5, 46),
(271, 'Cursando', 'Primavera 2023', 1, NULL, NULL, 5, 47),
(272, 'Aprobada', 'Otoño 2021', 0, NULL, 7.0, 5, 48),
(273, 'Aprobada', 'Primavera 2022', 0, NULL, 10.0, 5, 49),
(274, 'Aprobada', 'Primavera 2022', 0, NULL, 10.0, 5, 50),
(275, 'No aprobada', 'Primavera 2022', 1, NULL, 5.0, 5, 51),
(276, 'No aprobada', 'Primavera 2022', 1, NULL, 5.0, 5, 52),
(277, 'No cursada', NULL, 0, NULL, NULL, 5, 53),
(278, 'No cursada', NULL, 0, NULL, NULL, 5, 54),
(279, 'No aprobada', 'Primavera 2022', 1, NULL, 5.0, 5, 55),
(280, 'Aprobada', 'Primavera 2022', 0, NULL, 6.0, 5, 56),
(285, 'Aprobada', 'Otoño 2022', 0, NULL, 9.0, 5, 92),
(286, 'Aprobada', 'Otoño 2022', 0, NULL, 6.0, 5, 99),
(287, 'Aprobada', 'Otoño 2022', 0, NULL, 8.0, 5, 100),
(288, 'Aprobada', 'Otoño 2022', 0, NULL, 9.0, 5, 101),
(289, 'No cursada', NULL, 0, NULL, NULL, 5, 73),
(293, 'No cursada', NULL, 0, NULL, NULL, 5, 72),
(294, 'Aprobada', 'Primavera 2022', 0, NULL, 9.0, 1, 62),
(295, 'Aprobada', 'Primavera 2022', 0, NULL, 9.0, 1, 63),
(296, 'Aprobada', 'Primavera 2022', 0, NULL, 10.0, 1, 64),
(297, 'Aprobada', 'Primavera 2022', 0, NULL, 10.0, 1, 65),
(298, 'Aprobada', 'Primavera 2022', 0, NULL, 9.0, 1, 92),
(300, 'Aprobada', 'Primavera 2022', 0, NULL, 10.0, 1, 100),
(301, 'Aprobada', 'Primavera 2022', 0, NULL, 10.0, 1, 101),
(302, 'Aprobada', 'Primavera 2022', 0, NULL, 9.0, 1, 66),
(303, 'Aprobada', 'Primavera 2022', 0, NULL, 9.0, 1, 99),
(373, 'Aprobada', 'Otoño 2018', 0, NULL, 9.0, 10, 2),
(374, 'Aprobada', 'Otoño 2018', 0, NULL, 9.0, 10, 1),
(375, 'Aprobada', 'Otoño 2018', 0, NULL, 9.0, 10, 3),
(376, 'Aprobada', 'Otoño 2018', 0, NULL, 9.0, 10, 4),
(377, 'Aprobada', 'Otoño 2018', 0, NULL, 9.0, 10, 5),
(378, 'Aprobada', 'Otoño 2018', 0, NULL, 9.0, 10, 6),
(379, 'Aprobada', 'Otoño 2018', 0, NULL, 9.0, 10, 7),
(380, 'Aprobada', 'Otoño 2018', 0, NULL, 9.0, 10, 8),
(381, 'Aprobada', 'Otoño 2018', 0, NULL, 9.0, 10, 9),
(382, 'Aprobada', 'Otoño 2018', 0, NULL, 9.0, 10, 10),
(383, 'Aprobada', 'Primavera 2019', 0, NULL, 9.0, 10, 11),
(384, 'Aprobada', 'Primavera 2019', 0, NULL, 9.0, 10, 12),
(385, 'Aprobada', 'Primavera 2019', 0, NULL, 9.0, 10, 13),
(386, 'Aprobada', 'Primavera 2019', 0, NULL, 9.0, 10, 14),
(387, 'Aprobada', 'Primavera 2019', 0, NULL, 9.0, 10, 15),
(388, 'Aprobada', 'Primavera 2019', 0, NULL, 9.0, 10, 16),
(389, 'Aprobada', 'Primavera 2019', 0, NULL, 9.0, 10, 17),
(390, 'Aprobada', 'Primavera 2019', 0, NULL, 9.0, 10, 18),
(391, 'Aprobada', 'Primavera 2019', 0, NULL, 9.0, 10, 19),
(392, 'Aprobada', 'Otoño 2019', 0, NULL, 9.0, 10, 20),
(393, 'Aprobada', 'Otoño 2019', 0, NULL, 9.0, 10, 21),
(394, 'Aprobada', 'Otoño 2019', 0, NULL, 9.0, 10, 22),
(395, 'Aprobada', 'Otoño 2019', 0, NULL, 9.0, 10, 23),
(396, 'Aprobada', 'Otoño 2019', 0, NULL, 9.0, 10, 24),
(397, 'Aprobada', 'Otoño 2019', 0, NULL, 9.0, 10, 25),
(398, 'Aprobada', 'Otoño 2019', 0, NULL, 9.0, 10, 26),
(399, 'Aprobada', 'Otoño 2019', 0, NULL, 9.0, 10, 27),
(400, 'Aprobada', 'Otoño 2019', 0, NULL, 9.0, 10, 28),
(401, 'Aprobada', 'Otoño 2019', 0, NULL, 9.0, 10, 29),
(402, 'Aprobada', 'Otoño 2019', 0, NULL, 9.0, 10, 30),
(403, 'Aprobada', 'Primavera 2020', 0, NULL, 9.0, 10, 32),
(404, 'Aprobada', 'Primavera 2020', 0, NULL, 9.0, 10, 33),
(405, 'Aprobada', 'Primavera 2020', 0, NULL, 9.0, 10, 34),
(406, 'Aprobada', 'Primavera 2020', 0, NULL, 9.0, 10, 31),
(407, 'Aprobada', 'Primavera 2020', 0, NULL, 9.0, 10, 35),
(408, 'Aprobada', 'Primavera 2020', 0, NULL, 9.0, 10, 36),
(409, 'Aprobada', 'Primavera 2020', 0, NULL, 9.0, 10, 37),
(410, 'Aprobada', 'Primavera 2020', 0, NULL, 9.0, 10, 38),
(411, 'Aprobada', 'Primavera 2020', 0, NULL, 9.0, 10, 39),
(412, 'Aprobada', 'Otoño 2020', 0, NULL, 9.0, 10, 40),
(413, 'Aprobada', 'Otoño 2020', 0, NULL, 9.0, 10, 41),
(414, 'Aprobada', 'Otoño 2020', 0, NULL, 9.0, 10, 42),
(415, 'Aprobada', 'Otoño 2020', 0, NULL, 9.0, 10, 43),
(416, 'Aprobada', 'Otoño 2020', 0, NULL, 9.0, 10, 44),
(417, 'Aprobada', 'Otoño 2020', 0, NULL, 9.0, 10, 45),
(418, 'Aprobada', 'Otoño 2020', 0, NULL, 9.0, 10, 46),
(419, 'Aprobada', 'Otoño 2020', 0, NULL, 9.0, 10, 47),
(420, 'Aprobada', 'Otoño 2020', 0, NULL, 9.0, 10, 48),
(421, 'Aprobada', 'Primavera 2021', 0, NULL, 9.0, 10, 49),
(422, 'Aprobada', 'Primavera 2021', 0, NULL, 9.0, 10, 50),
(423, 'Aprobada', 'Primavera 2021', 0, NULL, 9.0, 10, 51),
(424, 'Aprobada', 'Primavera 2021', 0, NULL, 9.0, 10, 52),
(425, 'Aprobada', 'Primavera 2021', 0, NULL, 9.0, 10, 53),
(426, 'Aprobada', 'Primavera 2021', 0, NULL, 9.0, 10, 54),
(427, 'Aprobada', 'Primavera 2021', 0, NULL, 9.0, 10, 55),
(428, 'Aprobada', 'Primavera 2021', 0, NULL, 9.0, 10, 56),
(429, 'Aprobada', 'Otoño 2021', 0, NULL, 9.0, 10, 58),
(430, 'Aprobada', 'Otoño 2021', 0, NULL, 9.0, 10, 59),
(431, 'Aprobada', 'Otoño 2021', 0, NULL, 9.0, 10, 60),
(432, 'Aprobada', 'Otoño 2021', 0, NULL, 9.0, 10, 61),
(433, 'Aprobada', 'Otoño 2021', 0, NULL, 9.0, 10, 62),
(434, 'Aprobada', 'Otoño 2021', 0, NULL, 9.0, 10, 63),
(435, 'Aprobada', 'Otoño 2021', 0, NULL, 9.0, 10, 64),
(436, 'Aprobada', 'Otoño 2021', 0, NULL, 9.0, 10, 65),
(437, 'Aprobada', 'Otoño 2021', 0, NULL, 9.0, 10, 73),
(438, 'Aprobada', 'Primavera 2022', 0, NULL, 9.0, 10, 84),
(439, 'Aprobada', 'Primavera 2022', 0, NULL, 9.0, 10, 85),
(440, 'Aprobada', 'Primavera 2022', 0, NULL, 9.0, 10, 86),
(441, 'Aprobada', 'Primavera 2022', 0, NULL, 9.0, 10, 87),
(442, 'Aprobada', 'Primavera 2022', 0, NULL, 9.0, 10, 72),
(443, 'Cursando', 'Primavera 2023', 0, NULL, NULL, 5, 84),
(444, 'Cursando', 'Primavera 2023', 0, NULL, NULL, 5, 85),
(445, 'Cursando', 'Primavera 2023', 0, NULL, NULL, 5, 86),
(446, 'Cursando', 'Primavera 2023', 0, NULL, NULL, 5, 87),
(447, 'No cursada', NULL, 0, NULL, NULL, 5, 88),
(448, 'No cursada', NULL, 0, NULL, NULL, 5, 89),
(449, 'No cursada', NULL, 0, NULL, NULL, 5, 90),
(450, 'No cursada', NULL, 0, NULL, NULL, 5, 91),
(451, 'No cursada', NULL, 0, NULL, NULL, 9, 92),
(452, 'No cursada', NULL, 0, NULL, NULL, 9, 99),
(453, 'No cursada', NULL, 0, NULL, NULL, 9, 100),
(454, 'No cursada', NULL, 0, NULL, NULL, 9, 101),
(455, 'Aprobada', 'Otoño 2019', 0, NULL, 8.0, 3, 1),
(456, 'Aprobada', 'Otoño 2019', 0, NULL, 8.0, 3, 2),
(457, 'Aprobada', 'Otoño 2019', 0, NULL, 7.0, 3, 3),
(458, 'Aprobada', 'Otoño 2019', 0, NULL, 10.0, 3, 4),
(459, 'Aprobada', 'Otoño 2019', 0, NULL, 10.0, 3, 5),
(460, 'Aprobada', 'Otoño 2019', 0, NULL, 9.0, 3, 6),
(461, 'Aprobada', 'Otoño 2019', 0, NULL, 8.0, 3, 7),
(462, 'Aprobada', 'Otoño 2019', 0, NULL, 7.0, 3, 8),
(463, 'Aprobada', 'Otoño 2019', 0, NULL, 7.0, 3, 9),
(464, 'Aprobada', 'Otoño 2019', 0, NULL, 8.0, 3, 10),
(465, 'Aprobada', 'Primavera 2020', 0, NULL, 6.0, 3, 11),
(466, 'Aprobada', 'Primavera 2020', 0, NULL, 9.0, 3, 12),
(467, 'Aprobada', 'Primavera 2020', 0, NULL, 8.0, 3, 13),
(468, 'Aprobada', 'Primavera 2020', 0, NULL, 10.0, 3, 14),
(469, 'Aprobada', 'Primavera 2020', 0, NULL, 7.0, 3, 15),
(470, 'Aprobada', 'Primavera 2020', 1, NULL, 6.0, 3, 16),
(471, 'Aprobada', 'Primavera 2020', 0, NULL, 7.0, 3, 17),
(472, 'Aprobada', 'Primavera 2020', 0, NULL, 9.0, 3, 18),
(473, 'Aprobada', 'Primavera 2020', 0, NULL, 7.0, 3, 19),
(474, 'Aprobada', 'Otoño 2020', 0, NULL, 7.0, 3, 20),
(475, 'Aprobada', 'Otoño 2020', 0, NULL, 9.0, 3, 21),
(476, 'Aprobada', 'Otoño 2020', 0, NULL, 10.0, 3, 22),
(477, 'Aprobada', 'Otoño 2020', 0, NULL, 10.0, 3, 23),
(478, 'Aprobada', 'Otoño 2020', 0, NULL, 6.0, 3, 24),
(479, 'Aprobada', 'Otoño 2020', 0, NULL, 8.0, 3, 25),
(480, 'Aprobada', 'Otoño 2020', 0, NULL, 7.0, 3, 26),
(481, 'Aprobada', 'Otoño 2020', 0, NULL, 6.0, 3, 27),
(482, 'Aprobada', 'Otoño 2020', 0, NULL, 6.0, 3, 28),
(483, 'Aprobada', 'Otoño 2020', 0, NULL, 9.0, 3, 29),
(484, 'Aprobada', 'Otoño 2020', 0, NULL, 10.0, 3, 30),
(485, 'Aprobada', 'Primavera 2021', 0, NULL, 10.0, 3, 31),
(486, 'Aprobada', 'Primavera 2021', 0, NULL, 9.0, 3, 32),
(487, 'Aprobada', 'Primavera 2021', 0, NULL, 9.0, 3, 33),
(488, 'Aprobada', 'Primavera 2021', 0, NULL, 7.0, 3, 34),
(489, 'Aprobada', 'Primavera 2021', 0, NULL, 8.0, 3, 35),
(490, 'Aprobada', 'Primavera 2021', 0, NULL, 9.0, 3, 36),
(491, 'Aprobada', 'Primavera 2021', 0, NULL, 9.0, 3, 37),
(492, 'Aprobada', 'Primavera 2021', 0, NULL, 8.0, 3, 38),
(493, 'Aprobada', 'Primavera 2021', 0, NULL, 10.0, 3, 39),
(494, 'Aprobada', 'Otoño 2021', 0, NULL, 9.0, 3, 40),
(495, 'Aprobada', 'Otoño 2021', 0, NULL, 10.0, 3, 41),
(496, 'Aprobada', 'Otoño 2021', 0, NULL, 10.0, 3, 42),
(497, 'Aprobada', 'Otoño 2021', 0, NULL, 10.0, 3, 43),
(498, 'Aprobada', 'Otoño 2021', 0, NULL, 8.0, 3, 44),
(499, 'Aprobada', 'Otoño 2021', 0, NULL, 9.0, 3, 45),
(500, 'Aprobada', 'Otoño 2021', 0, NULL, 8.0, 3, 46),
(501, 'Aprobada', 'Otoño 2021', 0, NULL, 8.0, 3, 47),
(502, 'Aprobada', 'Otoño 2021', 0, NULL, 9.0, 3, 48),
(503, 'Aprobada', 'Primavera 2022', 0, NULL, 10.0, 3, 49),
(504, 'Aprobada', 'Primavera 2022', 0, NULL, 9.0, 3, 50),
(505, 'Aprobada', 'Primavera 2022', 0, NULL, 9.0, 3, 51),
(506, 'Aprobada', 'Primavera 2022', 0, NULL, 6.0, 3, 52),
(507, 'Aprobada', 'Primavera 2022', 0, NULL, 6.0, 3, 53),
(508, 'Aprobada', 'Primavera 2022', 0, NULL, 8.0, 3, 54),
(509, 'Aprobada', 'Primavera 2022', 0, NULL, 6.0, 3, 55),
(510, 'Aprobada', 'Primavera 2022', 0, NULL, 8.0, 3, 56),
(511, 'Aprobada', 'Primavera 2022', 0, NULL, 9.0, 3, 57),
(512, 'No cursada', NULL, 0, NULL, NULL, 3, 73),
(513, 'Cursando', 'Primavera 2023', 0, NULL, NULL, 3, 114),
(514, 'Cursando', 'Primavera 2023', 0, NULL, NULL, 3, 115),
(515, 'Cursando', 'Primavera 2023', 0, NULL, NULL, 3, 116),
(516, 'No cursada', NULL, 0, NULL, NULL, 3, 72),
(517, 'Cursando', 'Primavera 2023', 0, NULL, NULL, 3, 117),
(518, 'Aprobada', 'Primavera 2022', 1, NULL, 6.0, 3, 62),
(519, 'Aprobada', 'Primavera 2022', 0, NULL, 9.0, 3, 63),
(520, 'Aprobada', 'Primavera 2022', 0, NULL, 10.0, 3, 64),
(521, 'Aprobada', 'Primavera 2022', 0, NULL, 10.0, 3, 65),
(522, 'Aprobada', 'Primavera 2022', 0, NULL, 7.0, 3, 92),
(523, 'Aprobada', 'Primavera 2022', 0, NULL, 8.0, 3, 100),
(524, 'Aprobada', 'Primavera 2022', 0, NULL, 8.0, 3, 101),
(525, 'Aprobada', 'Primavera 2022', 0, NULL, 10.0, 3, 66),
(526, 'Aprobada', 'Primavera 2022', 1, NULL, 8.0, 3, 99),
(527, 'Aprobada', 'Otoño 2019', 0, NULL, NULL, 12, 1),
(528, 'Aprobada', 'Otoño 2019', 0, NULL, NULL, 12, 2),
(529, 'Aprobada', 'Primavera 2020', 0, NULL, NULL, 12, 3),
(530, 'Aprobada', 'Otoño 2019', 0, NULL, NULL, 12, 4),
(531, 'Aprobada', 'Otoño 2019', 0, NULL, NULL, 12, 5),
(532, 'Aprobada', 'Otoño 2019', 0, NULL, NULL, 12, 6),
(533, 'Aprobada', 'Otoño 2019', 0, NULL, NULL, 12, 7),
(534, 'No aprobada', 'Primavera 2022', 0, NULL, NULL, 12, 8),
(535, 'Aprobada', 'Otoño 2022', 0, NULL, NULL, 12, 9),
(536, 'Aprobada', 'Otoño 2019', 0, NULL, NULL, 12, 10),
(537, 'No aprobada', 'Primavera 2021', 0, NULL, NULL, 12, 11),
(538, 'Aprobada', 'Primavera 2020', 0, NULL, NULL, 12, 12),
(539, 'No aprobada', 'Primavera 2020', 0, NULL, NULL, 12, 13),
(540, 'Aprobada', 'Verano 2021', 0, NULL, NULL, 12, 14),
(541, 'No aprobada', 'Verano 2022', 0, NULL, NULL, 12, 15),
(542, 'No cursada', NULL, 0, NULL, NULL, 12, 16),
(543, 'No cursada', NULL, 0, NULL, NULL, 12, 17),
(544, 'No aprobada', 'Primavera 2020', 0, NULL, NULL, 12, 18),
(545, 'Aprobada', 'Primavera 2020', 0, NULL, NULL, 12, 19),
(546, 'Aprobada', 'Verano 2022', 0, NULL, NULL, 12, 20),
(547, 'Aprobada', 'Otoño 2020', 0, NULL, NULL, 12, 21),
(548, 'Aprobada', 'Otoño 2020', 0, NULL, NULL, 12, 22),
(549, 'Aprobada', 'Otoño 2021', 0, NULL, NULL, 12, 23),
(550, 'Aprobada', 'Otoño 2020', 0, NULL, NULL, 12, 24),
(551, 'Aprobada', 'Otoño 2020', 0, NULL, NULL, 12, 25),
(552, 'No aprobada', 'Otoño 2020', 0, NULL, NULL, 12, 26),
(553, 'No aprobada', 'Otoño 2021', 0, NULL, NULL, 12, 27),
(554, 'Aprobada', 'Otoño 2020', 0, NULL, NULL, 12, 28),
(555, 'No aprobada', 'Primavera 2021', 0, NULL, NULL, 12, 29),
(556, 'Aprobada', 'Otoño 2020', 0, NULL, NULL, 12, 30),
(557, 'Aprobada', 'Otoño 2022', 0, NULL, NULL, 12, 31),
(558, 'Aprobada', 'Otoño 2022', 0, NULL, NULL, 12, 32),
(559, 'Aprobada', 'Otoño 2022', 0, NULL, NULL, 12, 33),
(560, 'Aprobada', 'Otoño 2022', 0, NULL, NULL, 12, 34),
(561, 'No cursada', NULL, 0, NULL, NULL, 12, 35),
(562, 'Aprobada', 'Otoño 2021', 0, NULL, NULL, 12, 36),
(563, 'No cursada', NULL, 0, NULL, NULL, 12, 37),
(564, 'Aprobada', 'Otoño 2022', 0, NULL, NULL, 12, 38),
(565, 'Aprobada', 'Primavera 2021', 0, NULL, NULL, 12, 39),
(566, 'No cursada', NULL, 0, NULL, NULL, 12, 40),
(567, 'Aprobada', 'Otoño 2021', 0, NULL, NULL, 12, 41),
(568, 'Aprobada', 'Otoño 2021', 0, NULL, NULL, 12, 42),
(569, 'No aprobada', 'Otoño 2021', 0, NULL, NULL, 12, 43),
(570, 'No aprobada', 'Primavera 2022', 0, NULL, NULL, 12, 44),
(571, 'No aprobada', 'Primavera 2022', 0, NULL, NULL, 12, 45),
(572, 'No aprobada', 'Otoño 2021', 0, NULL, NULL, 12, 46),
(573, 'No cursada', NULL, 0, NULL, NULL, 12, 47),
(574, 'Aprobada', 'Primavera 2022', 0, NULL, NULL, 12, 49),
(575, 'Aprobada', 'Primavera 2022', 0, NULL, NULL, 12, 50),
(576, 'No aprobada', 'Pimavera 2022', 0, NULL, NULL, 12, 51),
(577, 'No cursada', NULL, 0, NULL, NULL, 12, 52),
(578, 'No cursada', NULL, 0, NULL, NULL, 12, 53),
(579, 'No cursada', NULL, 0, NULL, NULL, 12, 54),
(580, 'Aprobada', 'Primavera 2022', 0, NULL, NULL, 12, 55),
(581, 'No cursada', NULL, 0, NULL, NULL, 12, 56),
(582, 'No cursada', NULL, 0, NULL, NULL, 12, 73),
(583, 'Aprobada', 'Otoño 2022', 0, NULL, NULL, 12, 88),
(584, 'Aprobada', 'Otoño 2022', 0, NULL, NULL, 12, 89),
(585, 'Aprobada', 'Otoño 2022', 0, NULL, NULL, 12, 90),
(586, 'No aprobada', 'Otoño 2022', 0, NULL, NULL, 12, 91),
(587, 'No cursada', NULL, 0, NULL, NULL, 12, 72),
(588, 'No cursada', NULL, 0, NULL, NULL, 12, 62),
(589, 'No cursada', NULL, 0, NULL, NULL, 12, 63),
(590, 'No cursada', NULL, 0, NULL, NULL, 12, 64),
(591, 'No cursada', NULL, 0, NULL, NULL, 12, 65),
(592, 'No cursada', NULL, 0, NULL, NULL, 12, 92),
(593, 'No cursada', NULL, 0, NULL, NULL, 12, 100),
(594, 'No cursada', NULL, 0, NULL, NULL, 12, 101),
(595, 'No cursada', NULL, 0, NULL, NULL, 12, 99),
(599, 'Aprobada', 'Otoño 2019', 0, NULL, 6.0, 13, 1),
(600, 'Aprobada', 'Primavera 2020', 1, 1, 6.0, 13, 2),
(601, 'Aprobada', 'Primavera 2020', 1, 1, 6.0, 13, 3),
(602, 'Aprobada', 'Otoño 2019', 0, NULL, 9.0, 13, 4),
(603, 'Aprobada', 'Otoño 2019', 0, NULL, 9.0, 13, 5),
(604, 'Aprobada', 'Otoño 2019', 0, NULL, 9.0, 13, 6),
(605, 'Aprobada', 'Otoño 2019', 0, NULL, 7.0, 13, 7),
(606, 'Aprobada', 'Otoño 2019', 0, NULL, 6.0, 13, 8),
(607, 'Aprobada', 'Otoño 2019', 0, NULL, 8.0, 13, 9),
(608, 'Aprobada', 'Otoño 2019', 0, NULL, 8.0, 13, 10),
(609, 'Aprobada', 'Primavera 2022', 0, NULL, 7.0, 13, 11),
(610, 'Aprobada', 'Verano 2021', 0, NULL, 9.0, 13, 12),
(611, 'Aprobada', 'Primavera 2022', 0, NULL, 7.0, 13, 13),
(612, 'Aprobada', 'Primavera 2020', 0, NULL, 7.0, 13, 14),
(613, 'Aprobada', 'Otoño 2020', 1, 1, 6.0, 13, 15),
(614, 'Aprobada', 'Primavera 2020', 1, NULL, 6.0, 13, 16),
(615, 'Aprobada', 'Primavera 2020', 0, NULL, 6.0, 13, 17),
(616, 'Aprobada', 'Otoño 2020', 0, NULL, 7.0, 13, 20),
(617, 'Aprobada', 'Otoño 2020', 0, NULL, 10.0, 13, 21),
(618, 'Aprobada', 'Otoño 2020', 0, NULL, 9.0, 13, 22),
(619, 'Aprobada', 'Otoño 2020', 0, NULL, 8.0, 13, 23),
(620, 'Aprobada', 'Otoño 2021', 1, 2, 6.0, 13, 24),
(621, 'Aprobada', 'Primavera 2021', 1, 1, 7.0, 13, 25),
(622, 'Aprobada', 'Otoño 2020', 0, NULL, 7.0, 13, 26),
(623, 'Aprobada', 'Primavera 2021', 1, 1, 6.0, 13, 27),
(624, 'Aprobada', 'Otoño 2020', 0, NULL, 7.0, 13, 28),
(625, 'Aprobada', 'Otoño 2020', 0, NULL, 9.0, 13, 29),
(626, 'Aprobada', 'Otoño 2020', 0, NULL, 6.0, 13, 30),
(627, 'Aprobada', 'Primavera 2021', 0, NULL, 7.0, 13, 31),
(628, 'Aprobada', 'Primavera 2021', 0, NULL, 6.0, 13, 32),
(629, 'Aprobada', 'Primavera 2021', 0, NULL, 9.0, 13, 33),
(630, 'Aprobada', 'Primavera 2021', 0, NULL, 7.0, 13, 34),
(631, 'Aprobada', 'Primavera 2021', 0, NULL, 8.0, 13, 35),
(632, 'Aprobada', 'Primavera 2021', 0, NULL, 8.0, 13, 36),
(633, 'Aprobada', 'Primavera 2021', 0, NULL, 8.0, 13, 37),
(634, 'Aprobada', 'Primavera 2021', 0, NULL, 7.0, 13, 38),
(635, 'Aprobada', 'Primavera 2021', 0, NULL, 10.0, 13, 39),
(636, 'Aprobada', 'Otoño 2021', 0, NULL, 6.0, 13, 40),
(637, 'Aprobada', 'Otoño 2021', 0, NULL, 10.0, 13, 41),
(639, 'Aprobada', 'Otoño 2021', 0, NULL, 10.0, 13, 42),
(640, 'Aprobada', 'Otoño 2021', 0, NULL, 8.0, 13, 43),
(641, 'Aprobada', 'Otoño 2021', 0, NULL, 8.0, 13, 44),
(642, 'Aprobada', 'Otoño 2021', 0, NULL, 7.0, 13, 45),
(643, 'Aprobada', 'Otoño 2021', 0, NULL, 8.0, 13, 46),
(644, 'Cursando', 'Primavera 2023', 0, NULL, NULL, 13, 47),
(645, 'Aprobada', 'Otoño 2021', 0, NULL, 8.0, 13, 48),
(646, 'Aprobada', 'Primavera 2022', 0, NULL, 10.0, 13, 49),
(647, 'Aprobada', 'Primavera 2022', 0, NULL, 10.0, 13, 50),
(648, 'Aprobada', 'Primavera 2022', 0, NULL, 7.0, 13, 51),
(649, 'Aprobada', 'Primavera 2022', 0, NULL, 7.0, 13, 52),
(650, 'Aprobada', 'Primavera 2022', 0, NULL, 9.0, 13, 53),
(651, 'Aprobada', 'Primavera 2022', 0, NULL, 8.0, 13, 54),
(652, 'Aprobada', 'Primavera 2022', 0, NULL, 7.0, 13, 55),
(653, 'Aprobada', 'Primavera 2022', 0, NULL, 9.0, 13, 56),
(654, 'Aprobada', 'Primavera 2022', 0, NULL, 9.0, 13, 57),
(655, 'Cursando', 'Primavera 2023', 1, 1, NULL, 13, 62),
(656, 'Aprobada', 'Otoño 2022', 0, NULL, 7.0, 13, 63),
(657, 'Cursando', 'Primavera 2023', 1, 1, NULL, 13, 64),
(658, 'Cursando', 'Primavera 2023', 1, 1, NULL, 13, 65),
(659, 'Aprobada', 'Otoño 2022', 0, NULL, 8.0, 13, 92),
(660, 'Cursando', 'Primavrea 2023', 1, 1, NULL, 13, 99),
(661, 'Cursando', 'Primavera 2023', 1, 1, NULL, 13, 100),
(662, 'Aprobada', 'Otoño 2022', 0, NULL, 8.0, 13, 101),
(663, 'Aprobada', 'Otoño 2022', 0, NULL, 9.0, 13, 66),
(664, 'Cursando', 'Primavera 2023', 0, NULL, NULL, 13, 71),
(665, 'No cursada', NULL, 0, NULL, NULL, 13, 73),
(666, 'No cursada', NULL, 0, NULL, NULL, 13, 72),
(667, 'Aprobada', 'Primavera 2020', 0, NULL, 6.0, 13, 18),
(668, 'Aprobada', 'Primavrea 2020', 0, NULL, 7.0, 13, 19),
(669, 'No cursada', NULL, 0, NULL, NULL, 13, 114),
(670, 'No cursada', NULL, 0, NULL, NULL, 13, 115),
(671, 'No cursada', NULL, 0, NULL, NULL, 13, 116),
(672, 'No cursada', NULL, 0, NULL, NULL, 13, 117),
(673, 'Cursando', 'Primavera 2023', 0, NULL, NULL, 8, 114),
(674, 'Cursando', 'Primavera 2023', 0, NULL, NULL, 8, 115),
(675, 'Cursando', 'Primavera 2023', 0, NULL, NULL, 8, 116),
(676, 'Cursando', 'Primavera 2023', 0, NULL, NULL, 8, 117);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `siglas` varchar(255) NOT NULL,
  `creditosmin` int(11) DEFAULT NULL,
  `creditosmax` int(11) DEFAULT NULL,
  `horasmin` int(11) DEFAULT NULL,
  `horasmax` int(11) DEFAULT NULL,
  `idsede` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`id`, `nombre`, `siglas`, `creditosmin`, `creditosmax`, `horasmin`, `horasmax`, `idsede`) VALUES
(1, 'Ingeniería en Sistemas y Tecnologías de la Información Industrial', 'ISTII', 250, 282, 4950, 5526, 1),
(2, 'Ingenieria en Procesos y Gestion Industrial', 'IPGI', 250, 282, 4950, 5526, 1),
(3, 'Ingeniería en Automatización y Autotrónica', 'IAA', 260, 310, 5000, 5600, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `id` int(11) NOT NULL,
  `generacion` int(11) NOT NULL COMMENT 'Año de ingreso de la generación',
  `seccion` int(11) NOT NULL,
  `idcarrera` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`id`, `generacion`, `seccion`, `idcarrera`) VALUES
(1, 2019, 1, 1),
(2, 2019, 2, 1),
(5, 2018, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `id` int(11) NOT NULL,
  `clave` varchar(10) DEFAULT NULL,
  `nombre` varchar(150) DEFAULT NULL,
  `creditos` int(11) DEFAULT NULL,
  `ht` int(11) DEFAULT NULL COMMENT 'Horas teoria por semana',
  `hp` int(11) DEFAULT NULL COMMENT 'Horas practica por semana',
  `totalh` int(11) DEFAULT NULL COMMENT 'Horas totales por semestre',
  `requisito` int(11) DEFAULT NULL,
  `requisito2` int(11) DEFAULT NULL,
  `requisito3` int(11) DEFAULT NULL,
  `correquisito` int(11) DEFAULT NULL,
  `idmodulo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `materia`
--

INSERT INTO `materia` (`id`, `clave`, `nombre`, `creditos`, `ht`, `hp`, `totalh`, `requisito`, `requisito2`, `requisito3`, `correquisito`, `idmodulo`) VALUES
(1, 'TCIS 001', 'Introducción a las Ciencias de la Ingeniería', 2, 1, 1, 36, NULL, NULL, NULL, NULL, 1),
(2, 'TCIS 002', 'Modelado de Fenómenos Físicos', 4, 2, 2, 72, NULL, NULL, NULL, 1, 1),
(3, 'TCIS 003', 'Fenómenos Físicos I', 4, 2, 2, 72, NULL, NULL, NULL, 1, 1),
(4, 'TCIS 004', 'Matemáticas I', 4, 2, 2, 72, NULL, NULL, NULL, 1, 1),
(5, 'TCIS 005', 'Razonamiento Algorítmico', 2, 1, 1, 36, NULL, NULL, NULL, 1, 1),
(6, 'ISTS 001', 'Ingeniería de Software Industrial I', 4, 2, 2, 72, NULL, NULL, NULL, NULL, 2),
(7, 'ISTS 002', 'Lenguajes de Programación I', 4, 2, 2, 72, NULL, NULL, NULL, 6, 2),
(8, 'ISTS 003', 'Ingeniería y Tecnologías WEB I', 3, 1, 2, 54, NULL, NULL, NULL, 6, 2),
(9, 'ISTS 004', 'Bases de Datos I', 3, 1, 2, 54, NULL, NULL, NULL, 6, 2),
(10, 'FGUS 004', 'Lengua Extranjera I', 4, 2, 2, 72, NULL, NULL, NULL, NULL, 3),
(11, 'TCIS 006', 'Diseño y Realización de Experimentos', 4, 2, 2, 72, 2, NULL, NULL, NULL, 4),
(12, 'TCIS 007', 'Estadística I', 4, 2, 2, 72, 4, NULL, NULL, 11, 4),
(13, 'TCIS 009', 'Matemática Vectorial y Matricial', 2, 1, 1, 36, NULL, NULL, NULL, 11, 4),
(14, 'ISTS 005', 'Ingeniería de Software Industrial II', 4, 2, 2, 72, 6, NULL, NULL, NULL, 5),
(15, 'ISTS 006', 'Lenguajes de Programación II', 4, 2, 2, 72, 7, NULL, NULL, 14, 5),
(16, 'ISTS 007', 'Aplicaciones Móviles I', 3, 1, 2, 54, 8, NULL, NULL, 14, 5),
(17, 'ISTS 008', 'Bases de Datos II', 3, 1, 2, 54, 9, NULL, NULL, 14, 5),
(18, 'FGUS 001', 'Formación Humana y Social', 4, 2, 2, 72, NULL, NULL, NULL, NULL, 6),
(19, 'FGUS 005', 'Lengua Extranjera II', 4, 2, 2, 72, 10, NULL, NULL, NULL, 7),
(20, 'TCIS 010', 'Solución de los Problemas de Ingeniería', 4, 2, 2, 72, NULL, NULL, NULL, NULL, 8),
(21, 'TCIS 011', 'Teoría de Resolución de Problemas de Inventiva (TRIZ)', 4, 2, 2, 72, 2, NULL, NULL, 20, 8),
(22, 'TCIS 012', 'Análisis y Resolución Creativa de Problemas', 2, 2, 2, 72, NULL, NULL, NULL, 20, 8),
(23, 'TCIS 013', 'Vigilancia y Prospectiva Tecnológica', 2, 2, 2, 72, NULL, NULL, NULL, 20, 8),
(24, 'ISTS 010', 'Integración de los Sistemas de Información en las Organizaciones', 4, 2, 2, 72, NULL, NULL, NULL, NULL, 9),
(25, 'ISTS 011', 'Sistemas de Información Empresarial', 2, 1, 1, 36, NULL, NULL, NULL, 24, 9),
(26, 'ISTS 012', 'Inteligencia de Negocios', 4, 2, 2, 72, NULL, NULL, NULL, 24, 9),
(27, 'ISTS 013', 'Minería de Datos', 4, 2, 2, 72, NULL, NULL, NULL, 24, 9),
(28, 'ISTS 014', 'Introducción a Big Data', 4, 2, 2, 72, NULL, NULL, NULL, 24, 9),
(29, 'ISTS 009', 'Física', 3, 1, 2, 54, 3, NULL, NULL, NULL, 10),
(30, 'FGUS 006', 'Lengua Extranjera III', 4, 2, 2, 72, 19, NULL, NULL, NULL, 11),
(31, 'TCIS 014', 'Diseño y Evaluación de Procesos y Sistemas de Ingeniería', 4, 2, 2, 72, 20, NULL, NULL, NULL, 12),
(32, 'TCIS 015', 'Teoría General de Sistemas', 4, 2, 2, 72, NULL, NULL, NULL, 31, 12),
(33, 'TCIS 016', 'Análisis y Diseño de Procesos  (Modelado de Procesos de Negocio)', 4, 2, 2, 72, NULL, NULL, NULL, 31, 12),
(34, 'ISTS 015', 'Diseño y Gestión de una Arquitectura Empresarial de Información en una Organización', 4, 2, 2, 72, 14, NULL, NULL, NULL, 13),
(35, 'ISTS 016', 'Arquitectura Empresarial', 4, 2, 2, 72, NULL, NULL, NULL, 34, 13),
(36, 'ISTS 017', 'Arquitecturas de Cómputo en la Nube', 4, 2, 2, 72, NULL, NULL, NULL, 34, 13),
(37, 'ISTS 018', 'Estructuras de Gestión y Control de los Servicios de TI', 4, 2, 2, 72, NULL, NULL, NULL, 34, 13),
(38, 'FGUS 002', 'Desarrollo de Habilidades del Pensamiento Complejo', 4, 2, 2, 72, NULL, NULL, NULL, NULL, 14),
(39, 'FGUS 007', 'Lengua Extranjera IV', 4, 2, 2, 72, 30, NULL, NULL, NULL, 15),
(40, 'TCIS 250', 'Gestión de Proyectos', 4, 2, 2, 72, 31, NULL, NULL, NULL, 16),
(41, 'TCIS 251', 'Gestión de la Calidad', 4, 2, 2, 72, NULL, NULL, NULL, 40, 16),
(42, 'TCIS 252', 'Ingeniería Económica', 4, 2, 2, 72, NULL, NULL, NULL, 40, 16),
(43, 'ISTS 250', 'Infraestructura de Tecnologías de la Información', 4, 2, 2, 72, 14, NULL, NULL, NULL, 17),
(44, 'ISTS 251', 'Sistemas Operativos', 4, 2, 2, 72, 14, NULL, NULL, 43, 17),
(45, 'ISTS 252', 'Redes de Computadoras', 4, 2, 2, 72, 3, 4, NULL, 43, 17),
(46, 'ISTS 253', 'Aseguramiento de la Seguridad de la Información', 4, 2, 2, 72, NULL, NULL, NULL, 43, 17),
(47, 'ISTS 254', 'Diseño de una Estrategia para la Implementación, Actualización o Mejora de los Sistemas de Información de una Empresa', 4, 2, 2, 72, 14, 24, 34, NULL, 18),
(48, 'OCIS 800', 'Lengua Extranjera Complementaria I: Aleman', 4, 2, 2, 72, 39, NULL, NULL, NULL, 19),
(49, 'TCIS 253', 'Innovación y Emprendimiento', 4, 2, 2, 72, NULL, NULL, NULL, NULL, 20),
(50, 'TCIS 254', 'Innovación Centrada en el Cliente', 4, 2, 2, 72, NULL, NULL, NULL, 49, 20),
(51, 'ISTS 255', 'Diseño Centrado en la Experiencia del Usuario', 4, 2, 2, 72, 14, NULL, NULL, NULL, 21),
(52, 'ISTS 256', 'Programación de Sistemas Interactivos', 4, 2, 2, 72, 34, NULL, NULL, 51, 21),
(53, 'ISTS 257', 'Realidad Virtual', 4, 2, 2, 72, 15, NULL, NULL, 51, 21),
(54, 'ISTS 258', 'Realidad Aumentada y Mixta', 4, 2, 2, 72, 15, NULL, NULL, 51, 21),
(55, 'ISTS 259', 'Procesamiento de Lenguaje Natural', 4, 2, 2, 72, 14, NULL, NULL, 51, 21),
(56, 'ISTS 260', 'Modelado y Simulación de Sistemas', 4, 2, 2, 72, 4, 32, NULL, NULL, 22),
(57, 'OCIS 801', 'Lengua Extranjera Complementaria II: Alemán ', 4, 2, 2, 72, 48, NULL, NULL, NULL, 23),
(58, 'ISTS 600', 'Seminario de Investigación: Aplicación de Internet de las Cosas en el Ámbito Industrial', 4, 2, 2, 72, 14, 29, NULL, NULL, 24),
(59, 'ISTS 601', 'Protocolos de Comunicación Industrial y Automotriz', 4, 2, 2, 72, NULL, NULL, NULL, 58, 24),
(60, 'ISTS 602', 'Sistemas de Supervisión, Control y Adquisición de Datos', 4, 2, 2, 72, NULL, NULL, NULL, 58, 24),
(61, 'ISTS 603', 'Sistemas Empotrados', 4, 2, 2, 72, NULL, NULL, NULL, 58, 24),
(62, 'ISTS 604', 'Seminario de Investigación: Políticas de Seguridad y Gobernanza', 4, 2, 2, 72, 45, NULL, NULL, NULL, 25),
(63, 'ISTS 605', 'Análisis Forense Digital', 4, 2, 2, 72, NULL, NULL, NULL, 62, 25),
(64, 'ISTS 606', 'Criptografía', 4, 2, 2, 72, NULL, NULL, NULL, 62, 25),
(65, 'ISTS 607', 'Ingeniería de Software Segura e Ing. Social', 4, 2, 2, 72, NULL, NULL, NULL, 62, 25),
(66, 'OCIS 802', 'Lengua Extranjera Complementaria III: Alemán', 4, 2, 2, 72, 57, NULL, NULL, NULL, 26),
(71, 'OCIS 803', 'Asignatura Optativa IV', 4, 2, 2, 72, 66, NULL, NULL, NULL, 29),
(72, 'SSST', 'Servicio Social', 10, NULL, NULL, 480, NULL, NULL, NULL, NULL, 30),
(73, 'PPST', 'Prácticas Profesionales', 5, NULL, NULL, 240, NULL, NULL, NULL, NULL, 27),
(84, 'ISTS 608', 'Seminario de Investigación: Uso de Tecnologías Emergentes en los Sistemas de Información', 4, 2, 2, 72, 14, 34, 43, NULL, 38),
(85, 'ISTS 609', 'Fundamentos Tecnológicos I', 4, 2, 2, 72, NULL, NULL, NULL, 84, 38),
(86, 'ISTS 610', 'Fundamentos Tecnológicos II', 4, 2, 2, 72, NULL, NULL, NULL, 84, 38),
(87, 'ISTS 611', 'Fundamentos Tecnológicos III', 4, 2, 2, 72, NULL, NULL, NULL, 84, 38),
(88, 'ISTS 612', 'Seminario de Investigación: Transformación de los Datos en Conocimiento', 3, 1, 2, 72, 28, NULL, NULL, NULL, 39),
(89, 'ISTS 613', 'Plataformas para Big Data (Manejo de Datos a Gran Escala)', 3, 1, 2, 72, 28, NULL, NULL, 88, 39),
(90, 'ISTS 614', 'Análisis de Big Data', 4, 2, 2, 72, 28, NULL, NULL, 88, 39),
(91, 'ISTS 615', 'Aprendizaje Automático con Big Data', 4, 2, 2, 72, 28, NULL, NULL, 88, 39),
(92, 'ISTS 616', 'Seminario de Investigación: Vehículos Autónomos', 3, 1, 2, 72, 14, NULL, NULL, NULL, 40),
(99, 'ISTS 617', 'Aprendizaje Automático', 4, 2, 2, 72, NULL, NULL, NULL, 92, 40),
(100, 'ISTS 618', 'Percepción y Visión Computacional', 3, 2, 2, NULL, NULL, NULL, NULL, 92, 40),
(101, 'ISTS 619', 'Razonamiento Bajo Incertidumbre', 4, 2, 2, 72, NULL, NULL, NULL, 92, 40),
(102, 'ISTS 620', 'Seminario de Investigación: Integración de Soluciones Tecnológicas para la Industria Automotriz', 4, 2, 2, 72, 14, 34, 43, NULL, 41),
(103, 'ISTS 621', 'Soluciones Tecnológicas para la Industria Automotriz I', 4, 2, 2, 72, NULL, NULL, NULL, 102, 41),
(104, 'ISTS 622', 'Soluciones Tecnológicas para la Industria Automotriz II', 4, 2, 2, 72, NULL, NULL, NULL, 102, 41),
(105, 'ISTS 623', 'Soluciones Tecnológicas para la Industria Automotriz III', 4, 2, 2, 72, NULL, NULL, NULL, 102, 41),
(106, 'ISTS 600', 'Seminario de Investigación: Aplicación de Internet de las Cosas en el Ámbito Industrial', 4, 2, 2, 72, 14, 29, NULL, NULL, 42),
(107, 'ISTS 601', 'Protocolos de Comunicación Industrial y Automotriz', 4, 2, 2, 72, NULL, NULL, NULL, 58, 42),
(108, 'ISTS 602', 'Sistemas de Supervisión, Control y Adquisición de Datos', 4, 2, 2, 72, NULL, NULL, NULL, 58, 42),
(109, 'ISTS 603', 'Sistemas Empotrados', 4, 2, 2, 72, NULL, NULL, NULL, 58, 42),
(110, 'ISTS 604', 'Seminario de Investigación: Políticas de Seguridad y Gobernanza', 4, 2, 2, 72, 45, NULL, NULL, NULL, 43),
(111, 'ISTS 605', 'Análisis Forense Digital', 4, 2, 2, 72, NULL, NULL, NULL, 62, 43),
(112, 'ISTS 606', 'Criptografía', 4, 2, 2, 72, NULL, NULL, NULL, 62, 43),
(113, 'ISTS 607', 'Ingeniería de Software Segura e Ing. Social', 4, 2, 2, 72, NULL, NULL, NULL, 62, 43),
(114, 'ISTS 608', 'Seminario de Investigación: Uso de Tecnologías Emergentes en los Sistemas de Información', 4, 2, 2, 72, 14, 34, 43, NULL, 44),
(115, 'ISTS 609', 'Fundamentos Tecnológicos I', 4, 2, 2, 72, NULL, NULL, NULL, 84, 44),
(116, 'ISTS 610', 'Fundamentos Tecnológicos II', 4, 2, 2, 72, NULL, NULL, NULL, 84, 44),
(117, 'ISTS 611', 'Fundamentos Tecnológicos III', 4, 2, 2, 72, NULL, NULL, NULL, 84, 44),
(118, 'ISTS 612', 'Seminario de Investigación: Transformación de los Datos en Conocimiento', 3, 1, 2, 72, 28, NULL, NULL, NULL, 45),
(119, 'ISTS 613', 'Plataformas para Big Data (Manejo de Datos a Gran Escala)', 3, 1, 2, 72, 28, NULL, NULL, 88, 45),
(120, 'ISTS 614', 'Análisis de Big Data', 4, 2, 2, 72, 28, NULL, NULL, 88, 45),
(121, 'ISTS 615', 'Aprendizaje Automático con Big Data', 4, 2, 2, 72, 28, NULL, NULL, 88, 45),
(122, 'ISTS 616', 'Seminario de Investigación: Vehículos Autónomos', 3, 1, 2, 72, 14, NULL, NULL, NULL, 46),
(123, 'ISTS 617', 'Aprendizaje Automático', 4, 2, 2, 72, NULL, NULL, NULL, 92, 46),
(124, 'ISTS 618', 'Percepción y Visión Computacional', 3, 2, 2, NULL, NULL, NULL, NULL, 92, 46),
(125, 'ISTS 619', 'Razonamiento Bajo Incertidumbre', 4, 2, 2, 72, NULL, NULL, NULL, 92, 46),
(126, 'ISTS 620', 'Seminario de Investigación: Integración de Soluciones Tecnológicas para la Industria Automotriz', 4, 2, 2, 72, 14, 34, 43, NULL, 47),
(127, 'ISTS 621', 'Soluciones Tecnológicas para la Industria Automotriz I', 4, 2, 2, 72, NULL, NULL, NULL, 102, 47),
(128, 'ISTS 622', 'Soluciones Tecnológicas para la Industria Automotriz II', 4, 2, 2, 72, NULL, NULL, NULL, 102, 47),
(129, 'ISTS 623', 'Soluciones Tecnológicas para la Industria Automotriz III', 4, 2, 2, 72, NULL, NULL, NULL, 102, 47);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

CREATE TABLE `modulo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `optativo` tinyint(1) NOT NULL DEFAULT 0,
  `idsemestre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `modulo`
--

INSERT INTO `modulo` (`id`, `nombre`, `tipo`, `optativo`, `idsemestre`) VALUES
(1, 'Modelado de Fenómenos Físicos Existentes en un problema de ingeniería', 'TCIS', 0, 1),
(2, 'Diseño y Desarrollo de Software Industrial I', 'ISTS', 0, 1),
(3, 'Lengua Extranjera', 'FGUS', 0, 1),
(4, 'Diseño de Experimentos', 'TCIS', 0, 2),
(5, 'Diseño y Desarrollo de Software Industrial II', 'ISTS', 0, 2),
(6, 'Formación Humana y Social', 'FGUS', 0, 2),
(7, 'Lengua Extranjera', 'FGUS', 0, 2),
(8, 'Solución de Problemas de Ingeniería Asociados a la Producción', 'TCIS', 0, 3),
(9, 'Sistemas de Información en las Organizaciones', 'ISTS', 0, 3),
(10, 'Área Básica', 'ISTS', 0, 3),
(11, 'Lengua Extranjera', 'FGUS', 0, 3),
(12, 'Diseño y Evaluación de Procesos y Sistemas de Ingeniería', 'TCIS', 0, 4),
(13, 'Diseño, Selección, Implementación y Gestión de Soluciones Empresariales de TI', 'ISTS', 0, 4),
(14, 'Desarrollo de Habilidades del Pensamiento Complejo', 'FGUS', 0, 4),
(15, 'Lengua Extranjera', 'FGUS', 0, 4),
(16, 'Gestión de Proyectos de Ingeniería', 'TCIS', 0, 5),
(17, 'Arquitecturas de Computo, Sistemas y Redes de Comunicación', 'ISTS', 0, 5),
(18, 'Gestión Estratégica de los Sistemas de Información', 'ISTS', 0, 5),
(19, 'Asignaturas Optativas Complementarias', 'OCIS', 0, 5),
(20, 'Innovación y Emprendimiento', 'TCIS', 0, 6),
(21, 'Interacción Humano Computadora', 'ISTS', 0, 6),
(22, 'Simulación', 'ISTS', 0, 6),
(23, 'Asignaturas Optativas Complementarias', 'OCIS', 0, 6),
(24, 'Optativo Interconectividad Industrial', 'ISTS', 1, 7),
(25, 'Optativo Aseguramiento de la Información y Seguridad', 'ISTS', 1, 7),
(26, 'Asignaturas Optativas Complementarias', 'OCIS', 0, 7),
(27, 'Practicas Profesionales', 'PPST', 0, 7),
(29, 'Asignaturas Optativas Complementarias', 'OCIS', 0, 8),
(30, 'Servicio Social', 'SSST', 0, 8),
(38, 'Optativo Tecnologías Emergentes en Sistemas de Información', 'ISTS', 1, 7),
(39, 'Optativo Introducción a la Ciencia de Datos (Big Data)', 'ISTS', 1, 7),
(40, 'Optativo Desarrollo de Sistemas Inteligentes', 'ISTS', 1, 7),
(41, 'Optativo Convergencia Tecnológica en la Industria Automotriz', 'ISTS', 1, 7),
(42, 'Optativo Interconectividad Industrial', 'ISTS', 1, 8),
(43, 'Optativo Aseguramiento de la Información y Seguridad', 'ISTS', 1, 8),
(44, 'Optativo Tecnologías Emergentes en Sistemas de Información', 'ISTS', 1, 8),
(45, 'Optativo Introducción a la Ciencia de Datos (Big Data)', 'ISTS', 1, 8),
(46, 'Optativo Desarrollo de Sistemas Inteligentes', 'ISTS', 1, 8),
(47, 'Optativo Convergencia Tecnológica en la Industria Automotriz', 'ISTS', 1, 8),
(48, 'Modulo de Prueba', 'TCIS', 0, 19);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sede`
--

CREATE TABLE `sede` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `municipio` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `sede`
--

INSERT INTO `sede` (`id`, `nombre`, `direccion`, `municipio`) VALUES
(1, 'San José Chiapa', 'Calle 2 sur s/n Ciudad Modelo', 'San José Chiapa'),
(14, 'Prueba', 'Prueba', 'Prueba');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `semestre`
--

CREATE TABLE `semestre` (
  `id` int(11) NOT NULL,
  `semestre` varchar(255) NOT NULL,
  `numero` int(11) NOT NULL,
  `nivel` varchar(45) NOT NULL COMMENT 'Los niveles son  básico y formativo',
  `idcarrera` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `semestre`
--

INSERT INTO `semestre` (`id`, `semestre`, `numero`, `nivel`, `idcarrera`) VALUES
(1, 'Primero', 1, 'Básico', 1),
(2, 'Segundo', 2, 'Básico', 1),
(3, 'Tercero', 3, 'Básico', 1),
(4, 'Cuarto', 4, 'Básico', 1),
(5, 'Quinto', 5, 'Formativo', 1),
(6, 'Sexto', 6, 'Formativo', 1),
(7, 'Séptimo', 7, 'Formativo', 1),
(8, 'Octavo', 8, 'Formativo', 1),
(19, 'Primero', 1, 'Básico', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tutor`
--

CREATE TABLE `tutor` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apaterno` varchar(100) NOT NULL,
  `amaterno` varchar(100) DEFAULT NULL,
  `iddocente` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `tutor`
--

INSERT INTO `tutor` (`id`, `nombre`, `apaterno`, `amaterno`, `iddocente`) VALUES
(1, 'Diana Ivonne', 'Tapia', 'López', '123456789'),
(2, 'Irianely Ivonne', 'Pérez', 'Juárez', '777');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `registered` datetime NOT NULL,
  `last_login` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `username`, `password`, `registered`, `last_login`) VALUES
(2, 'administrador', '$2a$10$N5MwVJojoeVzYGjuMqMjmun66c7I/GkPRCLR.QLoF7n.XEmtseh1G', '2023-04-06 13:18:10', '2023-05-09 10:36:40'),
(8, '201928846', '$2a$10$nw1YiiDngioMhb5iPFcRP.hDpgc19VPzwgZchv/M.EAup6vNhVldu', '2023-04-04 22:52:54', '2023-04-24 14:48:18'),
(9, 'NSS526946', '$2a$10$nS4/jLDp4mboRI3Nk4hHIuLCxMC4XQ5VGFhcc8eU/1Vza9Yueun7i', '2023-04-21 12:18:54', '2023-04-21 12:19:26'),
(563784, '201966770', '$2a$10$cGFrlXYcTAbxzVbj4uG9HetB.P0RJCYyilFvbBZ9fBFrCs/U7Bv2W', '2023-04-05 16:13:56', '2023-04-24 14:07:21'),
(563785, '201966109', '$2a$10$l1yDWkFwvxDLn2uFE/LCz.8.dqvLH.RSeWvQiCakL3/ZsL8o/WxEK', '2023-04-05 16:41:29', '2023-04-21 09:44:08'),
(563786, '201952865', '$2a$10$Dema8wS83wJCMEkYWgifBelCFDX1n3XZcy/NNG413VKdSSmr0z6nS', '2023-04-05 18:20:09', '2023-04-05 20:06:29'),
(563787, '123456789', '$2a$10$i1Be1qNGs8MeQTiMM.KqnODrITiHZy1Fyu6/orwtTCB.h3CpzR8w2', '2023-04-06 13:08:17', '2023-04-21 12:25:12'),
(563788, '201911111', '$2a$10$QjHOxMdHlvnx7fUlWI4VOudbHklBrD46w5tNNAp557HcFY8uf9uQa', '2023-04-11 14:18:59', '2023-04-11 16:18:47');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idgrupo_idx` (`idgrupo`),
  ADD KEY `idtutor_idx` (`idtutor`);

--
-- Indices de la tabla `auth`
--
ALTER TABLE `auth`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `calificacion`
--
ALTER TABLE `calificacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idalumno_idx` (`idalumno`),
  ADD KEY `idmateria_idx` (`idmateria`);

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idsede_idx` (`idsede`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idcarrera1_idx` (`idcarrera`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idmodulo_idx` (`idmodulo`),
  ADD KEY `requisito_idx` (`requisito`),
  ADD KEY `correquisito_idx` (`correquisito`),
  ADD KEY `requisito2_idx` (`requisito2`) USING BTREE,
  ADD KEY `requisito3_idx` (`requisito3`) USING BTREE;

--
-- Indices de la tabla `modulo`
--
ALTER TABLE `modulo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idsemestre_idx` (`idsemestre`);

--
-- Indices de la tabla `sede`
--
ALTER TABLE `sede`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `semestre`
--
ALTER TABLE `semestre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idcarrera_idx` (`idcarrera`);

--
-- Indices de la tabla `tutor`
--
ALTER TABLE `tutor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumno`
--
ALTER TABLE `alumno`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `calificacion`
--
ALTER TABLE `calificacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=677;

--
-- AUTO_INCREMENT de la tabla `carrera`
--
ALTER TABLE `carrera`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `grupo`
--
ALTER TABLE `grupo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `materia`
--
ALTER TABLE `materia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT de la tabla `modulo`
--
ALTER TABLE `modulo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `sede`
--
ALTER TABLE `sede`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `semestre`
--
ALTER TABLE `semestre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `tutor`
--
ALTER TABLE `tutor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=563789;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD CONSTRAINT `idgrupo` FOREIGN KEY (`idgrupo`) REFERENCES `grupo` (`id`),
  ADD CONSTRAINT `idtutor` FOREIGN KEY (`idtutor`) REFERENCES `tutor` (`id`);

--
-- Filtros para la tabla `calificacion`
--
ALTER TABLE `calificacion`
  ADD CONSTRAINT `idalumno` FOREIGN KEY (`idalumno`) REFERENCES `alumno` (`id`),
  ADD CONSTRAINT `idmateria` FOREIGN KEY (`idmateria`) REFERENCES `materia` (`id`);

--
-- Filtros para la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD CONSTRAINT `idsede` FOREIGN KEY (`idsede`) REFERENCES `sede` (`id`);

--
-- Filtros para la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `idcarrera1` FOREIGN KEY (`idcarrera`) REFERENCES `carrera` (`id`);

--
-- Filtros para la tabla `materia`
--
ALTER TABLE `materia`
  ADD CONSTRAINT `correquisito` FOREIGN KEY (`correquisito`) REFERENCES `materia` (`id`),
  ADD CONSTRAINT `idmodulo` FOREIGN KEY (`idmodulo`) REFERENCES `modulo` (`id`),
  ADD CONSTRAINT `materia_ibfk_1` FOREIGN KEY (`requisito2`) REFERENCES `materia` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `materia_ibfk_2` FOREIGN KEY (`requisito3`) REFERENCES `materia` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `requisito` FOREIGN KEY (`requisito`) REFERENCES `materia` (`id`);

--
-- Filtros para la tabla `modulo`
--
ALTER TABLE `modulo`
  ADD CONSTRAINT `idsemestre` FOREIGN KEY (`idsemestre`) REFERENCES `semestre` (`id`);

--
-- Filtros para la tabla `semestre`
--
ALTER TABLE `semestre`
  ADD CONSTRAINT `idcarrera` FOREIGN KEY (`idcarrera`) REFERENCES `carrera` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
