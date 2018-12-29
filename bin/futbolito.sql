-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-11-2017 a las 03:35:44
-- Versión del servidor: 10.1.28-MariaDB
-- Versión de PHP: 7.0.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `futbolito`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cancha`
--

CREATE TABLE `cancha` (
  `idCancha` int(11) NOT NULL,
  `Numero` int(11) DEFAULT NULL,
  `Estado` varchar(45) DEFAULT NULL,
  `idRecinto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cancha`
--

INSERT INTO `cancha` (`idCancha`, `Numero`, `Estado`, `idRecinto`) VALUES
(1, 1, 'Reservada', 1),
(3, 2, 'Reservada', 2),
(4, 2, 'Reservada', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competir`
--

CREATE TABLE `competir` (
  `idTorneo` int(11) NOT NULL,
  `idEquipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE `equipo` (
  `idEquipo` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `numeroPartidos` int(11) DEFAULT NULL,
  `numeroJugadores` varchar(45) DEFAULT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `equipo`
--

INSERT INTO `equipo` (`idEquipo`, `Nombre`, `numeroPartidos`, `numeroJugadores`, `idUsuario`) VALUES
(1, 'Liverpool FC', 0, '0', 9),
(2, 'Parral City', 0, '1', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `idHorario` int(11) NOT NULL,
  `Precio` int(11) DEFAULT NULL,
  `horaInicio` varchar(20) DEFAULT NULL,
  `horaFin` varchar(10) DEFAULT NULL,
  `idRecinto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `horario`
--

INSERT INTO `horario` (`idHorario`, `Precio`, `horaInicio`, `horaFin`, `idRecinto`) VALUES
(10, 25000, '10:00-11:00', '10', 1),
(11, 25000, '11:00-12:00', '10', 1),
(12, 25000, '12:00-13:00', '10', 1),
(13, 25000, '13:00-14:00', '10', 1),
(14, 25000, '14:00-15:00', '10', 1),
(15, 25000, '15:00-16:00', '10', 1),
(16, 25000, '16:00-17:00', '10', 1),
(17, 25000, '17:00-18:00', '10', 1),
(18, 25000, '18:00-19:00', '10', 1),
(19, 30000, '19:00-20:00', '10', 1),
(20, 30000, '20:00-21:00', '10', 1),
(21, 30000, '21:00-22:00', '10', 1),
(22, 30000, '22:00-23:00', '10', 1),
(23, 25000, '10:00-11:00', '10', 2),
(24, 25000, '11:00-12:00', '10', 2),
(25, 25000, '12:00-13:00', '10', 2),
(26, 25000, '13:00-14:00', '10', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugador`
--

CREATE TABLE `jugador` (
  `idJugador` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Apellido` varchar(45) DEFAULT NULL,
  `idEquipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `jugador`
--

INSERT INTO `jugador` (`idJugador`, `Nombre`, `Apellido`, `idEquipo`) VALUES
(1, 'Juan', 'Dominf', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partido`
--

CREATE TABLE `partido` (
  `idPartido` int(11) NOT NULL,
  `Fecha` date DEFAULT NULL,
  `horaInicio` time DEFAULT NULL,
  `horaFin` time DEFAULT NULL,
  `Estado` varchar(45) DEFAULT NULL,
  `golesEquipo1` int(11) DEFAULT NULL,
  `golesEquipo2` int(11) DEFAULT NULL,
  `idEquipo1` int(11) NOT NULL,
  `idEquipo2` int(11) NOT NULL,
  `idCancha` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recinto`
--

CREATE TABLE `recinto` (
  `idRecinto` int(11) NOT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  `Telefono` varchar(45) DEFAULT NULL,
  `Nombre` varchar(45) NOT NULL,
  `numeroCanchas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `recinto`
--

INSERT INTO `recinto` (`idRecinto`, `Direccion`, `Telefono`, `Nombre`, `numeroCanchas`) VALUES
(1, 'Chillan 123', '12345', 'La curva', 2),
(2, 'Las rosas 142', '12331231', 'Mas Futbol', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `idReserva` int(11) NOT NULL,
  `Usuario_idUsuario` int(11) NOT NULL,
  `Cancha_idCancha` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`idReserva`, `Usuario_idUsuario`, `Cancha_idCancha`, `Fecha`, `Hora`) VALUES
(9, 7, 1, '2017-11-22', '10:00-11:00'),
(11, 7, 3, '2017-11-25', '10:00-11:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idRol` int(11) NOT NULL,
  `Tipo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idRol`, `Tipo`) VALUES
(1, 'admin'),
(2, 'normal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud`
--

CREATE TABLE `solicitud` (
  `id_solicitud` int(11) NOT NULL,
  `nombre_equipo` varchar(30) NOT NULL,
  `accion` varchar(20) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `estado` varchar(20) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `solicitud`
--

INSERT INTO `solicitud` (`id_solicitud`, `nombre_equipo`, `accion`, `descripcion`, `estado`, `id_usuario`) VALUES
(1, 'Barcelona', 'Eliminar', NULL, 'pendiente', 9),
(3, 'Liverpool ', 'Modificar', 'cambiar nombre a Liverpool FC		                    \r\n			                    ', 'pendiente', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `torneo`
--

CREATE TABLE `torneo` (
  `idTorneo` int(11) NOT NULL,
  `FechaInicio` date DEFAULT NULL,
  `numeroParticipantes` int(11) DEFAULT NULL,
  `idCampeon` int(11) DEFAULT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Apellido` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Telefono` varchar(45) DEFAULT NULL,
  `Contrasena` varchar(45) DEFAULT NULL,
  `idRol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `Nombre`, `Apellido`, `Email`, `Telefono`, `Contrasena`, `idRol`) VALUES
(6, 'Juan', 'Dominguez', 'Juan@hotmail.com', '12345678', '1234', 1),
(7, 'Juanitio', 'D', 'j@gmail.com', '123123', '4321', 2),
(8, 'Camilo', 'Inostroza', 'caminost@alumnos.ubiobio.cl', '93912171', 'qwerty123', 1),
(9, 'Roman', 'Reigns', 'roman@empire.cl', '90612786', '123456789', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cancha`
--
ALTER TABLE `cancha`
  ADD PRIMARY KEY (`idCancha`,`idRecinto`),
  ADD KEY `fk_Cancha_Recinto1_idx` (`idRecinto`);

--
-- Indices de la tabla `competir`
--
ALTER TABLE `competir`
  ADD PRIMARY KEY (`idTorneo`,`idEquipo`),
  ADD KEY `fk_Torneo_has_Equipo_Equipo1_idx` (`idEquipo`),
  ADD KEY `fk_Torneo_has_Equipo_Torneo1_idx` (`idTorneo`);

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`idEquipo`,`idUsuario`),
  ADD KEY `fk_Equipo_Usuario1_idx` (`idUsuario`);

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`idHorario`,`idRecinto`),
  ADD KEY `fk_Horario_Recinto1_idx` (`idRecinto`);

--
-- Indices de la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD PRIMARY KEY (`idJugador`),
  ADD KEY `fk_Jugador_Equipo1_idx` (`idEquipo`);

--
-- Indices de la tabla `partido`
--
ALTER TABLE `partido`
  ADD PRIMARY KEY (`idPartido`),
  ADD KEY `fk_Partido_Equipo1_idx` (`idEquipo1`),
  ADD KEY `fk_Partido_Equipo2_idx` (`idEquipo2`),
  ADD KEY `fk_Partido_Cancha1_idx` (`idCancha`),
  ADD KEY `fk_Partido_Usuario1_idx` (`idUsuario`);

--
-- Indices de la tabla `recinto`
--
ALTER TABLE `recinto`
  ADD PRIMARY KEY (`idRecinto`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`idReserva`),
  ADD KEY `fk_Usuario_has_Cancha_Cancha1_idx` (`Cancha_idCancha`),
  ADD KEY `fk_Usuario_has_Cancha_Usuario_idx` (`Usuario_idUsuario`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `solicitud`
--
ALTER TABLE `solicitud`
  ADD PRIMARY KEY (`id_solicitud`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `torneo`
--
ALTER TABLE `torneo`
  ADD PRIMARY KEY (`idTorneo`),
  ADD KEY `fk_Torneo_Usuario1_idx` (`idUsuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `fk_Usuario_Rol1_idx` (`idRol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cancha`
--
ALTER TABLE `cancha`
  MODIFY `idCancha` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `equipo`
--
ALTER TABLE `equipo`
  MODIFY `idEquipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `horario`
--
ALTER TABLE `horario`
  MODIFY `idHorario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `jugador`
--
ALTER TABLE `jugador`
  MODIFY `idJugador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `partido`
--
ALTER TABLE `partido`
  MODIFY `idPartido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `recinto`
--
ALTER TABLE `recinto`
  MODIFY `idRecinto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `reserva`
--
ALTER TABLE `reserva`
  MODIFY `idReserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `solicitud`
--
ALTER TABLE `solicitud`
  MODIFY `id_solicitud` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `torneo`
--
ALTER TABLE `torneo`
  MODIFY `idTorneo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cancha`
--
ALTER TABLE `cancha`
  ADD CONSTRAINT `fk_Cancha_Recinto1` FOREIGN KEY (`idRecinto`) REFERENCES `recinto` (`idRecinto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `competir`
--
ALTER TABLE `competir`
  ADD CONSTRAINT `fk_Torneo_has_Equipo_Equipo1` FOREIGN KEY (`idEquipo`) REFERENCES `equipo` (`idEquipo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Torneo_has_Equipo_Torneo1` FOREIGN KEY (`idTorneo`) REFERENCES `torneo` (`idTorneo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD CONSTRAINT `fk_Equipo_Usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `horario`
--
ALTER TABLE `horario`
  ADD CONSTRAINT `fk_Horario_Recinto1` FOREIGN KEY (`idRecinto`) REFERENCES `recinto` (`idRecinto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD CONSTRAINT `fk_Jugador_Equipo1` FOREIGN KEY (`idEquipo`) REFERENCES `equipo` (`idEquipo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `partido`
--
ALTER TABLE `partido`
  ADD CONSTRAINT `fk_Partido_Cancha1` FOREIGN KEY (`idCancha`) REFERENCES `cancha` (`idCancha`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Partido_Equipo1` FOREIGN KEY (`idEquipo1`) REFERENCES `equipo` (`idEquipo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Partido_Equipo2` FOREIGN KEY (`idEquipo2`) REFERENCES `equipo` (`idEquipo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Partido_Usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `fk_Usuario_has_Cancha_Cancha1` FOREIGN KEY (`Cancha_idCancha`) REFERENCES `cancha` (`idCancha`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Usuario_has_Cancha_Usuario` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `solicitud`
--
ALTER TABLE `solicitud`
  ADD CONSTRAINT `solicitud_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `torneo`
--
ALTER TABLE `torneo`
  ADD CONSTRAINT `fk_Torneo_Usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_Usuario_Rol1` FOREIGN KEY (`idRol`) REFERENCES `rol` (`idRol`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
