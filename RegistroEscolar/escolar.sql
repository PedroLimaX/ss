-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-05-2023 a las 04:04:47
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
(218, 'Cursando', 'Primavera 2023', 0, NULL, NULL, 1, 117),
(294, 'Aprobada', 'Primavera 2022', 0, NULL, 9.0, 1, 62),
(295, 'Aprobada', 'Primavera 2022', 0, NULL, 9.0, 1, 63),
(296, 'Aprobada', 'Primavera 2022', 0, NULL, 10.0, 1, 64),
(297, 'Aprobada', 'Primavera 2022', 0, NULL, 10.0, 1, 65),
(298, 'Aprobada', 'Primavera 2022', 0, NULL, 9.0, 1, 92),
(300, 'Aprobada', 'Primavera 2022', 0, NULL, 10.0, 1, 100),
(301, 'Aprobada', 'Primavera 2022', 0, NULL, 10.0, 1, 101),
(302, 'Aprobada', 'Primavera 2022', 0, NULL, 9.0, 1, 66),
(303, 'Aprobada', 'Primavera 2022', 0, NULL, 9.0, 1, 99);

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
(1, 'Ingeniería en Sistemas y tecnologías de la Información Industrial', 'ISTII', 250, 282, 4950, 5526, 1),
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
(2, 'administrador', '$2a$10$N5MwVJojoeVzYGjuMqMjmun66c7I/GkPRCLR.QLoF7n.XEmtseh1G', '2023-04-06 13:18:10', '2023-05-04 17:37:45'),
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
