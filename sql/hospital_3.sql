-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-11-2022 a las 09:10:12
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
  `telefono` int(11) NOT NULL,
  `fecha_nac` date NOT NULL,
  `estado` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `enfermero`
--

INSERT INTO `enfermero` (`dni_enfermero`, `nombre`, `apellido`, `sexo`, `telefono`, `fecha_nac`, `estado`) VALUES
(20479161, 'Griffin', 'Dai Sheppard', 'Masculino', 3738079, '2001-12-15', 1),
(26118066, 'Steven', 'Colette Jones', 'Femenino', 7142779, '1971-12-05', 0),
(27081025, 'Eve', 'Rana Sherman', 'Femenino', 4469815, '1981-12-07', 0),
(30211954, 'Angelica', 'Garrison Valencia', 'Femenino', 9408861, '1956-06-26', 1),
(32595766, 'Danielle', 'Kyle Leach', 'Femenino', 7576773, '1964-01-20', 1),
(39759950, 'Daria', 'Colton Cantrell', 'Masculino', 6750028, '1981-05-11', 1),
(42204455, 'Daquan', 'Sheila Gentry', 'Masculino', 5854325, '2001-09-02', 0),
(42865726, 'Acton', 'Oleg Cantu', 'Femenino', 877317, '1967-04-06', 1),
(53400328, 'Orlando', 'Norman Gaines', 'Masculino', 7553074, '2010-09-27', 0),
(56294117, 'Hanna', 'Benedict Stewart', 'Masculino', 5046043, '2010-02-01', 1),
(68950765, 'Jakeem', 'Brian Forbes', 'Masculino', 1545256, '2012-02-04', 0),
(70592330, 'Nash', 'Jolene Rogers', 'Masculino', 8607118, '2000-12-20', 0),
(74120879, 'Isaac', 'Colton Wagner', 'Femenino', 9426743, '1982-08-08', 0),
(77144022, 'Quin', 'Alexa O\'Neill', 'Femenino', 8372714, '1990-08-25', 1),
(78025393, 'Rhoda', 'Theodore Mcpherson', 'Femenino', 3227251, '2001-12-08', 0),
(81808503, 'Felix', 'Ciara Ewing', 'Masculino', 9684486, '2017-04-02', 0),
(82359841, 'Pearl', 'Gay Meyers', 'Femenino', 8468487, '2000-03-15', 1),
(83031287, 'Eugenia', 'Teegan Kim', 'Femenino', 5185666, '1986-04-05', 0),
(84958402, 'Tanek', 'Howard Harding', 'Femenino', 6422139, '2006-05-14', 0),
(87579908, 'George', 'Wyoming Prince', 'Femenino', 4819242, '1992-08-28', 0),
(88396721, 'Porter', 'Kelsie Larsen', 'Femenino', 8584314, '1957-07-08', 0),
(91056678, 'Hedda', 'Ross Browning', 'Femenino', 1534102, '2020-10-20', 1),
(92937187, 'Irene', 'Lance Joyner', 'Masculino', 8736750, '1990-09-25', 1),
(93841374, 'Rahim', 'Lyle Cross', 'Masculino', 7837874, '1976-01-23', 1),
(250583972, 'Abbot1', 'Rollins2', 'Masculino', 2835147, '2010-09-27', 0);

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
(46, 49583498, 'normal', '2022-11-17 04:28:00', NULL, 'cama'),
(47, 49583498, 'emergencia', '2022-11-17 04:28:18', NULL, 'cama'),
(48, 91728332, 'normal', '2022-11-17 04:42:35', NULL, 'cama');

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
(11111111, 'Aquila', 'Cox', '1982-02-06', 'Femenino', 5290770, '2022-11-17 00:55:00', '0000-00-00 00:00:00', 'AB', 'Alejo Bruix 5455'),
(11203766, 'Patrick', 'Foreman', '1975-09-22', 'Femenino', 8562386, '2022-11-16 02:06:40', NULL, 'AB', '3674 Iaculis Ave'),
(12801761, 'Noble', 'Murphy', '1956-03-20', 'Femenino', 5714818, '2022-11-16 02:06:40', NULL, 'AB', '545-4831 Aliquam Av.'),
(13876702, 'Kuame', 'Austin', '2006-11-06', 'Femenino', 2818151, '2022-11-16 02:06:40', NULL, 'O', '907-5226 Nunc Ave'),
(30432182, 'Aquila', 'Cox', '1982-02-06', 'Femenino', 5290770, '2022-11-16 20:39:51', '0000-00-00 00:00:00', 'AB', 'Alejo Bruix 5455'),
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
(91728332, 'Carol', 'Dyer', '1963-11-11', 'Femenino', 5495841, '2022-11-16 02:06:40', NULL, 'O', '684-4 Rutrum Ave'),
(91728333, 'Aquila', 'Cox', '1982-02-06', 'Femenino', 5290770, '2022-11-17 00:58:40', '0000-00-00 00:00:00', 'AB', 'Alejo Bruix 5455');

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
  `dni_paciente` int(11) NOT NULL,
  `descripcion` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `zona`
--

INSERT INTO `zona` (`id_zona`, `nombre`, `numero`, `id_forma_llamada`, `dni_enfermero`, `dni_paciente`, `descripcion`, `estado`) VALUES
(1, 'Galvin', 2, 1, 20479161, 10039469, 'Nunc ut erat. Sed', 1),
(2, 'Patience', 2, 1, 26118066, 11111111, 'arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien,', 1),
(3, 'Keefe', 7, 1, 27081025, 11203766, 'Suspendisse eleifend. Cras sed leo. Cras', 1),
(4, 'Vladimir', 8, 1, 30211954, 12801761, 'magna nec quam. Curabitur', 1),
(5, 'Amela', 1, 1, 32595766, 13876702, 'ante lectus convallis est, vitae', 0),
(6, 'Gareth', 8, 1, 39759950, 30432182, 'augue scelerisque mollis. Phasellus libero', 0),
(7, 'Todd', 5, 1, 42204455, 33520329, 'aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus', 0),
(8, 'Isabella', 8, 1, 42865726, 35932430, 'ridiculus mus. Proin vel nisl. Quisque fringilla euismod', 0),
(9, 'Yuri', 6, 1, 53400328, 37634415, 'faucibus ut, nulla.', 0),
(10, 'Ulric', 5, 1, 56294117, 39093614, 'Nulla tempor', 1),
(11, 'Rose', 9, 1, 68950765, 49334864, 'semper pretium neque. Morbi quis urna. Nunc quis arcu vel', 1),
(12, 'Edward', 3, 1, 70592330, 49583498, 'Cum sociis natoque penatibus', 0),
(13, 'Claire', 4, 1, 74120879, 59150592, 'feugiat non, lobortis quis, pede. Suspendisse', 1),
(14, 'Reuben', 8, 1, 77144022, 60454920, 'vitae semper egestas, urna justo faucibus', 0),
(15, 'Jameson', 10, 1, 78025393, 61791624, 'Etiam imperdiet', 0),
(16, 'Hector', 1, 1, 81808503, 64727944, 'risus a ultricies', 1),
(17, 'Vance', 9, 1, 82359841, 64931056, 'sodales at,', 0),
(18, 'Hadley', 4, 1, 83031287, 68176054, 'Nullam scelerisque neque sed sem egestas blandit. Nam', 1),
(19, 'Ursula', 6, 1, 84958402, 68632848, 'magnis dis parturient montes, nascetur', 0),
(20, 'Mariam', 9, 1, 87579908, 75067520, 'vehicula aliquet libero. Integer in magna. Phasellus dolor elit,', 1),
(21, 'Abraham', 7, 1, 88396721, 77725435, 'elit, a feugiat tellus lorem eu metus. In lorem.', 1),
(22, 'Hop', 4, 1, 91056678, 78648023, 'elementum, dui quis', 0),
(23, 'Todd', 6, 1, 92937187, 79118870, 'nec, diam. Duis mi enim, condimentum', 0),
(24, 'Kermit', 4, 1, 93841374, 79612848, 'eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus', 0),
(25, 'Elton', 4, 1, 250583972, 80454994, 'lorem ipsum sodales purus, in molestie tortor nibh sit', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zona_llamada`
--

CREATE TABLE `zona_llamada` (
  `id_zona_llamada` int(11) NOT NULL,
  `id_zona` int(11) NOT NULL,
  `id_llamada` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `zona_llamada`
--

INSERT INTO `zona_llamada` (`id_zona_llamada`, `id_zona`, `id_llamada`) VALUES
(1, 21, 46),
(2, 21, 47),
(3, 12, 48);

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
  ADD KEY `dni_paciente` (`dni_paciente`);

--
-- Indices de la tabla `zona_llamada`
--
ALTER TABLE `zona_llamada`
  ADD PRIMARY KEY (`id_zona_llamada`),
  ADD KEY `id_zona` (`id_zona`),
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
  MODIFY `id_llamada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

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
  MODIFY `id_zona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT de la tabla `zona_llamada`
--
ALTER TABLE `zona_llamada`
  MODIFY `id_zona_llamada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alergias`
--
ALTER TABLE `alergias`
  ADD CONSTRAINT `alergias_ibfk_1` FOREIGN KEY (`dni_paciente`) REFERENCES `paciente` (`dni_paciente`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `zona_ibfk_5` FOREIGN KEY (`id_forma_llamada`) REFERENCES `forma_llamada` (`id_forma_llamada`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `zona_ibfk_6` FOREIGN KEY (`dni_paciente`) REFERENCES `paciente` (`dni_paciente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `zona_llamada`
--
ALTER TABLE `zona_llamada`
  ADD CONSTRAINT `zona_llamada_ibfk_1` FOREIGN KEY (`id_zona`) REFERENCES `zona` (`id_zona`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `zona_llamada_ibfk_2` FOREIGN KEY (`id_llamada`) REFERENCES `llamada` (`id_llamada`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
