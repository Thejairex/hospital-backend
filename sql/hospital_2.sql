-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-11-2022 a las 22:24:55
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
(98648257, 'Xyla', 'Rivera', 'Masculino', 2872479),
(250583972, 'Abbotasd', 'Rollinsas', 'Masculino', 2835147);

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
  `dni_paciente` int(11) NOT NULL,
  `tipo` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_hora_llamada` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_hora_atentido` datetime DEFAULT NULL,
  `origen_llamada` varchar(300) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `llamada`
--

INSERT INTO `llamada` (`id_llamada`, `dni_paciente`, `tipo`, `fecha_hora_llamada`, `fecha_hora_atentido`, `origen_llamada`) VALUES
(1, 10039469, 'Normal', '2022-11-16 16:34:07', NULL, 'Cama'),
(2, 11203766, 'Emergencia', '2022-11-16 16:34:07', NULL, 'Bano'),
(3, 12801761, 'Emergencia', '2022-11-16 16:34:07', NULL, 'Cama'),
(4, 13876702, 'Emergencia', '2022-11-16 16:34:07', NULL, 'Cama'),
(5, 33520329, 'Normal', '2022-11-16 16:34:07', NULL, 'Cama'),
(6, 35932430, 'Normal', '2022-11-16 16:34:07', NULL, 'Cama'),
(7, 37634415, 'Normal', '2022-11-16 16:34:07', NULL, 'Bano'),
(8, 39093614, 'Normal', '2022-11-16 16:34:07', NULL, 'Cama'),
(9, 49334864, 'Normal', '2022-11-16 16:34:07', NULL, 'Cama'),
(10, 49583498, 'Emergencia', '2022-11-16 16:34:07', NULL, 'Cama'),
(11, 59150592, 'Emergencia', '2022-11-16 16:34:07', NULL, 'Bano'),
(12, 60454920, 'Normal', '2022-11-16 16:34:07', NULL, 'Cama'),
(13, 61791624, 'Emergencia', '2022-11-16 16:34:07', NULL, 'Bano'),
(14, 64727944, 'Normal', '2022-11-16 16:34:07', NULL, 'Cama'),
(15, 64931056, 'Normal', '2022-11-16 16:34:07', NULL, 'Bano'),
(16, 68176054, 'Normal', '2022-11-16 16:34:07', NULL, 'Cama'),
(17, 68632848, 'Emergencia', '2022-11-16 16:34:07', NULL, 'Cama'),
(18, 75067520, 'Normal', '2022-11-16 16:34:07', NULL, 'Bano'),
(19, 77725435, 'Normal', '2022-11-16 16:34:07', NULL, 'Bano'),
(20, 78648023, 'Emergencia', '2022-11-16 16:34:07', NULL, 'Bano'),
(21, 79118870, 'Normal', '2022-11-16 16:34:07', NULL, 'Cama'),
(22, 79612848, 'Normal', '2022-11-16 16:34:07', NULL, 'Bano'),
(23, 80454994, 'Emergencia', '2022-11-16 16:34:07', NULL, 'Cama'),
(24, 86674296, 'Emergencia', '2022-11-16 16:34:07', NULL, 'Bano'),
(25, 91728332, 'Emergencia', '2022-11-16 16:34:07', NULL, 'Cama');

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
  `tipo_sangre` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `direccion` varchar(300) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`dni_paciente`, `nombre`, `apellido`, `fecha_nac`, `sexo`, `telefono`, `fecha_hora_ingreso`, `fecha_hora_egreso`, `tipo_sangre`, `direccion`) VALUES
(10039469, 'Zelda', 'Gillespie', '1997-01-27', 'Masculino', 5861242, '2022-11-16 02:06:40', NULL, 'B', '264-579 Ornare Road'),
(11203766, 'Patrick', 'Foreman', '1975-09-22', 'Femenino', 8562386, '2022-11-16 02:06:40', NULL, 'AB', '3674 Iaculis Ave'),
(12801761, 'Noble', 'Murphy', '1956-03-20', 'Femenino', 5714818, '2022-11-16 02:06:40', NULL, 'AB', '545-4831 Aliquam Av.'),
(13876702, 'Kuame', 'Austin', '2006-11-06', 'Femenino', 2818151, '2022-11-16 02:06:40', NULL, 'O', '907-5226 Nunc Ave'),
(33520329, 'Dora', 'Sherman', '2015-04-25', 'Masculino', 370846, '2022-11-16 02:06:40', NULL, 'B', 'Ap #895-3782 Velit. Rd.'),
(35932430, 'Dana', 'Rodriguez', '2005-02-08', 'Masculino', 7289811, '2022-11-16 02:06:40', NULL, 'AB', 'Ap #995-7814 Vel Road'),
(37634415, 'Knox', 'Gomez', '2015-09-16', 'Masculino', 9850365, '2022-11-16 02:06:40', NULL, 'AB', '1785 Felis. St.'),
(39093614, 'Dara', 'Cobb', '1994-06-03', 'Femenino', 5645748, '2022-11-16 02:06:40', NULL, 'AB', 'Ap #260-3428 Laoreet St.'),
(49334864, 'Oleg', 'Hensley', '2001-11-03', 'Masculino', 4171197, '2022-11-16 02:06:40', NULL, 'A', '446-5162 Proin Av.'),
(49583498, 'Alfonso', 'Hess', '1968-05-27', 'Masculino', 8456295, '2022-11-16 02:06:40', NULL, 'AB', '580-8215 Interdum Road'),
(59150592, 'Oleg', 'Burton', '1955-06-06', 'Femenino', 6595261, '2022-11-16 02:06:40', NULL, 'B', '6981 A Ave'),
(60454920, 'Hayes', 'Wilson', '1965-05-10', 'Femenino', 7855747, '2022-11-16 02:06:40', NULL, 'AB', '248-7219 Convallis St.'),
(61791624, 'Cedric', 'Duran', '2004-11-27', 'Femenino', 9541209, '2022-11-16 02:06:40', NULL, 'O', '432-4786 Vehicula Rd.'),
(64727944, 'Sydnee', 'Patrick', '2016-01-06', 'Femenino', 347371, '2022-11-16 02:06:40', NULL, 'A', '983-411 Mauris St.'),
(64931056, 'Keith', 'Zimmerman', '2002-09-23', 'Femenino', 1685498, '2022-11-16 02:06:40', NULL, 'B', '3147 Duis St.'),
(68176054, 'Claire', 'Ingram', '1995-05-04', 'Femenino', 7684427, '2022-11-16 02:06:40', NULL, 'AB', '736-8699 Adipiscing. Ave'),
(68632848, 'Christen', 'Reeves', '1986-07-03', 'Masculino', 3624618, '2022-11-16 02:06:40', NULL, 'B', 'P.O. Box 294, 8977 Suspendisse Rd.'),
(75067520, 'Phoebe', 'Sullivan', '1974-05-17', 'Femenino', 9161815, '2022-11-16 02:06:40', NULL, 'O', 'P.O. Box 862, 5127 Curae Av.'),
(77725435, 'Xavier', 'Ellison', '2009-11-16', 'Femenino', 1173478, '2022-11-16 02:06:40', NULL, 'O', '134-4221 Aliquet Road'),
(78648023, 'Georgia', 'Melton', '1985-11-13', 'Masculino', 6937891, '2022-11-16 02:06:40', NULL, 'AB', 'Ap #695-9573 Facilisis. St.'),
(79118870, 'Ava', 'Owen', '2003-04-02', 'Femenino', 6667862, '2022-11-16 02:06:40', NULL, 'AB', '446-5354 Sed Rd.'),
(79612848, 'Sean', 'Key', '2007-01-04', 'Masculino', 7176614, '2022-11-16 02:06:40', NULL, 'A', '497-8331 Ut Rd.'),
(80454994, 'Dawn', 'Ross', '1999-07-15', 'Masculino', 2026531, '2022-11-16 02:06:40', NULL, 'A', '143-6060 A St.'),
(86674296, 'Indira', 'Riggs', '2002-10-31', 'Masculino', 8088660, '2022-11-16 02:06:40', NULL, 'B', 'P.O. Box 194, 7714 Adipiscing St.'),
(91728332, 'Carol', 'Dyer', '1963-11-11', 'Femenino', 5495841, '2022-11-16 02:06:40', NULL, 'O', '684-4721 Rutrum Ave');

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
  `dni_enfermero` int(11) NOT NULL,
  `id_llamada` int(11) NOT NULL,
  `descripcion` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `zona`
--

INSERT INTO `zona` (`id_zona`, `nombre`, `numero`, `id_forma_llamada`, `dni_enfermero`, `id_llamada`, `descripcion`, `estado`) VALUES
(1, 'Brady', 4, 1, 15752301, 1, 'Sed congue, elit sed consequat auctor, nunc nulla vulputate dui,', 1),
(2, 'Leonard', 8, 1, 17645132, 2, 'enim mi tempor lorem, eget mollis lectus pede et risus.', 0),
(3, 'Alvin', 2, 1, 19681332, 3, 'nunc risus varius orci, in consequat enim diam vel arcu.', 0),
(4, 'Hope', 8, 1, 25058397, 4, 'ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque', 0),
(5, 'Clementine', 4, 1, 30869558, 5, 'ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec,', 1),
(6, 'Signe', 6, 1, 31299616, 6, 'euismod est arcu ac orci. Ut semper pretium neque. Morbi', 0),
(7, 'Iris', 8, 1, 41917631, 7, 'cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum', 1),
(8, 'Zachery', 1, 1, 46502872, 8, 'nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in', 1),
(9, 'Curran', 10, 1, 50164879, 9, 'eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam', 1),
(10, 'Merrill', 5, 1, 54984044, 10, 'pede, ultrices a, auctor non, feugiat nec, diam. Duis mi', 0),
(11, 'Ella', 5, 1, 55530097, 11, 'Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc', 0),
(12, 'Aurora', 9, 1, 57122918, 12, 'mi tempor lorem, eget mollis lectus pede et risus. Quisque', 1),
(13, 'Kelly', 5, 1, 58117520, 13, 'leo, in lobortis tellus justo sit amet nulla. Donec non', 1),
(14, 'Karly', 4, 1, 58377713, 14, 'non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum', 0),
(15, 'Merritt', 5, 1, 58451379, 15, 'amet ante. Vivamus non lorem vitae odio sagittis semper. Nam', 1),
(16, 'Selma', 4, 1, 68430449, 16, 'ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra', 0),
(17, 'Arden', 2, 1, 70994638, 17, 'vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit', 1),
(18, 'Armand', 8, 1, 71176427, 18, 'arcu. Vestibulum ante ipsum primis in faucibus orci luctus et', 1),
(19, 'Emi', 6, 1, 75941397, 19, 'pellentesque, tellus sem mollis dui, in sodales elit erat vitae', 0),
(20, 'Belle', 6, 1, 76154950, 20, 'litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut', 1),
(21, 'Uriah', 7, 1, 87246215, 21, 'ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque', 0),
(22, 'John', 3, 1, 92813644, 22, 'in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est', 1),
(23, 'Ingrid', 4, 1, 93767789, 23, 'enim. Nunc ut erat. Sed nunc est, mollis non, cursus', 1),
(24, 'Kerry', 4, 1, 98331588, 24, 'urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat', 1);

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
  ADD KEY `id_paciente` (`dni_paciente`);

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
  ADD KEY `dni_enfermero` (`dni_enfermero`),
  ADD KEY `id_llamada` (`id_llamada`);

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
  MODIFY `dni_enfermero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250583973;

--
-- AUTO_INCREMENT de la tabla `forma_llamada`
--
ALTER TABLE `forma_llamada`
  MODIFY `id_forma_llamada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `llamada`
--
ALTER TABLE `llamada`
  MODIFY `id_llamada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

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
  MODIFY `id_zona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

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
  ADD CONSTRAINT `llamada_ibfk_1` FOREIGN KEY (`dni_paciente`) REFERENCES `paciente` (`dni_paciente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `patologia`
--
ALTER TABLE `patologia`
  ADD CONSTRAINT `patologia_ibfk_1` FOREIGN KEY (`dni_paciente`) REFERENCES `paciente` (`dni_paciente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `zona`
--
ALTER TABLE `zona`
  ADD CONSTRAINT `zona_ibfk_2` FOREIGN KEY (`dni_enfermero`) REFERENCES `enfermero` (`dni_enfermero`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `zona_ibfk_4` FOREIGN KEY (`id_llamada`) REFERENCES `llamada` (`id_llamada`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `zona_ibfk_5` FOREIGN KEY (`id_forma_llamada`) REFERENCES `forma_llamada` (`id_forma_llamada`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
