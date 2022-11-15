-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-11-2022 a las 22:43:27
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hospital`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alergias`
--

CREATE TABLE `alergias` (
  `id_alergia` int(11) NOT NULL,
  `alergia` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `condicion` int(1) NOT NULL,
  `dni_paciente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `antecedentes`
--

CREATE TABLE `antecedentes` (
  `id_antecedente` int(11) NOT NULL,
  `antec_personal` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `antec_observacion` text COLLATE utf8_unicode_ci NOT NULL,
  `dni_paciente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enfermero`
--

CREATE TABLE `enfermero` (
  `dni_enfermero` int(11) NOT NULL,
  `nombre` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `sexo` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `enfermero`
--

INSERT INTO `enfermero` (`dni_enfermero`, `nombre`, `apellido`, `sexo`, `telefono`) VALUES
(15752301, 'Olympia', 'Donaldson', 'Femenino', 7127848),
(17645132, 'Carissa', 'Haynes', 'Masculino', 1786791),
(19681332, 'Jennifer', 'Jacobson', 'Femenino', 1828075),
(25058397, 'Abbot', 'Rollins', 'Masculino', 2835147),
(30869558, 'Allen', 'Hampton', 'Femenino', 5446768),
(31299616, 'Stewart', 'Cook', 'Femenino', 2661898),
(41917631, 'Felix', 'Kinney', 'Masculino', 6042828),
(46502872, 'Wing', 'Kirby', 'Masculino', 5482060),
(50164879, 'Lois', 'Kirkland', 'Masculino', 2433016),
(54984044, 'Tanek', 'Wyatt', 'Femenino', 3284265),
(55530097, 'Macaulay', 'Skinner', 'Masculino', 9116851),
(57122918, 'Charlotte', 'Bradshaw', 'Masculino', 9714271),
(58117520, 'Rana', 'Gill', 'Femenino', 8612787),
(58377713, 'Marny', 'Galloway', 'Femenino', 4712104),
(58451379, 'Moana', 'Walters', 'Femenino', 4988112),
(68430449, 'Richard', 'Bray', 'Femenino', 3694302),
(70994638, 'Garth', 'Oliver', 'Femenino', 3866683),
(71176427, 'Aidan', 'Leach', 'Femenino', 7723088),
(75941397, 'Giselle', 'Ward', 'Masculino', 3858580),
(76154950, 'Akeem', 'Espinoza', 'Masculino', 2228964),
(87246215, 'Hunter', 'Mckay', 'Masculino', 1771145),
(92813644, 'Madeson', 'Hammond', 'Masculino', 3641054),
(93767789, 'Nash', 'Wilson', 'Masculino', 8667186),
(98331588, 'Catherine', 'Wade', 'Femenino', 3245147),
(98648257, 'Xyla', 'Rivera', 'Masculino', 2872479);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forma_llamada`
--

CREATE TABLE `forma_llamada` (
  `id_forma_llamada` int(11) NOT NULL,
  `forma_llamada` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `forma_llamada`
--

INSERT INTO `forma_llamada` (`id_forma_llamada`, `forma_llamada`, `descripcion`) VALUES
(1, 'Llamada del paciente', 'lorem'),
(2, 'Televisor', 'lorem');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `llamada`
--

CREATE TABLE `llamada` (
  `id_llamada` int(11) NOT NULL,
  `tipo` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `estado` int(1) NOT NULL,
  `fecha_hora_llamada` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_hora_atentido` datetime NOT NULL,
  `origen_llamada` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `dni_enfermero` int(11) NOT NULL,
  `dni_paciente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE `paciente` (
  `dni_paciente` int(11) NOT NULL,
  `nombre` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_nac` date NOT NULL,
  `sexo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` int(11) NOT NULL,
  `fecha_hora_ingreso` datetime DEFAULT current_timestamp(),
  `fecha_hora_egreso` datetime DEFAULT NULL,
  `tipo_sangre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`dni_paciente`, `nombre`, `apellido`, `fecha_nac`, `sexo`, `telefono`, `fecha_hora_ingreso`, `fecha_hora_egreso`, `tipo_sangre`) VALUES
(13145820, 'Alfreda', 'Meyer', '2011-06-08', 'Femenino', 2662065, '2022-11-14 23:17:29', NULL, 0),
(18316403, 'Berk', 'Dale', '1982-04-18', 'Femenino', 6857753, '2022-11-14 23:17:29', NULL, 0),
(19584110, 'Morgan', 'Berger', '1999-08-15', 'Femenino', 9129423, '2022-11-14 23:17:29', NULL, 0),
(20955552, 'Carter', 'Pittman', '2014-04-25', 'Femenino', 4156824, '2022-11-14 23:17:29', NULL, 0),
(23760158, 'Quinlan', 'Meadows', '2010-01-10', 'Masculino', 5847412, '2022-11-14 23:17:29', NULL, 0),
(27583042, 'Gisela', 'Conrad', '2003-07-25', 'Masculino', 4963241, '2022-11-14 23:17:29', NULL, 0),
(30432182, 'Aquila', 'Cox', '1982-02-06', 'Femenino', 5290770, '2022-11-14 23:17:29', NULL, 0),
(35755857, 'Jermaine', 'Campbell', '1990-12-19', 'Masculino', 5448056, '2022-11-14 23:17:29', NULL, 0),
(38513710, 'Bo', 'Hendricks', '1988-09-04', 'Masculino', 7778883, '2022-11-14 23:17:29', NULL, 0),
(42487863, 'Martin', 'Soto', '1970-05-26', 'Femenino', 9581838, '2022-11-14 23:17:29', NULL, 0),
(42915996, 'Bernard', 'Baxter', '2008-10-23', 'Masculino', 7761237, '2022-11-14 23:17:29', NULL, 0),
(61358450, 'Chava', 'Floyd', '1966-11-10', 'Masculino', 6564362, '2022-11-14 23:17:29', NULL, 0),
(63142621, 'Vivien', 'Mason', '1985-05-18', 'Masculino', 1632480, '2022-11-14 23:17:29', NULL, 0),
(63576550, 'Derek', 'Cantu', '2006-08-24', 'Masculino', 4726158, '2022-11-14 23:17:29', NULL, 0),
(72286421, 'Ivy', 'Stevens', '1977-12-02', 'Masculino', 5522644, '2022-11-14 23:17:29', NULL, 0),
(72379245, 'Katell', 'White', '2001-10-01', 'Masculino', 7589662, '2022-11-14 23:17:29', NULL, 0),
(74122155, 'Seth', 'Lang', '2005-10-22', 'Femenino', 6572431, '2022-11-14 23:17:29', NULL, 0),
(78848212, 'Jena', 'Bates', '1982-11-20', 'Masculino', 8653898, '2022-11-14 23:17:29', NULL, 0),
(83961204, 'Emily', 'Merrill', '2016-12-20', 'Femenino', 1038755, '2022-11-14 23:17:29', NULL, 0),
(87587573, 'Martha', 'Bush', '1970-03-30', 'Femenino', 1185232, '2022-11-14 23:17:29', NULL, 0),
(91104636, 'Micah', 'Jacobs', '2006-03-23', 'Masculino', 3823154, '2022-11-14 23:17:29', NULL, 0),
(92099779, 'Shelby', 'Barry', '2006-11-26', 'Femenino', 2686730, '2022-11-14 23:17:29', NULL, 0),
(93681689, 'Tucker', 'Mccoy', '1986-01-12', 'Masculino', 7958005, '2022-11-14 23:17:29', NULL, 0),
(94498037, 'Neville', 'Faulkner', '1983-06-26', 'Femenino', 4244554, '2022-11-14 23:17:29', NULL, 0),
(98996537, 'Hunter', 'Heath', '2009-07-21', 'Femenino', 1865869, '2022-11-14 23:17:29', NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patologia`
--

CREATE TABLE `patologia` (
  `id_patologia` int(11) NOT NULL,
  `patologia` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `condicion` int(11) NOT NULL,
  `dni_paciente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `contrasena` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `rol` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `usuario`, `contrasena`, `email`, `rol`) VALUES
(1, 'pete', '932f3c1b56257ce8539ac269d7aab42550dacf8818d075f0bdf1990562aae3ef', 'pete@gmail.com', 1),
(2, 'jair', '932f3c1b56257ce8539ac269d7aab42550dacf8818d075f0bdf1990562aae3ef', 'jair@gmail.com', 0),
(4, 'TikkiX2', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'efrainrg@gmail.com', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zona`
--

CREATE TABLE `zona` (
  `id_zona` int(11) NOT NULL,
  `nombre` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `numero` int(11) NOT NULL,
  `id_forma_llamada` int(11) NOT NULL,
  `dni_paciente` int(11) NOT NULL,
  `dni_enfermero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `zona`
--

INSERT INTO `zona` (`id_zona`, `nombre`, `numero`, `id_forma_llamada`, `dni_paciente`, `dni_enfermero`) VALUES
(1, 'Lavinia', 3, 1, 19584110, 19681332),
(2, 'Alexa', 9, 2, 18316403, 17645132),
(3, 'Lavinia', 3, 1, 19584110, 19681332),
(4, 'Aurelia', 9, 2, 20955552, 25058397),
(5, 'Glenna', 4, 2, 23760158, 30869558),
(6, 'Kennan', 3, 1, 27583042, 31299616),
(7, 'Lana', 8, 2, 30432182, 41917631),
(8, 'Aladdin', 7, 2, 35755857, 46502872),
(9, 'Preston', 7, 1, 38513710, 50164879),
(10, 'Melyssa', 1, 1, 42487863, 54984044),
(11, 'Garrison', 1, 1, 42915996, 55530097),
(12, 'Cara', 10, 1, 61358450, 57122918),
(13, 'Christen', 6, 2, 63142621, 58117520),
(14, 'Juliet', 4, 1, 63576550, 58377713),
(15, 'Keelie', 5, 1, 72286421, 58451379),
(16, 'Deborah', 5, 1, 72379245, 68430449),
(17, 'Hayes', 2, 1, 74122155, 70994638),
(18, 'Quamar', 3, 1, 78848212, 71176427),
(19, 'Rigel', 3, 1, 83961204, 75941397),
(21, 'Colt', 9, 2, 91104636, 87246215),
(22, 'Hollee', 0, 2, 92099779, 92813644),
(23, 'Sonya', 7, 2, 93681689, 93767789),
(24, 'Aileen', 10, 2, 94498037, 98331588),
(26, 'Quirofano', 1, 1, 87587573, 76154950);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alergias`
--
ALTER TABLE `alergias`
  ADD PRIMARY KEY (`id_alergia`),
  ADD KEY `dni_paciente` (`dni_paciente`);

--
-- Indices de la tabla `antecedentes`
--
ALTER TABLE `antecedentes`
  ADD PRIMARY KEY (`id_antecedente`),
  ADD KEY `dni_paciente` (`dni_paciente`);

--
-- Indices de la tabla `enfermero`
--
ALTER TABLE `enfermero`
  ADD PRIMARY KEY (`dni_enfermero`);

--
-- Indices de la tabla `forma_llamada`
--
ALTER TABLE `forma_llamada`
  ADD PRIMARY KEY (`id_forma_llamada`);

--
-- Indices de la tabla `llamada`
--
ALTER TABLE `llamada`
  ADD PRIMARY KEY (`id_llamada`),
  ADD KEY `dni_paciente` (`dni_paciente`),
  ADD KEY `dni_enfermero` (`dni_enfermero`);

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`dni_paciente`);

--
-- Indices de la tabla `patologia`
--
ALTER TABLE `patologia`
  ADD PRIMARY KEY (`id_patologia`),
  ADD KEY `dni_paciente` (`dni_paciente`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `usuario` (`usuario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `zona`
--
ALTER TABLE `zona`
  ADD PRIMARY KEY (`id_zona`),
  ADD KEY `id_forma_llamada` (`id_forma_llamada`),
  ADD KEY `dni_paciente` (`dni_paciente`),
  ADD KEY `dni_enfermero` (`dni_enfermero`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alergias`
--
ALTER TABLE `alergias`
  MODIFY `id_alergia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `antecedentes`
--
ALTER TABLE `antecedentes`
  MODIFY `id_antecedente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `enfermero`
--
ALTER TABLE `enfermero`
  MODIFY `dni_enfermero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98648258;

--
-- AUTO_INCREMENT de la tabla `forma_llamada`
--
ALTER TABLE `forma_llamada`
  MODIFY `id_forma_llamada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `llamada`
--
ALTER TABLE `llamada`
  MODIFY `id_llamada` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `paciente`
--
ALTER TABLE `paciente`
  MODIFY `dni_paciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98996538;

--
-- AUTO_INCREMENT de la tabla `patologia`
--
ALTER TABLE `patologia`
  MODIFY `id_patologia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `zona`
--
ALTER TABLE `zona`
  MODIFY `id_zona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alergias`
--
ALTER TABLE `alergias`
  ADD CONSTRAINT `alergias_ibfk_1` FOREIGN KEY (`dni_paciente`) REFERENCES `paciente` (`dni_paciente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `antecedentes`
--
ALTER TABLE `antecedentes`
  ADD CONSTRAINT `antecedentes_ibfk_1` FOREIGN KEY (`dni_paciente`) REFERENCES `paciente` (`dni_paciente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `llamada`
--
ALTER TABLE `llamada`
  ADD CONSTRAINT `llamada_ibfk_1` FOREIGN KEY (`dni_paciente`) REFERENCES `paciente` (`dni_paciente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `llamada_ibfk_2` FOREIGN KEY (`dni_enfermero`) REFERENCES `enfermero` (`dni_enfermero`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `patologia`
--
ALTER TABLE `patologia`
  ADD CONSTRAINT `patologia_ibfk_1` FOREIGN KEY (`dni_paciente`) REFERENCES `paciente` (`dni_paciente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `zona`
--
ALTER TABLE `zona`
  ADD CONSTRAINT `zona_ibfk_1` FOREIGN KEY (`dni_paciente`) REFERENCES `paciente` (`dni_paciente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `zona_ibfk_2` FOREIGN KEY (`dni_enfermero`) REFERENCES `enfermero` (`dni_enfermero`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `zona_ibfk_3` FOREIGN KEY (`id_forma_llamada`) REFERENCES `forma_llamada` (`id_forma_llamada`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
